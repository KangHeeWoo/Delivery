package com.jhta.delivery.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PeventDao {
		@Autowired private SqlSession sqlSession;
		private final String NAMESPACE = "com.jhta.mybatis.PeventMapper";
		
		public int update(HashMap<String, Object> map) {
			int n = sqlSession.update(NAMESPACE + ".update", map);
			return n;
		}
		public int getinfo(String gra_name) {
			return sqlSession.selectOne(NAMESPACE+".getinfo",gra_name);
		}
		public int getAdm() {
			return sqlSession.selectOne(NAMESPACE+".getAdm");
		}
		public int updateAdm(int ordFee) {
			return sqlSession.update(NAMESPACE+".updateAdm",ordFee);
		}
}
