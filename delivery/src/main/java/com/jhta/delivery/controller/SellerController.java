package com.jhta.delivery.controller;



import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.delivery.mail.SimpleMailSender;
import com.jhta.delivery.service.MembersService;
import com.jhta.delivery.service.SellerService;
import com.jhta.delivery.vo.MembersVo;
import com.jhta.delivery.vo.SellerVo;

@Controller
public class SellerController {
	@Autowired private SimpleMailSender simpleMailSender;
	@Autowired private SellerService service;
	
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
			System.out.println("메일갓니"+n);
			
			ob.put("result", n);
			
		}else {
			ob.put("result", false);
		}

		return ob.toString();
	}
	/*
	@RequestMapping(value="/member/nick",produces="application/json;charset=utf-8")
	@ResponseBody
	public String email(String inputNick) {
		System.out.println("inputNick:"+inputNick);
		JSONObject ob=new JSONObject();

		int m=service.nickcheck(inputNick);
		if(m<0) ob.put("result",true);
		else ob.put("result", false);
	
		return ob.toString();
	}
	*/
	
}
