package com.jhta.delivery.vo;

public class CartVo {
	private int num;
	private String name;
	private int price;
	private int cnt;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public CartVo() {}
	public CartVo(int num, String name, int price, int cnt) {
		super();
		this.num = num;
		this.name = name;
		this.price = price;
		this.cnt = cnt;
	}
	@Override
	public String toString() {
		return "CartVo [num=" + num + ", name=" + name + ", price=" + price + ", cnt=" + cnt + "]";
	}
	
	

}
