package tw.hanjee.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.hanjee.schedule.model.PlaceBean;
import tw.hanjee.schedule.model.PlaceDetailBean;
import tw.hanjee.schedule.service.IplaceService;
import tw.hanjee.schedule.service.PlaceDetailService;
import tw.hanjee.schedule.service.impl.PlaceDetailServiceImpl;

@Controller
@RequestMapping("/tw/hanjee")
public class TakeLatLanController {

	@Autowired
	IplaceService iplaceService;
	@Autowired
	PlaceDetailService pds;
	@RequestMapping("/init")
	public String toInitIndex() {
		return "googleapi/getInitInfo";
	}
	@RequestMapping("/test")
	public String test() {
		System.out.println("123");
		return "index";
	}
	
	
	@RequestMapping("insertlatLan")
	public String insertLat(Model m) {
		
		String pla_name=null;
		HashMap<Integer, String> map = new HashMap<Integer, String>();
		for(Integer pla_no=12;pla_no<=30;pla_no++) {
		PlaceBean pb = iplaceService.selectAttractionsGetBean(pla_no);
		pla_name=pb.getPla_name();
		map.put(pla_no, pla_name);
		
		}
		m.addAttribute("mapPB",map);
		return "googleapi/getInitInfo";
	}
	
	@PostMapping("insertlatLan")
	public String insertLanLnt(@RequestParam("pla_no") Integer pla_no,
								@RequestParam("pla_lan") Double pla_lan, 
								@RequestParam("pla_lnt") Double pla_lnt) {
		System.out.println("近來insert"+pla_no);
		PlaceDetailBean pdb = pds.getPDBByPla_no(pla_no);
		pdb.setPla_lan(pla_lan);
		pdb.setPla_lnt(pla_lnt);
		pds.saveLntLat(pdb);
		return "googleapi/getInitInfo";
	}
}
