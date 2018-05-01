package com.jhta.delivery.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.delivery.vo.EventEntryVo;
import com.jhta.delivery.vo.EventVo;

@Repository
public class EventDao {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.EventMapper";
	
	public List<EventVo> eventList(HashMap<String, Object> map){
		return session.selectList(NAMESPACE + ".eventList", map);
	}
	
	public int getCount() {
		return session.selectOne(NAMESPACE + ".getCount");
	}
	
	public EventVo detailEvent(int num) {
		return session.selectOne(NAMESPACE + ".detailEvent", num);
	}
	
	public List<EventEntryVo> entryList(HashMap<String, Object> map){
		return session.selectList(NAMESPACE + ".entryList", map);
	}
	
	public int addEvent(EventVo vo) {
		return session.insert(NAMESPACE + ".addEvent", vo);
	}
	
	public int getEntCount(int num) {
		return session.selectOne(NAMESPACE + ".getEntCount", num);
	}
	
	public int winProsess(HashMap<String, Object> map) {
		return session.update(NAMESPACE + ".win_prosess", map);
	}
	
	public int loseProsess(HashMap<String, Object> map) {
		return session.update(NAMESPACE + ".lose_prosess", map);
	}
	public int eventEntry(HashMap<String,Object> map) {
		return session.insert(NAMESPACE+".eventEntry", map);
	}
}
