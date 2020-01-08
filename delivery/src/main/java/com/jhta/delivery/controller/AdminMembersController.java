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
	public ModelAndView detail(int mem_num, @RequestParam(value="chNum", defaultValue="1")int chNum, 
			@RequestParam(value="cNum", defaultValue="1")int cNum, @RequestParam(value="pNum", defaultValue="1")int pNum,
			@RequestParam(value="oNum", defaultValue="1")int oNum) {
		
		ModelAndView mv=new ModelAndView(".admin.membersDetail");
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		int getChatCount	=	service1.getChatCount(mem_num);
		int getCouponCount	=	service1.getCouponCount(mem_num);
		int getPointCount	=	service1.getPointCount(mem_num);
		int getOrdersCount	=	service1.getOrdersCount(mem_num);
		
		PageUtil chatPage	=	new PageUtil(chNum,5,5,getChatCount);
		PageUtil couponPage	=	new PageUtil(cNum,5,5,getCouponCount);
		PageUtil pointPage	=	new PageUtil(pNum,5,5,getPointCount);
		PageUtil ordersPage	=	new PageUtil(oNum,5,5,getOrdersCount);
		
		map.put("mem_num", mem_num);
		map.put("ch_startRow", chatPage.getStartRow());
		map.put("ch_endRow",chatPage.getEndRow());
		map.put("c_startRow",couponPage.getStartRow());
		map.put("c_endRow",couponPage.getEndRow());
		map.put("p_startRow",pointPage.getStartRow());
		map.put("p_endRow",pointPage.getEndRow());
		map.put("o_startRow",ordersPage.getStartRow());
		map.put("o_endRow",ordersPage.getEndRow());
		
		MembersGradeVo mgv=service1.members_grade(mem_num);
		List<ChatLogVo> clv		=	service1.chat_log(map);
		List<CouponUseVo> cuv	=	service1.coupon(map);
		List<UsePointVo> upv	=	service1.point(map);
		List<OrdersVo> ov		=	service1.orders(map);
		
		mv.addObject("mgv",mgv);
		mv.addObject("clv",clv);
		mv.addObject("cuv",cuv);
		mv.addObject("upv",upv);
		mv.addObject("ov",ov);
		mv.addObject("chatPage",chatPage);
		mv.addObject("couponPage",couponPage);
		mv.addObject("pointPage",pointPage);
		mv.addObject("ordersPage",ordersPage);
		return mv;
	}
	
	@RequestMapping("/graUp")
	public String graUp(int gra_num, int mem_num) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("gra_num", gra_num);
		map.put("mem_num", mem_num);
		service.graUp(map);
		return "redirect:/memberslist";
	}
}
