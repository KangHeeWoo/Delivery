package com.jhta.delivery.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.delivery.service.MembersService;
import com.jhta.delivery.service.SellerService;

@Controller
public class HomeController {
	@Autowired private MembersService memService;
	@Autowired private SellerService selService;
	
	@RequestMapping("/")
	public String home() {
		return ".main";
	}
	@RequestMapping(value="/join",method=RequestMethod.GET)
	public String join() {
		return ".join";
	}
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return ".main";
	}
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login() {
		return ".login";
	}
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String loginOk(String joinradio,String email, String pwd,HttpSession session) {
		HashMap<String, String> map=new HashMap<String, String>();
		
		int n=0;
		int m=0;
		if(joinradio.equals("mem_email") ) {
			map.put("mem_email", email);
			map.put("mem_pwd",pwd);
			n=memService.logincheck(map);
			if(n>0) {
				session.setAttribute("email", email);
				return ".main";
			}
		}else if(joinradio.equals("sel_email")) {
			map.put("sel_email", email);
			map.put("sel_pwd",pwd);
			m=selService.logincheck(map);
			if(m>0) {
				session.setAttribute("email", email);
				return ".seller.main";
			}
		}
		
		return ".login";
	}
}
