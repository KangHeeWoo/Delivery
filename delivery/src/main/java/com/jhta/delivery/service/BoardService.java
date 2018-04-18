package com.jhta.delivery.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.BoardDao;
import com.jhta.delivery.vo.BoardVo;

@Service
public class BoardService {
	@Autowired private BoardDao dao;
	
	public int insert(BoardVo vo) {
		return dao.insert(vo);
	}
	public int getCount() {
		return dao.getCount();
	}
	public List<BoardVo> getList(HashMap<String, Object> map){
		return dao.getList(map);
	}
	
}
