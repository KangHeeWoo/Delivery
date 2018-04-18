package com.jhta.delivery.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.delivery.vo.NoticeVo;

@Repository
public class NoticeDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.NoticeMapper";
	
	public int insert(NoticeVo vo) {
		return session.insert(NAMESPACE + ".insert", vo);
	}
	
	public int update(NoticeVo vo) {
		return session.update(NAMESPACE + ".update", vo);
	}
	
	public int delete(int num) {
		return session.delete(NAMESPACE + ".delete", num);
	}
	
	public int getCount() {
		return session.selectOne(NAMESPACE + ".getCount");
	}
	
	public List<NoticeVo> getList(HashMap<String, Object> map){
		return session.selectList(NAMESPACE + ".getList", map);
	}
	
	public NoticeVo getDetail(int num) {
		return session.selectOne(NAMESPACE + ".getDetail", num);
	}
	
	public int addHit(int num) {
		return session.update(NAMESPACE + ".addHit", num);
	}
	
	public NoticeVo prev(int num) {
		return session.selectOne(NAMESPACE + ".prev", num);
	}
	
	public NoticeVo next(int num) {
		return session.selectOne(NAMESPACE + ".next", num);
	}
}
