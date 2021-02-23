package tw.hanjee.schedule.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import tw.hanjee.model.MemberBean;
import tw.hanjee.schedule.model.DailyScheduleBean;
import tw.hanjee.schedule.model.PlaceBean;
import tw.hanjee.schedule.model.PlaceDetailBean;
import tw.hanjee.schedule.model.ScheduleBean;
import tw.hanjee.schedule.service.IplaceService;
import tw.hanjee.schedule.service.IscheduleService;
import tw.hanjee.schedule.service.PlaceService;

@Controller
@RequestMapping("/tw/hanjee/schedule/controller")
@SessionAttributes({"LoginOK","scheduleBean","Schedule","Day1"})
public class ScheduleListController {

	@Autowired
	IscheduleService ischeduleService;
	@Autowired
	PlaceService ps;
	@Autowired
	IplaceService ips;

	@RequestMapping("addlist")
	public String addList(@ModelAttribute PlaceDetailBean pdb, Model m) {
		System.out.println("人生很難");
		m.addAttribute("pb", pdb.getPlaceBean());
		System.out.println(pdb.getPlaceBean().getPla_name());
		return "index";
	}


	@RequestMapping("placeList")
	public @ResponseBody ArrayList<String> getScheduleList(Model model,
			@RequestParam("place_list") String schedulelist) {
		String[] arr = schedulelist.split(",");

		ArrayList<String> arrlist = new ArrayList<String>();
		int len = arr.length;
		System.out.println("len=" + len);
		for (int j = 0; j < len; j++) {
			int att = Integer.parseInt(arr[j]);
			String attName = ischeduleService.getAttractionDetail(att).getPlaceBean().getPla_name();
			String attPla_lan = String.valueOf(ischeduleService.getAttractionDetail(att).getPla_lan());
			String attPla_lnt = String.valueOf(ischeduleService.getAttractionDetail(att).getPla_lnt());
//				String attPlaDetail = attPla_lan+","+attPla_lnt;
			arrlist.add(attPla_lan);
			arrlist.add(attPla_lnt);

			System.out.println("attName=" + attName + "attPla_lan=" + attPla_lan + "," + "attPla_lnt=" + attPla_lnt);
		}

		return arrlist;
	}



	@PostMapping("GetPleaceBean")
	public @ResponseBody Map<Integer, PlaceBean> useLanToGetPleaceBean(@RequestParam("LanStr") String pla_lan, HttpSession httpSession,Model m) {
		MemberBean mb = (MemberBean) m.getAttribute("LoginOK");
		
		if(mb != null) {
		System.out.println(pla_lan);
//		double doublePla_lan = Double.parseDouble(pla_lan);
		String[] pla_lanArr = pla_lan.split(",");
//		Object doupla_lanArr = Double.parseDouble(pla_lanArr);
		Map<Integer, PlaceBean> dailySchMap = new LinkedHashMap<Integer, PlaceBean>();
		for (Integer i = 0; i < pla_lanArr.length; i++) {
			dailySchMap.put(i+1, ischeduleService.getPlaceBeanByLan(Double.parseDouble(pla_lanArr[i])));

		}
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyMMdd");
		Date date = new Date();
		System.out.println(sdFormat.format(date).toString());
		Integer sch_no = Integer.parseInt(sdFormat.format(date).toString())+((mb.getMember_id())*1000000);
		System.out.println(sch_no);
		
		String sch_endP = ischeduleService.getPlaceBeanByLan(Double.parseDouble(pla_lanArr[pla_lanArr.length-1])).getPla_name();

		ScheduleBean schb =new ScheduleBean(sch_no,sch_endP,mb);
		
		httpSession.setAttribute("scheduleBean", schb);
		
		return dailySchMap;
		}else {
			return null;
		}
	}
	
	@PostMapping("sendSchedule")
	public @ResponseBody ScheduleBean demoDailysc(@RequestParam("scheduleList") String scheduleList, HttpSession httpSession,Model m){
		ScheduleBean schb = (ScheduleBean) m.getAttribute("scheduleBean");
		System.out.println(schb.getSch_no());
		DailyScheduleBean dailysch = new DailyScheduleBean(schb);
		
		System.out.println("scheduleList "+scheduleList);
		
//		dailysch.setScheduleBean(schb);          執行save時才需要，否則會報錯
		Integer sch_dno = schb.getSch_no()*10+1;
		dailysch.setSch_dno(sch_dno);
		
		String[] schDetailArr = scheduleList.split(",");
		System.out.println("schDetailArr "+schDetailArr);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = schDetailArr[0];
		System.out.println("strDate"+strDate);
		
		java.util.Date date= null;
		java.sql.Date sqlDate = null;
		
		try {
			date = sdf.parse(strDate);  
	        sqlDate = new java.sql.Date(date.getTime());
			
		} catch (ParseException e) {
			System.out.println("日期型態無法轉換");
			e.printStackTrace();
		}
		System.out.println("javaDate"+date);
		System.out.println("sqlDate"+sqlDate);
		
		schb.setSch_startD(sqlDate);                 //將日期放入schedule及dailyschedule Bean中
		schb.setSch_endD(sqlDate);
		dailysch.setSch_Daily(sqlDate);
		double distance = Double.parseDouble(schDetailArr[1]);
		dailysch.setDistance(distance);            //將距離放入dailyschedule Bean中
		
		double amount = (distance/1000)*4;         //每公里4元計算，放入schedule及dailyschedule Bean中
		schb.setSch_amount(amount);
		dailysch.setAmount(amount);
		
		int len = schDetailArr.length;             //取得陣列長度，用if迴圈判斷要放入的景點位置
		if(len==4) {
			dailysch.setSch_Pla1(Integer.parseInt(schDetailArr[2]));
			dailysch.setSch_Pla2(Integer.parseInt(schDetailArr[3]));
			schb.setPla_no(Integer.parseInt(schDetailArr[3]));
			System.out.println("陣列長4");
		}else if(len==5) {
			dailysch.setSch_Pla1(Integer.parseInt(schDetailArr[2]));
			dailysch.setSch_Pla2(Integer.parseInt(schDetailArr[3]));
			dailysch.setSch_Pla3(Integer.parseInt(schDetailArr[4]));
			schb.setPla_no(Integer.parseInt(schDetailArr[4]));
			System.out.println("陣列長5");
		}else if(len==6) {
			dailysch.setSch_Pla1(Integer.parseInt(schDetailArr[2]));
			dailysch.setSch_Pla2(Integer.parseInt(schDetailArr[3]));
			dailysch.setSch_Pla3(Integer.parseInt(schDetailArr[4]));
			dailysch.setSch_Pla4(Integer.parseInt(schDetailArr[5]));
			schb.setPla_no(Integer.parseInt(schDetailArr[5]));
			System.out.println("陣列長6");
		}else if(len==7) {
			dailysch.setSch_Pla1(Integer.parseInt(schDetailArr[2]));
			dailysch.setSch_Pla2(Integer.parseInt(schDetailArr[3]));
			dailysch.setSch_Pla3(Integer.parseInt(schDetailArr[4]));
			dailysch.setSch_Pla4(Integer.parseInt(schDetailArr[5]));
			dailysch.setSch_Pla5(Integer.parseInt(schDetailArr[6]));
			schb.setPla_no(Integer.parseInt(schDetailArr[6]));
			System.out.println("陣列長7");
		};
		   //再把DailyScheduleBean List放進ScheduleBean
		
//		ischeduleService.saveSchedule(schb);
//		ischeduleService.saveDailySchedule(dailysch);
		System.out.println("我有執行完，然後我的SCH_DNO是"+dailysch.getSch_dno()+"然後我的SCH_NO是"+dailysch.getScheduleBean().getSch_no());
		ischeduleService.saveDailySchedule(dailysch);
		ischeduleService.saveSchedule(schb);
		System.out.println("我有執行完");
		return schb;
		
		
	};
	
	@RequestMapping("dailyScheduleDetail")
	public String checkDetail(Model m) {
		System.out.println("我有吃到阿哈哈");
		ScheduleBean schb=(ScheduleBean) m.getAttribute("scheduleBean");
		DailyScheduleBean dailysch=(DailyScheduleBean) m.getAttribute("Day1");
		
		System.out.println("我在DAILYSCHBEAN的執事"+dailysch.getSch_dno());
		List<PlaceBean> allPb = ps.getPlace();
		m.addAttribute("allPlace",allPb);
		m.addAttribute("scheduleBean",schb);
		m.addAttribute("Daily1",dailysch);
//		ischeduleService.saveDailySchedule(dailysch);
//		ischeduleService.saveSchedule(schb);
		return "schedule/scheduleConfirm";
	}
	@RequestMapping("getplaceLan")
	public @ResponseBody Map<Integer,List<Double>> getplaceLan(@RequestParam("pla1") String pla_no1,Model m) {
		String[] schDetailArr = pla_no1.split(",");
		
		Map<Integer,List<Double>> dailySch= new HashMap<Integer, List<Double>>();
		for(String pla_no:schDetailArr) {
			List<Double> placeLanLnt=new ArrayList<Double>();
			placeLanLnt.add(ips.selectAttractionsGetBean(Integer.parseInt(pla_no)).getPlaceDetailBean().getPla_lan());
			placeLanLnt.add(ips.selectAttractionsGetBean(Integer.parseInt(pla_no)).getPlaceDetailBean().getPla_lnt());
			dailySch.put(Integer.parseInt(pla_no), placeLanLnt);
			System.out.println(dailySch.get(Integer.parseInt(pla_no)));
			
		};
		return dailySch;
	}
	
	@RequestMapping("changedailyScheduleDetail")
	public @ResponseBody DailyScheduleBean changedailySch(@RequestParam("pla1") Integer pla_no1,Model m) {
		System.out.println(pla_no1);
		DailyScheduleBean dailysch=(DailyScheduleBean) m.getAttribute("Day1");
		dailysch.setSch_Pla1(pla_no1);
		return dailysch;
	}
	

}