package com.jhta.delivery.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.NoticeDao;
import com.jhta.delivery.vo.NoticeVo;

@Service
public class NoticeService {
	@Autowired private NoticeDao dao;
	
	public int insert(NoticeVo vo) {
		return dao.insert(vo);
	}
	
	public int update(NoticeVo vo) {
		return dao.update(vo);
	}
	
	public int delete(int num) {
		return dao.delete(num);
	}
	
	public int getCount() {
		return dao.getCount();
	}
	
	public List<NoticeVo> getList(HashMap<String, Object> map){
		return dao.getList(map);
	}
	
	public NoticeVo getDetail(int num) {
		return dao.getDetail(num);
	}
	
	public int addHit(int num) {
		return dao.addHit(num);
	}
	
	public NoticeVo prev(int num) {
		return dao.prev(num);
	}
	
	public NoticeVo next(int num) {
		return dao.next(num);
	}
}
