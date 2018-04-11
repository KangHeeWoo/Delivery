package com.jhta.delivery.vo;

public class CouponVo {
	private int cou_num;
	private String cou_type;
	private int dis_price;
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
	public int getDis_price() {
		return dis_price;
	}
	public void setDis_price(int dis_price) {
		this.dis_price = dis_price;
	}
	public CouponVo(int cou_num, String cou_type, int dis_price) {
		super();
		this.cou_num = cou_num;
		this.cou_type = cou_type;
		this.dis_price = dis_price;
	}
	public CouponVo() {
		super();
	}
	@Override
	public String toString() {
		return "CouponVo [cou_num=" + cou_num + ", cou_type=" + cou_type + ", dis_price=" + dis_price + "]";
	}
}
