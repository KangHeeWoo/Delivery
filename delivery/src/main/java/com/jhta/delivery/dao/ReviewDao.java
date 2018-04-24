package com.jhta.delivery.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.delivery.vo.OrdersVo;
import com.jhta.delivery.vo.ReviewCommentVo;
import com.jhta.delivery.vo.ReviewImageVo;
import com.jhta.delivery.vo.ReviewVo;

@Repository
public class ReviewDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.ReviewMapper";
	
	public int insertReview(ReviewVo vo) {
		return session.insert(NAMESPACE + ".insertReview", vo);
	}
	
	public int insertComment(ReviewCommentVo vo) {
		return session.insert(NAMESPACE + ".insertComment", vo);
	}
	
	public int deleteReview(int num) {
		return session.delete(NAMESPACE + ".delete", num);
	}
	
	public int getCount(int num) {
		return session.selectOne(NAMESPACE + ".getCount", num);
	}
	
	public List<ReviewVo> getList(HashMap<String, Object> map){
		return session.selectList(NAMESPACE + ".getList", map);
	}
	
	public OrdersVo getOrder(HashMap<String, Object> map) {
		return session.selectOne(NAMESPACE + ".getOrder", map);
	}
	
	public int getMaxNum() {
		return session.selectOne(NAMESPACE + ".getMaxNum");
	}
	
	public int insertImage(ReviewImageVo vo) {
		return session.insert(NAMESPACE + ".insertImage", vo);
	}
}
