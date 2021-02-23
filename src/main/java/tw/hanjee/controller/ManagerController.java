package tw.hanjee.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import tw.hanjee.model.LoginBean;
import tw.hanjee.model.ManagerBean;
import tw.hanjee.model.MemberBean;
import tw.hanjee.schedule.model.ScheduleBean;
import tw.hanjee.service.ManagerService;
import tw.hanjee.service.MemberService;

@Controller
@RequestMapping("/tw/hanjee")
@SessionAttributes({"ManageLoginOK","schedule"})
public class ManagerController {
	@Autowired
	ManagerService ms;
	@Autowired
	MemberService mms;
	@GetMapping("/managerlogin")
	public String loginfromindex() {
		return "managerLogin";
	}
	@GetMapping("/managerback")
	public String backIndex() {
		return "manageForm";
	}
	@RequestMapping("/ticketProduct_manager")
	public String indexTicketProductManager(Model model) {
		return "fixSch_manager";
	}
	@PostMapping("/managerlogin")
	public String loginbutton(@ModelAttribute("managerloginbean")ManagerBean mbb,Model m,HttpServletRequest request, HttpServletResponse response ) {
		System.out.println("進來登入");
		ManagerBean mb = null;
		
			mb= ms.checkaccountPassword(mbb.getManager_Name(),mbb.getManager_Pwd());

			if (mb != null) {
				
				m.addAttribute("ManageLoginOK", mb);
				System.out.println("登入成功");
			} else {
				System.out.println("登入失敗");
				return "redirect: "+request.getContextPath()+"/tw/hanjee/managerlogin";
			}
			
		
			return "/manageForm" ;
	}
	
	@GetMapping("/managerlogout")
	public String logout(HttpSession session,  Model model, SessionStatus status,
			RedirectAttributes redirectAtt
			) {
		String name = "";
		System.out.println("Logout");
		ManagerBean managerBean = (ManagerBean) session.getAttribute("LoginOK");
		if (managerBean != null) {
			name = managerBean.getManager_Name();
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
	
	@GetMapping("/membermanage")
	public String manageMember(Model m) {
		Map<Integer, MemberBean> map = ms.queryAllMember();
		System.out.println("map.keySet()="+map.keySet());
		//System.out.println("我的MAP是"+map.size());
		
		m.addAttribute("allMemberMap",map);
		m.addAttribute("memID",map.keySet());
		
		return"manageMember";
	}
	
	@PostMapping("/shutup")
	public String shutup(Model m,@RequestParam("memID")Integer i) {
		MemberBean mb=mms.getMember_id(i);
		mb.setMobile_phone("閉嘴"+mb.getMobile_phone());
		mms.updateMember(mb);
		return "demo";
	}
	@PostMapping("/kill")
	public String kill(Model m,@RequestParam("memID")Integer i) {
		MemberBean mb=mms.getMember_id(i);
		mb.setMobile_phone("違反規範了大哥(姊)"+mb.getMobile_phone());
		mb.setRealname(mb.getRealname()+"(黑單)");
		mms.updateMember(mb);
		return "demo";
	}
	
	
	@PostMapping("/revive")
	public String revive(Model m,@RequestParam("memID")Integer i) {
		MemberBean mb=mms.getMember_id(i);
//		mb.setMobile_phone("0978982302");
		mb.setMobile_phone(mb.getMobile_phone().substring((mb.getMobile_phone().length()-10), (mb.getMobile_phone().length())));
		String fixName = mb.getRealname();
//	mb.setRealname("張帷翔");
		mb.setRealname(mb.getRealname().substring(0,(fixName.length()-4)));
		mms.updateMember(mb);
		
		return "demo";
	}
	@GetMapping("aboutus")
	public String toaboutus() {
		return "aboutUs";
	}
	
	
}
