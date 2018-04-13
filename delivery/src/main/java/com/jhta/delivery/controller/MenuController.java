package com.jhta.delivery.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.delivery.service.StoresService;
import com.jhta.delivery.vo.StoreMenuVo;

@Controller
public class MenuController {
	@Autowired private StoresService service;
	
	@RequestMapping("/menu/menu")
	public String admin(int sto_num,Model model) {
		List<StoreMenuVo> storemenu=service.storeMenu(sto_num);
		model.addAttribute("stomenu", storemenu);
		return ".menu.menu";
	}
	
	
}
