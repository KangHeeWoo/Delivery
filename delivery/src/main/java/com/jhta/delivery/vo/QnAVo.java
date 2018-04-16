package com.jhta.delivery.vo;

import java.util.Date;

public class QnAVo {
	private int qna_num;
	private String qna_title;
	private String qna_cont;
	private Date qna_date;
	private int mem_num;
	
	private AnswerVo answers;

	public QnAVo(int qna_num, String qna_title, String qna_cont, Date qna_date, int mem_num, AnswerVo answer) {
		super();
		this.qna_num = qna_num;
		this.qna_title = qna_title;
		this.qna_cont = qna_cont;
		this.qna_date = qna_date;
		this.mem_num = mem_num;
		this.answers = answers;
	}

	public int getQna_num() {
		return qna_num;
	}

	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_cont() {
		return qna_cont;
	}

	public void setQna_cont(String qna_cont) {
		this.qna_cont = qna_cont;
	}

	public Date getQna_date() {
		return qna_date;
	}

	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public AnswerVo getAnswers() {
		return answers;
	}

	public void setAnswers(AnswerVo answers) {
		this.answers = answers;
	}
	
	
	
}
