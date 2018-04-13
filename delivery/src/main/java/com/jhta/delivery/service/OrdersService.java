package com.jhta.delivery.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.OrdersDao;
import com.jhta.delivery.vo.OrderListVo;
import com.jhta.delivery.vo.OrdersVo;

@Service
public class OrdersService {
	@Autowired private OrdersDao dao;
	
	public List<OrdersVo> getOrder(HashMap<String, Object> map){
		return dao.getOrder(map);
	}
	
	public List<OrderListVo> getOrderList(int ordNum){
		return dao.getOrderList(ordNum);
	}
	
	public int setOrdState(HashMap<String, Object> map) {
		return dao.setOrdState(map);
	}
	
	public int getOrderCnt(int stoNum) {
		return dao.getOrderCnt(stoNum);
	}
}