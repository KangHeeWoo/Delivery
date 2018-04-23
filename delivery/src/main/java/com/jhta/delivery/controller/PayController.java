package com.jhta.delivery.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.delivery.service.MembersService;
import com.jhta.delivery.service.PayService;
import com.jhta.delivery.vo.CartVo;
import com.jhta.delivery.vo.MembersVo;
import com.jhta.delivery.vo.OrderListVo;
import com.jhta.delivery.vo.OrdersVo;

@Controller
public class PayController {
	@Autowired private PayService service;
	@Autowired private MembersService mservice;
	
	@InitBinder
    public void InitBinder(WebDataBinder binder) {
       CustomDateEditor dateEditor=new CustomDateEditor(new SimpleDateFormat("HH:mm"), true);
       binder.registerCustomEditor(Date.class, dateEditor);
    }
	
	@RequestMapping("/order/pay")
	public String order(int[] num,String[] name,int[] price, int[] cnt,int total,int coupon,int usePoint,int sto_num,int payType,HttpSession session,boolean reseChk, Date ord_deli_time, String myDetail) {
		String email = (String)session.getAttribute("email");
		String able_loc = (String)session.getAttribute("able_loc");
		//String myDetail = (String)session.getAttribute("myDetail");
		
		MembersVo vo = mservice.getinfo(email);
		
		double getPoint = service.getPoint(vo.getMem_num());
		double getComm = service.getComm();
		service.insertOrder(new OrdersVo(0, null, ord_deli_time, 
				null, total, (int)(total * (getPoint/100)), (int)(total * (getComm/100)), sto_num, 
				payType, vo.getMem_num(), able_loc+" "+myDetail, null, null));
		
		int getOrdNum = service.getOrdNum();		
		
		for(int i=0;i<num.length;i++) {
			service.insertOrderList(new OrderListVo(0, getOrdNum, num[i], null, cnt[i]));
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(coupon != -1) {
			map.put("cou_iss_num", coupon);
			map.put("ord_num", getOrdNum);
			service.useCoupon(map);
		}
		if(usePoint != 0) {
			map.put("use_amount", usePoint);
			map.put("mem_num", vo.getMem_num());
			map.put("ord_num", getOrdNum);
			service.usePoint(map);
		}
		
		map.put("use_amount", usePoint);
		if(usePoint == 0) map.put("use_amount", 0);
		map.put("mem_num", vo.getMem_num());
		map.put("ord_point", (int)(total * (getPoint/100)));	
		
		service.updatePoint(map);
		
		return "redirect:/members/orderlist";
	}
}
