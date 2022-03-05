package org.sist.AboutPet.vo;

import java.sql.Date;

public class Cancel {

	//취소
	private String odd_code;
	private String pd_code;
	private String cc_code;
	private String rcc_code;
	private String cc_desc;
	private Date cc_date;
	
	
	public String getOdd_code() {
		return odd_code;
	}
	public void setOdd_code(String odd_code) {
		this.odd_code = odd_code;
	}
	public String getPd_code() {
		return pd_code;
	}
	public void setPd_code(String pd_code) {
		this.pd_code = pd_code;
	}
	public String getCc_code() {
		return cc_code;
	}
	public void setCc_code(String cc_code) {
		this.cc_code = cc_code;
	}
	public String getRcc_code() {
		return rcc_code;
	}
	public void setRcc_code(String rcc_code) {
		this.rcc_code = rcc_code;
	}
	public String getCc_desc() {
		return cc_desc;
	}
	public void setCc_desc(String cc_desc) {
		this.cc_desc = cc_desc;
	}
	public Date getCc_date() {
		return cc_date;
	}
	public void setCc_date(Date cc_date) {
		this.cc_date = cc_date;
	}
	
	
	
}
