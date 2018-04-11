package com.jhta.delivery.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.delivery.vo.CouponVo;

@Repository
public class CouponDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.CoupunMapper";
	
	public int addcoupon(CouponVo vo) {
		return session.insert(NAMESPACE + ".addcoupon", vo);
	}
	
	public int issuecoupon(HashMap<String, Integer> map) {
		return session.insert(NAMESPACE + ".issuecoupon", map);
	}
	
	public int usecoupon(HashMap<String, Integer> map) {
		return session.insert(NAMESPACE + ".usecoupon", map);
	}
}
