package tw.hanjee.friend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.hanjee.friend.model.Sen_MachineBean;
import tw.hanjee.friend.service.interface1.ISen_MachineService;

@Controller
@RequestMapping("/tw/hanjee")
public class Sen_MachineController {
	
	@Autowired
	ISen_MachineService service;

	@RequestMapping("/Add_Information")
	public String AddInformation() {
		
		return "friend/Basic_Information";
	}

	@RequestMapping("/ShowAllSentence")
	public String showAllSentence(Model model) {
		List<Sen_MachineBean> sentence = service.queryAllSentence();
//		System.out.println(sentence);
		model.addAttribute("Sentence", sentence);
		return "friend/Sen_Machine2";
	}
	
//	@RequestMapping("/")
//	public String showSentenceByID() {
//		
//		return "friend/";
//	}

}
