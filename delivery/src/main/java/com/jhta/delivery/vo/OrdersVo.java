package com.jhta.delivery.vo;

import java.util.Date;

public class OrdersVo {
	private int ord_num;
	private Date ord_time;
	private Date ord_deli_time;
	private String ord_state;
	private int ord_price;
	private int ord_point;
	private int ord_comm;
	private int sto_num;
	private int pay_type_num;
	private int mem_num;
	private String ord_addr;
	private String pay_type_name;
	
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
	public Date getOrd_deli_time() {
		return ord_deli_time;
	}
	public void setOrd_deli_time(Date ord_deli_time) {
		this.ord_deli_time = ord_deli_time;
	}
	public String getOrd_state() {
		return ord_state;
	}
	public void setOrd_state(String ord_state) {
		this.ord_state = ord_state;
	}
	public int getOrd_price() {
		return ord_price;
	}
	public void setOrd_price(int ord_price) {
		this.ord_price = ord_price;
	}
	public int getOrd_point() {
		return ord_point;
	}
	public void setOrd_point(int ord_point) {
		this.ord_point = ord_point;
	}
	public int getOrd_comm() {
		return ord_comm;
	}
	public void setOrd_comm(int ord_comm) {
		this.ord_comm = ord_comm;
	}
	public int getSto_num() {
		return sto_num;
	}
	public void setSto_num(int sto_num) {
		this.sto_num = sto_num;
	}
	public int getPay_type_num() {
		return pay_type_num;
	}
	public void setPay_type_num(int pay_type_num) {
		this.pay_type_num = pay_type_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getOrd_addr() {
		return ord_addr;
	}
	public void setOrd_addr(String ord_addr) {
		this.ord_addr = ord_addr;
	}
	public String getPay_type_name() {
		return pay_type_name;
	}
	public void setPay_type_name(String pay_type_name) {
		this.pay_type_name = pay_type_name;
	}
	@Override
	public String toString() {
		return "OrdersVo [ord_num=" + ord_num + ", ord_time=" + ord_time + ", ord_deli_time=" + ord_deli_time
				+ ", ord_state=" + ord_state + ", ord_price=" + ord_price + ", ord_point=" + ord_point + ", ord_comm="
				+ ord_comm + ", sto_num=" + sto_num + ", pay_type_num=" + pay_type_num + ", mem_num=" + mem_num
				+ ", ord_addr=" + ord_addr + ", pay_type_name=" + pay_type_name + "]";
	}
	public OrdersVo(int ord_num, Date ord_time, Date ord_deli_time, String ord_state, int ord_price, int ord_point,
			int ord_comm, int sto_num, int pay_type_num, int mem_num, String ord_addr, String pay_type_name) {
		super();
		this.ord_num = ord_num;
		this.ord_time = ord_time;
		this.ord_deli_time = ord_deli_time;
		this.ord_state = ord_state;
		this.ord_price = ord_price;
		this.ord_point = ord_point;
		this.ord_comm = ord_comm;
		this.sto_num = sto_num;
		this.pay_type_num = pay_type_num;
		this.mem_num = mem_num;
		this.ord_addr = ord_addr;
		this.pay_type_name = pay_type_name;
	}
	public OrdersVo() {
		super();
	}
}
