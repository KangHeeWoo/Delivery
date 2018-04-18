package com.jhta.delivery.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.delivery.vo.BoardVo;

@Repository
public class BoardDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.BoardMapper";
	
	public int insert(BoardVo vo) {
		return session.insert(NAMESPACE + ".insert",vo);
	}
	public int getCount() {
		return session.selectOne(NAMESPACE + ".getCount");
	}
	public List<BoardVo> getList(HashMap<String, Object> map){
		return session.selectList(NAMESPACE + ".boardlist",map);
	}
}
