package com.jhta.delivery.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.MembersDao;
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
}
