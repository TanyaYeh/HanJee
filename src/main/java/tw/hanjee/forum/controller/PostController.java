package tw.hanjee.forum.controller;

import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import tw.hanjee.forum.model.CommentBean;
import tw.hanjee.forum.model.ForumBean;
import tw.hanjee.forum.model.PostBean;
import tw.hanjee.forum.service.ForumService;
import tw.hanjee.forum.service.PostService;
import tw.hanjee.model.MemberBean;

@Controller
@RequestMapping("/tw/hanjee")
@SessionAttributes({ "LoginOK", "ManageLoginOK", "forum" })
public class PostController {

	@Autowired
	PostService service;
	@Autowired
	ServletContext context;
	@Autowired
	ForumService fs;

//找全部
	@RequestMapping("/posts")
	public String list(Model model) {
		ForumBean thisforum = (ForumBean) model.getAttribute("forum");
		MemberBean mb = (MemberBean) model.getAttribute("LoginOK");
		List<PostBean> list = thisforum.getPost();
		model.addAttribute("posts", list);
		model.addAttribute("mb",mb);
		return "Forum/PostBlog";// 視圖邏輯名稱
	}

//	單筆找詳細
	@RequestMapping("/post")
	public String getPostById(@RequestParam("post_no") Integer post_no, Model model) {
		model.addAttribute("post", service.getPostByOn(post_no));

		PostBean pb = service.getPostByOn(post_no);
		model.addAttribute("com", pb.getComment());
//		model.addAttribute("comments",pb.getComment());

		return "Forum/PostDetail";
	}

//	新增Post
	@GetMapping("/AddPost")
	public String getAddNewPostForm(Model model) {
		ForumBean thisforum = (ForumBean) model.getAttribute("forum");
		MemberBean mb = (MemberBean) model.getAttribute("LoginOK");
		System.out.println("1. 本方法送出新增Customer資料的空白表單2" + thisforum.getForum_no());
		PostBean po = new PostBean(mb, thisforum);

		model.addAttribute("poBean", po);	
		return "Forum/AddPost";
	}

	@PostMapping("/add")
	public String processAddNewPostForm(@ModelAttribute("poBean") PostBean bb, Model model,HttpSession session) {
		ForumBean thisforum = (ForumBean) session.getAttribute("forum");
		MemberBean mb = (MemberBean) model.getAttribute("LoginOK");
		bb.setMb(mb);
		bb.setForumBean(thisforum);

//		圖片存
		MultipartFile productImage = bb.getProductImage();
		String originalFilename = productImage.getOriginalFilename();
		bb.setFileName(originalFilename);
//		顯示抓取照片檔名名字
		
		//  建立Blob物件，交由 Hibernate 寫入資料庫
		if (productImage != null && !productImage.isEmpty() ) {
			try {
				byte[] b = productImage.getBytes();
//				上方是照片轉為bytes型別
				
				Blob blob = new SerialBlob(b);
//				轉Blob型別
				
				bb.setPost_img(blob);
				
				
			} catch(Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		String strDate = sdFormat.format(ts);
		System.out.println(strDate);
		
		bb.setPost_time(ts);
		System.out.println(bb.getMb().getNickname());
		service.addPost(bb);
		List<PostBean> nowPost=service.eachForumPost(thisforum);
//   查詢
//		List<PostBean> list = thisforum.getPost();
		model.addAttribute("posts", nowPost);
		return "Forum/PostBlog";

	}
	@GetMapping("backPostList")
	public String backPostList(Model model) {
		ForumBean thisforum = (ForumBean) model.getAttribute("forum");
	
		List<PostBean> list = thisforum.getPost();
		model.addAttribute("posts", list);

		return "Forum/PostBlog";
	}

	@PostMapping("/PostDelete/{post_no}")
	public String deletePostData(@PathVariable("post_no") Integer post_no) {
		System.out.println("232131231231231231321312123");
		
		service.deletePostByPrimmaryKey(post_no);

		return "redirect:../backPostIndex";

	}
//  修改 1-1
//	因為修改 需要取得TB資料 顯示 並且 修改使用者變更資料回傳到TB
	@GetMapping("/PostUpdate/{post_no}")
	public String editPostForm(Model model, @PathVariable("post_no") Integer post_no) {
		PostBean bean = service.getPostByOn(post_no);
		model.addAttribute("bean", bean);
//		這邊是update的addAttribute
		System.out.println("我的論壇名稱是::::"+bean.getForumBean().getForum_name());

		return "Forum/EditPost";
	}

///////修改 1-2///////文章更新有包含內文更新/////////////////////
	@PostMapping("/PostUpdate/{post_no}")
	public String modifyPostData(@ModelAttribute(name = "bean") PostBean bean, Model m) {
		ForumBean fb=(ForumBean) m.getAttribute("forum");
		bean.setForumBean(fb);
		service.updatePost(bean);
		bean.getForumBean();
		
		List<PostBean> list = fs.getForumNo(bean.getForumBean().getForum_no()).getPost();
		m.addAttribute("posts", list);

		return "Forum/PostBlog";
	}
	
	
	
	///照片新增
	@RequestMapping(value = "/getPicture/{post_no}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer post_no) {
		String filePath ="/WEB-INF/views/images/NoImage.jpg";
//		"/WEB-INF/views/images/aNoImage.png";
		

		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		PostBean bean = service.getPostByOn(post_no);
		if (bean != null) {
			Blob blob = bean.getPost_img();
			filename = bean.getFileName();
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					throw new RuntimeException("PostController的getPicture()發生SQLException: " + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				filename = filePath;
			}
		} else {
			media = toByteArray(filePath);
			filename = filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = context.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("mediaType =" + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}


	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		try (InputStream fis = context.getResourceAsStream(filepath);
				ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
			int len = 0;
			byte[] b0 = new byte[2048];
			while ((len = fis.read(b0)) != -1) {
				baos.write(b0, 0, len);
			}
			b=baos.toByteArray();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}

	}
