package com.jhta.delivery.vo;

import java.util.Date;

public class CouponIssueVo {
	private int cou_iss_num;
	private int cou_num;
	private int mem_num;
	private Date cou_start;
	private Date cou_end;
	private String cou_type;
	private String mem_email;
	private int dis_price;
	
	
	public CouponIssueVo() {}
	public CouponIssueVo(int cou_iss_num, int cou_num, int mem_num, Date cou_start, Date cou_end, String cou_type,
			String mem_email, int dis_price) {
		super();
		this.cou_iss_num = cou_iss_num;
		this.cou_num = cou_num;
		this.mem_num = mem_num;
		this.cou_start = cou_start;
		this.cou_end = cou_end;
		this.cou_type = cou_type;
		this.mem_email = mem_email;
		this.dis_price = dis_price;
	}
	public int getCou_iss_num() {
		return cou_iss_num;
	}
	public void setCou_iss_num(int cou_iss_num) {
		this.cou_iss_num = cou_iss_num;
	}
	public int getCou_num() {
		return cou_num;
	}
	public void setCou_num(int cou_num) {
		this.cou_num = cou_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
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
	public String getCou_type() {
		return cou_type;
	}
	public void setCou_type(String cou_type) {
		this.cou_type = cou_type;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public int getDis_price() {
		return dis_price;
	}
	public void setDis_price(int dis_price) {
		this.dis_price = dis_price;
	}
	@Override
	public String toString() {
		return "CouponIssueVo [cou_iss_num=" + cou_iss_num + ", cou_num=" + cou_num + ", mem_num=" + mem_num
				+ ", cou_start=" + cou_start + ", cou_end=" + cou_end + ", cou_type=" + cou_type + ", mem_email="
				+ mem_email + ", dis_price=" + dis_price + "]";
	}
	
}