package com.jhta.delivery.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.delivery.service.EventService;
import com.jhta.delivery.util.PageUtil;
import com.jhta.delivery.vo.EventVo;

@Controller
public class AdminEventController {
	@Autowired private EventService service;
	
	@InitBinder
    public void InitBinder(WebDataBinder binder) {
       CustomDateEditor dateEditor=new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm"), true);
       binder.registerCustomEditor(Date.class, dateEditor);
    }
	
	@RequestMapping("/admin/event")
	public String eventManage(@RequestParam(name="pageNum", defaultValue="1")int pageNum, Model model) {
		int getCount = service.getCount();
		
		PageUtil pu = new PageUtil(pageNum, 10, 10, getCount);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		
		List<EventVo> list = service.eventList(map);
		
		model.addAttribute("pu", pu);
		model.addAttribute("event", list);
		
		return ".admin.event";
	}
	
	@RequestMapping(value="/admin/addEvent", method=RequestMethod.GET)
	public String addEvent() {
		return ".admin.addEvent";
	}
	
	@RequestMapping(value="/admin/addEvent", method=RequestMethod.POST)
	public String addEventOk(EventVo vo) {
		System.out.println(vo);
		return "redirect:/admin/event";
	}
}
