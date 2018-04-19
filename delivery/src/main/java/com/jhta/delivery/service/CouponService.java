package com.jhta.delivery.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.CouponDao;
import com.jhta.delivery.vo.CouponIssueVo;
import com.jhta.delivery.vo.CouponUseVo;
import com.jhta.delivery.vo.CouponVo;
import com.jhta.delivery.vo.MemCouponVo;
import com.jhta.delivery.vo.MembersVo;

@Service
public class CouponService {
	@Autowired private CouponDao dao;
	
	public int addCoupon(CouponVo vo) {
		return dao.addCoupon(vo);
	}
	
	public int issueCoupon(CouponIssueVo vo) {
		return dao.issueCoupon(vo);
	}
	
	public int usecoupon(CouponUseVo vo) {
		return dao.usecoupon(vo);
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
	
	public MembersVo searchMem(String email) {
		return dao.searchMem(email);
	}
	
	public List<CouponVo> allCouponList(){
		return dao.allCouponList();
	}
	public List<MemCouponVo> memCoupon(int mem_num){
		return dao.memCoupon(mem_num);
	}
}
