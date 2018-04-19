package com.jhta.delivery.vo;

import java.util.Date;

public class boa_comment {
	private int boa_com_num;
	private String boa_cont;
	private Date boa_regd;
	private int boa_ref;
	private int boa_lev;
	private int boa_step;
	private String boa_com_writer;
	private int boa_num;
	
	public boa_comment() {}

	public boa_comment(int boa_com_num, String boa_cont, Date boa_regd, int boa_ref, int boa_lev, int boa_step,
			String boa_com_writer, int boa_num) {
		super();
		this.boa_com_num = boa_com_num;
		this.boa_cont = boa_cont;
		this.boa_regd = boa_regd;
		this.boa_ref = boa_ref;
		this.boa_lev = boa_lev;
		this.boa_step = boa_step;
		this.boa_com_writer = boa_com_writer;
		this.boa_num = boa_num;
	}

	public int getBoa_com_num() {
		return boa_com_num;
	}

	public void setBoa_com_num(int boa_com_num) {
		this.boa_com_num = boa_com_num;
	}

	public String getBoa_cont() {
		return boa_cont;
	}

	public void setBoa_cont(String boa_cont) {
		this.boa_cont = boa_cont;
	}

	public Date getBoa_regd() {
		return boa_regd;
	}

	public void setBoa_regd(Date boa_regd) {
		this.boa_regd = boa_regd;
	}

	public int getBoa_ref() {
		return boa_ref;
	}

	public void setBoa_ref(int boa_ref) {
		this.boa_ref = boa_ref;
	}

	public int getBoa_lev() {
		return boa_lev;
	}

	public void setBoa_lev(int boa_lev) {
		this.boa_lev = boa_lev;
	}

	public int getBoa_step() {
		return boa_step;
	}

	public void setBoa_step(int boa_step) {
		this.boa_step = boa_step;
	}

	public String getBoa_com_writer() {
		return boa_com_writer;
	}

	public void setBoa_com_writer(String boa_com_writer) {
		this.boa_com_writer = boa_com_writer;
	}

	public int getBoa_num() {
		return boa_num;
	}

	public void setBoa_num(int boa_num) {
		this.boa_num = boa_num;
	}

	@Override
	public String toString() {
		return "boa_comment [boa_com_num=" + boa_com_num + ", boa_cont=" + boa_cont + ", boa_regd=" + boa_regd
				+ ", boa_ref=" + boa_ref + ", boa_lev=" + boa_lev + ", boa_step=" + boa_step + ", boa_com_writer="
				+ boa_com_writer + ", boa_num=" + boa_num + "]";
	}
	
}
