package com.jhta.delivery.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

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
import com.jhta.delivery.vo.MembersVo;

@Controller
public class MembersController {
	@Autowired private SimpleMailSender simpleMailSender;
	@Autowired private MembersService service;
	@InitBinder
    public void InitBinder(WebDataBinder binder) {
       CustomDateEditor dateEditor=new CustomDateEditor(new SimpleDateFormat("yyyy-mm-dd"), true);
       binder.registerCustomEditor(Date.class, dateEditor);
    }
	
	@RequestMapping(value="/join",method=RequestMethod.GET)
	public String join() {
		return ".members.join";
	}
	
	@RequestMapping(value="/join",method=RequestMethod.POST)
	public String insert(MembersVo vo, String mem_addr2) {
		String mem_addr=vo.getMem_addr()+mem_addr2;
		vo.setMem_addr(mem_addr);
		
		service.insert(vo);
		
		return ".main";
	}
	
	@RequestMapping(value="/member/email",produces="application/json;charset=utf-8")
	@ResponseBody
	public String email(String mem_email, String email_num) {
		System.out.println("email:"+mem_email+",email_num:"+email_num);
		
		boolean n=simpleMailSender.sendMail("배달의 백성民 인증", "인증번호를 가입란에 입력해주세요.\n"+ email_num , mem_email, "deliveryjhta@gmail.com");
		System.out.println("메일갓니"+n);
		
		JSONObject ob=new JSONObject();
		ob.put("result", n);
		
		
		return ob.toString();
	}
	
	
}
