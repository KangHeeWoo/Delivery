package com.jhta.delivery.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.delivery.service.OrdersService;
import com.jhta.delivery.service.SellerService;
import com.jhta.delivery.service.StoresService;
import com.jhta.delivery.util.PageUtil;
import com.jhta.delivery.vo.OrderListVo;
import com.jhta.delivery.vo.OrdersVo;
import com.jhta.delivery.vo.SellerVo;
import com.jhta.delivery.vo.StoresVo;

@Controller
public class OrdersController {
	@Autowired private OrdersService service;
	@Autowired private SellerService selService;
	@Autowired private StoresService stoService;
	
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
}
