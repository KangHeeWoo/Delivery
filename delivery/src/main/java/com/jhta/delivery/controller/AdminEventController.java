package com.jhta.delivery.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.delivery.service.EventService;
import com.jhta.delivery.util.PageUtil;
import com.jhta.delivery.vo.EventEntryVo;
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
	public String addEventOk(EventVo vo, MultipartFile img, HttpSession session) {
		String uploadPath = session.getServletContext().getRealPath("/resources/images/event");
		String orgFileName = img.getOriginalFilename();
		String saveFileName = UUID.randomUUID() + "_" + orgFileName;
		vo.setEve_img(saveFileName);
		
		try {
			InputStream is = img.getInputStream();
			FileOutputStream fos = new FileOutputStream(uploadPath + "\\" + saveFileName);
			FileCopyUtils.copy(is, fos);
			
			service.addEvent(vo);
						
			return "redirect:/admin/event";
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:/admin/event";
		}		
	}
	
	@RequestMapping("/admin/detailevent")
	public String detailEvent(int num, Model model) {
		EventVo vo = service.detailEvent(num);
		List<EventEntryVo> list = service.entryList(num);
		
		System.out.println(vo);
		System.out.println(list);
		
		model.addAttribute("event", vo);
		model.addAttribute("entry", list);
		
		return ".admin.detailEvent";
	}
}
