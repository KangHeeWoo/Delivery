package com.jhta.delivery.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.delivery.vo.StoresVo;

@Repository
public class StoresDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.StoresMapper";
	
	public List<StoresVo> myPositionList(String able_loc){
		return session.selectList(NAMESPACE+".mypositionList", able_loc);
	}
}
