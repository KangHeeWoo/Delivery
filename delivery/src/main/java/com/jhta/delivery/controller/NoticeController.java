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
	@RequestMapping("/admin/noticeList")
	public String adminNoticeList(@RequestParam(name="pageNum", defaultValue="1")int pageNum, Model model) {
int getCount = service.getCount();
		PageUtil pu = new PageUtil(pageNum, 10, 10, getCount);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<NoticeVo> list = service.getList(map);
		model.addAttribute("pu", pu);
		model.addAttribute("notice", list);
		return ".admin.adminNoticeList";
	}
	@RequestMapping("/admin/noticeDetail")
	public String adminNoticeDetail(int num, Model model) {
		service.addHit(num);
		NoticeVo vo = service.getDetail(num);
		NoticeVo prev = service.prev(num);
		NoticeVo next = service.next(num);
		
		vo.setNot_cont(vo.getNot_cont().replaceAll("\n", "<br>"));
		
		model.addAttribute("notice", vo);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		
		return ".admin.adminNoticeDetail";
	}
	@RequestMapping("/admin/noticeInsert")
	public String adminNoticeInsert() {
		return ".admin.adminNoticeInsert";
	}
	@RequestMapping("/admin/noticeInsertOk")
	public String adminNoticeInsertOk(String not_title,String not_cont) {
		NoticeVo vo=new NoticeVo(0,not_title,not_cont,null,0);
		service.insert(vo);
		return "redirect:/admin/noticeList";
	}
	@RequestMapping("/admin/noticeDelete")
	public String adminNoticeDelete(int not_num) {
		service.delete(not_num);
		return "redirect:/admin/noticeList";
	}
	@RequestMapping("/admin/noticeUpdate")
	public String adminNoticeUpdate(int not_num, Model model) {
		NoticeVo vo = service.getDetail(not_num);

		model.addAttribute("notice", vo);
		
		return ".admin.adminNoticeUpdate";
	}
	@RequestMapping("/admin/noticeUpdateOk")
	public String adminNoticeUpdateOk(int not_num,String not_title,String not_cont) {
		System.out.println(not_num+not_title+not_cont);
		NoticeVo vo=new NoticeVo(not_num,not_title,not_cont,null,0);
		service.update(vo);
		return "redirect:/admin/noticeList";
	}
}
