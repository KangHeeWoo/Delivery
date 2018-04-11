package com.jhta.delivery.vo;

import java.util.Date;

public class SellerVo {
//#{mem_email},#{mem_name},#{mem_pwd},#{mem_birth},#{mem_addr},#{mem_phone},sysdate,#{mem_nick}
	private int sel_num;
	private String sel_email;
	private String sel_name;
	private String sel_pwd;
	private String sel_addr;
	private String sel_phone;
	private Date sel_regd;
	private int gra_num;
	public int getSel_num() {
		return sel_num;
	}
	public void setSel_num(int sel_num) {
		this.sel_num = sel_num;
	}
	public String getSel_email() {
		return sel_email;
	}
	public void setSel_email(String sel_email) {
		this.sel_email = sel_email;
	}
	public String getSel_name() {
		return sel_name;
	}
	public void setSel_name(String sel_name) {
		this.sel_name = sel_name;
	}
	public String getSel_pwd() {
		return sel_pwd;
	}
	public void setSel_pwd(String sel_pwd) {
		this.sel_pwd = sel_pwd;
	}
	public String getSel_addr() {
		return sel_addr;
	}
	public void setSel_addr(String sel_addr) {
		this.sel_addr = sel_addr;
	}
	public String getSel_phone() {
		return sel_phone;
	}
	public void setSel_phone(String sel_phone) {
		this.sel_phone = sel_phone;
	}
	public Date getSel_regd() {
		return sel_regd;
	}
	public void setSel_regd(Date sel_regd) {
		this.sel_regd = sel_regd;
	}
	public int getGra_num() {
		return gra_num;
	}
	public void setGra_num(int gra_num) {
		this.gra_num = gra_num;
	}
	public SellerVo() {}
	public SellerVo(int sel_num, String sel_email, String sel_name, String sel_pwd, String sel_addr, String sel_phone,
			Date sel_regd, int gra_num) {
		super();
		this.sel_num = sel_num;
		this.sel_email = sel_email;
		this.sel_name = sel_name;
		this.sel_pwd = sel_pwd;
		this.sel_addr = sel_addr;
		this.sel_phone = sel_phone;
		this.sel_regd = sel_regd;
		this.gra_num = gra_num;
	}
	@Override
	public String toString() {
		return "SellerVo [sel_num=" + sel_num + ", sel_email=" + sel_email + ", sel_name=" + sel_name + ", sel_pwd="
				+ sel_pwd + ", sel_addr=" + sel_addr + ", sel_phone=" + sel_phone + ", sel_regd=" + sel_regd
				+ ", gra_num=" + gra_num + "]";
	}
	
	
}
