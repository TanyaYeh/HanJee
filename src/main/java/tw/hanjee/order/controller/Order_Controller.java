package tw.hanjee.order.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.hanjee.insurance.insModel.InsProfiles;
import tw.hanjee.insurance.insService.IFinsService;
import tw.hanjee.model.ManagerBean;
import tw.hanjee.model.MemberBean;
import tw.hanjee.order.model.Iv;
import tw.hanjee.order.model.OrderDetail;
import tw.hanjee.order.model.OrderMain;
import tw.hanjee.order.model.OrderMapping;
import tw.hanjee.order.service.Iv_Service;
import tw.hanjee.order.service.OrderMain_Service;
import tw.hanjee.order.service.OrderMapping_Service;
import tw.hanjee.product.model.FixSchedule_product;
import tw.hanjee.product.model.Ticket_product;
import tw.hanjee.product.model.shoppingcart;
import tw.hanjee.product.service.FixSchedule_product_Service;
import tw.hanjee.product.service.Ticket_product_Service;
import tw.hanjee.schedule.model.ScheduleBean;
import tw.hanjee.schedule.service.IscheduleService;

@Controller
@SessionAttributes({"LoginOK"})
public class Order_Controller {
	@Autowired
	Ticket_product_Service ticket_product_Service;
	@Autowired
	FixSchedule_product_Service fixSchedule_product_Service;
	@Autowired
	Iv_Service iv_Service;
	@Autowired
	OrderMain_Service orderMain_Service;
	@Autowired
	OrderMapping_Service orderMapping_Service;
	@Autowired
	IscheduleService ischedule_Service;
	@Autowired
	IFinsService iFins_Service;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "insert_order", produces = "text/html; charset=UTF-8")
	private @ResponseBody String shoppingcartInsertDb(HttpSession session, Model model,
			@RequestParam("ReceiveName") String name, @RequestParam("ReceivePhone") String phone,
			@RequestParam("ReceiveAdd") String address, @RequestParam("IvNumber") String ivNumber,
			@RequestParam("IncludeTaxAmount") Double includeTaxAmount

	) {
		// 判斷庫存數量是否大於訂購數量
		List<shoppingcart> tickets = (List<shoppingcart>) session.getAttribute("ticket");
		List<shoppingcart> fixSchPs = (List<shoppingcart>) session.getAttribute("fixSchedules");
		ScheduleBean scheduleObj = (ScheduleBean) session.getAttribute("scheduleBean");
		
		MemberBean memberBean=(MemberBean)session.getAttribute("LoginOK");
		String message = "";
		// 判斷庫存是否滿足訂單數量
		if (tickets != null) {
			for (int i = 0; i < tickets.size(); i++) {
				// 取出目前購物車內的車票
				shoppingcart ticket = tickets.get(i);
				// 從資料庫撈出這筆的數量與商品名稱
				List<Ticket_product> ticketsFromDb = ticket_product_Service.getShoppingcartInfo(ticket.getNo());
				Ticket_product ticketFromDb = ticketsFromDb.get(0);

				String startName = ticketFromDb.getPro_start();
				String endName = ticketFromDb.getPro_end();
				String ticketName = startName + "-" + endName;
				// 如果該產品訂單數量大於庫存量，則顯示錯誤訊息
				if (ticket.getOrd_qui() > ticketFromDb.getPro_sto()) {
					message += "車票:" + ticketName + "庫存數量不足\n";
				}
			}
		}

		if (fixSchPs != null) {
			for (int i = 0; i < fixSchPs.size(); i++) {
				// 取出目前購物車內的車票
				shoppingcart fixSchP = fixSchPs.get(i);
				// 從資料庫撈出這筆的數量與商品名稱
				List<FixSchedule_product> fixSchPsFromDb = fixSchedule_product_Service
						.getFixScheduleProductById(fixSchP.getNo());
				FixSchedule_product fixSchPFromDb = fixSchPsFromDb.get(0);

				String fixSchName = fixSchPFromDb.getFixSch_name();
				// 如果該產品訂單數量大於庫存量，則顯示錯誤訊息
				if (fixSchP.getOrd_qui() > fixSchPFromDb.getFixSch_available()) {
					message += "主題旅遊:" + fixSchName + "庫存數量不足\n";
				}
			}
		}
        
		
		// 如果Message不為空，代表異常發生，直接return 訊息回去
		if (!message.equals("")) {
			return message;
		}

		// 寫入發票(尚未成立order主表)
		Iv ivBean = new Iv();

		ivBean.setIv_amount(includeTaxAmount);
		ivBean.setIv_number(ivNumber);
		ivBean.setIv_status(true);
		ivBean.setIv_tax(0.5);
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		int month = cal.get(Calendar.MONTH) + 1;
		ivBean.setIv_month(month);
		iv_Service.insertIv(ivBean);
		// 寫入order主表
		OrderMain orderBean = new OrderMain();
		orderBean.setMember_id(memberBean.getMember_id());
		Date now = new Date();
		Timestamp ordernow = new Timestamp(now.getTime());
		orderBean.setOrd_date(ordernow);
		orderBean.setUpdate_time(ordernow);
		orderBean.setManager_id(1);


		orderBean.setTotal_amount(includeTaxAmount);
		// 寫入使用者input資訊
		orderBean.setRecipient(name);
		orderBean.setRecipient_phone(phone);
		orderBean.setRecipient_address(address);
		orderBean.setIsDelete(0);
		// 怎麼取的iv id
		List<Iv> ivs = iv_Service.selectByIvNumber(ivNumber);
		Iv iv = ivs.get(0);
		Integer ivNo = iv.getIv_no();
		orderBean.setIv_no(ivNo);
		orderBean.setOrder_status("成立");
		orderBean.setPayment_status("未付款");
		orderMain_Service.insertOrderMain(orderBean);
		// 寫回Iv的ord_no
		System.out.println("orderBean.getOrd_no():" + orderBean.getOrd_no());
		iv_Service.updatePro_no(ivNo, orderBean.getOrd_no());
		// 寫入ordermapping
		if (tickets != null) {
			for (int i = 0; i < tickets.size(); i++) {
				shoppingcart ticket = tickets.get(i);
				OrderMapping ordermapping = new OrderMapping();
				ordermapping.setOrd_no(orderBean.getOrd_no());
				ordermapping.setNo(ticket.getNo());
				ordermapping.setType(ticket.getType());
				ordermapping.setQuantity(ticket.getOrd_qui());
				ordermapping.setAmount(ticket.getPro_amount());
				orderMapping_Service.insertOrderMapping(ordermapping);
				ticket_product_Service.updateStockQuantity(ticket.getNo(), ticket.getOrd_qui());
			}
		}
		if (fixSchPs != null) {
			for (int i = 0; i < fixSchPs.size(); i++) {
				shoppingcart fixSchP = fixSchPs.get(i);
				OrderMapping ordermapping = new OrderMapping();
				ordermapping.setOrd_no(orderBean.getOrd_no());
				ordermapping.setNo(fixSchP.getNo());
				ordermapping.setType(fixSchP.getType());
				ordermapping.setQuantity(fixSchP.getOrd_qui());
				ordermapping.setAmount(fixSchP.getPro_amount());
				orderMapping_Service.insertOrderMapping(ordermapping);
				fixSchedule_product_Service.updateStockQuantity(fixSchP.getNo(), fixSchP.getOrd_qui());
			}
		}
		//自由行
		if(scheduleObj!=null) {
			OrderMapping ordermapping = new OrderMapping();
			ordermapping.setOrd_no(orderBean.getOrd_no());
			ordermapping.setNo(scheduleObj.getSch_no());
			ordermapping.setType("scheduleBean");
			ordermapping.setQuantity(1);
			ordermapping.setAmount(scheduleObj.getSch_amount());
			orderMapping_Service.insertOrderMapping(ordermapping);
			
		}
		//保險
		InsProfiles insObj = (InsProfiles) session.getAttribute("insurance");
		if(insObj!=null) {
			OrderMapping ordermapping = new OrderMapping();
			Integer insNo = Integer.valueOf(insObj.getInsNum());
			ordermapping.setOrd_no(orderBean.getOrd_no());
			ordermapping.setNo(Integer.valueOf(insObj.getInsId()));
			ordermapping.setType("insurance");
			ordermapping.setQuantity(1);
			ordermapping.setAmount(130.0);
			orderMapping_Service.insertOrderMapping(ordermapping);
		}
		
		//String ordNoStr = String.valueOf(orderBean.getOrd_no());
		//寫回ord_id
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String dateString = sdf.format(now);
		String a=String.format("%03d", orderBean.getOrd_no());
		orderMain_Service.updateOrdId(dateString+"-"+a, orderBean.getOrd_no());
		session.removeAttribute("ticket");
		session.removeAttribute("fixSchedules");
		session.removeAttribute("scheduleBean");
		session.removeAttribute("insurance");
		return "訂購成功";

	}

	@RequestMapping("/index_orderList")
	public String shoppingcart(Model model) {
		return "view_orderList";
	}

	@RequestMapping("showUserOrderList")
	private @ResponseBody List<OrderMain> showOrderList(HttpSession session, Model model)
			throws ServletException, IOException {
		// 需先從session取得session.getAttribute("MemberBean");
		// 再取得目前登入的使用者id
		MemberBean member = (MemberBean)session.getAttribute("LoginOK");
		
		List<OrderMain> orderLists = orderMain_Service.selectOrderMainByMemberId(member.getMember_id());
		return orderLists;

	}

	@RequestMapping("orderDetail")
	public String orderDetail(Model model) {
		return "showOrderDetail";
	}

	@RequestMapping("show_detailOrder")
	private @ResponseBody OrderDetail showOrderDetail(HttpSession session, Model model,
			@RequestParam("Ord_no") Integer ord_no) {
		//宣告回吐結果的物件
		OrderDetail orderDetail= new OrderDetail();
		//撈取此訂單資訊
		List<OrderMain> orderMains=orderMain_Service.selectOrderMainByOrderNo(ord_no);
		if(orderMains.size()==0) {
			
			return orderDetail;
		}
		
		OrderMain  orderMain =orderMains.get(0);
		//撈取發票號碼
		orderDetail.setIv_number(iv_Service.selectByIvNO(orderMain.getIv_no()).get(0).getIv_number());
		
		//獲取收件人資料
		orderDetail.setRecipient(orderMain.getRecipient());	
		orderDetail.setRecipient_phone(orderMain.getRecipient_phone());	
		orderDetail.setRecipient_address(orderMain.getRecipient_address());	

		//撈取此訂單的產品
		List<OrderMapping> orderMappings = orderMapping_Service.selectOrderMappingByOrderNo(ord_no);
		
		ArrayList<shoppingcart> products = new ArrayList<shoppingcart>();
		for (int i = 0; i < orderMappings.size(); i++) {
			shoppingcart product = new shoppingcart();
			
			OrderMapping orderMapping = orderMappings.get(i);
			String orderType = orderMapping.getType();
			// 找到目前產品種類為票券
			if (orderType.equals("ticket")) {
				// 利用id去拿目前是哪一個產品
				Integer productNo = orderMapping.getNo();
				List<Ticket_product> productList = ticket_product_Service.getShoppingcartInfo(productNo);
				Ticket_product ticketProduct = productList.get(0);
				String startName = ticketProduct.getPro_start();
				String endName = ticketProduct.getPro_end();
				product.setName(startName + "-" + endName);
				product.setOrd_qui(orderMapping.getQuantity());
				product.setPro_amount(orderMapping.getAmount());
				product.setType(orderMapping.getType());
				products.add(product);
			}
			// 找到目前產品種類為主題旅遊
			if (orderType.equals("fixSchedule")) {
				// 利用id去拿目前是哪一個產品
				Integer fixSchNo = orderMapping.getNo();
				List<FixSchedule_product> fixSchList = fixSchedule_product_Service.getFixScheduleProductById(fixSchNo);
				FixSchedule_product fixSchProduct = fixSchList.get(0);
				String fixSchName = fixSchProduct.getFixSch_name();
				product.setName(fixSchName);
				product.setOrd_qui(orderMapping.getQuantity());
				product.setPro_amount(orderMapping.getAmount());
				product.setType(orderMapping.getType());
				products.add(product);
			}
			//找到目前產品種類為自由行
			if (orderType.equals("scheduleBean")) {
				
				product.setName(orderMapping.getNo().toString());
				product.setOrd_qui(orderMapping.getQuantity());
				product.setPro_amount(orderMapping.getAmount());
				product.setType(orderMapping.getType());
				products.add(product);
			}
              if (orderType.equals("insurance")) {
            	InsProfiles a=  iFins_Service.query(orderMapping.getNo());
				product.setName(a.getInsPlan());
				product.setOrd_qui(orderMapping.getQuantity());
				product.setPro_amount(orderMapping.getAmount());
				product.setType(orderMapping.getType());
				products.add(product);
			}
		}
		orderDetail.setProducts(products);
		return orderDetail;

	}
	//導向管理者訂單管理頁面
	@RequestMapping("/order_manager")
	public String indexOrderManager(Model model) {
		return "order_manager";
	}
	
	@RequestMapping("GetOrders")
	private @ResponseBody List<OrderMain> getOrders(HttpSession session, Model model,
			@RequestParam("Search") String search) {
	    List<OrderMain> orders = orderMain_Service.getOrders(search);
		return orders;
	}
	
	
	
	@RequestMapping(value="Update_Order",produces = "text/html; charset=UTF-8")
	private @ResponseBody String updateOrder(HttpSession session, Model model,
			@RequestParam("Ord_no") Integer ord_no,
			@RequestParam("Name") String name,
			@RequestParam("Phone") String phone,
			@RequestParam("Add") String add,
			@RequestParam("Note") String note
			) {
		
		ManagerBean managerBean = (ManagerBean)session.getAttribute("ManageLoginOK");
		if(managerBean!=null) {
			Integer managerId = managerBean.getManager_id();
			try {
				orderMain_Service.updateOrder(ord_no, name, phone, add, note);
				
				return "更新成功";
			}catch(Exception e) {
				
				return "更新失敗";
				
			}
		}else {
			return "沒有登入";
		}
		
		
		
	}
	@RequestMapping(value="delete_Order",produces = "text/html; charset=UTF-8")
	private @ResponseBody String deleteOrder(HttpSession session, Model model,
			@RequestParam("Ord_no") Integer ord_no
			) {
	   
		
		try {
			orderMain_Service.deleteOrder(ord_no);
			
			return "刪除成功";
		}catch(Exception e) {
			
			return "刪除失敗";
			
		}
		
		
	}
	
}
