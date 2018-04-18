package com.jhta.delivery.dao;

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
	public List<ChatLogVo> chat_log(int mem_num) {
		return session.selectList(NAMESPACE+".chat_log",mem_num);
	}
	public List<CouponUseVo> coupon(int mem_num) {
		return session.selectList(NAMESPACE+".coupon",mem_num);
	}
	public List<UsePointVo> point(int mem_num) {
		return session.selectList(NAMESPACE+".point",mem_num);
	}
	public List<OrdersVo> orders(int mem_num) {
		return session.selectList(NAMESPACE+".orders",mem_num);
	}
}
