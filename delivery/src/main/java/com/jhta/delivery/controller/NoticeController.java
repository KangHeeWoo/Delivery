package com.jhta.delivery.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.delivery.service.NoticeService;
import com.jhta.delivery.util.PageUtil;
import com.jhta.delivery.vo.NoticeVo;

@Controller
public class NoticeController {
	@Autowired private NoticeService service;
	
	@RequestMapping("/notice/noticeList")
	public String noticeList(@RequestParam(name="pageNum", defaultValue="1")int pageNum, Model model) {
		int getCount = service.getCount();
		
		PageUtil pu = new PageUtil(pageNum, 10, 10, getCount);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		
		List<NoticeVo> list = service.getList(map);
		
		model.addAttribute("pu", pu);
		model.addAttribute("notice", list);
		
		return ".notice.noticeList";
	}
	
	@RequestMapping("/notice/noticeDetail")
	public String noticeDetail(int num, Model model) {
		service.addHit(num);
		NoticeVo vo = service.getDetail(num);
		NoticeVo prev = service.prev(num);
		NoticeVo next = service.next(num);
		
		vo.setNot_cont(vo.getNot_cont().replaceAll("\n", "<br>"));
		
		model.addAttribute("notice", vo);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		
		return ".notice.noticeDetail";
	}
	@RequestMapping("/admin/noticeInsert")
	public String noticeInsert() {
		return ".admin.noticeInsert";
	}
}
