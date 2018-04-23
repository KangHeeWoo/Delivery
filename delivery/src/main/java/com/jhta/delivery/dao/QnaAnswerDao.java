package com.jhta.delivery.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.delivery.vo.QnAVo;

@Repository
public class QnaAnswerDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE="com.jhta.mybatis.QnaAnswerMapper";
	public List<QnAVo> list(HashMap<String, Object> map) {
		return session.selectList(NAMESPACE+".list",map);
	}
	public int getCount() {
		return session.selectOne(NAMESPACE+".count");
	}
	public QnAVo detail(int qna_num) {
		return session.selectOne(NAMESPACE+".detail",qna_num);
	}
	public int insert(HashMap<String, Object> map) {
		return session.insert(NAMESPACE+".insert",map);
	}
}
