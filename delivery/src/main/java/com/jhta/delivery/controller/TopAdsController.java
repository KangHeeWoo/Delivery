package com.jhta.delivery.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.delivery.service.TopAdsService;

@Controller
public class TopAdsController {
	@Autowired private TopAdsService service;
	
	@RequestMapping("/admin/topAds")
	public String topAds() {
		
		return ".admin.topAds";
	}
	
	@RequestMapping("/admin/topAdsList")
	public String topAdsList(int year, int month) {
		System.out.println(year+"-0"+month);

		
		return ".admin.topAds";
	}
	
	
}
