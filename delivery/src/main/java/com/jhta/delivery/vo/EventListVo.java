package com.jhta.delivery.vo;

import java.util.Date;

public class EventListVo {
	private int eve_num;
	private String eve_title;
	private Date eve_start;
	private Date eve_end;
	private String eve_win;
	public EventListVo() {}
	public EventListVo(int eve_num, String eve_title, Date eve_start, Date eve_end, String eve_win) {
		super();
		this.eve_num = eve_num;
		this.eve_title = eve_title;
		this.eve_start = eve_start;
		this.eve_end = eve_end;
		this.eve_win = eve_win;
	}
	public int getEve_num() {
		return eve_num;
	}
	public void setEve_num(int eve_num) {
		this.eve_num = eve_num;
	}
	public String getEve_title() {
		return eve_title;
	}
	public void setEve_title(String eve_title) {
		this.eve_title = eve_title;
	}
	public Date getEve_start() {
		return eve_start;
	}
	public void setEve_start(Date eve_start) {
		this.eve_start = eve_start;
	}
	public Date getEve_end() {
		return eve_end;
	}
	public void setEve_end(Date eve_end) {
		this.eve_end = eve_end;
	}
	public String getEve_win() {
		return eve_win;
	}
	public void setEve_win(String eve_win) {
		this.eve_win = eve_win;
	}
	@Override
	public String toString() {
		return "EventListVo [eve_num=" + eve_num + ", eve_title=" + eve_title + ", eve_start=" + eve_start
				+ ", eve_end=" + eve_end + ", eve_win=" + eve_win + "]";
	}
	
}
