package com.jhta.delivery.controller;





import java.sql.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.delivery.mail.SimpleMailSender;
import com.jhta.delivery.service.SellerService;
import com.jhta.delivery.service.StoresService;
import com.jhta.delivery.vo.SellerVo;
import com.jhta.delivery.vo.StoresVo;

@Controller
public class SellerController {
	@Autowired private SimpleMailSender simpleMailSender;
	@Autowired private SellerService service;
	@Autowired private StoresService service1;
	
	@RequestMapping("/seller/main")
	public String main() {
		
		return ".seller";
	}
	
	@RequestMapping(value="/seller",method=RequestMethod.GET)
	public String join() {
		return ".seller.join";
	}


	@RequestMapping(value="/seller/join",method=RequestMethod.POST)
		public String insert(SellerVo vo, String sel_addr2) {
			String sel_addr=vo.getSel_addr()+sel_addr2;
			vo.setSel_addr(sel_addr);
			
			service.insert(vo);
			
			return ".main";
		}
	
	
	
	@RequestMapping(value="/seller/email",produces="application/json;charset=utf-8")
	@ResponseBody
	public String email(String sel_email, String email_num) {
		System.out.println("email:"+sel_email+",email_num:"+email_num);
		JSONObject ob=new JSONObject();

		int m=service.emailcheck(sel_email);
		if(m<0) {
			boolean n=simpleMailSender.sendMail("배달의 백성民 인증", "안녕하세요. 사장님 \n 인증번호를 가입란에 입력해주세요.\n"+ email_num , sel_email, "deliveryjhta@gmail.com");
			
			ob.put("result", n);
			
		}else {
			ob.put("result", false);
		}

		return ob.toString();
	}
	
	@RequestMapping("/stManage")
	public String stManage() {
		return ".seller.manageIndex";
	}
	
	@RequestMapping("/stAdd")
	public String stAdd() {
		return ".seller.stInsert";
	}
	@RequestMapping("/stInsert")
	public String stInsert(String sto_name,String sto_regnum,String sto_addr,String sto_phone,String sto_open,String sto_close,String sto_holiday,String sto_intro,int cat_num,HttpSession session) {
		System.out.println("셀러컨트롤러"+sto_open+"///"+sto_close);
		String email=(String)session.getAttribute("email");
		System.out.println(email);
		int sel_num=service.getSel_num(email);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("sto_name", sto_name);
		map.put("sto_regnum", sto_regnum);
		map.put("sto_addr", sto_addr);
		map.put("sto_phone", sto_phone);
		map.put("sto_open", sto_open);
		map.put("sto_close", sto_close);
		map.put("sto_holiday", sto_holiday);
		map.put("sto_intro", sto_intro);
		map.put("cat_num", cat_num);
		map.put("sel_num", sel_num);
		service1.stInsert(map);
		return ".seller.manageIndex";
	}
	@RequestMapping("/stList")
	public String stList() {
		return ".seller.stList";
	}
}
