package com.jhta.delivery.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.delivery.vo.EventListVo;
import com.jhta.delivery.vo.MembersVo;

@Repository
public class MembersDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.MembersMapper";
	
	public int insert(MembersVo vo) {
		return session.insert(NAMESPACE+".insert", vo);
	}
	public MembersVo emailcheck(String mem_email) {
		return session.selectOne(NAMESPACE+".emailcheck", mem_email);
	}
	public MembersVo nickcheck(String mem_nick) {
		return session.selectOne(NAMESPACE+".nickcheck", mem_nick);
	}
	public MembersVo logincheck(HashMap<String, String> map) {
		return session.selectOne(NAMESPACE+".logincheck", map);
	}
	public MembersVo mem_num(String mem_email) {
		return session.selectOne(NAMESPACE+".mem_num", mem_email);
	}
	public int getCount() {
		return session.selectOne(NAMESPACE+".count");
	}
	public List<MembersVo> list(HashMap<String, Object> map) {
		return session.selectList(NAMESPACE+".list",map);
	}
	public int getCounts(HashMap<String, Object> map1) {
		return session.selectOne(NAMESPACE+".counts",map1); 
	}
	public List<MembersVo> searchList(HashMap<String, Object> map){
		return session.selectList(NAMESPACE+".searchList",map);
	}
	public MembersVo memPoint(int mem_num) {
		return session.selectOne(NAMESPACE+".memPoint",mem_num);
	}
	public MembersVo searchMemNum(int num) {
		return session.selectOne(NAMESPACE + ".searchMemNum", num);
	}
	public List<EventListVo> memElist(HashMap<String, Object> map){
		return session.selectList(NAMESPACE+".memElist", map);
	}
	public int memEcount(int mem_num) {
		return session.selectOne(NAMESPACE+".memEcount", mem_num);
	}
	public int eventMem(HashMap<String, Object> map) {
		return session.selectOne(NAMESPACE+".eventMem", map);
	}
	public int Password(HashMap<String, Object> map) {
		return session.selectOne(NAMESPACE+".Password", map);
	}
	public int memUpdate(MembersVo vo) {
		return session.update(NAMESPACE+".memUPdate", vo);
	}
	public int memGra(HashMap<String, Object> map) {
		return session.update(NAMESPACE+".MemGra", map);
	}
	public int pwdUpdate(HashMap<String, Object> map) {
		return session.update(NAMESPACE+".pwdUpdate", map);
	}
	/////////////////////////////////////// sns ///////////////////////
	
	public int snsInsert(String mem_email) {
		return session.insert(NAMESPACE+".snsInsert", mem_email);
	}
}
