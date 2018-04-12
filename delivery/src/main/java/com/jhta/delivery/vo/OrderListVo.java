package com.jhta.delivery.vo;

public class OrderListVo {
	private int ord_list_num;
	private int ord_num;
	private int mem_num;
	private String mem_name;
	private int ord_cnt;
	
	@Override
	public String toString() {
		return "OrderListVo [ord_list_num=" + ord_list_num + ", ord_num=" + ord_num + ", mem_num=" + mem_num
				+ ", mem_name=" + mem_name + ", ord_cnt=" + ord_cnt + "]";
	}
	public OrderListVo(int ord_list_num, int ord_num, int mem_num, String mem_name, int ord_cnt) {
		super();
		this.ord_list_num = ord_list_num;
		this.ord_num = ord_num;
		this.mem_num = mem_num;
		this.mem_name = mem_name;
		this.ord_cnt = ord_cnt;
	}
	public OrderListVo() {
		super();
	}
	public int getOrd_list_num() {
		return ord_list_num;
	}
	public void setOrd_list_num(int ord_list_num) {
		this.ord_list_num = ord_list_num;
	}
	public int getOrd_num() {
		return ord_num;
	}
	public void setOrd_num(int ord_num) {
		this.ord_num = ord_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public int getOrd_cnt() {
		return ord_cnt;
	}
	public void setOrd_cnt(int ord_cnt) {
		this.ord_cnt = ord_cnt;
	}
}
