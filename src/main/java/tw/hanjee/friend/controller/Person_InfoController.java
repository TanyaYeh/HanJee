package tw.hanjee.friend.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import tw.hanjee.friend.model.Friend_RelationBean;
import tw.hanjee.friend.model.Person_InfoBean;
import tw.hanjee.friend.service.interface1.IFriend_RelationService;
import tw.hanjee.friend.service.interface1.IPerson_InfoService;
import tw.hanjee.model.MemberBean;
import tw.hanjee.schedule.model.DailyScheduleBean;
import tw.hanjee.schedule.model.ScheduleBean;
import tw.hanjee.schedule.service.IscheduleService;

@Controller
@RequestMapping("/friend")
@SessionAttributes({ "LoginOK" })
public class Person_InfoController {
	@Autowired
	IPerson_InfoService iiService;

	@Autowired
	IFriend_RelationService ifrservice;

	@Autowired
	ServletContext context;
	
	@Autowired
	IscheduleService ischService;
	
//////////////////填資料+進到Friend_index做各種判斷(沒球的)/////////////////////////////////////////////////////////////
	@GetMapping("/piForm")
	public String showForm(Model model, HttpSession session) {
		MemberBean member = (MemberBean) model.getAttribute("LoginOK");

		if (member != null) {
			Integer member_id = member.getMember_id(); //因為這是首頁按進來，所以使用者可能沒登錄，member可能是null，如果在外面getMember_id會直接報錯，所以不能寫在if外
			Person_InfoBean PiBean = iiService.showInf(member_id);
			if (PiBean == null) {
				Person_InfoBean pIBean = new Person_InfoBean();
			    pIBean.setPer_high(175.5);
			    pIBean.setPer_wei(67.0);
			    pIBean.setPer_rel("單身");
			    pIBean.setPer_job("工程師");
			    pIBean.setPer_inc("100000以上");
			    pIBean.setPer_int("專題發表");
			    pIBean.setPer_con("摩羯座");
			    pIBean.setDream("面試上好公司");
				model.addAttribute("PIBean", pIBean);
				return "friend/Basic_Information";
			} else {
				/////////////////////這區間是加上行程判斷(大魔王的部分)////////////////
				
				Set<Integer> confirmfriendIDSet = new HashSet<Integer>();
				Set<Person_InfoBean> person_InfoBeanSet = new HashSet<Person_InfoBean>();
				System.out.println("1111111111111111111111111111111111111111111111111111111111111");
				Integer mid = member.getMember_id(); 
				System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"+mid);
//				Map<Integer, List<java.sql.Date>> mydateMap = ischService.memberHangoutDate(mid);
//				List<java.sql.Date> mydate = mydateMap.get(mid); //自己所有去玩日期
//				System.out.println("22222222222222222222222222222222222222222222222222222222222"+mydate);
				Set<Integer> allNoFandSID = ifrservice.getAllNofriendIDandSelfID(mid);
				System.out.println("靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠靠"+allNoFandSID);
				for(Integer allotherID:allNoFandSID) {
					Map<Integer, List<java.sql.Date>> mydateMap = ischService.memberHangoutDate(mid);  //78
					List<java.sql.Date> mydate = mydateMap.get(mid); //自己所有去玩日期     //78
					
					System.out.println("出來吧出來吧出來吧出來吧出來吧出來吧出來吧出來吧出來吧出來吧出來吧出來吧出來吧出來吧出來吧"+allotherID);
					Map<Integer, List<java.sql.Date>> otherdateMap = ischService.memberHangoutDate(allotherID);
					List<java.sql.Date> otherdate = otherdateMap.get(allotherID);  //其他人所有去玩日期
					System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+mydate);
//					mydate.containsAll(otherdate);
					System.out.println("有沒有有沒有有沒有有沒有有沒有有沒有有沒有有沒有有沒有有沒有有沒有有沒有有沒有有沒有有沒有有沒有"+mydate);
					mydate.retainAll(otherdate);  //日期交集
					System.out.println("33333333333333333333333333333333333333333333333333333333333"+mydate);
					mydate.removeAll(Collections.singleton(null));
					
					if(mydate.size() != 0) {
						
						System.out.println("我進來了，我的size"+mydate.size());
						
						for(java.sql.Date mydate1:mydate) {
							System.out.println("我進來了，我的Date"+mydate1);
							
							Map<Integer, Map<java.sql.Date, List<Integer>>> myPlaceMap = ischService.queryDatePlaceBymemberIDDate(mydate1,mid);
							System.out.println("我進來了，我的Date");
							List<Integer> myPlaceList = myPlaceMap.get(mid).get(mydate1); //自己有交集時間的去玩地點
							System.out.println("064064064064064064064064064064064064064064064064064064064"+myPlaceList);
							
							Map<Integer, Map<java.sql.Date, List<Integer>>> otherPlaceMap = ischService.queryDatePlaceBymemberIDDate(mydate1,allotherID);
							List<Integer> otherPlaceList = otherPlaceMap.get(allotherID).get(mydate1); //其他人有交集時間的去玩地點
							System.out.println("你老師你老師你老師你老師你老師你老師你老師你老師你老師你老師你老師你老師你老師你老師"+otherPlaceList);
							myPlaceList.retainAll(otherPlaceList);
							System.out.println("000000000000000000000000000000000000000000000000000000000"+myPlaceList.size());
							myPlaceList.removeAll(Collections.singleton(null));
							System.out.println("幹幹幹幹幹幹幹幹幹幹幹幹幹幹幹幹幹幹幹幹幹幹幹幹"+myPlaceList.size());
							if(myPlaceList.size() != 0) {
								System.out.println("000000000000000000000000000000000000000000000000000000000"+myPlaceList);
								
								confirmfriendIDSet.add(allotherID);  //取到所有時間地點有相符合的人的ID
								System.out.println("6666666666666666666666666666666666666666666666666666666666666666");
								for(Integer allotherid:confirmfriendIDSet) {
									Person_InfoBean myfriendperinfoBean = iiService.showInf(allotherid);
									person_InfoBeanSet.add(myfriendperinfoBean);
								}
								
							}
						}
						
					}
				}
				 session.setAttribute("Person_InfoList", person_InfoBeanSet);
				
				/////////////////////////////////////////////////////////////////////////////////////
//				 List<Friend_RelationBean> frBList = ifrservice.queryByMemberId(member.getMember_id());
//				    Iterator<Friend_RelationBean> frB = frBList.iterator();//用member_id找的所有朋友的Friend_RelationBean
//				    List<Integer> friendIdList = new LinkedList<Integer>();//給個容器
//				    friendIdList.add(member.getMember_id());
//				    while (frB.hasNext()) {													
//				     friendIdList.add(frB.next().getFb().getMember_id());
//				    }
//				    List<Friend_RelationBean> mrBList = ifrservice.queryByFriendId(member.getMember_id());
//				    Iterator<Friend_RelationBean> mrB = mrBList.iterator();//用friend_id找的所有朋友的Friend_RelationBean
//				    while (mrB.hasNext()) {				    								
//				     friendIdList.add(mrB.next().getMb().getMember_id());
//				    }
//				    System.out.println("friendIdList有====" + friendIdList);
//				    List<Person_InfoBean> person_InfoBean = iiService.queryAllInf();
//				    Set<Person_InfoBean> withoutMe = new HashSet<Person_InfoBean>();
//				    List<Integer> allPIFId = new LinkedList<Integer>();
//				    
//				    for (Person_InfoBean pifb : person_InfoBean) {
//				     allPIFId.add(pifb.getBean().getMember_id());
//				    }
//				    
//
//				    System.out.println("friendIdList的SIZE是" + friendIdList.size());
//				    System.out.println("allPIFId的SIZE是" + allPIFId.size());
//				    allPIFId.removeAll(friendIdList);
//				    System.out.println("allPIFId的SIZE是" + allPIFId.size());
//				    for(Integer i:allPIFId) {
//				     withoutMe.add(iiService.showInf(i));
//				    }
//				    session.setAttribute("Person_InfoList", withoutMe);
				    return "friend/Friend_index";
				    
				    //-----------不顯示自己時的做法-------------------------------------------------------------
//				List<Person_InfoBean> person_InfoBean = IIService.queryAllInf();
//				Iterator<Person_InfoBean> iterpibean = person_InfoBean.iterator();
//				while (iterpibean.hasNext()) {
//					Person_InfoBean itbeannext = iterpibean.next();
//					Integer memberid = itbeannext.getMember_id();
//
//					if (memberid == member_id) {
//						iterpibean.remove(); 
//					}
//				}
				///////////////////////////////////////////////////////////////////////////////////
			
			}
		} else {
			return "redirect:/tw/hanjee/login";
		}
	}
	

//////////////////送出基本資料到資料庫/////////////////////////////////////////////////////////////
	@PostMapping("/piForm")
	public String processAddInf(@ModelAttribute("PIBean") Person_InfoBean pIBean, HttpSession session,
			RedirectAttributes ra, Model model) {

		MemberBean member = (MemberBean) model.getAttribute("LoginOK"); // 為何原本這無法接到member_id的值???
		pIBean.setBean(member);

		MultipartFile personalImage = pIBean.getmultipartFile();
		String originalFilename = personalImage.getOriginalFilename();
		pIBean.setImg_name(originalFilename);
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if (personalImage != null && !personalImage.isEmpty()) {
			try {
				byte[] b = personalImage.getBytes();
				Blob blob = new SerialBlob(b);
				pIBean.setProfile(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}

		iiService.AddInf(pIBean);
//		session.setAttribute("pIBean", pIBean);
//		System.out.println(pIBean);
		ra.addFlashAttribute("ra", pIBean);

//		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
//		String rootDirectory = context.getRealPath("/");
//		try {
//			File imageFolder = new File(rootDirectory, "images");
//			if (!imageFolder.exists()) imageFolder.mkdirs();//建資料夾
//			File file = new File(imageFolder, bb.getBookId() + ext);
//			productImage.transferTo(file);
//		} catch(Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
//		}
//		System.out.println("redirect??");
		return "redirect:/friend/Show_Basic_Info";

	}


//////////////////進入(查詢資料)更新頁面/////////////////////////////////////////////////////////////
	@GetMapping("/showInf")
	public String showBasicInf(Model model, HttpSession session) {

		MemberBean member = (MemberBean) model.getAttribute("LoginOK");
		Integer member_id = member.getMember_id();
//		Person_InfoBean perIbean = (Person_InfoBean) session.getAttribute("pIBean");
//		Integer member_id = perIbean.getMember_id();
//		System.out.println(perIbean.getMember_id());
//		System.out.println("22222222222222222");
		Person_InfoBean PiBean = iiService.showInf(member_id);
//		System.out.println("pIBean");

		model.addAttribute("PiBean", PiBean);
		return "friend/Update_Basic_Info";
	}

//////////////////更新完成並回到交友首頁/////////////////////////////////////////////////////////////
	@PostMapping("/update_and_back")
	public String cchangeInf(@ModelAttribute("PiBean") Person_InfoBean pIBean) {
		System.out.println("123");
		MultipartFile personalImage = pIBean.getmultipartFile();
		System.out.println("234");
		String originalFilename = personalImage.getOriginalFilename();
		System.out.println("345");
		pIBean.setImg_name(originalFilename);

		if (personalImage != null && !personalImage.isEmpty()) {
			try {
				byte[] b = personalImage.getBytes();
				Blob blob = new SerialBlob(b);
				pIBean.setProfile(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}

		iiService.changeInf(pIBean);
//		IIService.AddInf(pIBean);
		return "friend/Friend_index";
	}


//////////////////取得照片並秀出/////////////////////////////////////////////////////////////
	@GetMapping("/getPicture/{member_id}")
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer member_id) {
		String filePath = "/WEB-INF/views/images/NoImage.jpg";

		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();

		String filename = "";
		int len = 0;
		Person_InfoBean bean = iiService.showInf(member_id);
		if (bean != null) {
			Blob blob = bean.getProfile();
			filename = bean.getImg_name();
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
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

//////////////////取得照片並秀出的必要使用到的方法/////////////////////////////////////////////////////////////
	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		try (InputStream fis = context.getResourceAsStream(filepath);
				ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
			int len = 0;
			byte[] b0 = new byte[2048];
			while ((len = fis.read(b0)) != -1) {
				baos.write(b0, 0, len);
			}
			b = baos.toByteArray();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}
	

}
