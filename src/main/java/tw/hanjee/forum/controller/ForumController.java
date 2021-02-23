package tw.hanjee.forum.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.hanjee.forum.model.ForumBean;
import tw.hanjee.forum.model.PostBean;
import tw.hanjee.forum.service.ForumService;
import tw.hanjee.forum.service.PostService;
import tw.hanjee.model.ManagerBean;
import tw.hanjee.model.MemberBean;

@Controller
@RequestMapping("/tw/hanjee")
@SessionAttributes({ "LoginOK", "ManageLoginOK", "forum" })
public class ForumController {

	@Autowired
	ForumService service;
	@Autowired
	PostService ps;

	@RequestMapping("/forums")
	public String list(Model model, HttpSession session) {

//	////////////////判斷是否登入	
		MemberBean login = (MemberBean) model.getAttribute("LoginOK");
		ManagerBean manlogin = (ManagerBean) model.getAttribute("ManageLoginOK");
		System.out.println("我測試");
		if (login != null || manlogin != null) {

//////////////////透過service去撈			
			List<ForumBean> list = service.getAllForum();

//		以下對應到jsp items
			model.addAttribute("forums", list);
			return "Forum/forum";
		} else {
			return "redirect:/tw/hanjee/login";
		}

	}

//	新增後快速呈現
	@RequestMapping("backPostIndex")
	public String backPostIndex(Model model, HttpSession session) {
		ForumBean forum = (ForumBean) model.getAttribute("forum");
		Integer forum_no = forum.getForum_no();
		List<PostBean> list = service.getForumNo(forum_no).getPost();

//		以下對應到jsp items
		model.addAttribute("posts", list);
		return "Forum/PostBlog";
	}
	
//	刪除後快速呈現
	@RequestMapping("backPostIndexByDE" )
	public String backPostDetailIndex(Model model, HttpSession session) {
		ForumBean forum = (ForumBean) model.getAttribute("forum");
		List<PostBean> list = service.getForumNo(forum.getForum_no()).getPost();
		model.addAttribute("posts", list);
		return "Forum/PostBlog";
	}

	
	
	@RequestMapping("/forum")
	public String getForumNo(@RequestParam("forum_no") Integer forum_no, HttpSession session,Model model) {
		model.addAttribute("forum", service.getForumNo(forum_no));
		System.out.println("我測試我在56行" + forum_no);
//		ForumBean fpb = service.getForumNo(forum_no);

		try {
			List<PostBean> list = service.getForumNo(forum_no).getPost();

			model.addAttribute("posts", list);
			return "Forum/PostBlog";
		} catch (Exception e) {
			e.printStackTrace();
			return "Forum/PostBlog";
		}

	}

	@GetMapping("/AddForum")
	public String gettAddNewForum(Model model) {
		System.out.println("我測試我在65行");
		System.out.println("1. 本方法送出新增Forum資料的空白表單");
		ForumBean fpo = new ForumBean();
		System.out.println("成功匯入");
		model.addAttribute("fpoBean", fpo);
		System.out.println("1. 本方法送出新增Forum資料的空白表單2");
		return "Forum/AddForum";
	}

	@PostMapping("/Forumadd")
	public String processAddNewPostForm(@ModelAttribute("fpoBean") ForumBean bb,Model m) {
		System.out.println("我測試我在76行");
		System.out.println("add匯入POST");
		service.addForum(bb);
		List<ForumBean> list = service.getAllForum();

//		以下對應到jsp items
			m.addAttribute("forums", list);
		return "Forum/forum";

	}

	//////////////// 刪除主題
	@PostMapping("/ForumDelete")
	public String deleteForumData(@ModelAttribute("beenf") ForumBean fb,Model m) {
		System.out.println("刪除主題");
		Integer a= fb.getForum_no();
		System.out.println(a);
		service.deleteForumByPrimaryKey(a);
		m.addAttribute("forums",service.getAllForum());
		return "Forum/forum";
	}

	//////////// 主題修改
	@GetMapping("/ForumUpdate/{forum_no}")
	public String editForum(Model model, @PathVariable("forum_no") Integer forum_no) {
		ForumBean been = service.getForumNo(forum_no);
		System.out.println("hihi");
		System.out.println(been.getForum_no());
		model.addAttribute("beenf", been);
		return "Forum/EditForum";
	}

	@PostMapping("/ForumUpdate/{forum_no}")
	public String modifyForumData(@ModelAttribute(name = "beenf") ForumBean been) {
		service.updateForum(been);
		return "Forum/forum";

	}
}
