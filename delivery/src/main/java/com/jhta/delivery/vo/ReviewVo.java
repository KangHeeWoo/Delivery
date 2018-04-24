package com.jhta.delivery.vo;

import java.util.Date;
import java.util.List;

public class ReviewVo {
	private int rev_num;
	private String rev_title;
	private String rev_cont;
	private int rev_hit;
	private Date rev_regd;
	private int rev_sco;
	private int ord_num;
	private int mem_num;
	private String mem_nick;
	
	private ReviewCommentVo reviewComment;
	private List<ReviewImageVo> reviewImage;
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
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	public ReviewCommentVo getReviewComment() {
		return reviewComment;
	}
	public void setReviewComment(ReviewCommentVo reviewComment) {
		this.reviewComment = reviewComment;
	}
	public List<ReviewImageVo> getReviewImage() {
		return reviewImage;
	}
	public void setReviewImage(List<ReviewImageVo> reviewImage) {
		this.reviewImage = reviewImage;
	}
	@Override
	public String toString() {
		return "ReviewVo [rev_num=" + rev_num + ", rev_title=" + rev_title + ", rev_cont=" + rev_cont + ", rev_hit="
				+ rev_hit + ", rev_regd=" + rev_regd + ", rev_sco=" + rev_sco + ", ord_num=" + ord_num + ", mem_num="
				+ mem_num + ", mem_nick=" + mem_nick + ", reviewComment=" + reviewComment + ", reviewImage="
				+ reviewImage + "]";
	}
	public ReviewVo(int rev_num, String rev_title, String rev_cont, int rev_hit, Date rev_regd, int rev_sco,
			int ord_num, int mem_num, String mem_nick, ReviewCommentVo reviewComment, List<ReviewImageVo> reviewImage) {
		super();
		this.rev_num = rev_num;
		this.rev_title = rev_title;
		this.rev_cont = rev_cont;
		this.rev_hit = rev_hit;
		this.rev_regd = rev_regd;
		this.rev_sco = rev_sco;
		this.ord_num = ord_num;
		this.mem_num = mem_num;
		this.mem_nick = mem_nick;
		this.reviewComment = reviewComment;
		this.reviewImage = reviewImage;
	}
	public ReviewVo() {
		super();
	}
}
