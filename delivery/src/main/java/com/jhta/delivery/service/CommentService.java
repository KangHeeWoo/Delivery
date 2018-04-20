package com.jhta.delivery.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.CommentDao;
import com.jhta.delivery.vo.CommentVo;

@Service
public class CommentService {
	@Autowired private CommentDao dao;
	
	public int insert(CommentVo vo) {
		return dao.insert(vo);
	}
	public int insertRe(CommentVo vo) {
		return dao.insertRe(vo);
	}
	public int updateRe(HashMap<String, Object> map) {
		return dao.updateRe(map);
	}
	public List<CommentVo> list(int boa_num){
		return dao.list(boa_num);
	}
}
