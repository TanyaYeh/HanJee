package tw.hanjee.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.hanjee.model.MemberBean;
import tw.hanjee.service.MemberService;



@Controller
@RequestMapping("tw/hanjee/")
public class RegisterController {
	@Autowired
	ServletContext context;


	@Autowired
	MemberService service;

	@GetMapping("/modifyCustomer/{id}")
	public String editMembeForm(Model model, @PathVariable Integer id) {
		MemberBean bean = service.getMember_id(id);	
		model.addAttribute("customerBean", bean);
		return "Register/EditCustomerForm";
	}

	@GetMapping("Register/insertCustomer")
	public String showMemberForm(Model model) {
		
		MemberBean bean = new MemberBean();
		
		model.addAttribute("mbBean", bean);
		return "Register/CustomerForm";
	}
	
	@PostMapping("Register/insertCustomer")
	public String insertCustomerData(
			@ModelAttribute("mbBean") MemberBean bean , BindingResult bindingResult,HttpServletRequest request, HttpServletResponse response ) {
		
	
		System.out.println("新增會員: " + bean);

		if (bindingResult.hasErrors()) {
			return "Register/CustomerForm";
		}

		System.out.println("bean==>" + bean);
		if (bean.getMember_id() != null) {
			service.updateMember(bean);
		}
		bean.setRegister_date(new Timestamp(System.currentTimeMillis()));
		service.save(bean);
		
		System.out.println("insertPostController");
		return "redirect: " + request.getContextPath();
//		redirect  按重新整理 不會造成後續的增加
//		customers試圖邏輯名稱
	}

	@DeleteMapping(value="/modifyCustomer/{id}")
	public String deleteMemberData(@PathVariable String account) {
		System.out.println(11122233);
		service.deleteMemberByAccount(account);	
		return "redirect:../customers";
	}
	
	@PostMapping("Register/modifyAccount")
	public @ResponseBody String modifyAccount(@RequestParam("reAccount") String account) {
		System.out.println("我怎麼回去了");
		if(service.accountExists(account)) {
			
			return "exist";
		}else{
			return "okaccount";
		}
		
		
	}
	
}
