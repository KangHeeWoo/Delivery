package com.jhta.delivery.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.delivery.service.MembersService;
import com.jhta.delivery.vo.MembersVo;

@Controller
public class MembersController {
	@Autowired private MembersService service;
	@InitBinder
    public void InitBinder(WebDataBinder binder) {
       CustomDateEditor dateEditor=new CustomDateEditor(new SimpleDateFormat("yyyy-mm-dd"), true);
       binder.registerCustomEditor(Date.class, dateEditor);
    }
	
	@RequestMapping(value="/join",method=RequestMethod.GET)
	public String join() {
		return ".members.join";
	}
	
	@RequestMapping(value="/join",method=RequestMethod.POST)
	public String insert(MembersVo vo, String mem_addr2) {
		String mem_addr=vo.getMem_addr()+mem_addr2;
		vo.setMem_addr(mem_addr);
		
		service.insert(vo);
		
		return ".main";
	}
	
}
