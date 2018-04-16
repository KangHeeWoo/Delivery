package com.jhta.delivery.vo;



public class BookMarkVo {
	private int boo_num;
	private int mem_num;
	private int sto_num;
	
	public BookMarkVo() {}
	public BookMarkVo(int boo_num, int mem_num, int sto_num) {
		super();
		this.boo_num = boo_num;
		this.mem_num = mem_num;
		this.sto_num = sto_num;
	}
	public int getBoo_num() {
		return boo_num;
	}
	public void setBoo_num(int boo_num) {
		this.boo_num = boo_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getSto_num() {
		return sto_num;
	}
	public void setSto_num(int sto_num) {
		this.sto_num = sto_num;
	}
	@Override
	public String toString() {
		return "BooMarkVo [boo_num=" + boo_num + ", mem_num=" + mem_num + ", sto_num=" + sto_num + "]";
	}
}
	
	

	
	