package com.jhta.delivery.vo;

import java.util.Date;

public class EventVo {
	private int eve_num;
	private String eve_title;
	private String eve_cont;
	private String eve_img;
	private Date eve_start;
	private Date eve_end;
	private Date eve_regd;
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
	public String getEve_cont() {
		return eve_cont;
	}
	public void setEve_cont(String eve_cont) {
		this.eve_cont = eve_cont;
	}
	public String getEve_img() {
		return eve_img;
	}
	public void setEve_img(String eve_img) {
		this.eve_img = eve_img;
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
	public Date getEve_regd() {
		return eve_regd;
	}
	public void setEve_regd(Date eve_regd) {
		this.eve_regd = eve_regd;
	}
	@Override
	public String toString() {
		return "EventVo [eve_num=" + eve_num + ", eve_title=" + eve_title + ", eve_cont=" + eve_cont + ", eve_img="
				+ eve_img + ", eve_start=" + eve_start + ", eve_end=" + eve_end + ", eve_regd=" + eve_regd + "]";
	}
	public EventVo(int eve_num, String eve_title, String eve_cont, String eve_img, Date eve_start, Date eve_end,
			Date eve_regd) {
		super();
		this.eve_num = eve_num;
		this.eve_title = eve_title;
		this.eve_cont = eve_cont;
		this.eve_img = eve_img;
		this.eve_start = eve_start;
		this.eve_end = eve_end;
		this.eve_regd = eve_regd;
	}
	public EventVo() {}
}
