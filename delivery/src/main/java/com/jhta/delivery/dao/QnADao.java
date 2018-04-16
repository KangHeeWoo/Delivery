package com.jhta.delivery.dao;

import java.util.HashMap;
import java.util.List;

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
	public List<QnAVo> qnalist(int mem_num){
		return session.selectList(NAMESPACE + ".myqna",mem_num);
	}
}
