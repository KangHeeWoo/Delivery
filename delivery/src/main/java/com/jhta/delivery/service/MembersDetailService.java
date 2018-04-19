package com.jhta.delivery.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.MembersDetailDao;
import com.jhta.delivery.vo.ChatLogVo;
import com.jhta.delivery.vo.CouponUseVo;
import com.jhta.delivery.vo.MembersGradeVo;
import com.jhta.delivery.vo.OrdersVo;
import com.jhta.delivery.vo.UsePointVo;

@Service
public class MembersDetailService {
	@Autowired private MembersDetailDao dao;
	public MembersGradeVo members_grade(int mem_num) {
		return dao.members_grade(mem_num);
	}
	public List<ChatLogVo> chat_log(HashMap<String, Object> map) {
		return dao.chat_log(map);
	}
	public List<CouponUseVo> coupon(HashMap<String, Object> map) {
		return dao.coupon(map);
	}
	public List<UsePointVo> point(HashMap<String, Object> map) {
		return dao.point(map);
	}
	public List<OrdersVo> orders(HashMap<String, Object> map) {
		return dao.orders(map);
	}
	public int getChatCount(int mem_num) {
		return dao.getChatCount(mem_num);
	}
	public int getCouponCount(int mem_num) {
		return dao.getCouponCount(mem_num);
	}
	public int getPointCount(int mem_num) {
		return dao.getPointCount(mem_num);
	}
	public int getOrdersCount(int mem_num) {
		return dao.getOrdersCount(mem_num);
	}
}
