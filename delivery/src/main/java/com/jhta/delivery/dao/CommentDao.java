package com.jhta.delivery.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.delivery.vo.CommentVo;

@Repository
public class CommentDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.CommentMapper";
	
	public int insert(CommentVo vo) {
		return session.insert(NAMESPACE + ".insert",vo);
	}
	public int insertRe(CommentVo vo) {
		return session.insert(NAMESPACE + ".insertRe",vo);
	}
	public int updateRe(HashMap<String, Object> map) {
		return session.update(NAMESPACE + ".updateRe",map);
	}
	public List<CommentVo> list(int boa_num){
		return session.selectList(NAMESPACE + ".list",boa_num);
	}
}
