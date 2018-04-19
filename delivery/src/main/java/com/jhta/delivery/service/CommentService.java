package com.jhta.delivery.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.CommentDao;

@Service
public class CommentService {
	@Autowired private CommentDao dao;
	
}
