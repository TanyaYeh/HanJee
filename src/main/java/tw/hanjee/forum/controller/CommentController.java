package tw.hanjee.forum.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.hanjee.forum.model.CommentBean;
import tw.hanjee.forum.model.ForumBean;
import tw.hanjee.forum.model.PostBean;
import tw.hanjee.forum.service.CommentService;
import tw.hanjee.forum.service.PostService;


@Controller
@RequestMapping("/tw/hanjee")
@SessionAttributes("comment")
public class CommentController {
	@Autowired
	PostService pservice;
	@Autowired
	CommentService service;
	
	@RequestMapping("coms")
	public String list(Model model) {
		List<CommentBean> com = service.getAllCom();
		model.addAttribute("coms",com);
		return "Forum/PostDetail";
	}
	
	
//	
//	@GetMapping("/add")
//	public String getAddNewComForm(Model model) {
//		System.out.println("新增表單");
//		CommentBean co = new CommentBean();
//		System.out.println("成功匯入");
//		model.addAttribute("coBean",co);
//		System.out.println("新增空白表單2");
//		return  "Forum/PostDetail";
//	}
	
//	使用ajax方法
	@PostMapping("/Comadd")
	public @ResponseBody String processAddNewComForm(@RequestParam("co") String s, 
			@RequestParam("post" )Integer po) {
//		加上去 ,@RequestParam("id") Integer mem 測試硬塞ID值用的
		
		
		System.out.println("Comment add匯入");
		System.out.println(s);
		System.out.println(pservice.getPostByOn(po).getPost_no());
		CommentBean cb = new CommentBean(s,pservice.getPostByOn(po));
//		CommentBean cb = null;  
		System.out.println(po);
			
		service.addCom(cb);
		
		
		return  cb.getCom_text();
		
	}
//刪除
//	@PostMapping("/ComDelet")
//	public String deleteComData(@PathVariable("com_no") int com_no ) {
//	System.out.println("刪除OK");
//	service.deleteComByPrimaryKey(com_no);
//		
//		return "Forum/PostDetail";
//		
//	}
	
	@GetMapping(value = "/ComDelet/{com_no}")
	 public String ComDelet(@PathVariable("com_no") Integer com_no ,Model m) {
	  System.out.println("我在CONTROLLER+++++++"+com_no);
		PostBean art = service.getCommentByNo(com_no).getPostBean();			 
	  System.out.println("---------"+art);
	  service.deleteComByPrimaryKey(com_no);
	  
	  m.addAttribute("coms",service.getallComByPost(art));
	  
	  return "Forum/PostDetail";
	  
	 }
}
