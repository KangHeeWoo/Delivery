package com.jhta.delivery.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminQnaAnswerController {
	
	@RequestMapping("/admin/qnaAnswer")
	public String qnaAnswerList() {
		return ".admin.adminQnaAnswerList";
	}
}
