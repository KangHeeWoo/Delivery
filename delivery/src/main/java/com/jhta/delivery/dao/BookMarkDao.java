package com.jhta.delivery.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.delivery.vo.BookMarkVo;
import com.jhta.delivery.vo.MenuVo;
import com.jhta.delivery.vo.StoresVo;

@Repository
public class BookMarkDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.BookMarkMapper";
	
	public int insert(BookMarkVo vo ) {
		return session.insert(NAMESPACE+".insert", vo);
	}
	public int getCount(int mem_num) {
		return session.selectOne(NAMESPACE+".count", mem_num);
	}
	public List<StoresVo> booklist(HashMap<String, Object> map) {
		return session.selectList(NAMESPACE+".booklist", map);
	}
	public BookMarkVo numCheck(HashMap<String, Object> map) {
		return session.selectOne(NAMESPACE+".numCheck", map);
	}
	

	
}
