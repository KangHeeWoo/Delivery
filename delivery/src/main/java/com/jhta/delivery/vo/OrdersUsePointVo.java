package com.jhta.delivery.vo;

import java.util.Date;

public class OrdersUsePointVo {
	private int use_amount;
	private String sto_addr;
	private int ord_num;
	private Date ord_time;
	private String sto_name;
	public OrdersUsePointVo() {}
	public OrdersUsePointVo(int use_amount, String sto_addr, int ord_num, Date ord_time, String sto_name) {
		super();
		this.use_amount = use_amount;
		this.sto_addr = sto_addr;
		this.ord_num = ord_num;
		this.ord_time = ord_time;
		this.sto_name = sto_name;
	}
	public int getUse_amount() {
		return use_amount;
	}
	public void setUse_amount(int use_amount) {
		this.use_amount = use_amount;
	}
	public String getSto_addr() {
		return sto_addr;
	}
	public void setSto_addr(String sto_addr) {
		this.sto_addr = sto_addr;
	}
	public int getOrd_num() {
		return ord_num;
	}
	public void setOrd_num(int ord_num) {
		this.ord_num = ord_num;
	}
	public Date getOrd_time() {
		return ord_time;
	}
	public void setOrd_time(Date ord_time) {
		this.ord_time = ord_time;
	}
	public String getSto_name() {
		return sto_name;
	}
	public void setSto_name(String sto_name) {
		this.sto_name = sto_name;
	}
	@Override
	public String toString() {
		return "OrdersUsePointVo [use_amount=" + use_amount + ", sto_addr=" + sto_addr + ", ord_num=" + ord_num
				+ ", ord_time=" + ord_time + ", sto_name=" + sto_name + "]";
	}
	

}
