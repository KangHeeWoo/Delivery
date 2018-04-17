package com.jhta.delivery.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.delivery.mail.SimpleMailSender;
import com.jhta.delivery.service.BookMarkService;
import com.jhta.delivery.service.CouponService;
import com.jhta.delivery.service.MembersService;
import com.jhta.delivery.util.PageUtil;
import com.jhta.delivery.vo.CouponIssueVo;
import com.jhta.delivery.vo.MembersVo;
import com.jhta.delivery.vo.StoresVo;

@Controller
public class MembersController {
	@Autowired private SimpleMailSender simpleMailSender;
	@Autowired private MembersService service;
	@Autowired private CouponService couponService;
	@Autowired private BookMarkService bservice;
	
	@InitBinder
    public void InitBinder(WebDataBinder binder) {
       CustomDateEditor dateEditor=new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true);
       binder.registerCustomEditor(Date.class, dateEditor);
    }
	
	@RequestMapping(value="/members",method=RequestMethod.GET)
	public String join() {
		return ".members.join";
	}
	
	@RequestMapping("/members/bookmark")
	public String bookmark(HttpSession session,Model model,@RequestParam(value="pageNum",defaultValue="1")int pageNum) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		String mem_email=(String)session.getAttribute("email");
		MembersVo vo=service.mem_num(mem_email);
		int mem_num=vo.getMem_num();
		
		int totalRowCount=bservice.getCount(mem_num);
		PageUtil pu=new PageUtil(pageNum, 10, 10, totalRowCount);
		map.put("mem_num", mem_num);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
			
		
		List<StoresVo> list=bservice.booklist(map);
		model.addAttribute("booklist", list);
		model.addAttribute("pu", pu);
		
		return ".members.bookmark";
	}
	
	
	@RequestMapping(value="/join",method=RequestMethod.POST)
	public String insert(MembersVo vo, String mem_addr2) {
		String mem_addr=vo.getMem_addr()+mem_addr2;
		vo.setMem_addr(mem_addr);
		
		service.insert(vo);
		
		MembersVo mem = couponService.searchMem(vo.getMem_email());
		Calendar today = Calendar.getInstance();
		Calendar nextMon = Calendar.getInstance();
		
		nextMon.set(Calendar.MONTH, today.get(Calendar.MONTH) + 1);
		
		couponService.issueCoupon(new CouponIssueVo(0, 41, mem.getMem_num(), today.getTime(), nextMon.getTime(), null, null));
		
		return ".main";
	}
	
	@RequestMapping(value="/member/email",produces="application/json;charset=utf-8")
	@ResponseBody
	public String email(String mem_email, String email_num) {
		System.out.println("email:"+mem_email+",email_num:"+email_num);
		JSONObject ob=new JSONObject();

		int m=service.emailcheck(mem_email);
		if(m<0) {
			boolean n=simpleMailSender.sendMail("배달의 백성民 인증", "인증번호를 가입란에 입력해주세요.\n"+ email_num , mem_email, "deliveryjhta@gmail.com");
			System.out.println("메일갓니"+n);
			
			ob.put("result", n);
			
		}else {
			ob.put("result", false);
		}

		return ob.toString();
	}
	@RequestMapping(value="/member/nick",produces="application/json;charset=utf-8")
	@ResponseBody
	public String email(String inputNick) {
		System.out.println("inputNick:"+inputNick);
		JSONObject ob=new JSONObject();

		int m=service.nickcheck(inputNick);
		if(m<0) ob.put("result",true);
		else ob.put("result", false);
	
		return ob.toString();
	}
	
	
}
