package com.jhta.delivery.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminEventController {
	@RequestMapping("/admin/event")
	public String eventManage(@RequestParam(name="pageNum", defaultValue="1")int pageNum) {
		return ".admin.event";
	}
}
