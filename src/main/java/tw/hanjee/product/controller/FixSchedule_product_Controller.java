package tw.hanjee.product.controller;

import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import tw.hanjee.product.model.FixSchedule_product;
import tw.hanjee.product.model.Ticket_product;
import tw.hanjee.product.model.shoppingcart;
import tw.hanjee.product.service.FixSchedule_product_Service;

@Controller
@SessionAttributes({"ManageLoginOK"})
//@RequestMapping("/tw/hanjee")
public class FixSchedule_product_Controller {
	@Autowired
	FixSchedule_product_Service fixSchedule_product_Service;

	@RequestMapping("show_fixSchedule")
	private @ResponseBody List<FixSchedule_product> processRequest1(@RequestParam("FixSch_name") String inputName,
			HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes)
			throws ServletException, IOException {
		List<FixSchedule_product> fixSchs = fixSchedule_product_Service.getAllFixScheduleProduct(inputName);
		return fixSchs;
	}

	@RequestMapping("showFixSchDetail")
	private String processRequest2(@RequestParam("fixSch_no") Integer fixSch_no, Model model) {
		return "showFixSchDetail";

	}

	@RequestMapping("show_detailfixSchedule")
	private @ResponseBody List<FixSchedule_product> processRequest3(@RequestParam("fixSch_no") Integer fixSch_no,
			Model model) {
		List<FixSchedule_product> dFixSch = fixSchedule_product_Service.getFixScheduleProductById(fixSch_no);

		return dFixSch;

	}

	@RequestMapping(value = "AddFixSchedule", produces = "text/html; charset=UTF-8")
	private @ResponseBody String addFixSchedule(HttpSession session, Model model,
			@RequestParam("AddFixSch") String addFixSchedule) {

		Gson gson = new Gson();
		try {
			shoppingcart Jshoppingcart = gson.fromJson(addFixSchedule, shoppingcart.class);
			@SuppressWarnings("unchecked")
			List<shoppingcart> fixSchs = (List<shoppingcart>) session.getAttribute("fixSchedules");
			if (fixSchs == null) {
				fixSchs = new ArrayList<shoppingcart>();
				session.setAttribute("fixSchedules", fixSchs);
			}
			// 處理重複加入的商品
			if (fixSchs.size() > 0) {
				// 找出重複的之前商品
				boolean isRepeat=false;
				for (int i = 0; i < fixSchs.size(); i++) {
					shoppingcart thisfixSch = fixSchs.get(i);
					if (thisfixSch.getNo().equals(Jshoppingcart.getNo())) {
						// 獲取之前的數量與價格，與現在相加
						thisfixSch.setOrd_qui(Jshoppingcart.getOrd_qui() + thisfixSch.getOrd_qui());
						thisfixSch.setPro_amount(Jshoppingcart.getPro_amount() + thisfixSch.getPro_amount());
						isRepeat=true;
					}
				}
				//沒有重複就新增
				if(!isRepeat) {
					fixSchs.add(Jshoppingcart);
				}
			} else {
				fixSchs.add(Jshoppingcart);
			}
			session.setAttribute("fixSchedules", fixSchs);

			return "新增成功";

		} catch (Exception e) {
			return "新增失敗";

		}

	}
	@RequestMapping("GetFixSchProducts")
	private @ResponseBody List<FixSchedule_product> getFixSchProducts(HttpSession session, Model model,
			@RequestParam("Search") String search) {
	    List<FixSchedule_product> fixSchproducts = fixSchedule_product_Service.getFixSchProduct(search);
		return fixSchproducts;
	}

	@RequestMapping(value = "AddFixSchProduct", produces = "text/html; charset=UTF-8")
	private @ResponseBody String addFixSchProduct(HttpSession session, Model model,
			@RequestParam("FixSchProduct") String fixSchProductStr) {
		
		
		try{
			Gson gson = new GsonBuilder().setDateFormat("yyyy/MM/dd").create();
			FixSchedule_product fixSchProduct = gson.fromJson(fixSchProductStr, FixSchedule_product.class);
			
			fixSchedule_product_Service.AddFixSchProduct(fixSchProduct);
			
			return "新增成功";
		}catch(Exception e) {
			
			return "新增失敗";
		}
		
	    
	}
	
	@RequestMapping(value = "UpdateFixSchProduct",produces = "text/html; charset=UTF-8")
	private @ResponseBody String updateFixSchProduct(HttpSession session, Model model,
			@RequestParam("FixSchProductStr") String fixSchProductStr) {
	
		try{
			Gson gson = new GsonBuilder().setDateFormat("yyyy/MM/dd").create();
			FixSchedule_product fixSchProduct = gson.fromJson(fixSchProductStr, FixSchedule_product.class);
			fixSchedule_product_Service.UpdateFixSchProduct(fixSchProduct);		
			return "更新成功";
		}catch(Exception e) {
			e.printStackTrace();
			return "更新失敗";
		}
		
	}
}
