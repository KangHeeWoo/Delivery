package com.jhta.delivery.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.delivery.service.CommentService;
import com.jhta.delivery.service.MembersService;
import com.jhta.delivery.vo.CommentVo;
import com.jhta.delivery.vo.MembersVo;

@Controller
public class CommentController {
	@Autowired
	private CommentService service;
	@Autowired
	private MembersService mservice;

	@RequestMapping("/comment/insertOk")
	public String insertOk(CommentVo vo, HttpSession session) {
		String email = (String) session.getAttribute("email");
		try {
			MembersVo vo1 = mservice.getinfo(email);
			vo.setBoa_com_writer(vo1.getMem_nick());
			//System.out.println(vo.getBoa_com_num());
		
			if (vo.getBoa_com_num() != 0) {
				//System.out.println(vo.getBoa_com_num());
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("boa_ref", vo.getBoa_ref());
				map.put("boa_step", vo.getBoa_step());
				
				System.out.println("vo1 : " + vo);
				System.out.println("map1 : " + map);
				
				vo.setBoa_lev(vo.getBoa_lev()+1);
				vo.setBoa_step(vo.getBoa_step()+1);
				
				System.out.println("vo2 : " + vo);
				System.out.println("map2 : " + map);
				
				service.updateRe(map);
				service.insertRe(vo);
			} else {
				service.insert(vo);
			}
			return "redirect:/board/detail?boa_num=" + vo.getBoa_num();

		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

}
