package com.jhta.delivery.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.delivery.dao.QnADao;

@Controller
public class QnAController {
	@Autowired private QnADao dao;
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert() {
		return ".qna.insert";
	}
}
