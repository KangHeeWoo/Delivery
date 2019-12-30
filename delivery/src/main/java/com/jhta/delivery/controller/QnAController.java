package com.jhta.delivery.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.delivery.service.MembersService;
import com.jhta.delivery.service.QnAService;
import com.jhta.delivery.util.PageUtil;
import com.jhta.delivery.vo.AnswerVo;
import com.jhta.delivery.vo.MembersVo;
import com.jhta.delivery.vo.QnAVo;

@Controller
public class QnAController {
	@Autowired private QnAService service;
	@Autowired private MembersService mservice;
	
	@RequestMapping("/qna/list")
	public String list(@RequestParam(value="pageNum",defaultValue="1")int pageNum, HttpSession session, Model model) {
		
		String email=(String)session.getAttribute("email");
		model.addAttribute("email",email);
		MembersVo vo = mservice.getinfo(email);
		
		
		int getCount = service.getCount(vo.getMem_num());
		
		PageUtil pu = new PageUtil(pageNum, 10, 10, getCount);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		map.put("mem_num", vo.getMem_num());		
		
		List<QnAVo> list = service.qnalist(map);
		
		model.addAttribute("list",list);
		model.addAttribute("pu",pu);
		return ".qna.list";
	}
	
	@RequestMapping("/qna/insert")
	public String insert(HttpSession session,Model model) {
		String email=(String)session.getAttribute("email");
		MembersVo vo = mservice.getinfo(email);
		model.addAttribute("mem_num",vo.getMem_num());
		return ".qna.insert";
	}
	
	@RequestMapping("/qna/insertOk")
	public String insertOk(QnAVo vo) {
		try {
			service.insert(vo);
			return "redirect:/qna/list";
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return "error";
		}
	}
	@RequestMapping("/qna/detail")
	public String detail(int qna_num,Model model) {
		QnAVo vo = service.detail(qna_num);
		model.addAttribute("vo",vo);
		return ".qna.detail";
	}
	@RequestMapping("/qna/adetail")
	public String adetail(int qna_ans_num, Model model) {
		AnswerVo vo = service.adetail(qna_ans_num);
		model.addAttribute("vo",vo);
		return ".qna.adetail";
	}
	
	@RequestMapping("/qna/delete")
	public String delete(int qna_num) {
		try {
			service.delete(qna_num);
			return "redirect:/qna/list";
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return "error";
		}
	}
}
