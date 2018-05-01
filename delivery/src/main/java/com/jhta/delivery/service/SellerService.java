package com.jhta.delivery.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.MembersDao;
import com.jhta.delivery.dao.SellerDao;
import com.jhta.delivery.vo.MembersVo;
import com.jhta.delivery.vo.SellerVo;



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
}
