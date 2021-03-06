package com.jhta.delivery.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.delivery.vo.StoresVo;
import com.jhta.delivery.vo.TopAdsVo;

@Repository
public class TopAdsDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.TopAdsMapper";
	
	public List<StoresVo> topAdsList(HashMap<String, Object> map) {
		return session.selectList(NAMESPACE+".topAdsList",map);
	}
	public List<TopAdsVo> topAdsEntry(HashMap<String, Object> map){
		return session.selectList(NAMESPACE+".topAdsEntry", map);
	}
	public int getCount(Date d) {
		return session.selectOne(NAMESPACE+".count",d);
	}
		
}
