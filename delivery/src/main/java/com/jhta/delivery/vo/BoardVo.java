package com.jhta.delivery.vo;

import java.util.Date;

public class BoardVo {
	private int boa_num;
	private String boa_title;
	private String boa_cont;
	private int boa_hit;
	private Date boa_regd;
	private String boa_writer;
	
	public BoardVo() {}

	public BoardVo(int boa_num, String boa_title, String boa_cont, int boa_hit, Date boa_regd, String boa_writer) {
		super();
		this.boa_num = boa_num;
		this.boa_title = boa_title;
		this.boa_cont = boa_cont;
		this.boa_hit = boa_hit;
		this.boa_regd = boa_regd;
		this.boa_writer = boa_writer;
	}

	public int getBoa_num() {
		return boa_num;
	}

	public void setBoa_num(int boa_num) {
		this.boa_num = boa_num;
	}

	public String getBoa_title() {
		return boa_title;
	}

	public void setBoa_title(String boa_title) {
		this.boa_title = boa_title;
	}

	public String getBoa_cont() {
		return boa_cont;
	}

	public void setBoa_cont(String boa_cont) {
		this.boa_cont = boa_cont;
	}

	public int getBoa_hit() {
		return boa_hit;
	}

	public void setBoa_hit(int boa_hit) {
		this.boa_hit = boa_hit;
	}

	public Date getBoa_regd() {
		return boa_regd;
	}

	public void setBoa_regd(Date boa_regd) {
		this.boa_regd = boa_regd;
	}

	public String getBoa_writer() {
		return boa_writer;
	}

	public void setBoa_writer(String boa_writer) {
		this.boa_writer = boa_writer;
	}

	@Override
	public String toString() {
		return "BoardVo [boa_num=" + boa_num + ", boa_title=" + boa_title + ", boa_cont=" + boa_cont + ", boa_hit="
				+ boa_hit + ", boa_regd=" + boa_regd + ", boa_writer=" + boa_writer + "]";
	}
}
