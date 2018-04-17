package com.jhta.delivery.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.BookMarkDao;
import com.jhta.delivery.vo.BookMarkVo;
import com.jhta.delivery.vo.StoresVo;

@Service
public class BookMarkService {
	@Autowired private BookMarkDao dao;
	public int insert(BookMarkVo vo) {
		return dao.insert(vo);
	}
	public int getCount(int mem_num) {
		return dao.getCount(mem_num);
	}
	public List<StoresVo> booklist(HashMap<String, Object> map){
		return dao.booklist(map);
	}
	public int numCheck(HashMap<String, Object> map) {
		BookMarkVo vo=dao.numCheck(map);
		if(vo!=null)return -1;
		return 1;
	}
	public int bookDel(HashMap<String, Object> map) {
		return dao.bookDel(map);
	}
}
