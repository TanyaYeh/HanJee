package tw.hanjee.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

import tw.hanjee.insurance.insModel.InsBenefitRelation;
import tw.hanjee.insurance.insModel.InsLocationFee;
import tw.hanjee.insurance.insModel.InsProfiles;
import tw.hanjee.insurance.insService.IFinsService;
import tw.hanjee.model.MemberBean;
import tw.hanjee.schedule.model.ScheduleBean;

@Controller
public class InsuranceController {

	@Autowired
	IFinsService service;
	
	
	


	//新增投保入口
	@GetMapping("/insEnter")
	public String insEnter(Model model,HttpSession ses) {
		MemberBean mb=(MemberBean) ses.getAttribute("LoginOK");
		ScheduleBean sb=(ScheduleBean) ses.getAttribute("scheduleBean");
		
		int countByA = service.countA();
		int countByB = service.countB();
		int countByC = service.countC();
		int countByM = service.countM();
		int countByF = service.countF();
		model.addAttribute("countA",countByA);
		model.addAttribute("countB",countByB);
		model.addAttribute("countC",countByC);
		model.addAttribute("countM",countByM);
		model.addAttribute("countF",countByF);
		
		model.addAttribute("inputModel", new InsProfiles());
		return "Insurance/insInput";
		
		
	}
	
	//新增投保
	@PostMapping("/insEnter")
	public @ResponseBody void insEnter(@ModelAttribute("inputModel") InsProfiles insp, 
									@RequestParam("name") String name,
									@RequestParam("birth") String birth_str,
									@RequestParam("identify") String identify,
									@RequestParam("gender") String gender,
									@RequestParam("address") String address,
									@RequestParam("phone") String phone,
									@RequestParam("plan") String plan,
									@RequestParam("benefit") String benefit,
									@RequestParam("relationId") int rid,
									@RequestParam("locationId") int lid,
									@RequestParam("start") String start_str,
									@RequestParam("end") String end_str,
									HttpSession session) {
		
		
		
		//產生 保單號碼 (包含轉型birth)
		Date birth = Date.valueOf(birth_str);
		Calendar cal = Calendar.getInstance();
		
		String birth_newstr = birth_str.replace("-", "");
		String num = String.valueOf(((int)(Math.random()+1)*100));
		
		//取得 兩個相關聯的bean的資料
		InsBenefitRelation insBR = service.getInsBenefitRelation(rid);
		InsLocationFee insLF = service.getInsLocationFee(lid);
		
		//產生 天數
		Date start = Date.valueOf(start_str);
		Date end = Date.valueOf(end_str);
		long days = (end.getTime()-start.getTime())/(1000*60*60*24);
		
		insp = new InsProfiles(num, name, birth, identify, gender, address, phone, plan, benefit, insBR, insLF, start, end, days );
		
		
		service.add(insp);
		session.setAttribute("insurance", insp);
	}
	
	

	

	//投保確認
	@GetMapping("confirm")
	public String toConfirm(Model model, HttpSession session) {
		InsProfiles insp = (InsProfiles) session.getAttribute("insurance");
		int id = insp.getInsId();
      	model.addAttribute("myData", service.query(id));
		
		return "Insurance/insConfirm";
		
	}
	
	
	//更新資料
	@GetMapping("insUpdate")
	public String update(Model model, @ModelAttribute("myData") InsProfiles insp) {
		System.out.println("Here is update get controller");
		model.addAttribute("myData", insp);
		return "Insurance/insInput";
	}
	@PostMapping("insUpdate")
	public @ResponseBody void update(@ModelAttribute("myData") InsProfiles insp,
							@RequestParam("name") String name,
							@RequestParam("birth") String birth_str,
							@RequestParam("identify") String identify,
							@RequestParam("gender") String gender,
							@RequestParam("address") String address,
							@RequestParam("phone") String phone,
							@RequestParam("plan") String plan,
							@RequestParam("benefit") String benefit,
							@RequestParam("relationId") int rid,
							@RequestParam("locationId") int lid,
							@RequestParam("start") String start_str,
							@RequestParam("end") String end_str,
							HttpSession session,
							Model model) {
		System.out.println("Here is update post controller");
		
		Date birth = Date.valueOf(birth_str);
		
		
		InsProfiles insp_old = (InsProfiles) session.getAttribute("insurance");
		String newNum = insp_old.getInsNum();
		System.out.println("newNum="+newNum);
		int id = insp_old.getInsId();
		System.out.println("id="+id);
		
		
		InsBenefitRelation insBR = service.getInsBenefitRelation(rid);
		InsLocationFee insLF = service.getInsLocationFee(lid);
		
		Date start = Date.valueOf(start_str);
		Date end = Date.valueOf(end_str);
		long days = (end.getTime()-start.getTime())/(1000*60*60*24);
		
		insp = new InsProfiles(id, newNum, name, birth, identify, gender, address, phone, plan, benefit, insBR, insLF, start, end, days );
		
		service.update(insp);
		
		session.setAttribute("newData", insp);
		model.addAttribute("myData", insp);
		
	}
	
	//刪除投保
	@GetMapping("delete/{id}")
	public String delete(Model model,@PathVariable("id") int insId) {
		model.addAttribute("inputModel", new InsProfiles());
		service.delete(insId);
		return "Insurance/insDelete";
	}
	
	//前往潔蓉頁面
	@GetMapping("next")
	public String next() {
		return "Insurance/nextPage";
	}
	
	//測試圖表
//	@GetMapping("dataBar")
//	public String showDataBar(Model model) {
//		model.addAttribute("dataBar", service.queryWhereA());
//		
//		
//		return "";
//	}
	
	
	
	
	

	//ajax回應qrcode
	@PostMapping("qrCode")
	@ResponseBody
	public byte[] getQRCode() throws IOException {
		getQrCode();
		String imgPath = "C:/_springmvc/workspace/Insurance/src/main/webapp/images/qrCode.png";
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(imgPath));
		byte[] b = new byte[1024];
		int length;
		bis.read(b);
		return b;
	}
	
	//創造relation的下拉選單(來自資料庫)
	@ModelAttribute("relationList")
	public Map<Integer, String> getRelationList(){
		Map<Integer, String> map = new HashMap<>();
		List<InsBenefitRelation> list = service.getAllRelationList();
		for(InsBenefitRelation insBR : list) {
			map.put(insBR.getId(), insBR.getRelation());
		}
		return map;
	}
	
	//創造location的下拉選單(來自資料庫)
	@ModelAttribute("locationList")
	public Map<Integer, String> getLocationList(){
		Map<Integer, String> map = new HashMap<>();
		List<InsLocationFee> list = service.getAllLocationList();
		for(InsLocationFee insLF : list) {
			map.put(insLF.getId(), insLF.getLocation());
		}
		return map;
	}


	//非controller，僅函數創造qrcode
	public void getQrCode() {
		int width = 300;
		int height = 300;
		String format = "png";
		String ngrok = "http://acda6e7767af.ngrok.io";
		String contents = ngrok + "/HanJee_v2/orderDetail?ord_no=17";

		HashMap hm = new HashMap();
		// 內容的字符集編碼
		hm.put(EncodeHintType.CHARACTER_SET, "UTF-8");
		// 二維碼的糾錯等級
		hm.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.M);
		// 設定二維碼邊距
		hm.put(EncodeHintType.MARGIN, 2);

		try {
			BitMatrix bitMatrix = new MultiFormatWriter().encode(contents, BarcodeFormat.QR_CODE, width, height, hm);
			// 檔案生成路徑
			File file = new File("C:/_springmvc/workspace/Insurance/src/main/webapp/images/qrCode.png");
			if (!file.exists()) {
				file.mkdirs();
			}
			MatrixToImageWriter.writeToPath(bitMatrix, format, file.toPath());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
