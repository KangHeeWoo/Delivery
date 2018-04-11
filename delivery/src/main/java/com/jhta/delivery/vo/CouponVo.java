package com.jhta.delivery.vo;

import java.util.Date;

public class CouponVo {
	private int cou_num;
	private String cou_type;
	private Date cou_start;
	private Date cou_end;
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
	public Date getCou_start() {
		return cou_start;
	}
	public void setCou_start(Date cou_start) {
		this.cou_start = cou_start;
	}
	public Date getCou_end() {
		return cou_end;
	}
	public void setCou_end(Date cou_end) {
		this.cou_end = cou_end;
	}
	public CouponVo(int cou_num, String cou_type, Date cou_start, Date cou_end) {
		super();
		this.cou_num = cou_num;
		this.cou_type = cou_type;
		this.cou_start = cou_start;
		this.cou_end = cou_end;
	}
	public CouponVo() {
		super();
	}
	@Override
	public String toString() {
		return "CouponVo [cou_num=" + cou_num + ", cou_type=" + cou_type + ", cou_start=" + cou_start + ", cou_end="
				+ cou_end + "]";
	}
}