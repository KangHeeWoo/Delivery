package com.jhta.delivery.dao;


import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.delivery.vo.MembersVo;
import com.jhta.delivery.vo.SellerVo;

@Repository
public class SellerDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.SellerMapper";
	
	public SellerVo eamilcheck(String sel_email) {
		return session.selectOne(NAMESPACE+".emailcheck", sel_email);
	}
	public SellerVo logincheck(HashMap<String, String> map) {
		return session.selectOne(NAMESPACE+".logincheck",map);
	}

	public int insert(SellerVo vo) {
		return session.insert(NAMESPACE+".insert", vo);
	}
}
