package org.sist.AboutPet.vo;

public class Payment {

	// 결제
	private String pd_code;
	private String pm_code;
	private int pm_price;
	private String pd_method;
	
	
	public String getPm_code() {
		return pm_code;
	}
	public void setPm_code(String pm_code) {
		this.pm_code = pm_code;
	}
	public int getPm_price() {
		return pm_price;
	}
	public void setPm_price(int pm_price) {
		this.pm_price = pm_price;
	}
	public String getPd_method() {
		return pd_method;
	}
	public void setPd_method(String pd_method) {
		this.pd_method = pd_method;
	}
	public String getPd_code() {
		return pd_code;
	}
	public void setPd_code(String pd_code) {
		this.pd_code = pd_code;
	}
	
}
