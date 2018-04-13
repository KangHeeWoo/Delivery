package com.jhta.delivery.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.delivery.vo.MenuVo;

@Repository
public class MenuDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.MenuMapper";
	public List<MenuVo> menulist(int sto_num) {
		return session.selectList(NAMESPACE+".menulist", sto_num);
	}

	
}
