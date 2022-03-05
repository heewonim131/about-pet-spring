package org.sist.AboutPet.vo;

import java.sql.Date;


import org.springframework.stereotype.Component;

import lombok.Data;
@Data
public class OrderAndPayment {
	
	//주문
	private int ord_code;
	private int mem_code;
	private int adr_code;
	private Date ord_date;
	private int ord_status;
	
	// 주문상세
	private int odd_code;
	private int st_code; // item_code
	private int odd_cnt;
	private int dt_code;
	private String d_time;
	private int confirm;
	
	//결제
	private int pm_code;
	private int pm_price;
	
	//결제 상세
	private int pd_code;
	private String pd_method;
	private int pd_price;
	
	
	private int item_code;
	private String opt_name;
	private int opt_code;
	private int price;
	
	// 포인트
	private String mem_name;
	private String adr_name;
	private String recipient;
	private String d_contact;
	private String adr_detail;
	private int f_price;
	private int item_fee;
	
	private int mem_point;
	private String card;
	
	
	//배속지역
	private Address address;
	
	
	

}
