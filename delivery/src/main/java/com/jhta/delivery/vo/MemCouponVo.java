package com.jhta.delivery.vo;

import java.util.Date;

public class MemCouponVo {
	private int cou_num;
	private String cou_type;
	private int dis_price;
	private int cou_num_1;
	private int cou_iss_num;
	private int cou_num_2;
	private int mem_num;
	private Date cou_start;
	private Date cou_end;
	
	public MemCouponVo() {}
	public MemCouponVo(int cou_num, String cou_type, int dis_price, int cou_num_1, int cou_iss_num, int cou_num_2,
			int mem_num, Date cou_start, Date cou_end) {
		super();
		this.cou_num = cou_num;
		this.cou_type = cou_type;
		this.dis_price = dis_price;
		this.cou_num_1 = cou_num_1;
		this.cou_iss_num = cou_iss_num;
		this.cou_num_2 = cou_num_2;
		this.mem_num = mem_num;
		this.cou_start = cou_start;
		this.cou_end = cou_end;
	}
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
	public int getCou_num_1() {
		return cou_num_1;
	}
	public void setCou_num_1(int cou_num_1) {
		this.cou_num_1 = cou_num_1;
	}
	public int getCou_iss_num() {
		return cou_iss_num;
	}
	public void setCou_iss_num(int cou_iss_num) {
		this.cou_iss_num = cou_iss_num;
	}
	public int getCou_num_2() {
		return cou_num_2;
	}
	public void setCou_num_2(int cou_num_2) {
		this.cou_num_2 = cou_num_2;
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
	@Override
	public String toString() {
		return "MemCoupon [cou_num=" + cou_num + ", cou_type=" + cou_type + ", dis_price=" + dis_price + ", cou_num_1="
				+ cou_num_1 + ", cou_iss_num=" + cou_iss_num + ", cou_num_2=" + cou_num_2 + ", mem_num=" + mem_num
				+ ", cou_start=" + cou_start + ", cou_end=" + cou_end + "]";
	}
	
	

}
