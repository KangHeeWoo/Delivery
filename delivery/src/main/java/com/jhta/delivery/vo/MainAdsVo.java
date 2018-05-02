package com.jhta.delivery.vo;

import java.util.Date;

public class MainAdsVo {
	private int main_ads_num;
	private Date main_ads_start;
	private Date main_ads_end;
	private int main_ads_price;
	private String main_ads_state;
	private String main_ads_img;
	private Date main_ads_regd;
	private int sto_num;
	
	public MainAdsVo() {}

	public MainAdsVo(int main_ads_num, Date main_ads_start, Date main_ads_end, int main_ads_price,
			String main_ads_state, String main_ads_img, Date main_ads_regd, int sto_num) {
		super();
		this.main_ads_num = main_ads_num;
		this.main_ads_start = main_ads_start;
		this.main_ads_end = main_ads_end;
		this.main_ads_price = main_ads_price;
		this.main_ads_state = main_ads_state;
		this.main_ads_img = main_ads_img;
		this.main_ads_regd = main_ads_regd;
		this.sto_num = sto_num;
	}

	public int getMain_ads_num() {
		return main_ads_num;
	}

	public void setMain_ads_num(int main_ads_num) {
		this.main_ads_num = main_ads_num;
	}

	public Date getMain_ads_start() {
		return main_ads_start;
	}

	public void setMain_ads_start(Date main_ads_start) {
		this.main_ads_start = main_ads_start;
	}

	public Date getMain_ads_end() {
		return main_ads_end;
	}

	public void setMain_ads_end(Date main_ads_end) {
		this.main_ads_end = main_ads_end;
	}

	public int getMain_ads_price() {
		return main_ads_price;
	}

	public void setMain_ads_price(int main_ads_price) {
		this.main_ads_price = main_ads_price;
	}

	public String getMain_ads_state() {
		return main_ads_state;
	}

	public void setMain_ads_state(String main_ads_state) {
		this.main_ads_state = main_ads_state;
	}

	public String getMain_ads_img() {
		return main_ads_img;
	}

	public void setMain_ads_img(String main_ads_img) {
		this.main_ads_img = main_ads_img;
	}

	public Date getMain_ads_regd() {
		return main_ads_regd;
	}

	public void setMain_ads_regd(Date main_ads_regd) {
		this.main_ads_regd = main_ads_regd;
	}

	public int getSto_num() {
		return sto_num;
	}

	public void setSto_num(int sto_num) {
		this.sto_num = sto_num;
	}

	@Override
	public String toString() {
		return "MainAdsVo [main_ads_num=" + main_ads_num + ", main_ads_start=" + main_ads_start + ", main_ads_end="
				+ main_ads_end + ", main_ads_price=" + main_ads_price + ", main_ads_state=" + main_ads_state
				+ ", main_ads_img=" + main_ads_img + ", main_ads_regd=" + main_ads_regd + ", sto_num=" + sto_num + "]";
	}
	
	

}
