package com.jhta.delivery.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.StoresDao;
import com.jhta.delivery.vo.MembersVo;
import com.jhta.delivery.vo.MenuVo;
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
	public StoresVo stoName(int sto_num) {
		return dao.stoName(sto_num);
	}
	public int getCount() {
		return dao.getCount();
	}
	public int stInsert(HashMap<String, Object> map) {
		return dao.stInsert(map);
	}
	public List<StoresVo> list(int sel_num){
		return dao.list(sel_num);
	}
	public StoresVo stDetail(int sto_num) {
		return dao.stDetail(sto_num);
	}
}
