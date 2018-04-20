package com.jhta.delivery.vo;

import java.util.Date;

public class ReviewVo {
	private int rev_num;
	private String rev_title;
	private String rev_cont;
	private int rev_hit;
	private Date rev_regd;
	private int rev_sco;
	private int ord_num;
	
	private ReviewCommentVo reviewComment;

	public int getRev_num() {
		return rev_num;
	}

	public void setRev_num(int rev_num) {
		this.rev_num = rev_num;
	}

	public String getRev_title() {
		return rev_title;
	}

	public void setRev_title(String rev_title) {
		this.rev_title = rev_title;
	}

	public String getRev_cont() {
		return rev_cont;
	}

	public void setRev_cont(String rev_cont) {
		this.rev_cont = rev_cont;
	}

	public int getRev_hit() {
		return rev_hit;
	}

	public void setRev_hit(int rev_hit) {
		this.rev_hit = rev_hit;
	}

	public Date getRev_regd() {
		return rev_regd;
	}

	public void setRev_regd(Date rev_regd) {
		this.rev_regd = rev_regd;
	}

	public int getRev_sco() {
		return rev_sco;
	}

	public void setRev_sco(int rev_sco) {
		this.rev_sco = rev_sco;
	}

	public int getOrd_num() {
		return ord_num;
	}

	public void setOrd_num(int ord_num) {
		this.ord_num = ord_num;
	}

	public ReviewCommentVo getReviewComment() {
		return reviewComment;
	}

	public void setReviewComment(ReviewCommentVo reviewComment) {
		this.reviewComment = reviewComment;
	}

	@Override
	public String toString() {
		return "ReviewVo [rev_num=" + rev_num + ", rev_title=" + rev_title + ", rev_cont=" + rev_cont + ", rev_hit="
				+ rev_hit + ", rev_regd=" + rev_regd + ", rev_sco=" + rev_sco + ", ord_num=" + ord_num
				+ ", reviewComment=" + reviewComment + "]";
	}

	public ReviewVo(int rev_num, String rev_title, String rev_cont, int rev_hit, Date rev_regd, int rev_sco,
			int ord_num, ReviewCommentVo reviewComment) {
		super();
		this.rev_num = rev_num;
		this.rev_title = rev_title;
		this.rev_cont = rev_cont;
		this.rev_hit = rev_hit;
		this.rev_regd = rev_regd;
		this.rev_sco = rev_sco;
		this.ord_num = ord_num;
		this.reviewComment = reviewComment;
	}
	public ReviewVo() {
		super();
	}
}
