package com.jhta.delivery.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.delivery.mail.SimpleMailSender;
import com.jhta.delivery.service.QnaAnswerService;
import com.jhta.delivery.util.PageUtil;
import com.jhta.delivery.vo.QnAVo;

@Controller
public class AdminQnaAnswerController {
	@Autowired private QnaAnswerService service;
	@Autowired private SimpleMailSender sms;
	@RequestMapping("/admin/qnaAnswer")
	public ModelAndView qnaAnswerList(@RequestParam(value="pageNum",defaultValue="1")int pageNum) {
		int totalRowCount=service.getCount();
		ModelAndView mv=new ModelAndView(".admin.adminQnaAnswerList");
		PageUtil pu=new PageUtil(pageNum,10,10,totalRowCount);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("startRow", pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		List<QnAVo> list=service.list(map);
		mv.addObject("list",list);
		mv.addObject("pu",pu);
		return mv;
	}
	@RequestMapping("/admin/qnaAnswerDetail")
	public ModelAndView qnaAnswerDetail(int qna_num) {
		ModelAndView mv=new ModelAndView(".admin.adminQnaAnswerDetail");
		QnAVo vo=service.detail(qna_num);
		mv.addObject("vo",vo);
		return mv;
	}
	@RequestMapping("/admin/qnaAnswerInsert")
	public String qnaAnswerInsert(int qna_num,String qna_ans_title,String qna_ans_cont) {
		String email= service.getEmail(qna_num);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("qna_ans_title",qna_ans_title);
		map.put("qna_ans_cont",qna_ans_cont);
		map.put("qna_num",qna_num);
		service.insert(map);
		sms.sendMail("배달의 백성民 ", "회원님이 등록하신 문의에대한 답변이 등록 되었습니다.", email, "deliveryjhta@gmail.com");
		return "redirect:/admin/qnaAnswer";
	}
}
