package tw.hanjee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutOneTime;
import tw.hanjee.insurance.insService.IFinsService;

@Controller
public class PayController {
	@Autowired
	IFinsService service;
	
	@GetMapping("topay")
	public @ResponseBody String pay() {
		AllInOne all = new AllInOne("");
		AioCheckOutOneTime obj = new AioCheckOutOneTime();
		obj.setMerchantTradeNo("952710002");
		obj.setMerchantTradeDate("2021/02/05 09:00:01");
		obj.setTotalAmount("2000");
		obj.setTradeDesc("test description");
		obj.setItemName("HanJee");
		obj.setReturnURL("http://acda6e7767af.ngrok.io/HanJee_v2/orderStatus");
		obj.setClientBackURL("http://localhost:8080/HanJee_v2/index_shoppingcart");
		obj.setCustomField1("3");
		obj.setNeedExtraPaidInfo("N");
		obj.setRedeem("N");
		String form = all.aioCheckOut(obj, null);
		return form;
		
	}
	
	
	@PostMapping("/orderStatus")
	public void status() {
		System.out.println("here is back");
	}
}
