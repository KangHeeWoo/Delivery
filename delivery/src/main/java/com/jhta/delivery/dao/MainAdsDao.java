package com.jhta.delivery.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.delivery.vo.MainAdsSelectedVo;
import com.jhta.delivery.vo.MainAdsVo;

@Repository
public class MainAdsDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.MainAdsMapper";
	
	public List<MainAdsVo> mainAdsEntry(HashMap<String, Object> map){
		return session.selectList(NAMESPACE + ".mainAdsEntry",map);
	}
	public List<MainAdsVo> mainAdsSelected(){
		return session.selectList(NAMESPACE + ".mainAdsSelected");
	}
	public int getCount(Date d) {
		return session.selectOne(NAMESPACE + ".getCount",d);
	}
	public int insertSelected (int main_ads_num) {
		return session.insert(NAMESPACE + ".insertSelected", main_ads_num);
	}
	public int updateSuccess() {
		return session.update(NAMESPACE + ".updateSuccess");
	}
	public int updateFail() {
		return session.update(NAMESPACE + ".updateFail");
	}
	public List<MainAdsVo> getInfo() {
		return session.selectList(NAMESPACE + ".getInfo");
	}
	
}
