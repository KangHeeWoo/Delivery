package com.jhta.delivery.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.QnaAnswerDao;
import com.jhta.delivery.vo.QnAVo;

@Service
public class QnaAnswerService {
	@Autowired private QnaAnswerDao dao;
	public List<QnAVo> list(HashMap<String, Object> map){
		return dao.list(map);
	}
	public int getCount() {
		return dao.getCount();
	}
	public QnAVo detail(int qna_num) {
		return dao.detail(qna_num);
	}
	public int insert(HashMap<String, Object> map) {
		return dao.insert(map);
	}
	public String getEmail(int qna_num) {
		return dao.getEmail(qna_num);
	}
}
