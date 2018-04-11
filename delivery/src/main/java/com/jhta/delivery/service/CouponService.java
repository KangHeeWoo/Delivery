package com.jhta.delivery.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.CouponDao;
import com.jhta.delivery.vo.CouponVo;

@Service
public class CouponService {
	@Autowired private CouponDao dao;
	
	public int addcoupon(CouponVo vo) {
		return dao.addcoupon(vo);
	}
	
	public int issuecoupon(HashMap<String, Integer> map) {
		return dao.issuecoupon(map);
	}
	
	public int usecoupon(HashMap<String, Integer> map) {
		return dao.usecoupon(map);
	}
}
