package com.jhta.delivery.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.PeventDao;

@Service
public class PeventService {
	@Autowired private PeventDao dao;
	public int update(int grade, String gra_name) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("grade", grade);
		map.put("gra_name", gra_name);
		int n=dao.update(map);
		return n;
	}
	public int getinfo(String gra_name) {
		return dao.getinfo(gra_name);
	}
}
