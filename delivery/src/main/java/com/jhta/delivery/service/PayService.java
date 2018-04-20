package com.jhta.delivery.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.PayDao;
import com.jhta.delivery.vo.OrderListVo;
import com.jhta.delivery.vo.OrdersVo;

@Service
public class PayService {
	@Autowired private PayDao dao;
	
	public int insertOrder(OrdersVo vo) {
		return dao.insertOrder(vo);
	}
	public int getPoint(int mem_num) {
		return dao.getPoint(mem_num);
	}
	public int getComm() {
		return dao.getComm();
	}
	public int insertOrderList(OrderListVo vo) {
		return dao.insertOrderList(vo);
	}
	public int useCoupon(HashMap<String, Object> map) {
		return dao.useCoupon(map);
	}
	public int usePoint(HashMap<String, Object> map) {
		return dao.usePoint(map);
	}
	public int updatePoint(HashMap<String, Object> map) {
		return dao.updatePoint(map);
	}
	
	public int getOrdNum() {
		return dao.getOrdNum();
	}
}
