package com.jhta.delivery.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.StoresDao;
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
	public StoresVo stDetail2(String sto_name) {
		return dao.stDetail2(sto_name);
	}
	public int stImg(HashMap<String, Object> map1) {
		return dao.stImg(map1);
	}
	public int stUpdate(HashMap<String, Object> map) {
		return dao.stUpdate(map);
	}
	public String getImgName(int sto_num) {
		return dao.getImgName(sto_num);
	}
	public int imgUpdate(HashMap<String, Object> map1) {
		return dao.imgUpdate(map1);
	}
}
