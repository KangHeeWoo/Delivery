package com.jhta.delivery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.MenuDao;

import com.jhta.delivery.vo.MenuVo;



@Service
public class MenuService {
	@Autowired private MenuDao dao;
	
	public List<MenuVo> menulist(int sto_num){
		return dao.menulist(sto_num);
	}
}
