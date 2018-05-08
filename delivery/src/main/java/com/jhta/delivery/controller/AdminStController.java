package com.jhta.delivery.controller;

import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.delivery.service.StoresService;
import com.jhta.delivery.util.PageUtil;
import com.jhta.delivery.vo.MembersVo;
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
	@RequestMapping("/adstList")
	public String adstList(@RequestParam(value="pageNum",defaultValue="1")int pageNum, Model model) {
		int totalRowCount=service.adstListCnt();
		PageUtil pu=new PageUtil(pageNum,10,10,totalRowCount);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("startRow", pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		List<StoresVo> list=service.adstList(map);
		model.addAttribute("list",list);
		model.addAttribute("pu",pu);
		return ".admin.stList";
	}
	@RequestMapping("/adList/search")
	public String search(@RequestParam(value="pageNum",defaultValue="1") int pageNum,String word,String search,Model model) {
		HashMap<String, Object> map1=new HashMap<String, Object>();
		map1.put("search", search);
		map1.put("word", word);
		int totalRowCount=service.adstListCnts(map1);
		PageUtil pu=new PageUtil(pageNum,10,10,totalRowCount);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("startRow", pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		map.put("search", search);
		map.put("word", word);
		List<StoresVo> list=service.adstSearchList(map);
		model.addAttribute("list",list);
		model.addAttribute("pu",pu);
		model.addAttribute("map",map);
		return ".admin.stSearchList";
	}
}
