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
import org.springframework.web.bind.annotation.RequestParam;


import com.jhta.delivery.service.EventService;
import com.jhta.delivery.util.PageUtil;
import com.jhta.delivery.vo.EventVo;

@Controller
public class EventController {
	@Autowired private EventService service;

		
	@InitBinder
    public void InitBinder(WebDataBinder binder) {
       CustomDateEditor dateEditor=new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm"), true);
       binder.registerCustomEditor(Date.class, dateEditor);
    }
	
	@RequestMapping("/event/eventlist")
	public String eventManage(@RequestParam(name="pageNum", defaultValue="1")int pageNum, Model model) {
		int getCount = service.getCount();
		
		PageUtil pu = new PageUtil(pageNum, 10, 10, getCount);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		
		List<EventVo> list = service.eventList(map);
		
		model.addAttribute("pu", pu);
		model.addAttribute("event", list);
		
		return ".event.eventlist";
	}

	@RequestMapping("/event/eventdetail")
	public String eventDetail(int eve_num,Model model ) {
		//model.addAttribute("eve_num", eve_num);
		EventVo vo = service.detailEvent(eve_num);
		
		vo.setEve_cont(vo.getEve_cont().replaceAll("\n", "<br>"));
		
		model.addAttribute("event", vo);
		return ".event.eventdetail";
	}
	
	
}
