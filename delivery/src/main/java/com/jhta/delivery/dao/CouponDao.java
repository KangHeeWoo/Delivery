package com.jhta.delivery.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.delivery.vo.CouponIssueVo;
import com.jhta.delivery.vo.CouponUseVo;
import com.jhta.delivery.vo.CouponVo;

@Repository
public class CouponDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.CoupunMapper";
	
	public int addCoupon(CouponVo vo) {
		return session.insert(NAMESPACE + ".addcoupon", vo);
	}
	
	public int issueCoupon(CouponIssueVo vo) {
		return session.insert(NAMESPACE + ".issuecoupon", vo);
	}
	
	public int usecoupon(CouponUseVo vo) {
		return session.insert(NAMESPACE + ".usecoupon", vo);
	}
	
	public List<CouponVo> couponList(HashMap<String, Integer> map){
		return session.selectList(NAMESPACE + ".cou_list", map);
	}
	public List<CouponIssueVo> couponIssueList(HashMap<String, Integer> map){
		return session.selectList(NAMESPACE + ".cou_isu_list", map);
	}
	public List<CouponUseVo> couponUseList(HashMap<String, Integer> map){
		return session.selectList(NAMESPACE + ".cou_use_list", map);
	}
	public int getCouCount() {
		return session.selectOne(NAMESPACE + ".getCouCount");
	}
	public int getIsuCount() {
		return session.selectOne(NAMESPACE + ".getIsuCount");
	}
	public int getUseCount() {
		return session.selectOne(NAMESPACE + ".getUseCount");
	}
}
