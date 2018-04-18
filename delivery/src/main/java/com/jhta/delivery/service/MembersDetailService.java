package com.jhta.delivery.service;

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
	public List<ChatLogVo> chat_log(int mem_num) {
		return dao.chat_log(mem_num);
	}
	public List<CouponUseVo> coupon(int mem_num) {
		return dao.coupon(mem_num);
	}
	public List<UsePointVo> point(int mem_num) {
		return dao.point(mem_num);
	}
	public List<OrdersVo> orders(int mem_num) {
		return dao.orders(mem_num);
	}
}
