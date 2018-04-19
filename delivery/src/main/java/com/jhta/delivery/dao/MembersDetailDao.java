package com.jhta.delivery.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.delivery.vo.ChatLogVo;
import com.jhta.delivery.vo.CouponUseVo;
import com.jhta.delivery.vo.MembersGradeVo;
import com.jhta.delivery.vo.OrdersVo;
import com.jhta.delivery.vo.UsePointVo;

@Repository
public class MembersDetailDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.MembersDetailMapper";
	public MembersGradeVo members_grade(int mem_num) {
		return session.selectOne(NAMESPACE+".members_grade",mem_num);
	}
	public List<ChatLogVo> chat_log(HashMap<String, Object> map) {
		List<ChatLogVo> list =session.selectList(NAMESPACE+".chat_log",map);
		return list;
	}
	public List<CouponUseVo> coupon(HashMap<String, Object> map) {
		List<CouponUseVo> list =session.selectList(NAMESPACE+".coupon",map);
		return list;
	}
	public List<UsePointVo> point(HashMap<String, Object> map) {
		List<UsePointVo> list =session.selectList(NAMESPACE+".point",map);
		return list;
	}
	public List<OrdersVo> orders(HashMap<String, Object> map) {
		List<OrdersVo> list =session.selectList(NAMESPACE+".orders",map);
		return list;
	}
	public int getChatCount(int mem_num) {
		return session.selectOne(NAMESPACE+".getChatCount",mem_num);
	}
	public int getCouponCount(int mem_num) {
		return session.selectOne(NAMESPACE+".getCouponCount",mem_num);
	}
	public int getPointCount(int mem_num) {
		return session.selectOne(NAMESPACE+".getPointCount",mem_num);
	}
	public int getOrdersCount(int mem_num) {
		return session.selectOne(NAMESPACE+".getOrdersCount",mem_num);
	}
}
