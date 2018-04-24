package com.jhta.delivery.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.delivery.vo.BoardImgVo;
import com.jhta.delivery.vo.BoardVo;

@Repository
public class BoardDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.BoardMapper";
	
	public int insert(BoardVo vo) {
		return session.insert(NAMESPACE + ".insert",vo);
	}
	public int insertImg(BoardImgVo vo) {
		return session.insert(NAMESPACE + ".insertImg",vo);
	}
	public int getCount() {
		return session.selectOne(NAMESPACE + ".getCount");
	}
	public List<BoardVo> getList(HashMap<String, Object> map){
		return session.selectList(NAMESPACE + ".boardlist",map);
	}
	public int addHit(int boa_num) {
		return session.update(NAMESPACE + ".addHit",boa_num);
	}
	public BoardVo detail(int boa_num) {
		return session.selectOne(NAMESPACE + ".detail",boa_num);
	}
	public BoardVo prev(int boa_num) {
		return session.selectOne(NAMESPACE + ".prev",boa_num);
	}
	public BoardVo next(int boa_num) {
		return session.selectOne(NAMESPACE + ".next",boa_num);
	}
	public int delete(int boa_num) {
		return session.delete(NAMESPACE + ".delete",boa_num);
	}
	public int update(BoardVo vo) {
		return session.update(NAMESPACE + ".update",vo);
	}
	public int insertNum() {
		return session.selectOne(NAMESPACE + ".insertNum");
	}
	public List<BoardImgVo> detailImg(int boa_num) {
		return session.selectList(NAMESPACE + ".detailImg",boa_num);
	}
}
