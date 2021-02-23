package tw.hanjee.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import tw.hanjee.model.LoginBean;
import tw.hanjee.model.MemberBean;
import tw.hanjee.schedule.model.ScheduleBean;
import tw.hanjee.service.MemberService;

@Controller
@RequestMapping("/tw/hanjee")
@SessionAttributes({"LoginOK","schedule"})
public class LoginController {
	@Autowired
	MemberService ms;
	
	@GetMapping("/login")
	public String loginfromindex() {
		return "login";
	}
	
	@PostMapping("/login")
	public String loginbutton(@ModelAttribute("loginbean")LoginBean lb,Model m,HttpServletRequest request, HttpServletResponse response ) {
		System.out.println("進來登入");
		MemberBean mb = null;
		HttpSession session = request.getSession();
			mb= ms.checkaccountPassword(lb.getAccount(), lb.getPassword());

			if (mb != null) {
				
				m.addAttribute("LoginOK", mb);
				System.out.println("登入成功");
			} else {
				System.out.println("登入失敗");
				return "redirect: "+request.getContextPath()+"/tw/hanjee/login";
			}
			
		
			return "redirect: " + request.getContextPath();
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session,  Model model, SessionStatus status,
			RedirectAttributes redirectAtt
			) {
		String name = "";
		System.out.println("Logout");
		MemberBean memberBean = (MemberBean) session.getAttribute("LoginOK");
		if (memberBean != null) {
			name = memberBean.getNickname();
		} else {
			name = "訪客";
		}
		String farewellMessage = name + "已登出，期待您再次蒞臨本網站";
		redirectAtt.addFlashAttribute("logoutmessage", farewellMessage);
		// 登出時執行下列兩敘述
		
		status.setComplete();// 移除@SessionAttributes({"LoginOK"}) 標示的屬性物件
		
		session.invalidate();
		
		// 此敘述不能省略		
		return "redirect:/";
	}
}
