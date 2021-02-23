package tw.hanjee.product.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.hanjee.model.MemberBean;
import tw.hanjee.product.service.FixSchedule_product_Service;
import tw.hanjee.product.service.Ticket_product_Service;
import tw.hanjee.schedule.model.ScheduleBean;

@Controller
@SessionAttributes({"LoginOK"})
public class Product_Controller {
	@Autowired
	Ticket_product_Service ticket_product_Service;
	@Autowired
	FixSchedule_product_Service fixSchdule_product_Service;
	@RequestMapping("/product_Index")
	public String list(Model model) {
		MemberBean mb=(MemberBean) model.getAttribute("LoginOK");
		if(mb != null) {
			return "product_Index";
		}else {
			return "redirect:/tw/hanjee/login";
		}
//		List<Ticket_product> list = ticket_product_Service.getAllTicketProduct();
//		model.addAttribute("ticket_products",list);
		
	}
	@RequestMapping("/index_shoppingcart")
	public String shoppingcart(Model model) {
		
		return "view_shoppingcart";
	}
	
	
	@RequestMapping("/fixSchedule_index")
	public String fixSchdule(Model model) {
		return "fixSchedule_index";
	}
	
	//導向管理者商品頁面 
	@RequestMapping("/ticketProduct_manager")
	public String indexTicketProductManager(Model model) {
		return "product_manager";
	}
	
	//導向管理者主題旅遊商品頁面
		@RequestMapping("/fixSchProduct_manager")
		public String indexfixSchProductManager(Model model) {
			return "fixSch_manager";
		}
}
