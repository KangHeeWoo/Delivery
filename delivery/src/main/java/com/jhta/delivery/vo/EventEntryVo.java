package com.jhta.delivery.vo;

public class EventEntryVo {
	private int eve_ent_num;
	private String eve_win;
	private int eve_num;
	private int mem_num;
	public int getEve_ent_num() {
		return eve_ent_num;
	}
	public void setEve_ent_num(int eve_ent_num) {
		this.eve_ent_num = eve_ent_num;
	}
	public String getEve_win() {
		return eve_win;
	}
	public void setEve_win(String eve_win) {
		this.eve_win = eve_win;
	}
	public int getEve_num() {
		return eve_num;
	}
	public void setEve_num(int eve_num) {
		this.eve_num = eve_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	@Override
	public String toString() {
		return "EventEntryVo [eve_ent_num=" + eve_ent_num + ", eve_win=" + eve_win + ", eve_num=" + eve_num
				+ ", mem_num=" + mem_num + "]";
	}
	public EventEntryVo(int eve_ent_num, String eve_win, int eve_num, int mem_num) {
		super();
		this.eve_ent_num = eve_ent_num;
		this.eve_win = eve_win;
		this.eve_num = eve_num;
		this.mem_num = mem_num;
	}
	public EventEntryVo() {
		super();
	}
}
