package com.jhta.delivery.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChartDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.mybatis.ChartMapper";
	public int getFee(int date) {
		String d=String.valueOf(date);
		int a=sqlSession.selectOne(NAMESPACE+".getfee",d);
		return a;
	}
	public int getMainfee(int date) {
		String d=String.valueOf(date);
		int a=sqlSession.selectOne(NAMESPACE+".mainfee",d);
		return a;
	}
	public int getTopfee(int date) {
		String d=String.valueOf(date);
		int a=sqlSession.selectOne(NAMESPACE+".topfee",d);
		return a;
	}
}
