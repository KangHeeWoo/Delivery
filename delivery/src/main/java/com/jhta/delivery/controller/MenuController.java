package com.jhta.delivery.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MenuController {
	@RequestMapping("/menu/menu")
	public String admin(int sto_num) {
		
		return ".menu.menu";
	}
	
	
}
