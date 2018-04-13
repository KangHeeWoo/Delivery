package com.jhta.delivery.vo;

import java.util.Date;

public class StoreslistVo {
	private int sto_num;
	private String sto_name;
	private String sto_regnum;
	private String sto_addr;
	private String sto_phone;
	private Date sto_regd;
	private Date sto_open;
	private Date sto_close;
	private String sto_holiday;
	private String sto_intro;
	private String sto_state;
	private int sel_num;
	private int cat_num;
	private String sto_img;
	
	public StoreslistVo () {}

	public StoreslistVo(int sto_num, String sto_name, String sto_regnum, String sto_addr, String sto_phone,
			Date sto_regd, Date sto_open, Date sto_close, String sto_holiday, String sto_intro, String sto_state,
			int sel_num, int cat_num, String sto_img) {
		super();
		this.sto_num = sto_num;
		this.sto_name = sto_name;
		this.sto_regnum = sto_regnum;
		this.sto_addr = sto_addr;
		this.sto_phone = sto_phone;
		this.sto_regd = sto_regd;
		this.sto_open = sto_open;
		this.sto_close = sto_close;
		this.sto_holiday = sto_holiday;
		this.sto_intro = sto_intro;
		this.sto_state = sto_state;
		this.sel_num = sel_num;
		this.cat_num = cat_num;
		this.sto_img = sto_img;
	}

	public int getSto_num() {
		return sto_num;
	}

	public void setSto_num(int sto_num) {
		this.sto_num = sto_num;
	}

	public String getSto_name() {
		return sto_name;
	}

	public void setSto_name(String sto_name) {
		this.sto_name = sto_name;
	}

	public String getSto_regnum() {
		return sto_regnum;
	}

	public void setSto_regnum(String sto_regnum) {
		this.sto_regnum = sto_regnum;
	}

	public String getSto_addr() {
		return sto_addr;
	}

	public void setSto_addr(String sto_addr) {
		this.sto_addr = sto_addr;
	}

	public String getSto_phone() {
		return sto_phone;
	}

	public void setSto_phone(String sto_phone) {
		this.sto_phone = sto_phone;
	}

	public Date getSto_regd() {
		return sto_regd;
	}

	public void setSto_regd(Date sto_regd) {
		this.sto_regd = sto_regd;
	}

	public Date getSto_open() {
		return sto_open;
	}

	public void setSto_open(Date sto_open) {
		this.sto_open = sto_open;
	}

	public Date getSto_close() {
		return sto_close;
	}

	public void setSto_close(Date sto_close) {
		this.sto_close = sto_close;
	}

	public String getSto_holiday() {
		return sto_holiday;
	}

	public void setSto_holiday(String sto_holiday) {
		this.sto_holiday = sto_holiday;
	}

	public String getSto_intro() {
		return sto_intro;
	}

	public void setSto_intro(String sto_intro) {
		this.sto_intro = sto_intro;
	}

	public String getSto_state() {
		return sto_state;
	}

	public void setSto_state(String sto_state) {
		this.sto_state = sto_state;
	}

	public int getSel_num() {
		return sel_num;
	}

	public void setSel_num(int sel_num) {
		this.sel_num = sel_num;
	}

	public int getCat_num() {
		return cat_num;
	}

	public void setCat_num(int cat_num) {
		this.cat_num = cat_num;
	}

	public String getSto_img() {
		return sto_img;
	}

	public void setSto_img(String sto_img) {
		this.sto_img = sto_img;
	}
}
