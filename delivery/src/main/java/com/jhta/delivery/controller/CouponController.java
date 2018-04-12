package com.jhta.delivery.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

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

import com.jhta.delivery.service.CouponService;
import com.jhta.delivery.util.PageUtil;
import com.jhta.delivery.vo.CouponIssueVo;
import com.jhta.delivery.vo.CouponUseVo;
import com.jhta.delivery.vo.CouponVo;
import com.jhta.delivery.vo.MembersVo;

@Controller
public class CouponController {
	@Autowired private CouponService service;
	
	@InitBinder
    public void InitBinder(WebDataBinder binder) {
       CustomDateEditor dateEditor=new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true);
       binder.registerCustomEditor(Date.class, dateEditor);
    }
	
	@RequestMapping(value="/admin/coupon")
	public String addCoupon(Model model, @RequestParam(value="cNum", defaultValue="1")int cNum, 
			@RequestParam(value="iNum", defaultValue="1")int iNum, @RequestParam(value="uNum", defaultValue="1")int uNum) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		int getCouCount = service.getCouCount();
		int getIsuCount = service.getIsuCount();
		int getUseCount = service.getUseCount();
		
		PageUtil couPage = new PageUtil(cNum, 10, 10, getCouCount);
		PageUtil isuPage = new PageUtil(iNum, 10, 10, getIsuCount);
		PageUtil usePage = new PageUtil(uNum, 10, 10, getUseCount);
		
		map.put("c_startRow", couPage.getStartRow());
		map.put("c_endRow", couPage.getEndRow());
		map.put("i_startRow", isuPage.getStartRow());
		map.put("i_endRow", isuPage.getEndRow());
		map.put("u_startRow", usePage.getStartRow());
		map.put("u_endRow", usePage.getEndRow());
		
		List<CouponVo> couList = service.couponList(map);
		List<CouponIssueVo> couIssList = service.couponIssueList(map);
		List<CouponUseVo> couUseList = service.couponUseList(map);
		
		model.addAttribute("couPage", couPage);
		model.addAttribute("isuPage", isuPage);
		model.addAttribute("usePage", usePage);
		model.addAttribute("cou_list", couList);
		model.addAttribute("cou_ise_list", couIssList);
		model.addAttribute("cou_use_list", couUseList);
		
		return ".admin.coupon";
	}
	
	@RequestMapping(value="/admin/addcoupon")
	public String addCouponOk(CouponVo vo) {
		try {
			service.addCoupon(vo);
			return "redirect:/admin/coupon";
		}catch (Exception e) {
			e.printStackTrace();
			return "redirect:/admin/coupon";
		}
	}
	
	@RequestMapping("admin/issuecoupon")
	public String issueCoupon(CouponIssueVo vo) {
		try {
			System.out.println(vo);
			//service.issueCoupon(vo);
			return "redirect:/admin/coupon";
		}catch (Exception e) {
			e.printStackTrace();
			return "redirect:/admin/coupon";
		}
	}
	
	@RequestMapping("/admin/searchMem")
	@ResponseBody
	public MembersVo searchMem(String email) {		
		return service.searchMem(email);
	}
}
