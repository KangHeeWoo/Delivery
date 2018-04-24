package com.jhta.delivery.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.delivery.vo.OrdersUsePointVo;

@Repository
public class UsePointDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.PointMapper";
	
	
	public int usegetCount(int mem_num) {
		return session.selectOne(NAMESPACE+".usegetCount", mem_num);
	}
	public List<OrdersUsePointVo> ordUsePoint(HashMap<String, Object> map){
		return session.selectList(NAMESPACE+".ordUsePoint", map);
	}
	public int mypoint(int mem_num) {
		return session.selectOne(NAMESPACE+".mypoint", mem_num);
	}
}
