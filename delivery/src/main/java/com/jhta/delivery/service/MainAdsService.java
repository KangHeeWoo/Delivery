package com.jhta.delivery.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.MainAdsDao;
import com.jhta.delivery.vo.MainAdsVo;

@Service
public class MainAdsService {
	@Autowired private MainAdsDao dao;
	
	public List<MainAdsVo> mainAdsEntry(HashMap<String, Object> map){
		return dao.mainAdsEntry(map);
	}
	public List<MainAdsVo> mainAdsSelected(){
		return dao.mainAdsSelected();
	}
	public int getCount(Date d) {
		return dao.getCount(d);
	}

}
