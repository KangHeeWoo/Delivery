package com.jhta.delivery.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.MembersDao;
import com.jhta.delivery.vo.EventListVo;
import com.jhta.delivery.vo.MembersVo;



@Service
public class MembersService {
	@Autowired private MembersDao dao;
	
	public int insert(MembersVo vo) {
		return dao.insert(vo);
	}
	public int emailcheck(String mem_email) {
		MembersVo vo=dao.emailcheck(mem_email);
		if(vo!=null) return 1;
		else return -1; 
	}
	public int nickcheck(String mem_nick) {
		MembersVo vo=dao.nickcheck(mem_nick);
		if(vo!=null) return 1;
		else return -1; 
	}
	public int logincheck(HashMap<String, String> map) {
		MembersVo vo=dao.logincheck(map);
		if(vo!=null) return 1;
		else return -1; 
	}
	
	public MembersVo getinfo(String mem_email) {
		return dao.emailcheck(mem_email);
	}
	public MembersVo mem_num(String mem_email) {
		return dao.mem_num(mem_email);
	}
	public int getCount() {
		return dao.getCount();
	}
	public List<MembersVo> list(HashMap<String, Object> map) {
		return dao.list(map);
	}
	public int getCounts(HashMap<String, Object> map1) {
		return dao.getCounts(map1);
	}
	public List<MembersVo> searchList(HashMap<String, Object> map){
		return dao.searchList(map);
	}
	public MembersVo memPoint(int mem_num) {
		return dao.memPoint(mem_num);
	}
	public MembersVo searchMemNum(int num) {
		return dao.searchMemNum(num);
	}
	public List<EventListVo> memElist(HashMap<String, Object> map){
		return dao.memElist(map);
	}
	public int memEcount(int mem_num) {
		return dao.memEcount(mem_num);
	}
	public int eventMem(HashMap<String, Object> map) {
		return dao.eventMem(map);
	}
	public int Password(HashMap<String, Object> map) {
		return dao.Password(map);
	}
	public int memUpdate(MembersVo vo) {
		return dao.memUpdate(vo);
	}
	public int memGra(HashMap<String, Object> map) {
		return dao.memGra(map);
	}
	public int pwdUpdate(HashMap<String, Object> map) {
		return dao.pwdUpdate(map);
	}
	
	
	////////////sns/////////////////
	
	public int snsInsert(String mem_email) {
		return dao.snsInsert(mem_email);
	}
	public int graUp(HashMap<String, Object> map) {
		return dao.graUp(map);
		
	}
}
