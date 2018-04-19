package com.jhta.delivery.vo;

public class BoardImgVo {
	private int boa_img_num;
	private String boa_img;
	private int boa_num;
	
	public BoardImgVo () {}

	public BoardImgVo(int boa_img_num, String boa_img, int boa_num) {
		super();
		this.boa_img_num = boa_img_num;
		this.boa_img = boa_img;
		this.boa_num = boa_num;
	}

	public int getBoa_img_num() {
		return boa_img_num;
	}

	public void setBoa_img_num(int boa_img_num) {
		this.boa_img_num = boa_img_num;
	}

	public String getBoa_img() {
		return boa_img;
	}

	public void setBoa_img(String boa_img) {
		this.boa_img = boa_img;
	}

	public int getBoa_num() {
		return boa_num;
	}

	public void setBoa_num(int boa_num) {
		this.boa_num = boa_num;
	}

	@Override
	public String toString() {
		return "BoardImgVo [boa_img_num=" + boa_img_num + ", boa_img=" + boa_img + ", boa_num=" + boa_num + "]";
	}
	
	
}
