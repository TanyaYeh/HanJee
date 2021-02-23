package tw.hanjee.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.hanjee.insurance.insModel.InsProfiles;
import tw.hanjee.product.model.FixSchedule_product;
import tw.hanjee.product.model.Ticket_product;
import tw.hanjee.product.model.shoppingcart;
import tw.hanjee.product.service.FixSchedule_product_Service;
import tw.hanjee.product.service.Ticket_product_Service;
import tw.hanjee.schedule.model.ScheduleBean;

@Controller
public class Shoppingcart_Controller {
	@Autowired
	Ticket_product_Service ticket_product_Service;
	@Autowired
	FixSchedule_product_Service fixSchedule_product_Service;
	

	@RequestMapping("show_Shoppingcart")
	private @ResponseBody List<shoppingcart> showShoppingcart(HttpSession session, Model model)
			throws ServletException, IOException {
		
        // 放進所有訂單貨物
		List<shoppingcart> total = new ArrayList<shoppingcart>();
		
		//自由行
		ScheduleBean scheduleObj = (ScheduleBean) session.getAttribute("scheduleBean");
		if(scheduleObj!=null) {
			shoppingcart schedule=new shoppingcart();
			Integer scheduleno = scheduleObj.getSch_no();
			schedule.setNo(scheduleno);
			schedule.setName(scheduleno.toString());
			schedule.setId(scheduleno.toString());
			schedule.setOrd_qui(1);
			schedule.setPro_amount(scheduleObj.getSch_amount());
			schedule.setType("scheduleBean");
			total.add(schedule);
			System.out.println("我在SCHEDULE這邊");
		}
		
       //車票
		@SuppressWarnings("unchecked")
		List<shoppingcart> tickets = (List<shoppingcart>) session.getAttribute("ticket");
		if (tickets != null) {
			for (int i = 0; i < tickets.size(); i++) {
				shoppingcart ticket = tickets.get(i);
				Integer ticketNo = ticket.getNo();
				List<Ticket_product> ticketInfoList = ticket_product_Service.getShoppingcartInfo(ticketNo);
				Ticket_product ticketInfo = ticketInfoList.get(0);
				String startName = ticketInfo.getPro_start();
				String endName = ticketInfo.getPro_end();
				ticket.setName(startName + "-" + endName);
				ticket.setType("ticket");
				total.add(ticket);
				System.out.println("我進去了TICKET這邊");
			}

		}
		//主題旅遊
		@SuppressWarnings("unchecked")
		List<shoppingcart> fixSchPs = (List<shoppingcart>) session.getAttribute("fixSchedules");
		if (fixSchPs != null) {
			for (int i = 0; i < fixSchPs.size(); i++) {
				shoppingcart fixSchP = fixSchPs.get(i);
				Integer fixSchNo = fixSchP.getNo();
				List<FixSchedule_product> fixSchInfoList = fixSchedule_product_Service.getFixScheduleProductById(fixSchNo);
				FixSchedule_product fixSchInfo = fixSchInfoList.get(0);
				String fixSchName = fixSchInfo.getFixSch_name();
				System.out.println("我在fixSchPs");
				fixSchP.setName(fixSchName);
				fixSchP.setType("fixSchedule");
				total.add(fixSchP);
			}

		}
		System.out.println("我還沒進去insObj");
		//保險
		InsProfiles insObj = (InsProfiles) session.getAttribute("insurance");
		if(insObj!=null) {
			
			shoppingcart ins=new shoppingcart();
			 Integer insId = Integer.valueOf(insObj.getInsId());
			 ins.setNo(insId);
			 ins.setName(insObj.getInsPlan());
			 ins.setId("777777777");
			 ins.setOrd_qui(1);
			 ins.setPro_amount(130.0);
			 ins.setType("insurance");
			 total.add(ins);
		}
		
		
		
		
		return total;
	}
	

	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="delShopping",produces = "text/html; charset=UTF-8")
	private @ResponseBody String delShoppingcartItem(HttpSession session,
			Model model,
			@RequestParam("Session") String sessionType,
			@RequestParam("ShoppingId")String shoppingId) {
		if(sessionType.equals("scheduleBean")) {
			session.removeAttribute("scheduleBean");
			return "刪除成功";
			
		}else {
			
			ArrayList<shoppingcart> products=(ArrayList<shoppingcart>)session.getAttribute(sessionType);
			int index=-1;
			for (int i=0;i<products.size();i++) {
				shoppingcart product = products.get(i);
				if(product.getId().equals(shoppingId)) {
					index=i;
					break;
				}
				
			}
			if(index!=-1) {
				products.remove(index);
				session.setAttribute(sessionType, products);
				return "刪除成功";
			}else {
				return "刪除失敗";
				
			}
		}
		
		
	}
	
}
