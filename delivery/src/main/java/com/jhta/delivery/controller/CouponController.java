package com.jhta.delivery.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.delivery.service.CouponService;
import com.jhta.delivery.vo.CouponVo;

@Controller
public class CouponController {
	@Autowired private CouponService service;
	
	@RequestMapping(value="/addcoupon", method=RequestMethod.GET)
	public String addCoupon() {
		return ".admin.coupon";
	}
	
	@RequestMapping(value="/addcoupon", method=RequestMethod.POST)
	public String addCouponOk(CouponVo vo) {
		return "";
	}
}
