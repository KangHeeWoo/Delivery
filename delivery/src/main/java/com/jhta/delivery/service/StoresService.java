package com.jhta.delivery.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.StoresDao;
import com.jhta.delivery.vo.StoresVo;

@Service
public class StoresService {
	@Autowired private StoresDao dao;
	
	public List<StoresVo> myPositionList(HashMap<String, Object> map){
		return dao.myPositionList(map);
	}
	
	public int minStoNum(int sel_num) {
		return dao.minStoNum(sel_num);
	}
	
	public List<StoresVo> stoList(int sel_num){
		return dao.stoList(sel_num);
	}
}
