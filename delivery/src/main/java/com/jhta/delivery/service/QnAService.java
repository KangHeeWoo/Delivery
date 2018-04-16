package com.jhta.delivery.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.QnADao;
import com.jhta.delivery.vo.QnAVo;

@Service
public class QnAService {
	@Autowired private QnADao dao;
	
	public int insert(QnAVo vo) {
		return dao.insert(vo);
	}
}
