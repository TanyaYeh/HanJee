package tw.hanjee.product.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import tw.hanjee.product.model.Ticket_product;
import tw.hanjee.product.model.shoppingcart;
import tw.hanjee.product.service.Ticket_product_Service;

@Controller
public class Ticket_product_ShowData {
	@Autowired
	Ticket_product_Service ticket_product_Service;

	@RequestMapping("Ticket_product_ShowData")
	private @ResponseBody List<Ticket_product> processRequest(Model model
//			@RequestParam ("pro_no")Integer pro_no,
//			@RequestParam ("pro_start")String pro_start,
//			HttpServletRequest request,
//			HttpServletResponse response
	) throws ServletException {
		try {
			// Map<Integer, String> map = new HashMap<>();
			List<Ticket_product> ticket_products = new ArrayList<Ticket_product>();
			@SuppressWarnings("rawtypes")
			List tickets = ticket_product_Service.getselect();
			Iterator iterator = tickets.iterator();
			while (iterator.hasNext()) {
				Object[] obj = (Object[]) iterator.next();
				Integer pro_no = Integer.parseInt(String.valueOf(obj[0]));
				String pro_start = String.valueOf(obj[1]);
				String pro_end = String.valueOf(obj[2]);
				Timestamp pro_date = Timestamp.valueOf(String.valueOf(obj[3]));
				Ticket_product data = new Ticket_product();
				data.setPro_no(pro_no);
				data.setPro_start(pro_start);
				data.setPro_end(pro_end);
				data.setPro_date(pro_date);
				ticket_products.add(data);
			}
			return ticket_products;
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

	@RequestMapping("Ticket_product_SearchBySED")
	private @ResponseBody List<Ticket_product> processRequest1(@RequestParam("PickPro_star") String selectStart,
			@RequestParam("PickPro_end") String selectEnd, @RequestParam("PickPro_date") String selectDate,
			HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes)
			throws ServletException, IOException {
		List<Ticket_product> tickets = ticket_product_Service.getselectBySED(selectStart, selectEnd, selectDate);
		return tickets;
	}

	@RequestMapping(value = "AddTicket_product", produces = "text/html; charset=UTF-8")
	private @ResponseBody String addTicketProduct(HttpSession session, Model model,
			@RequestParam("AddProduct") String addProduct) {

		Gson gson = new Gson();
		try {

			// 現在加入的
			shoppingcart Jshoppingcart = gson.fromJson(addProduct, shoppingcart.class);
			@SuppressWarnings("unchecked")
			// 之前加入的
			List<shoppingcart> tickets = (List<shoppingcart>) session.getAttribute("ticket");
			if (tickets == null) {
				tickets = new ArrayList<shoppingcart>();
				session.setAttribute("ticket", tickets);
			}
			// 處理重複加入的商品
			if (tickets.size() > 0) {
				// 找出重複的之前商品
				boolean isRepeat=false;
				
				for (int i = 0; i < tickets.size(); i++) {
					shoppingcart thisTicket = tickets.get(i);
					if (thisTicket.getNo().equals(Jshoppingcart.getNo())) {
						// 獲取之前的數量與價格，與現在相加
						thisTicket.setOrd_qui(Jshoppingcart.getOrd_qui() + thisTicket.getOrd_qui());
						thisTicket.setPro_amount(Jshoppingcart.getPro_amount() + thisTicket.getPro_amount());
						isRepeat=true;
					}
				}
				//沒有重複就新增
				if(!isRepeat) {
					tickets.add(Jshoppingcart);
				}
			} else {
				tickets.add(Jshoppingcart);
			}

			session.setAttribute("ticket", tickets);

			return "新增成功";

		} catch (Exception e) {
			return "新增失敗";

		}

	}
	
	@RequestMapping(value = "GetProducts")
	private @ResponseBody List<Ticket_product> getProducts(HttpSession session, Model model,
			@RequestParam("Search") String search) {
	    List<Ticket_product> products = ticket_product_Service.getTicketProduct(search);
		return products;
	}
	
	@RequestMapping(value = "AddProduct", produces = "text/html; charset=UTF-8")
	private @ResponseBody String addProduct(HttpSession session, Model model,
			@RequestParam("Product") String productStr) {
		
		
		try{
			Gson gson = new GsonBuilder().setDateFormat("yyyy/MM/dd HH:mm").create();
			Ticket_product product = gson.fromJson(productStr, Ticket_product.class);
			
			ticket_product_Service.AddTicketProduct(product);
			
			return "新增成功";
		}catch(Exception e) {
			
			return "新增失敗";
		}
		
	    
	}
	
	@RequestMapping(value = "UpdateProduct",produces = "text/html; charset=UTF-8")
	private @ResponseBody String updateProduct(HttpSession session, Model model,
			@RequestParam("Product") String productStr) {
	
		try{
			Gson gson = new GsonBuilder().setDateFormat("yyyy/MM/dd HH:mm").create();
			Ticket_product product = gson.fromJson(productStr, Ticket_product.class);
			ticket_product_Service.UpdateTicketProduct(product);			
			return "更新成功";
		}catch(Exception e) {
			
			return "更新失敗";
		}
		
	}
	

}
