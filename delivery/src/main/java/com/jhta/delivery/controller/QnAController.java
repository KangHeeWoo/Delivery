package com.jhta.delivery.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.delivery.service.MembersService;
import com.jhta.delivery.service.QnAService;
import com.jhta.delivery.vo.MembersVo;
import com.jhta.delivery.vo.QnAVo;

@Controller
public class QnAController {
	@Autowired private QnAService service;
	@Autowired private MembersService mservice;
	
	@RequestMapping("/qna/list")
	public String list(HttpSession session, Model model) {
		String email=(String)session.getAttribute("email");
		model.addAttribute("email",email);
		MembersVo vo = mservice.getinfo(email);
		List<QnAVo> list = service.qnalist(vo.getMem_num());
		model.addAttribute("list",list);
		return ".qna.list";
	}
	
	@RequestMapping("/qna/insert")
	public String insert(int mem_num) {
		return ".qna.insert";
	}
	@RequestMapping("/qna/insertOk")
	public String insertOk(QnAVo vo) {
		try {
			System.out.println(vo);
			service.insert(vo);
			return ".qna.list";
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return "error";
		}
	}
}
