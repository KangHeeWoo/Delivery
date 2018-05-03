package com.jhta.delivery.controller;




import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class LoginController {
	
	
	@RequestMapping("/members/kakao_login")
	public String main() {
		
		return ".members.kakao_login";
	}
	
}
