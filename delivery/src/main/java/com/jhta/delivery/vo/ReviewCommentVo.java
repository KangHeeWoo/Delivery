package com.jhta.delivery.vo;

import java.util.Date;

public class ReviewCommentVo {
	private int rev_com_num;
	private String rev_com_cont;
	private Date rev_com_regd;
	private int rev_num;
	public int getRev_com_num() {
		return rev_com_num;
	}
	public void setRev_com_num(int rev_com_num) {
		this.rev_com_num = rev_com_num;
	}
	public String getRev_com_cont() {
		return rev_com_cont;
	}
	public void setRev_com_cont(String rev_com_cont) {
		this.rev_com_cont = rev_com_cont;
	}
	public Date getRev_com_regd() {
		return rev_com_regd;
	}
	public void setRev_com_regd(Date rev_com_regd) {
		this.rev_com_regd = rev_com_regd;
	}
	public int getRev_num() {
		return rev_num;
	}
	public void setRev_num(int rev_num) {
		this.rev_num = rev_num;
	}
	@Override
	public String toString() {
		return "ReviewCommentVo [rev_com_num=" + rev_com_num + ", rev_com_cont=" + rev_com_cont + ", rev_com_regd="
				+ rev_com_regd + ", rev_num=" + rev_num + "]";
	}
	public ReviewCommentVo(int rev_com_num, String rev_com_cont, Date rev_com_regd, int rev_num) {
		super();
		this.rev_com_num = rev_com_num;
		this.rev_com_cont = rev_com_cont;
		this.rev_com_regd = rev_com_regd;
		this.rev_num = rev_num;
	}
	public ReviewCommentVo() {
		super();
	}
}
