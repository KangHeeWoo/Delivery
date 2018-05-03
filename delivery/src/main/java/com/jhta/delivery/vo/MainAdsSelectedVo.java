package com.jhta.delivery.vo;

public class MainAdsSelectedVo {
	private int main_ads_sel_num;
	private int main_ads_num;
	
	public MainAdsSelectedVo() {}

	public MainAdsSelectedVo(int main_ads_sel_num, int main_ads_num) {
		super();
		this.main_ads_sel_num = main_ads_sel_num;
		this.main_ads_num = main_ads_num;
	}

	public int getMain_ads_sel_num() {
		return main_ads_sel_num;
	}

	public void setMain_ads_sel_num(int main_ads_sel_num) {
		this.main_ads_sel_num = main_ads_sel_num;
	}

	public int getMain_ads_num() {
		return main_ads_num;
	}

	public void setMain_ads_num(int main_ads_num) {
		this.main_ads_num = main_ads_num;
	}

	@Override
	public String toString() {
		return "MainAdsSelectedVo [main_ads_sel_num=" + main_ads_sel_num + ", main_ads_num=" + main_ads_num + "]";
	}

}
