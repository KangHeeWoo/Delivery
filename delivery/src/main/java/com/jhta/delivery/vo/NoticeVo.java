package com.jhta.delivery.vo;

import java.util.Date;

public class NoticeVo {
	private int not_num;
	private String not_title;
	private String not_cont;
	private Date not_regd;
	private int not_hit;
	public int getNot_num() {
		return not_num;
	}
	public void setNot_num(int not_num) {
		this.not_num = not_num;
	}
	public String getNot_title() {
		return not_title;
	}
	public void setNot_title(String not_title) {
		this.not_title = not_title;
	}
	public String getNot_cont() {
		return not_cont;
	}
	public void setNot_cont(String not_cont) {
		this.not_cont = not_cont;
	}
	public Date getNot_regd() {
		return not_regd;
	}
	public void setNot_regd(Date not_regd) {
		this.not_regd = not_regd;
	}
	public int getNot_hit() {
		return not_hit;
	}
	public void setNot_hit(int not_hit) {
		this.not_hit = not_hit;
	}
	public NoticeVo(int not_num, String not_title, String not_cont, Date not_regd, int not_hit) {
		super();
		this.not_num = not_num;
		this.not_title = not_title;
		this.not_cont = not_cont;
		this.not_regd = not_regd;
		this.not_hit = not_hit;
	}
	public NoticeVo() {
		super();
	}
	@Override
	public String toString() {
		return "NoticeVo [not_num=" + not_num + ", not_title=" + not_title + ", not_cont=" + not_cont + ", not_regd="
				+ not_regd + ", not_hit=" + not_hit + "]";
	}
}
