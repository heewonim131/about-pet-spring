package org.sist.AboutPet.vo;

import java.sql.Date;

public class Video {

	// fields
	private int v_code;
	private String v_type;
	private String v_img;
	private String v_time;
	private String s_name;
	private String v_name;
	private Date vv_date;

	// getter, setter
	public int getV_code() {
		return v_code;
	}

	public void setV_code(int v_code) {
		this.v_code = v_code;
	}

	public String getV_type() {
		return v_type;
	}

	public void setV_type(String v_type) {
		this.v_type = v_type;
	}

	public String getV_img() {
		return v_img;
	}

	public void setV_img(String v_img) {
		this.v_img = v_img;
	}

	public String getV_time() {
		return v_time;
	}

	public void setV_time(String v_time) {
		this.v_time = v_time;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public String getV_name() {
		return v_name;
	}

	public void setV_name(String v_name) {
		this.v_name = v_name;
	}

	public Date getVv_date() {
		return vv_date;
	}

	public void setVv_date(Date vv_date) {
		this.vv_date = vv_date;
	}
}
