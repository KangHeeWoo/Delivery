package com.jhta.delivery.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.delivery.vo.StoresVo;
import com.jhta.delivery.vo.StoreslistVo;

@Repository
public class StoresDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.StoresMapper";
	
	public List<StoreslistVo> myPositionList(HashMap<String, Object> map){
		return session.selectList(NAMESPACE+".myPositionList", map);
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
	public int getCount() {
		return session.selectOne(NAMESPACE + ".count");
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
}
