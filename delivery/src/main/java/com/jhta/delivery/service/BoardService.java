package com.jhta.delivery.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.BoardDao;

@Service
public class BoardService {
	@Autowired private BoardDao dao;
	
}
