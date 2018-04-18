package com.jhta.delivery.vo;

import java.util.Date;

public class MembersGradeVo {
	private int mem_num;
	private String mem_email;
	private String mem_name;
	private String mem_pwd;
	private Date mem_birth;
	private String mem_addr;
	private String mem_phone;
	private Date mem_regd;
	private String mem_nick;
	private int gra_num;
	private String mem_sex;
	private String gra_name;
	private int gra_bene;
	
	public MembersGradeVo() {}

	public MembersGradeVo(int mem_num, String mem_email, String mem_name, String mem_pwd, Date mem_birth,
			String mem_addr, String mem_phone, Date mem_regd, String mem_nick, int gra_num, String mem_sex,
			String gra_name, int gra_bene) {
		super();
		this.mem_num = mem_num;
		this.mem_email = mem_email;
		this.mem_name = mem_name;
		this.mem_pwd = mem_pwd;
		this.mem_birth = mem_birth;
		this.mem_addr = mem_addr;
		this.mem_phone = mem_phone;
		this.mem_regd = mem_regd;
		this.mem_nick = mem_nick;
		this.gra_num = gra_num;
		this.mem_sex = mem_sex;
		this.gra_name = gra_name;
		this.gra_bene = gra_bene;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_pwd() {
		return mem_pwd;
	}

	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}

	public Date getMem_birth() {
		return mem_birth;
	}

	public void setMem_birth(Date mem_birth) {
		this.mem_birth = mem_birth;
	}

	public String getMem_addr() {
		return mem_addr;
	}

	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}

	public String getMem_phone() {
		return mem_phone;
	}

	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}

	public Date getMem_regd() {
		return mem_regd;
	}

	public void setMem_regd(Date mem_regd) {
		this.mem_regd = mem_regd;
	}

	public String getMem_nick() {
		return mem_nick;
	}

	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}

	public int getGra_num() {
		return gra_num;
	}

	public void setGra_num(int gra_num) {
		this.gra_num = gra_num;
	}

	public String getMem_sex() {
		return mem_sex;
	}

	public void setMem_sex(String mem_sex) {
		this.mem_sex = mem_sex;
	}

	public String getGra_name() {
		return gra_name;
	}

	public void setGra_name(String gra_name) {
		this.gra_name = gra_name;
	}

	public int getGra_bene() {
		return gra_bene;
	}

	public void setGra_bene(int gra_bene) {
		this.gra_bene = gra_bene;
	}

	@Override
	public String toString() {
		return "MembersGradeVo [mem_num=" + mem_num + ", mem_email=" + mem_email + ", mem_name=" + mem_name
				+ ", mem_pwd=" + mem_pwd + ", mem_birth=" + mem_birth + ", mem_addr=" + mem_addr + ", mem_phone="
				+ mem_phone + ", mem_regd=" + mem_regd + ", mem_nick=" + mem_nick + ", gra_num=" + gra_num
				+ ", mem_sex=" + mem_sex + ", gra_name=" + gra_name + ", gra_bene=" + gra_bene + "]";
	}
}
