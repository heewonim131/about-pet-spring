package org.sist.AboutPet.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Address {
	//배송지
	
	private int adr_code;
	private int mem_code;
	private String mem_name;
	private String adr_name;
	private String recipient;
	private String contact;
	private int da_code;
	private String adr_detail;
	private int adr_default;
	private String mem_email;
	private String requests;
	private String dr_enter;
	private String dr_loc;	
	private String d_contact;
	
	

}
