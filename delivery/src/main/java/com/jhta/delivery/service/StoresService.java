package com.jhta.delivery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.StoresDao;
import com.jhta.delivery.vo.StoresVo;

@Service
public class StoresService {
	@Autowired private StoresDao dao;
	
	public List<StoresVo> myPositionList(String able_loc){
		return dao.myPositionList(able_loc);
	}
}
