package com.jhta.delivery.vo;

public class CouponUseVo {
	public int cou_use_num;
	public int cou_iss_num;
	public int ord_num;
	public int getCou_use_num() {
		return cou_use_num;
	}
	public void setCou_use_num(int cou_use_num) {
		this.cou_use_num = cou_use_num;
	}
	public int getCou_iss_num() {
		return cou_iss_num;
	}
	public void setCou_iss_num(int cou_iss_num) {
		this.cou_iss_num = cou_iss_num;
	}
	public int getOrd_num() {
		return ord_num;
	}
	public void setOrd_num(int ord_num) {
		this.ord_num = ord_num;
	}
	public CouponUseVo(int cou_use_num, int cou_iss_num, int ord_num) {
		super();
		this.cou_use_num = cou_use_num;
		this.cou_iss_num = cou_iss_num;
		this.ord_num = ord_num;
	}
	public CouponUseVo() {
		super();
	}
	@Override
	public String toString() {
		return "CouponUseVo [cou_use_num=" + cou_use_num + ", cou_iss_num=" + cou_iss_num + ", ord_num=" + ord_num
				+ "]";
	}
}
