package com.jhta.delivery.vo;

import java.util.Date;

public class TopAdsVo {
	private int top_ads_num;
	private Date top_ads_start;
	private Date top_ads_end;
	private int top_ads_price;
	private String top_ads_state;
	private String top_ads_img;
	private Date top_ads_regd;
	private int sto_num;
	
	public TopAdsVo() {}

	public TopAdsVo(int top_ads_num, Date top_ads_start, Date top_ads_end, int top_ads_price, String top_ads_state,
			String top_ads_img, Date top_ads_regd, int sto_num) {
		super();
		this.top_ads_num = top_ads_num;
		this.top_ads_start = top_ads_start;
		this.top_ads_end = top_ads_end;
		this.top_ads_price = top_ads_price;
		this.top_ads_state = top_ads_state;
		this.top_ads_img = top_ads_img;
		this.top_ads_regd = top_ads_regd;
		this.sto_num = sto_num;
	}

	public int getTop_ads_num() {
		return top_ads_num;
	}

	public void setTop_ads_num(int top_ads_num) {
		this.top_ads_num = top_ads_num;
	}

	public Date getTop_ads_start() {
		return top_ads_start;
	}

	public void setTop_ads_start(Date top_ads_start) {
		this.top_ads_start = top_ads_start;
	}

	public Date getTop_ads_end() {
		return top_ads_end;
	}

	public void setTop_ads_end(Date top_ads_end) {
		this.top_ads_end = top_ads_end;
	}

	public int getTop_ads_price() {
		return top_ads_price;
	}

	public void setTop_ads_price(int top_ads_price) {
		this.top_ads_price = top_ads_price;
	}

	public String getTop_ads_state() {
		return top_ads_state;
	}

	public void setTop_ads_state(String top_ads_state) {
		this.top_ads_state = top_ads_state;
	}

	public String getTop_ads_img() {
		return top_ads_img;
	}

	public void setTop_ads_img(String top_ads_img) {
		this.top_ads_img = top_ads_img;
	}

	public Date getTop_ads_regd() {
		return top_ads_regd;
	}

	public void setTop_ads_regd(Date top_ads_regd) {
		this.top_ads_regd = top_ads_regd;
	}

	public int getSto_num() {
		return sto_num;
	}

	public void setSto_num(int sto_num) {
		this.sto_num = sto_num;
	}

	@Override
	public String toString() {
		return "TopAdsVo [top_ads_num=" + top_ads_num + ", top_ads_start=" + top_ads_start + ", top_ads_end="
				+ top_ads_end + ", top_ads_price=" + top_ads_price + ", top_ads_state=" + top_ads_state
				+ ", top_ads_img=" + top_ads_img + ", top_ads_regd=" + top_ads_regd + ", sto_num=" + sto_num + "]";
	}
	
}
