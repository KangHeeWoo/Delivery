package com.jhta.delivery.controller;




import javax.mail.Session;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class LoginController {
	
	
	@RequestMapping("/members/kakao_login")
	public String Kakao() {
		
		return ".members.kakao_login";
	}
	@RequestMapping("/members/kakaoMain")
	public String kakaoMain(Session session) {
		return ".main";
	}
	
	
}
