//package tw.hanjee.product.controller;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//
//import tw.hanjee.product.model.Ticket_productBean;
//import tw.hanjee.product.service.Ticket_product_Service;
//
//@Controller
//public class Ticket_product_Controller {
//	@Autowired
//	Ticket_product_Service ticket_product_Service;
//	@RequestMapping("/product_Index")
//	public String list(Model model) {
//		List<Ticket_productBean> list = ticket_product_Service.getAllTicketProduct();
//		model.addAttribute("ticket_products",list);
//		return "product_Index";
//	}
//}
