package com.jhta.delivery.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.delivery.service.TopAdsService;
import com.jhta.delivery.util.PageUtil;
import com.jhta.delivery.vo.TopAdsVo;

@Controller
public class TopAdsController {
	@Autowired private TopAdsService service;
	
	@RequestMapping("/admin/topAdsList")
	public String topAdsList(@RequestParam(value="pageNum",defaultValue="1")int pageNum, @RequestParam(value="year",defaultValue="-1")int year, @RequestParam(value="month",defaultValue="-1")int month, Model model) {
		
		Calendar c = Calendar.getInstance();
		
		if(year != -1) {
			c.set(Calendar.YEAR, year);
			c.set(Calendar.MONTH, month-1);
		}else {
			year = c.get(Calendar.YEAR);
			month = c.get(Calendar.MONTH)+1;
		}
		
		int getCount = service.getCount(c.getTime());
		
		PageUtil pu = new PageUtil(pageNum, 10, 10, getCount);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		map.put("top_ads_start", c.getTime());
		
		List<TopAdsVo> list = service.topAdsEntry(map);
		model.addAttribute("list",list);
		model.addAttribute("year",year);
		model.addAttribute("month",month);
		model.addAttribute("pu",pu);
		
		return ".admin.topAds";
	}
}
