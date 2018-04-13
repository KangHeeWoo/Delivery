package com.jhta.delivery.vo;

public class StoreMenuVo {
	private String sto_name;
	private int sto_num;
	private String sto_intro;
	private String men_name;
	private String men_price;
	public StoreMenuVo() {}
	public StoreMenuVo(String sto_name, int sto_num, String sto_intro, String men_name, String men_price) {
		super();
		this.sto_name = sto_name;
		this.sto_num = sto_num;
		this.sto_intro = sto_intro;
		this.men_name = men_name;
		this.men_price = men_price;
	}
	public String getSto_name() {
		return sto_name;
	}
	public void setSto_name(String sto_name) {
		this.sto_name = sto_name;
	}
	public int getSto_num() {
		return sto_num;
	}
	public void setSto_num(int sto_num) {
		this.sto_num = sto_num;
	}
	public String getSto_intro() {
		return sto_intro;
	}
	public void setSto_intro(String sto_intro) {
		this.sto_intro = sto_intro;
	}
	public String getMen_name() {
		return men_name;
	}
	public void setMen_name(String men_name) {
		this.men_name = men_name;
	}
	public String getMen_price() {
		return men_price;
	}
	public void setMen_price(String men_price) {
		this.men_price = men_price;
	}
	@Override
	public String toString() {
		return "StoreMenuVo [sto_name=" + sto_name + ", sto_num=" + sto_num + ", sto_intro=" + sto_intro + ", men_name="
				+ men_name + ", men_price=" + men_price + "]";
	}
	
	
}
