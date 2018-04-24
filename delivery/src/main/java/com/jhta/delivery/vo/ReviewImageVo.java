package com.jhta.delivery.vo;

public class ReviewImageVo {
	private int rev_img_num;
	private String rev_img;
	private int rev_num;
	public ReviewImageVo(int rev_img_num, String rev_img, int rev_num) {
		super();
		this.rev_img_num = rev_img_num;
		this.rev_img = rev_img;
		this.rev_num = rev_num;
	}
	public ReviewImageVo() {
		super();
	}
	@Override
	public String toString() {
		return "ReviewImageVo [rev_img_num=" + rev_img_num + ", rev_img=" + rev_img + ", rev_num=" + rev_num + "]";
	}
	public int getRev_img_num() {
		return rev_img_num;
	}
	public void setRev_img_num(int rev_img_num) {
		this.rev_img_num = rev_img_num;
	}
	public String getRev_img() {
		return rev_img;
	}
	public void setRev_img(String rev_img) {
		this.rev_img = rev_img;
	}
	public int getRev_num() {
		return rev_num;
	}
	public void setRev_num(int rev_num) {
		this.rev_num = rev_num;
	}
}
