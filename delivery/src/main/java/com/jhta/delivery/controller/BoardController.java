package com.jhta.delivery.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.delivery.service.BoardService;
import com.jhta.delivery.util.PageUtil;
import com.jhta.delivery.vo.BoardVo;

@Controller
public class BoardController {
	@Autowired private BoardService service;
	
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
}
