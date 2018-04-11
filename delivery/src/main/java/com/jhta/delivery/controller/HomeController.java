package com.jhta.delivery.controller;

import java.util.HashMap;

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
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login() {
		return ".login";
	}
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String loginOk(String who_email,String email, String pwd) {
		HashMap<String, String> map=new HashMap<String, String>();
		if(who_email.equals("mem_email")) {
			map.put("mem_email", email);
			map.put("mem_email",email);
			int n=memService.logincheck(map);
		}else if(who_email.equals("sel_email")) {
			int m=selService.logincheck(map);
		}
		return ".login";
	}
}
