package com.jhta.delivery.dao;


import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.delivery.vo.MembersVo;

@Repository
public class MembersDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.MembersMapper";
	
	public int insert(MembersVo vo) {
		return session.insert(NAMESPACE+".insert", vo);
	}
	public MembersVo emailcheck(String mem_email) {
		
		return session.selectOne(NAMESPACE+".emailcheck", mem_email);
	}
	public MembersVo nickcheck(String mem_nick) {
		return session.selectOne(NAMESPACE+".nickcheck", mem_nick);
	}
	public MembersVo logincheck(HashMap<String, String> map) {
		return session.selectOne(NAMESPACE+".logincheck", map);
	}
	public MembersVo mem_num(String mem_email) {
		return session.selectOne(NAMESPACE+".mem_num", mem_email);
	}
}
