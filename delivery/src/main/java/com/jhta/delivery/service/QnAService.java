package com.jhta.delivery.service;

import java.util.List;

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
	public List<QnAVo> qnalist(int mem_num){
		return dao.qnalist(mem_num);
	}
	public QnAVo detail(int qna_num) {
		return dao.detail(qna_num);
	}
}
