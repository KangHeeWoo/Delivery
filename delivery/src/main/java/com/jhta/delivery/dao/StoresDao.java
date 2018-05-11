package com.jhta.delivery.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.delivery.vo.AbleLocationVo;
import com.jhta.delivery.vo.MenuVo;
import com.jhta.delivery.vo.StoresVo;
import com.jhta.delivery.vo.StoreslistVo;

@Repository
public class StoresDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.StoresMapper";
	
	public List<StoreslistVo> myPositionList(HashMap<String, Object> map){
		return session.selectList(NAMESPACE+".myPositionList", map);
	}
	
	public AbleLocationVo checkAbleLocation(HashMap<String, Object> map) {
		return session.selectOne(NAMESPACE + ".checkAbleLocation", map);
	}
	
	public int minStoNum(int sel_num) {
		return session.selectOne(NAMESPACE + ".minStoNum", sel_num);
	}
	
	public List<StoresVo> stoList(int sel_num){
		return session.selectList(NAMESPACE + ".stoList", sel_num);
	}
	public StoresVo stoName(int sto_num) {
		return session.selectOne(NAMESPACE+".stoName", sto_num);
	}
	public int getCount(HashMap<String, Object> map) {
		return session.selectOne(NAMESPACE + ".count",map);
	}
	public int stInsert(HashMap<String, Object> map) {
		return session.insert(NAMESPACE+".stInsert",map);
	}
	public List<StoresVo> list(int sel_num){
		return session.selectList(NAMESPACE+".stList",sel_num);
	}
	public StoresVo stDetail(int sto_num) {
		return session.selectOne(NAMESPACE+".stDetail",sto_num);
	}
	public StoresVo stDetail2(String sto_name) {
		return session.selectOne(NAMESPACE+".stDetail2",sto_name);
	}
	public int stImg(HashMap<String, Object> map1) {
		return session.insert(NAMESPACE+".stImg",map1);
	}
	public int stUpdate(HashMap<String, Object> map) {
		return session.update(NAMESPACE+".stUpdate",map);
	}
	public String getImgName(int sto_num) {
		return session.selectOne(NAMESPACE+".getImgName",sto_num);
	}
	public int imgUpdate(HashMap<String, Object> map1) {
		return session.update(NAMESPACE+".imgUpdate",map1);
	}
	public int stMenuInsert(HashMap<String, Object> map) {
		return session.insert(NAMESPACE+".stMenuInsert",map);
	}
	public List<MenuVo>stMenuList(int sto_num){
		return session.selectList(NAMESPACE+".stMenuList",sto_num);
	}
	public int stMenuUpdate(HashMap<String, Object> map) {
		return session.update(NAMESPACE+".stMenuUpdate",map);
	}
	public int stMenuDelete(String men_name) {
		return session.delete(NAMESPACE+".stMenuDelete",men_name);
	}
	public String stRegnumCheck(String sto_regnum) {
		return session.selectOne(NAMESPACE+".stRegnumCheck",sto_regnum);
	}
	public List<StoresVo> adstAdd() {
		return session.selectList(NAMESPACE+".adstAdd");
	}
	public int stEnable(int sto_num) {
		return session.update(NAMESPACE+".stEnable",sto_num);
	}
	public int stDisable(int sto_num) {
		return session.update(NAMESPACE+".stDisable",sto_num);
	}
	public int stDelete(int sto_num) {
		return session.update(NAMESPACE+".stDelete",sto_num);
	}
	public List<StoresVo> adstDel() {
		return session.selectList(NAMESPACE+".adstDel");
	}
	public int adstDelOk(int sto_num) {
		return session.update(NAMESPACE+".adstDelOk",sto_num);
	}
	public int adstListCnt() {
		return session.selectOne(NAMESPACE+".adstListCnt");
	}
	public List<StoresVo> adstList(HashMap<String, Object> map) {
		return session.selectList(NAMESPACE+".adstList",map);
	}
	public int adstListCnts(HashMap<String, Object> map1) {
		return session.selectOne(NAMESPACE+".adstListCnts",map1);
	}
	public List<StoresVo> adstSearchList(HashMap<String, Object> map){
		return session.selectList(NAMESPACE+".adstSearchList",map);
	}
	public int Sungjoon(int sto_num) {
		return session.selectOne(NAMESPACE+".Sungjoon",sto_num);
	}
}
