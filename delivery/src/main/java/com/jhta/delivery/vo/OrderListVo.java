package com.jhta.delivery.vo;

public class OrderListVo {
	private int ord_list_num;
	private int ord_num;
	private int men_num;
	private String men_name;
	private int ord_cnt;
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
	public int getMen_num() {
		return men_num;
	}
	public void setMen_num(int men_num) {
		this.men_num = men_num;
	}
	public String getMen_name() {
		return men_name;
	}
	public void setMen_name(String men_name) {
		this.men_name = men_name;
	}
	public int getOrd_cnt() {
		return ord_cnt;
	}
	public void setOrd_cnt(int ord_cnt) {
		this.ord_cnt = ord_cnt;
	}
	public OrderListVo(int ord_list_num, int ord_num, int men_num, String men_name, int ord_cnt) {
		super();
		this.ord_list_num = ord_list_num;
		this.ord_num = ord_num;
		this.men_num = men_num;
		this.men_name = men_name;
		this.ord_cnt = ord_cnt;
	}
	public OrderListVo() {
		super();
	}
	@Override
	public String toString() {
		return "OrderListVo [ord_list_num=" + ord_list_num + ", ord_num=" + ord_num + ", men_num=" + men_num
				+ ", men_name=" + men_name + ", ord_cnt=" + ord_cnt + "]";
	}
}
