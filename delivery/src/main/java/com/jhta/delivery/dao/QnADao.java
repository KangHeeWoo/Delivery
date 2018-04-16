package com.jhta.delivery.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.delivery.vo.QnAVo;

@Repository
public class QnADao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.QnAMapper";
	
	public int insert(QnAVo vo) {
		return session.insert(NAMESPACE+".insert",vo);
	}
}
