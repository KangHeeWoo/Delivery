package com.jhta.delivery.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.delivery.vo.AbleLocationVo;
import com.jhta.delivery.vo.SellerVo;

@Repository
public class SellerDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.SellerMapper";
	
	public SellerVo eamilcheck(String sel_email) {
		//System.out.println(sel_email);
		return session.selectOne(NAMESPACE+".emailcheck", sel_email);
	}
	public SellerVo logincheck(HashMap<String, String> map) {
		return session.selectOne(NAMESPACE+".logincheck",map);
	}
	
	public SellerVo getSellerInfo(int num) {
		return session.selectOne(NAMESPACE + ".getSellerInfo", num);
	}

	public int insert(SellerVo vo) {
		return session.insert(NAMESPACE+".insert", vo);
	}
	public int getSel_num(String email) {
		return session.selectOne(NAMESPACE+".getSel_num",email);
	}
	public List<AbleLocationVo> stLocList(int sto_num){
		return session.selectList(NAMESPACE+".stLocList",sto_num);
	}
	public int stLocInsert(AbleLocationVo vo){
		return session.insert(NAMESPACE+".stLocInsert",vo);
	}
	public int stLocDelete(int able_loc_num) {
		return session.delete(NAMESPACE+".stLocDelete",able_loc_num);
	}
	public SellerVo sel_num(String sel_email) {
		return session.selectOne(NAMESPACE+".sel_num", sel_email);
	}
	public SellerVo searchSelNum(int sel_num) {
		return session.selectOne(NAMESPACE + ".searchSelNum", sel_num);
	}
	public int Password(HashMap<String, Object> map) {
		return session.selectOne(NAMESPACE+".Password", map);
	}
	public int selGra(HashMap<String, Object> map) {
		return session.update(NAMESPACE+".SelGra", map);
	}
	public int selUpdate(SellerVo vo) {
		return session.update(NAMESPACE+".selUPdate", vo);
	}
}
