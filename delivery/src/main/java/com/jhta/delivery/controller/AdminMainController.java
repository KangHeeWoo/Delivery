package com.jhta.delivery.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminMainController {
	@RequestMapping("/admin")
	public String adminMain() {
		return ".admin";
	}
}
