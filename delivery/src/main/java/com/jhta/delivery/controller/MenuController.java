package com.jhta.delivery.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.delivery.service.MenuService;
import com.jhta.delivery.service.StoresService;
import com.jhta.delivery.vo.MenuVo;
import com.jhta.delivery.vo.StoresVo;

@Controller
public class MenuController {
	@Autowired private StoresService service;
	@Autowired private MenuService Mservice;
	
	@RequestMapping("/menu/menu")
	public String admin(int sto_num,Model model) {
		StoresVo stovo=service.stoName(sto_num);
		
		List<MenuVo> menulist=Mservice.menulist(sto_num);
		
		model.addAttribute("stovo", stovo);
		model.addAttribute("menulist", menulist);
		System.out.println(stovo.getSto_name()+"메뉴리스트:"+menulist);
		return ".menu.menu";
	}
	
	
}
