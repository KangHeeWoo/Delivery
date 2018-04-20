package com.jhta.delivery.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.delivery.vo.OrderListVo;
import com.jhta.delivery.vo.OrdersVo;

@Repository
public class PayDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE="com.jhta.mybatis.PayMapper";
	
	public int insertOrder(OrdersVo vo) {
		return session.insert(NAMESPACE+".insertOrder" , vo);
	}
	public int getPoint(int mem_num) {
		return session.selectOne(NAMESPACE+".getPoint",mem_num);
	}
	public int getComm() {
		return session.selectOne(NAMESPACE+".getComm");
	}
	public int insertOrderList(OrderListVo vo) {
		return session.insert(NAMESPACE+".insertOrderList",vo);
	}
	public int useCoupon(HashMap<String, Object> map) {
		return session.insert(NAMESPACE+".useCoupon",map);
	}
	public int usePoint(HashMap<String, Object> map) {
		return session.insert(NAMESPACE+".usePoint",map);
	}
	public int updatePoint(HashMap<String, Object> map) {
		return session.update(NAMESPACE+".updatePoint",map);
	}
	
	public int getOrdNum() {
		return session.selectOne(NAMESPACE + ".getOrdNum");
	}
}
