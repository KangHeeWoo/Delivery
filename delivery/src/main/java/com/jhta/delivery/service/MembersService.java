package com.jhta.delivery.service;

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
}
