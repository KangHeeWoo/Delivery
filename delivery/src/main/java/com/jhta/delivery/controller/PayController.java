package com.jhta.delivery.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import com.jhta.delivery.mail.SimpleMailSender;
import com.jhta.delivery.service.MembersService;
import com.jhta.delivery.service.PayService;
import com.jhta.delivery.vo.MembersVo;
import com.jhta.delivery.vo.OrderListVo;
import com.jhta.delivery.vo.OrdersVo;

@Controller
public class PayController {
	@Autowired private PayService service;
	@Autowired private MembersService mservice;
	@Autowired private SimpleMailSender simpleMailSender;
	
	@InitBinder
    public void InitBinder(WebDataBinder binder) {
       CustomDateEditor dateEditor=new CustomDateEditor(new SimpleDateFormat("HH:mm"), true);
       binder.registerCustomEditor(Date.class, dateEditor);
    }
	
	@RequestMapping("/order/pay")
	public String order(int[] num,String[] name,int[] price, int[] cnt,int total,int coupon,int usePoint,
			int sto_num,int payType,HttpSession session,boolean reseChk, Date ord_deli_time, String myDetail) {
		String email = (String)session.getAttribute("email");
		String searchAddr = (String)session.getAttribute("searchAddr");
		//String myDetail = (String)session.getAttribute("myDetail");
		
		MembersVo vo = mservice.getinfo(email);
		
		double getPoint = service.getPoint(vo.getMem_num());
		double getComm = service.getComm();
		
		Calendar curr = Calendar.getInstance();
		
		System.out.println( "curr : " + curr.getTime());
		System.out.println( "reseChk : " + reseChk);
		System.out.println( "ord_deli_time : " + ord_deli_time);
		
		if(reseChk == false) {
			ord_deli_time=curr.getTime();
		}
		
		service.insertOrder(new OrdersVo(0, curr.getTime(), ord_deli_time, 
				null, total, (int)(total * (getPoint/100)), (int)(total * (getComm/100)), sto_num, 
				payType, vo.getMem_num(), searchAddr+" "+myDetail, null, null));
		
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
		
		simpleMailSender.sendMail("배달의 백성民 인증", "회원님이 현재 주문하신 음식이 '주문접수' 되었습니다.", email, "deliveryjhta@gmail.com");
		
		return "redirect:/members/orderlist?requestPay=requestPay&stoNum="+sto_num;
	}
}
