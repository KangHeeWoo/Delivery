package com.jhta.delivery.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.delivery.service.MembersDetailService;
import com.jhta.delivery.service.MembersService;
import com.jhta.delivery.util.PageUtil;
import com.jhta.delivery.vo.ChatLogVo;
import com.jhta.delivery.vo.CouponUseVo;
import com.jhta.delivery.vo.MembersGradeVo;
import com.jhta.delivery.vo.MembersVo;
import com.jhta.delivery.vo.OrdersVo;
import com.jhta.delivery.vo.UsePointVo;

@Controller
public class AdminMembersController {
	@Autowired private MembersService service;
	@Autowired private MembersDetailService service1;
	@RequestMapping("/memberslist")
	public ModelAndView list(@RequestParam(value="pageNum",defaultValue="1")int pageNum) {
		ModelAndView mv=new ModelAndView(".admin.members");
		int totalRowCount=service.getCount();
		PageUtil pu=new PageUtil(pageNum,10,10,totalRowCount);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("startRow", pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		List<MembersVo> list=service.list(map);
		mv.addObject("list",list);
		mv.addObject("pu",pu);
		return mv;
	}
	@RequestMapping("/members/search")
	public ModelAndView search(@RequestParam(value="pageNum",defaultValue="1") int pageNum,String word,String search) {
		
		ModelAndView mv=new ModelAndView(".admin.membersSearch");
		HashMap<String, Object> map1=new HashMap<String, Object>();
		map1.put("search", search);
		map1.put("word", word);
		int totalRowCount=service.getCounts(map1);
		PageUtil pu=new PageUtil(pageNum,10,10,totalRowCount);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("startRow", pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		map.put("search", search);
		map.put("word", word);
		List<MembersVo> list=service.searchList(map);
		
		mv.addObject("list",list);
		mv.addObject("pu",pu);
		mv.addObject("map",map);
		return mv;
	}
	@RequestMapping("/members/detail")
	public ModelAndView detail(int mem_num) {
		ModelAndView mv=new ModelAndView(".admin.membersDetail");
		MembersGradeVo mgv=service1.members_grade(mem_num);
		List<ChatLogVo> clv=service1.chat_log(mem_num);
		List<CouponUseVo> cuv=service1.coupon(mem_num);
		List<UsePointVo> upv=service1.point(mem_num);
		List<OrdersVo> ov=service1.orders(mem_num);
		mv.addObject("mgv",mgv);
		mv.addObject("clv",clv);
		mv.addObject("cuv",cuv);
		mv.addObject("upv",upv);
		mv.addObject("ov",ov);
		return mv;
	}
}
