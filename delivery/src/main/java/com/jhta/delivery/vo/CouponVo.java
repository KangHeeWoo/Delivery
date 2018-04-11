package com.jhta.delivery.vo;

public class CouponVo {
	private int cou_num;
	private String cou_type;
	public int getCou_num() {
		return cou_num;
	}
	public void setCou_num(int cou_num) {
		this.cou_num = cou_num;
	}
	public String getCou_type() {
		return cou_type;
	}
	public void setCou_type(String cou_type) {
		this.cou_type = cou_type;
	}
	public CouponVo(int cou_num, String cou_type) {
		super();
		this.cou_num = cou_num;
		this.cou_type = cou_type;
	}
	public CouponVo() {}
	@Override
	public String toString() {
		return "CouponVo [cou_num=" + cou_num + ", cou_type=" + cou_type + "]";
	}
}
