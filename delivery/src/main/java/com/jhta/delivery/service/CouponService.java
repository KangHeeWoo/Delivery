package com.jhta.delivery.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.CouponDao;
import com.jhta.delivery.vo.CouponIssueVo;
import com.jhta.delivery.vo.CouponUseVo;
import com.jhta.delivery.vo.CouponVo;

@Service
public class CouponService {
	@Autowired private CouponDao dao;
	
	public int addCoupon(String type) {
		return dao.addCoupon(type);
	}
	
	public int issueCoupon(CouponIssueVo vo) {
		return dao.issueCoupon(vo);
	}
	
	public int usecoupon(HashMap<String, Integer> map) {
		return dao.usecoupon(map);
	}
	
	public List<CouponVo> couponList(HashMap<String, Integer> map){
		return dao.couponList(map);
	}
	public List<CouponIssueVo> couponIssueList(HashMap<String, Integer> map){
		return dao.couponIssueList(map);
	}
	public List<CouponUseVo> couponUseList(HashMap<String, Integer> map){
		return dao.couponUseList(map);
	}
	public int getCouCount() {
		return dao.getCouCount();
	}
	public int getIsuCount() {
		return dao.getIsuCount();
	}
	public int getUseCount() {
		return dao.getUseCount();
	}
}
