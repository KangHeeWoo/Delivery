package com.jhta.delivery.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.UsePointDao;
import com.jhta.delivery.vo.OrdersUsePointVo;

@Service
public class UsePointService {
	@Autowired private UsePointDao dao;
	
	public int usegetCount (int mem_num) {
		return dao.usegetCount(mem_num);
	}
	public List<OrdersUsePointVo> ordUsePoint(HashMap<String, Object> map){
		return dao.ordUsePoint(map);
	}
	
	public int mypoint(int mem_num) {
		return dao.mypoint(mem_num);
	}
}
