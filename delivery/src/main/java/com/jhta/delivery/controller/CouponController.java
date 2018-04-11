package com.jhta.delivery.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.delivery.service.CouponService;
import com.jhta.delivery.util.PageUtil;
import com.jhta.delivery.vo.CouponIssueVo;
import com.jhta.delivery.vo.CouponUseVo;
import com.jhta.delivery.vo.CouponVo;

@Controller
public class CouponController {
	@Autowired private CouponService service;
	
	@RequestMapping(value="/admin/coupon")
	public String addCoupon(Model model, @RequestParam(value="cNum", defaultValue="1")int cNum, @RequestParam(value="iNum", defaultValue="1")int iNum, @RequestParam(value="uNum", defaultValue="1")int uNum) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		int getCouCount = service.getCouCount();
		int getIsuCount = service.getIsuCount();
		int getUseCount = service.getUseCount();
		
		PageUtil couPage = new PageUtil(cNum, 10, 10, getCouCount);
		PageUtil isuPage = new PageUtil(iNum, 10, 10, getIsuCount);
		PageUtil usePage = new PageUtil(uNum, 10, 10, getUseCount);
		
		map.put("c_startRow", couPage.getStartRow());
		map.put("c_endRow", couPage.getStartRow());
		map.put("i_startRow", isuPage.getStartRow());
		map.put("i_endRow", isuPage.getStartRow());
		map.put("u_startRow", usePage.getStartRow());
		map.put("u_endRow", usePage.getStartRow());
		
		List<CouponVo> couList = service.couponList(map);
		List<CouponIssueVo> couIssList = service.couponIssueList(map);
		List<CouponUseVo> couUseList = service.couponUseList(map);
		
		System.out.println("couList : " + couList);
		System.out.println("couIssList : " + couIssList);
		System.out.println("couUseList : " + couUseList);
		
		System.out.println("couPage : " + couPage);
		System.out.println("isuPage : " + isuPage);
		System.out.println("usePage : " + usePage);
		
		model.addAttribute("couPage", couPage);
		model.addAttribute("isuPage", isuPage);
		model.addAttribute("usePage", usePage);
		model.addAttribute("cou_list", couList);
		model.addAttribute("cou_ise_list", couIssList);
		model.addAttribute("cou_use_list", couUseList);
		return ".admin.coupon";
	}
	
	@RequestMapping(value="/admin/addcoupon", method=RequestMethod.POST)
	public String addCouponOk() {
		return "";
	}
}
