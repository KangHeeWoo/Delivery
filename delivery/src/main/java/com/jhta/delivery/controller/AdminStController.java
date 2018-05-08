package com.jhta.delivery.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.delivery.service.StoresService;
import com.jhta.delivery.vo.StoresVo;

@Controller
public class AdminStController {
	@Autowired private StoresService service;
	@RequestMapping("/stoManage")
	public String stoManage() {
		return ".admin.stoManage";
	}
	@RequestMapping("/adstAdd")
	public String adstAdd(Model model) {
		List<StoresVo> list=service.adstAdd();
		model.addAttribute("list",list);
		return ".admin.stoAdd";
	}
	@RequestMapping("/adstDetail")
	public String stDetail(int sto_num,Model model) {
		StoresVo vo=service.stDetail(sto_num);
		model.addAttribute("vo",vo);
		return ".admin.stDetail";
	}
	@RequestMapping("/stEnable")
	public String stEnable(int sto_num) {
		service.stEnable(sto_num);
		return "redirect:/adstAdd";
	}
	@RequestMapping("/stDisable")
	public String stDisable(int sto_num) {
		service.stDisable(sto_num);
		return "redirect:/adstAdd";
	}
	@RequestMapping("/adstDel")
	public String adstDel(Model model) {
		List<StoresVo> list=service.adstDel();
		model.addAttribute("list",list);
		return ".admin.stoDel";
	}
	@RequestMapping("/adstDelOk")
	public String adstDelOk(int sto_num) {
		service.adstDelOk(sto_num);
		return "redirect:/adstDel";
	}
}
