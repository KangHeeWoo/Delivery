package com.jhta.delivery.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.MainAdsDao;
import com.jhta.delivery.vo.MainAdsSelectedVo;
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
	public int insertSelected (int main_ads_num) {
		return dao.insertSelected(main_ads_num);
	}
	public int updateSuccess() {
		return dao.updateSuccess();
	}
	public int updateFail() {
		return dao.updateFail();
	}
	public List<MainAdsVo> getInfo() {
		return dao.getInfo();
	}
	
}
