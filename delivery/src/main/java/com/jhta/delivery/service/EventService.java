package com.jhta.delivery.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.delivery.dao.EventDao;
import com.jhta.delivery.vo.EventEntryVo;
import com.jhta.delivery.vo.EventVo;

@Service
public class EventService {
	@Autowired private EventDao dao;
	
	public List<EventVo> eventList(HashMap<String, Object> map){
		return dao.eventList(map);
	}
	
	public int getCount() {
		return dao.getCount();
	}
	
	public EventVo detailEvent(int num) {
		return dao.detailEvent(num);
	}
	
	public List<EventEntryVo> entryList(HashMap<String, Object> map){
		return dao.entryList(map);
	}
	
	public int addEvent(EventVo vo) {
		return dao.addEvent(vo);
	}
	
	public int getEntCount(int num) {
		return dao.getEntCount(num);
	}
	
	public int winProsess(HashMap<String, Object> map) {
		return dao.winProsess(map);
	}
	
	public int loseProsess(HashMap<String, Object> map) {
		return dao.loseProsess(map);
	}
}
