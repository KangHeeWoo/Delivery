package com.jhta.delivery.vo;

import java.util.Date;

public class AnswerVo {
	private int qna_ans_num;
	private String qna_ans_title;
	private String qna_ans_cont;
	private Date qna_ans_regd;
	private int qna_num;
	
	@Override
	public String toString() {
		return "AnswerVo [qna_ans_num=" + qna_ans_num + ", qna_ans_title=" + qna_ans_title + ", qna_ans_cont="
				+ qna_ans_cont + ", qna_ans_regd=" + qna_ans_regd + ", qna_num=" + qna_num + "]";
	}

	public AnswerVo() {}

	public AnswerVo(int qna_ans_num, String qna_ans_title, String qna_ans_cont, Date qna_ans_regd, int qna_num) {
		super();
		this.qna_ans_num = qna_ans_num;
		this.qna_ans_title = qna_ans_title;
		this.qna_ans_cont = qna_ans_cont;
		this.qna_ans_regd = qna_ans_regd;
		this.qna_num = qna_num;
	}

	public int getQna_ans_num() {
		return qna_ans_num;
	}

	public void setQna_ans_num(int qna_ans_num) {
		this.qna_ans_num = qna_ans_num;
	}

	public String getQna_ans_title() {
		return qna_ans_title;
	}

	public void setQna_ans_title(String qna_ans_title) {
		this.qna_ans_title = qna_ans_title;
	}

	public String getQna_ans_cont() {
		return qna_ans_cont;
	}

	public void setQna_ans_cont(String qna_ans_cont) {
		this.qna_ans_cont = qna_ans_cont;
	}

	public Date getQna_ans_regd() {
		return qna_ans_regd;
	}

	public void setQna_ans_regd(Date qna_ans_regd) {
		this.qna_ans_regd = qna_ans_regd;
	}

	public int getQna_num() {
		return qna_num;
	}

	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}
	
	
}
