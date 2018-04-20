package com.jhta.delivery.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.UsePointDao;
import com.jhta.delivery.vo.UsePointVo;


@Service
public class UsePointService {
	@Autowired private UsePointDao dao;
	
	public List<UsePointVo> usePoint(HashMap<String, Object> map){
		return dao.usePoint(map);
	}
	
}
