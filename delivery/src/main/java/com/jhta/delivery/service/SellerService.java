package com.jhta.delivery.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.SellerDao;
import com.jhta.delivery.vo.AbleLocationVo;
import com.jhta.delivery.vo.MainAdsVo;
import com.jhta.delivery.vo.SellerVo;
import com.jhta.delivery.vo.TopAdsVo;



@Service
public class SellerService {
	@Autowired private SellerDao dao;
	
	public int emailcheck(String sel_email) {
		SellerVo vo=dao.eamilcheck(sel_email);
				
		if(vo!=null) return 1;
		else return -1; 
	}
	
	public SellerVo getSellerInfo(int num) {
		return dao.getSellerInfo(num);
	}

	public int logincheck(HashMap<String, String> map) {
		SellerVo vo=dao.logincheck(map);
		if(vo!=null) return 1;
		else return -1; 
	}
	public int insert(SellerVo vo) {
		return dao.insert(vo);
	}
	
	public SellerVo getSeller(String sel_email) {
		return dao.eamilcheck(sel_email);
	}
	public int getSel_num(String email) {
		return dao.getSel_num(email);
	}
	public List<AbleLocationVo> stLocList(int sto_num){
		return dao.stLocList(sto_num);
	}
	public int stLocInsert(AbleLocationVo vo) {
		return dao.stLocInsert(vo);
	}
	public int stLocDelete(int able_loc_num) {
		return dao.stLocDelete(able_loc_num);
	}
	public SellerVo sel_num(String sel_email) {
		return dao.sel_num(sel_email);
	}
	public SellerVo searchMemNum(int sel_num) {
		return dao.searchSelNum(sel_num);
	}
	public int Password(HashMap<String, Object> map) {
		return dao.Password(map);
	}
	public int selGra(HashMap<String, Object> map) {
		return dao.selGra(map);
	}
	public int selUpdate(SellerVo vo) {
		return dao.selUpdate(vo);
	}
	public int topAdsInsertOk(HashMap<String, Object> map) {
		return dao.topAdsInsertOk(map);
	}
	public int getTopCount(int sto_num) {
		return dao.getTopCount(sto_num);
	}
	public List<TopAdsVo> topList(HashMap<String, Object> map){
		return dao.topList(map);
	}
	public int mainAdsInsertOk(HashMap<String, Object> map) {
		return dao.mainAdsInsertOk(map);
	}
	public int getMainCount(int sto_num) {
		return dao.getMainCount(sto_num);
	}
	public List<MainAdsVo> mainList(HashMap<String, Object> map){
		return dao.mainList(map);
	}
	public int getSal(HashMap<String, Object> map1) {
		return dao.getSal(map1);
	}
}
