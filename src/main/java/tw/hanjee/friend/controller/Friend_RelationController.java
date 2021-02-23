package tw.hanjee.friend.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectWriter;

import tw.hanjee.friend.model.Friend_RelationBean;
import tw.hanjee.friend.model.Person_InfoBean;
import tw.hanjee.friend.service.interface1.IFriend_RelationService;
import tw.hanjee.friend.service.interface1.IPerson_InfoService;
import tw.hanjee.model.MemberBean;
import tw.hanjee.schedule.service.IscheduleService;
import tw.hanjee.service.MemberService;

@Controller
@SessionAttributes({ "LoginOK" })
public class Friend_RelationController {
	@Autowired
	IFriend_RelationService ifrservice;
	@Autowired
	IPerson_InfoService iiService;
	@Autowired
	MemberService mbs;
	@Autowired
	IscheduleService ischService;

	///////////////// 秀出所有會員//////////////////////////////////////////////////////////////
	@GetMapping("/showAllMember")
	public String showAllMember(HttpSession session) {

		List<Person_InfoBean> Person_InfoBean = iiService.queryAllInf();
		session.setAttribute("Person_InfoList", Person_InfoBean);

		return "friend/Show_AllMember";
	}

	///////////////// 加(新增)好友/////判斷狀態同意或拒絕(1or0)/////////////////////////////////////////////////////////
	@GetMapping("/addFriend/{person_Info.member_id}/{answer}")
	public String addFriend(@PathVariable("person_Info.member_id") Integer friend_id,
			@PathVariable(required = false) Integer answer, Model model, HttpSession session,RedirectAttributes ra) {

		MemberBean mmb = (MemberBean) model.getAttribute("LoginOK");
		Integer member_id = mmb.getMember_id();
		MemberBean fmb = mbs.queryByMember_id(friend_id);

		if (answer == -1) {

			Friend_RelationBean fRBean = new Friend_RelationBean(mmb, fmb);
			System.out.println("33333333333333333333333333333333333333333333333333");
			java.sql.Date date = new java.sql.Date(new java.util.Date().getTime());
			fRBean.setMeet_day(date);
			fRBean.setStatus(0);
			ifrservice.frinsert(fRBean);
		}

		if (answer == 1) {

			Friend_RelationBean fRBean1 = ifrservice.queryByTwoId(friend_id, member_id);
			System.out.println(fRBean1);

			System.out.println(fRBean1);
			java.sql.Date date = new java.sql.Date(new java.util.Date().getTime());

			fRBean1.setMeet_day(date);
			fRBean1.setStatus(1);// 也要判斷後才能直接變狀態1

			ifrservice.frupdate(fRBean1);
		} else if (answer == 0) {

			Friend_RelationBean fRBean1 = ifrservice.queryByTwoId(friend_id, member_id);
			System.out.println(fRBean1);

			fRBean1.setStatus(2);
			ifrservice.frupdate(fRBean1);
		}

//=========================這邊再做了一次/piform這路徑的Controller做的事，為了讓他可以重新搜尋======================================
		
//		Set<Integer> confirmfriendIDSet = new HashSet<Integer>();
//		Set<Person_InfoBean> person_InfoBeanSet = new HashSet<Person_InfoBean>();
//		System.out.println("1111111111111111111111111111111111111111111111111111111111111");
//		Integer mid = mmb.getMember_id(); 
////		Map<Integer, List<java.sql.Date>> mydateMap = ischService.memberHangoutDate(mid);
////		List<java.sql.Date> mydate = mydateMap.get(mid); //自己所有去玩日期
//		System.out.println("22222222222222222222222222222222222222222222222222222222222");
//		Set<Integer> allNoFandSID = ifrservice.getAllNofriendIDandSelfID(mid);
//		for(Integer allotherID:allNoFandSID) {
//			Map<Integer, List<java.sql.Date>> mydateMap = ischService.memberHangoutDate(mid);  //
//			List<java.sql.Date> mydate = mydateMap.get(mid); //自己所有去玩日期        //
//			
//			Map<Integer, List<java.sql.Date>> otherdateMap = ischService.memberHangoutDate(allotherID);
//			List<java.sql.Date> otherdate = otherdateMap.get(allotherID);  //其他人所有去玩日期
//			mydate.retainAll(otherdate);  //日期交集
//			System.out.println("33333333333333333333333333333333333333333333333333333333333");
//			mydate.removeAll(Collections.singleton(null));
//			if(mydate.size() != 0) {
//				System.out.println("我進來了，我的size"+mydate.size());
//				
//				for(java.sql.Date mydate1:mydate) {
//					System.out.println("我進來了，我的Date"+mydate1);
//					Map<Integer, Map<java.sql.Date, List<Integer>>> myPlaceMap = ischService.queryDatePlaceBymemberIDDate(mydate1,mid);
//					System.out.println("6666666666666666666666666666666666666666666666666666666666666");
//					List<Integer> myPlaceList = myPlaceMap.get(mid).get(mydate1); //自己有交集時間的去玩地點
//					System.out.println("444444444444444444444444444444444444444444444444444444444444");
//					Map<Integer, Map<java.sql.Date, List<Integer>>> otherPlaceMap = ischService.queryDatePlaceBymemberIDDate(mydate1,allotherID);
//					List<Integer> otherPlaceList = otherPlaceMap.get(allotherID).get(mydate1); //其他人有交集時間的去玩地點
//					System.out.println("555555555555555555555555555555555555555555555555555555555555555");
//					myPlaceList.retainAll(otherPlaceList);
//					myPlaceList.removeAll(Collections.singleton(null));
//					if(myPlaceList.size() != 0) {
//						confirmfriendIDSet.add(allotherID);  //取到所有時間地點有相符合的人的ID
//						System.out.println("6666666666666666666666666666666666666666666666666666666666666666");
//						for(Integer allotherid:confirmfriendIDSet) {
//							
//							Person_InfoBean myfriendperinfoBean = iiService.showInf(allotherid);
//							person_InfoBeanSet.add(myfriendperinfoBean);
//						}
//						
//					}
//				}
//			}
//		}
//		
//		 session.setAttribute("Person_InfoList", person_InfoBeanSet);
		 
		// ================================================================================================

		return "redirect:/friend/piForm";

		////////////////////// 這邊是原本的(保留用
		////////////////////// 怕上面改壞掉)/////////////////////////////////////////////////////
//		MemberBean mmb = (MemberBean)model.getAttribute("LoginOK");
//
//		MemberBean fmb = mbs.queryByMember_id(friend_id);
//		String realname = fmb.getRealname();
//		
//		Friend_RelationBean fRBean = new Friend_RelationBean(mmb,fmb);
//		
//		java.sql.Date date = new java.sql.Date(new java.util.Date().getTime());
//		
//		fRBean.setRealname(realname);
//		fRBean.setMeet_day(date);
//		fRBean.setStatus(1);
//		
//		ifrservice.frinsert(fRBean);
//		
//		return "friend/Friend_index";
	}

	///////////////// 查詢好友//////////////////////////////////////////////////////////////
	@GetMapping("/showAllMyFriend")
	public String showAllMyFriend(HttpSession session, Model model) {

		MemberBean member = (MemberBean) model.getAttribute("LoginOK");
		Integer member_id = member.getMember_id();
		List<Friend_RelationBean> frBList = ifrservice.queryByMemberId(member_id);
		List<Friend_RelationBean> frFList = ifrservice.queryByFriendId(member_id);
		List<Integer> friendIDList = new ArrayList<Integer>();
		Map<Integer, Friend_RelationBean> frBMap = new HashMap<Integer, Friend_RelationBean>();
		Map<Integer, MemberBean> memMap = new HashMap<Integer, MemberBean>();
		Map<Integer, Person_InfoBean> peInfoMap = new HashMap<Integer, Person_InfoBean>();

		for (Friend_RelationBean frB : frBList) {
			if (frB.getStatus() == 1) {
				friendIDList.add(frB.getFb().getMember_id());
				System.out.println(frB.getFb().getMember_id());
				frBMap.put(frB.getFb().getMember_id(), frB);
			} else {
				continue;
			}
		}
		for (Friend_RelationBean frB : frFList) {
			if (frB.getStatus() == 1) {
				friendIDList.add(frB.getMb().getMember_id());
				System.out.println(frB.getMb().getMember_id());
				frBMap.put(frB.getMb().getMember_id(), frB);
			} else {
				continue;
			}
		}
		for (Integer fID : friendIDList) {
			memMap.put(fID, mbs.queryByMember_id(fID));
			peInfoMap.put(fID, iiService.showInf(fID));
			System.out.println("我在fID=" + fID);
			System.out.println("我的名字叫做(在正常BEAN)" + mbs.queryByMember_id(fID).getRealname());
			System.out.println("我在MAPGET值的名字" + memMap.get(fID).getRealname());

		}
		System.out.println(friendIDList);

		System.out.println(peInfoMap);
		System.out.println(frBMap);
		model.addAttribute("friendIDList", friendIDList);
		model.addAttribute("memMap", memMap);
		model.addAttribute("peInfoMap", peInfoMap);
		model.addAttribute("frBMap", frBMap);

		model.addAttribute("member_id", member_id);

		return "friend/Show_AllMyFriend";

//////////////////////這邊是原本的(保留用 怕上面改壞掉)/////////////////////////////////////////////////////
//	  MemberBean member = (MemberBean)model.getAttribute("LoginOK");
//	  Integer member_id = member.getMember_id();
//	  List<Friend_RelationBean> frBList = ifrservice.queryByMemberId(member_id);
//	  List<Friend_RelationBean> frFList = ifrservice.queryByFriendId(member_id);
//	  List<Integer> friendIDList = new ArrayList<Integer>();
//	  Map<Integer,Friend_RelationBean> frBMap = new HashMap<Integer, Friend_RelationBean>();
//	  Map<Integer,MemberBean> memMap = new HashMap<Integer, MemberBean>();
//	  Map<Integer,Person_InfoBean> peInfoMap = new HashMap<Integer, Person_InfoBean>();
//	  
//	  for(Friend_RelationBean frB:frBList) {
//	   friendIDList.add(frB.getFb().getMember_id());
//	   System.out.println(frB.getFb().getMember_id());
//	   frBMap.put(frB.getFb().getMember_id(),frB);
//	   
//	  }
//	  for(Friend_RelationBean frB:frFList) {
//	   friendIDList.add(frB.getMb().getMember_id());
//	   System.out.println(frB.getMb().getMember_id());
//	   frBMap.put(frB.getMb().getMember_id(),frB);
//	  }
//	  for(Integer fID:friendIDList) {
//	   memMap.put(fID, mbs.queryByMember_id(fID));
//	   peInfoMap.put(fID, iiService.showInf(fID));
//	   System.out.println("我在fID="+fID);
//	   System.out.println("我的名字叫做(在正常BEAN)"+mbs.queryByMember_id(fID).getRealname());
//	   System.out.println("我在MAPGET值的名字"+memMap.get(fID).getRealname());
//	   
//	  }
//	  System.out.println(friendIDList);
//	 
//	  System.out.println(peInfoMap);
//	  System.out.println(frBMap);
//	  model.addAttribute("friendIDList",friendIDList);
//	  model.addAttribute("memMap",memMap);
//	  model.addAttribute("peInfoMap",peInfoMap);
//	  model.addAttribute("frBMap",frBMap);
//	  
//	  model.addAttribute("member_id", member_id);
//	 
//	  return "friend/Show_AllMyFriend";
	}

/////////////////修改簡述&關係//////////////////////////////////////////////////////////////
	@PostMapping("/updateFriend")
	public @ResponseBody String updateFriend(@RequestParam("friendId") Integer friendId,
			@RequestParam("comment") String comment, @RequestParam("close_rel") String close_rel, Model m,
			HttpSession session) {
		MemberBean member = (MemberBean) m.getAttribute("LoginOK");

		Friend_RelationBean frBean = ifrservice.queryByTwoId(member.getMember_id(), friendId);
		if (frBean == null) {
			frBean = ifrservice.queryByTwoId(friendId, member.getMember_id());
		}
		frBean.setComment(comment);
		frBean.setClose_rel(close_rel);

		ifrservice.frupdate(frBean);

		m.addAttribute("frBean", frBean);

		return frBean.getComment();
	}

/////////////////刪除好友//////////////////////////////////////////////////////////////
	@PostMapping("/deleteFriend")
	public String deleteFriend(@RequestParam("friendId") Integer friendId, Model m) {
		MemberBean member = (MemberBean) m.getAttribute("LoginOK");

		Friend_RelationBean frBean = ifrservice.queryByTwoId(member.getMember_id(), friendId);
		System.out.println("11111111111111111111111111111111111111111111111111");
		if (frBean == null) {
			frBean = ifrservice.queryByTwoId(friendId, member.getMember_id());
		}
		ifrservice.deleteByBean(frBean);
		System.out.println("22222222222222222222222222222222222222222222222");
		System.out.println(mbs.getMember_id(friendId).getNickname());
		return "showAllMyFriend";
	}

//////////////////導到好友請求頁/////////////////////////////////////////////////////////////
	@GetMapping("/queryFriendRequest")
	public String queryFriendRequest(Model model) {

		MemberBean member = (MemberBean) model.getAttribute("LoginOK");
		Integer member_id = member.getMember_id();

		List<Friend_RelationBean> frFList = ifrservice.queryByFriendId(member_id);
		List<Integer> friendIDList = new ArrayList<Integer>();
		List<Person_InfoBean> piBeanList = new ArrayList<Person_InfoBean>();

		for (Friend_RelationBean frB : frFList) {
			if (frB.getStatus() == 0) {
				friendIDList.add(frB.getMb().getMember_id());
				System.out.println(frB.getMb().getMember_id());
			} else {
				continue;
			}
		}
		for (Integer fID : friendIDList) {
			Person_InfoBean fIDpiBean = iiService.showInf(fID);
			piBeanList.add(fIDpiBean);

		}
		model.addAttribute("piBeanList", piBeanList);

		return "friend/Friend_Invitation";
	}

//////////////////導到星座頁/////////////////////////////////////////////////////////////
	@GetMapping("/queryCon")
	public String queryCon() {

		return "friend/Twelve Constellations";
	}

/////////////////星座爬蟲//////////////////////////////////////////////////////////////
	@GetMapping("/getConDetailInf/{num}")
	public String getConDetailInf(@PathVariable("num") Integer num, HttpSession session) throws IOException {
		String jsonStringCon = ifrservice.getConInf(num);
		session.setAttribute("jsonStringCon", jsonStringCon);

		if (num == 0) {
			session.setAttribute("constellation", "♈牡羊座");
		} else if (num == 1) {
			session.setAttribute("constellation", "♉金牛座");
		} else if (num == 2) {
			session.setAttribute("constellation", "♊雙子座");
		} else if (num == 3) {
			session.setAttribute("constellation", "♋巨蟹座");
		} else if (num == 4) {
			session.setAttribute("constellation", "♌獅子座");
		} else if (num == 5) {
			session.setAttribute("constellation", "♍處女座");
		} else if (num == 6) {
			session.setAttribute("constellation", "♎天秤座");
		} else if (num == 7) {
			session.setAttribute("constellation", "♏天蠍座");
		} else if (num == 8) {
			session.setAttribute("constellation", "♐射手座");
		} else if (num == 9) {
			session.setAttribute("constellation", "♑摩羯座");
		} else if (num == 10) {
			session.setAttribute("constellation", "♒水瓶座");
		} else if (num == 11) {
			session.setAttribute("constellation", "♓雙魚座");
		}

		return "friend/Twelve Con_Detail";
	}

}
