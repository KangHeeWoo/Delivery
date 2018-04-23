package com.jhta.delivery.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.ReviewDao;
import com.jhta.delivery.vo.ReviewCommentVo;
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
	
	public int getCount(int num) {
		return dao.getCount(num);
	}
	
	public List<ReviewVo> getList(HashMap<String, Object> map){
		return dao.getList(map);
	}
	
	public ReviewVo getReview(int num) {
		return dao.getReview(num);
	}
}
