package com.jhta.delivery.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.BoardDao;
import com.jhta.delivery.vo.BoardImgVo;
import com.jhta.delivery.vo.BoardVo;

@Service
public class BoardService {
	@Autowired private BoardDao dao;
	
	public int insert(BoardVo vo) {
		return dao.insert(vo);
	}
	public int insertImg(BoardImgVo vo) {
		return dao.insertImg(vo);
	}
	public int getCount() {
		return dao.getCount();
	}
	public List<BoardVo> getList(HashMap<String, Object> map){
		return dao.getList(map);
	}
	public int addHit(int boa_num) {
		return dao.addHit(boa_num);
	}
	public BoardVo detail(int boa_num) {
		return dao.detail(boa_num);
	}
	public BoardVo prev(int boa_num) {
		return dao.prev(boa_num);
	}
	public BoardVo next(int boa_num) {
		return dao.next(boa_num);
	}
	public int delete(int boa_num) {
		return dao.delete(boa_num);
	}
	public int update(BoardVo vo) {
		return dao.update(vo);
	}
	public int insertNum() {
		return dao.insertNum();
	}
	public List<BoardImgVo> detailImg(int boa_num) {
		return dao.detailImg(boa_num);
	}
}
