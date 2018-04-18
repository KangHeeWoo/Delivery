package com.jhta.delivery.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.delivery.service.BoardService;
import com.jhta.delivery.service.MembersService;
import com.jhta.delivery.util.PageUtil;
import com.jhta.delivery.vo.BoardVo;
import com.jhta.delivery.vo.MembersVo;

@Controller
public class BoardController {
	@Autowired private BoardService service;
	@Autowired private MembersService mservice;
	
	@RequestMapping("/board/list")
	public String board(@RequestParam(name="pageNum", defaultValue="1")int pageNum,Model model){
		int getCount = service.getCount();
		
		PageUtil pu = new PageUtil(pageNum, 10, 10, getCount);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		
		List<BoardVo> list = service.getList(map);
		
		model.addAttribute("pu",pu);
		model.addAttribute("list",list);
		
		return ".board.list";
	}
	@RequestMapping("/board/insert")
	public String insert(HttpSession session,Model model) {
		String email = (String)session.getAttribute("email");
		System.out.println(email);
		if(email != null) {
			MembersVo vo = mservice.getinfo(email);
			model.addAttribute("boa_writer",vo.getMem_nick());
			return ".board.insert";
		}else {
			return "redirect:/board/list";
		}
	}
	@RequestMapping("/board/insertOk")
	public String insertOk(BoardVo vo) {
		try {
			service.insert(vo);
			return "redirect:/board/list";
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return "error";
		}
	}
	@RequestMapping("/board/detail")
	public String detail(int boa_num, Model model) {
		service.addHit(boa_num);
		BoardVo vo = service.detail(boa_num);
		BoardVo prev = service.prev(boa_num);
		BoardVo next = service.next(boa_num);
		
		vo.setBoa_cont(vo.getBoa_cont().replaceAll("\n", "<br>"));
		
		model.addAttribute("vo", vo);
		model.addAttribute("prev",prev);
		model.addAttribute("next",next);
		
		return ".board.detail";
	}
	@RequestMapping("/board/delete")
	public String delete(int boa_num) {
		try {
			service.delete(boa_num);
			return "redirect:/board/list";
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return "error";
		}
	}
	@RequestMapping("/board/update")
	public String update(int boa_num,Model model,HttpSession session) {
		String email = (String)session.getAttribute("email");
		MembersVo vo = mservice.getinfo(email);
		model.addAttribute("boa_writer",vo.getMem_nick());
		BoardVo vo1 = service.detail(boa_num);
		model.addAttribute("vo",vo1);
		model.addAttribute("boa_num",boa_num);
		return ".board.update";
	}
	@RequestMapping("/board/updateOk")
	public String updateOk(BoardVo vo) {
		try {
			service.update(vo);
			return "redirect:/board/list";
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return "error";
		}
	}
}
