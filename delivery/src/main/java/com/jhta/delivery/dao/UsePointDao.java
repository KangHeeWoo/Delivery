package com.jhta.delivery.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.delivery.vo.UsePointVo;




@Repository
public class UsePointDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.PointMapper";
	
	public List<UsePointVo> usePoint(HashMap<String, Object> map) {
		return session.selectList(NAMESPACE+".usePoint", map);
	}
	
}
