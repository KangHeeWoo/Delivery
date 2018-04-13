package com.jhta.delivery.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.StoresDao;
import com.jhta.delivery.vo.StoreMenuVo;
import com.jhta.delivery.vo.StoresVo;
import com.jhta.delivery.vo.StoreslistVo;

@Service
public class StoresService {
	@Autowired private StoresDao dao;
	
	public List<StoreslistVo> myPositionList(HashMap<String, Object> map){
		return dao.myPositionList(map);
	}
	
	public int minStoNum(int sel_num) {
		return dao.minStoNum(sel_num);
	}
	
	public List<StoresVo> stoList(int sel_num){
		return dao.stoList(sel_num);
	}
	public List<StoreMenuVo> storeMenu(int sto_num){
		return dao.storeMenu(sto_num);
	}
}
