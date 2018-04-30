package com.jhta.delivery.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.ReviewDao;
import com.jhta.delivery.vo.OrdersVo;
import com.jhta.delivery.vo.ReviewCommentVo;
import com.jhta.delivery.vo.ReviewImageVo;
import com.jhta.delivery.vo.ReviewVo;

@Service
public class ReviewService {
	@Autowired private ReviewDao dao;
	
	public int insertReview(ReviewVo vo) {
		return dao.insertReview(vo);
	}
	
	public int insertComment(ReviewCommentVo vo) {
		return dao.insertComment(vo);
	}
	
	public int deleteReview(int num) {
		return dao.deleteReview(num);
	}
	
	public int getCount(HashMap<String, Object> map) {
		return dao.getCount(map);
	}
	
	public List<ReviewVo> getList(HashMap<String, Object> map){
		return dao.getList(map);
	}
	
	public OrdersVo getOrder(HashMap<String, Object> map) {
		return dao.getOrder(map);
	}
	
	public int getMaxNum() {
		return dao.getMaxNum();
	}
	
	public int insertImage(ReviewImageVo vo) {
		return dao.insertImage(vo);
	}
}
