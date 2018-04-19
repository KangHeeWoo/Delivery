package com.jhta.delivery.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.CommentMapper";
	
}
