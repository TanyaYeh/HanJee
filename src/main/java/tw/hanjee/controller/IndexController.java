package tw.hanjee.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.codec.json.Jackson2JsonEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import tw.hanjee.schedule.model.PlaceBean;
import tw.hanjee.schedule.model.PlaceDetailBean;
import tw.hanjee.schedule.service.IplaceService;

@Controller
@SessionAttributes
public class IndexController {
	
	@Autowired
	IplaceService iplaceService;
	
	@RequestMapping("/")
	public String home(Model m) {
		List<PlaceDetailBean> pcdb = iplaceService.selectAllAttraction();
		String jsonStr = "";
		try {
			jsonStr=new ObjectMapper().writeValueAsString(pcdb);
			
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		m.addAttribute("pcdb",jsonStr);
		return "index";
	}
	
	
//	@ModelAttribute
//	public @ResponseBody PlaceBean getPlaceBean(Model model,@RequestParam("pla_no") Integer pla_no) {
//		PlaceBean rs = ischeduleService.selectAttractionsGetBean(pla_no);
//		
//		return rs;
//		
//		
//	}

//	@RequestMapping("tw/hanjee/controller/test1")
//	public @ResponseBody PlaceDetailBean showTaipei101(Model model,@RequestParam("pla_no") Integer pla_no) {
//		PlaceDetailBean rs = iplaceService.selectAttractionsGetBean(pla_no).getPlaceDetailBean();
//		
////		model.addAttribute("rs", rs);
//		
//		System.out.println(rs.toString());
//		
//		return rs;
//		
//		
//	};
	


}
