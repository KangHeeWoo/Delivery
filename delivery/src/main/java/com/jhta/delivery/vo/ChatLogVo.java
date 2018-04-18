package com.jhta.delivery.vo;

import java.sql.Date;

public class ChatLogVo {
	private int chat_num;
	private String chat_name;
	private Date chat_regd;
	private int mem_num;
	private int sel_num;
	public ChatLogVo() {}
	public ChatLogVo(int chat_num, String chat_name, Date chat_regd, int mem_num, int sel_num) {
		super();
		this.chat_num = chat_num;
		this.chat_name = chat_name;
		this.chat_regd = chat_regd;
		this.mem_num = mem_num;
		this.sel_num = sel_num;
	}
	public int getChat_num() {
		return chat_num;
	}
	public void setChat_num(int chat_num) {
		this.chat_num = chat_num;
	}
	public String getChat_name() {
		return chat_name;
	}
	public void setChat_name(String chat_name) {
		this.chat_name = chat_name;
	}
	public Date getChat_regd() {
		return chat_regd;
	}
	public void setChat_regd(Date chat_regd) {
		this.chat_regd = chat_regd;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getSel_num() {
		return sel_num;
	}
	public void setSel_num(int sel_num) {
		this.sel_num = sel_num;
	}
	@Override
	public String toString() {
		return "ChatLogVo [chat_num=" + chat_num + ", chat_name=" + chat_name + ", chat_regd=" + chat_regd
				+ ", mem_num=" + mem_num + ", sel_num=" + sel_num + "]";
	}
}
