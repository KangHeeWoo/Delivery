package com.jhta.delivery.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.ChartDao;

@Service
public class ChartService {
	@Autowired private ChartDao dao;
	public int getFee(int date) {
		return dao.getFee(date);
	}
	public int getMainFee(int date) {
		return dao.getMainfee(date);
	}
	public int getTopFee(int date) {
		return dao.getTopfee(date);
	}
}
