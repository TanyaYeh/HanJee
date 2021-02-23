package tw.hanjee.friend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class View_Controller {

	@GetMapping("/friend/Show_Basic_Info")
	 public String ShowPageEX() {
	  return "/friend/Show_Basic_Info";
	 }
	
}
