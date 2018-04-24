package com.jhta.delivery.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.delivery.mail.SimpleMailSender;
import com.jhta.delivery.service.MembersService;
import com.jhta.delivery.service.OrdersService;
import com.jhta.delivery.service.SellerService;
import com.jhta.delivery.service.StoresService;
import com.jhta.delivery.util.PageUtil;
import com.jhta.delivery.vo.MembersVo;
import com.jhta.delivery.vo.OrderListVo;
import com.jhta.delivery.vo.OrdersVo;
import com.jhta.delivery.vo.SellerVo;
import com.jhta.delivery.vo.StoresVo;

@Controller
public class OrdersController {
	@Autowired private OrdersService service;
	@Autowired private SellerService selService;
	@Autowired private StoresService stoService;
	@Autowired private MembersService memservice;
	@Autowired private SimpleMailSender simpleMailSender;
	
	@RequestMapping("/seller/orderlist")
	public String orderList(@RequestParam(name="stoNum", defaultValue="-1")int stoNum, 
			@RequestParam(name="pageNum", defaultValue="1")int pageNum,Model model, HttpSession session) {
		
		String email = (String)session.getAttribute("email");

		SellerVo seller = selService.getSeller(email);

		if(stoNum == -1) stoNum = stoService.minStoNum(seller.getSel_num());

		int getCount = service.getOrderCnt(stoNum);

		PageUtil pu = new PageUtil(pageNum, 10, 10, getCount);

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("stoNum", stoNum);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());

		List<OrdersVo> list = service.getOrder(map);
		List<StoresVo> stoList = stoService.stoList(seller.getSel_num());

		model.addAttribute("sto_list", stoList);
		model.addAttribute("ord_list", list);
		model.addAttribute("pu", pu);
		model.addAttribute("sto_num", stoNum);

		return ".seller.orderlist";
	}
	
	@RequestMapping("/seller/orderInfo")
	@ResponseBody
	public List<OrderListVo> orderInfo(int ordNum){
		List<OrderListVo> list = service.getOrderList(ordNum);
		
		return list;
	}
	@RequestMapping("/orders/myorder")
	public String myoder(int ord_num,HttpSession session,Model model) {
		String mem_email=(String)session.getAttribute("email");
		MembersVo vo=memservice.mem_num(mem_email);
		int mem_num=vo.getMem_num();
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("mem_num", mem_num);
		map.put("ord_num", ord_num);
		
		OrdersVo odrVo=service.ordNumList(map);
		List<OrderListVo> listvo=service.getOrderList(ord_num);
		
		model.addAttribute("ordVo", odrVo);
		model.addAttribute("listvo", listvo);
		
		
		return ".members.myOrders";
	}
	
	@RequestMapping("/seller/setOrderState")
	@ResponseBody
	public String setOrderState(String ord_state, int ord_num) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("ord_state", ord_state);
		map.put("ord_num", ord_num);
		
		int n = service.setOrdState(map);
		
		JSONObject ob = new JSONObject();
		
		ob.put("result", false);
		if(n > 0 ) { 
			ob.put("result", true);
			
			OrdersVo ovo = service.getOrderInfo(ord_num);
			MembersVo mvo = memservice.searchMemNum(ovo.getMem_num());

			simpleMailSender.sendMail("배달의 백성民 인증", "회원님이 현재 주문하신 음식이 '" + ord_state + "' 입니다.", mvo.getMem_email(), "deliveryjhta@gmail.com");
		}
		
		return ob.toString();
	}
}
