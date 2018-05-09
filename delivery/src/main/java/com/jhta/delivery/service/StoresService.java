package com.jhta.delivery.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.StoresDao;
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
	public int getCount(HashMap<String, Object> map) {
		return dao.getCount(map);
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
	public int stMenuInsert(HashMap<String, Object> map) {
		return dao.stMenuInsert(map);
	}
	public List<MenuVo> stMenuList(int sto_num){
		return dao.stMenuList(sto_num);
	}
	public int stMenuUpdate(HashMap<String, Object> map) {
		return dao.stMenuUpdate(map);
	}
	public int stMenuDelete(String men_name) {
		return dao.stMenuDelete(men_name);
	}
	public String stRegnumCheck(String sto_regnum) {
		return dao.stRegnumCheck(sto_regnum);
	}
	public List<StoresVo> adstAdd() {
		return dao.adstAdd();
	}
	public int stEnable(int sto_num) {
		return dao.stEnable(sto_num);
	}
	public int stDisable(int sto_num) {
		return dao.stDisable(sto_num);
	}
	public int stDelete(int sto_num) {
		return dao.stDelete(sto_num);
	}
	public List<StoresVo> adstDel() {
		return dao.adstDel();
	}
	public int adstDelOk(int sto_num) {
		return dao.adstDelOk(sto_num);
	}
	public int adstListCnt() {
		return dao.adstListCnt();
	}
	public List<StoresVo> adstList(HashMap<String, Object> map){
		return dao.adstList(map);
	}
	public int adstListCnts(HashMap<String, Object> map1) {
		return dao.adstListCnts(map1);
	}
	public List<StoresVo> adstSearchList(HashMap<String, Object> map){
		return dao.adstSearchList(map);
	}
	public int Sungjoon(int sto_num) {
		return dao.Sungjoon(sto_num);
	}
}
