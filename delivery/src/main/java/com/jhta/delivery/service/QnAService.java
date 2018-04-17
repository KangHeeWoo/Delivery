package com.jhta.delivery.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.QnADao;
import com.jhta.delivery.vo.AnswerVo;
import com.jhta.delivery.vo.QnAVo;

@Service
public class QnAService {
	@Autowired private QnADao dao;
	
	public int insert(QnAVo vo) {
		return dao.insert(vo);
	}
	public List<QnAVo> qnalist(HashMap<String, Object> map){
		return dao.qnalist(map);
	}
	public QnAVo detail(int qna_num) {
		return dao.detail(qna_num);
	}
	public AnswerVo adetail(int qna_ans_num) {
		return dao.adetail(qna_ans_num);
	}
	public int getCount() {
		return dao.getCount();
	}
	public int delete(int qna_num) {
		return dao.delete(qna_num);
	}
}
