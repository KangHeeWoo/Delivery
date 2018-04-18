package com.jhta.delivery.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.delivery.vo.OrderListVo;
import com.jhta.delivery.vo.OrdersVo;

@Repository
public class OrdersDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.OrdersMapper";
	
	public List<OrdersVo> getOrder(HashMap<String, Object> map){
		return session.selectList(NAMESPACE + ".order", map);
	}
	
	public List<OrderListVo> getOrderList(int ordNum){
		return session.selectList(NAMESPACE + ".orderList", ordNum);
	}
	
	public int setOrdState(HashMap<String, Object> map) {
		return session.update(NAMESPACE + ".setOrdState", map);
	}
	
	public int getOrderCnt(int stoNum) {
		return session.selectOne(NAMESPACE + ".getOrderCnt", stoNum);
	}
	
	public int getMembersOrderCnt(int num) {
		return session.selectOne(NAMESPACE + ".getMembersOrderCnt", num);
	}
	
	public List<OrdersVo> getMembersOrder(HashMap<String, Object> map){
		return session.selectList(NAMESPACE + ".membersOrder", map);
	}
}
