package com.jhta.delivery.vo;

public class AbleLocationVo {
	private int able_loc_num;
	private String able_loc;
	private int sto_num;
	
	public AbleLocationVo() {}

	public AbleLocationVo(int able_loc_num, String able_loc, int sto_num) {
		super();
		this.able_loc_num = able_loc_num;
		this.able_loc = able_loc;
		this.sto_num = sto_num;
	}

	public int getAble_loc_num() {
		return able_loc_num;
	}

	public void setAble_loc_num(int able_loc_num) {
		this.able_loc_num = able_loc_num;
	}

	public String getAble_loc() {
		return able_loc;
	}

	public void setAble_loc(String able_loc) {
		this.able_loc = able_loc;
	}

	public int getSto_num() {
		return sto_num;
	}

	public void setSto_num(int sto_num) {
		this.sto_num = sto_num;
	}

	@Override
	public String toString() {
		return "AbleLocationVo [able_loc_num=" + able_loc_num + ", able_loc=" + able_loc + ", sto_num=" + sto_num + "]";
	}
}
