package com.jhta.delivery.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.delivery.service.MembersService;

@Controller
public class MembersController {
	@Autowired private MembersService service;
	
	@RequestMapping(value="/join",method=RequestMethod.GET)
	public String join() {
		return ".join";
	}
}
