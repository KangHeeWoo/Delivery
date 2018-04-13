package com.jhta.delivery.vo;

public class MenuVo {
	private int men_num;
	private String men_name;
	private int men_price;
	private String men_state;
	private int sto_num;
	public MenuVo() {}
	public MenuVo(int men_num, String men_name, int men_price, String men_state, int sto_num) {
		super();
		this.men_num = men_num;
		this.men_name = men_name;
		this.men_price = men_price;
		this.men_state = men_state;
		this.sto_num = sto_num;
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
	public int getMen_price() {
		return men_price;
	}
	public void setMen_price(int men_price) {
		this.men_price = men_price;
	}
	public String getMen_state() {
		return men_state;
	}
	public void setMen_state(String men_state) {
		this.men_state = men_state;
	}
	public int getSto_num() {
		return sto_num;
	}
	public void setSto_num(int sto_num) {
		this.sto_num = sto_num;
	}
	@Override
	public String toString() {
		return "MenuVo [men_num=" + men_num + ", men_name=" + men_name + ", men_price=" + men_price + ", men_state="
				+ men_state + ", sto_num=" + sto_num + "]";
	}
	
	
}
