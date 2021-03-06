package com.jhta.delivery.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.TopAdsDao;
import com.jhta.delivery.vo.StoresVo;
import com.jhta.delivery.vo.TopAdsVo;

@Service
public class TopAdsService {
	@Autowired private TopAdsDao dao;
	
	public List<StoresVo> topAdsList(HashMap<String, Object> map) {
		return dao.topAdsList(map);
	}
	public List<TopAdsVo> topAdsEntry(HashMap<String, Object> map){
		return dao.topAdsEntry(map);
	}
	public int getCount(Date d) {
		return dao.getCount(d);
	}
}
