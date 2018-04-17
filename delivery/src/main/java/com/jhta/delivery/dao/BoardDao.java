package com.jhta.delivery.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.BoardMapper";
	
}
