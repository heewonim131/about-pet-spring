package org.sist.AboutPet.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ShopITEM {
	
	
	private int mem_code;
	private String mem_name;
	private String pet_cate;
	private String pet_name;

	private int item_code;
	private String item_name;
	private String item_img;
	private String item_content;
	private int scate_code;
	private int cpn_code;
	private int item_price;
	private Date item_date;
	private String item_url;
	private String itag;
	private String item_filter;
	private Date exp_date;

	//
	private String lcate_name;
	private String mcate_name;
	private String scate_name;
	private String br_name;
	private String cpn_name;
	private int item_fee;
	private int free_fee;

	// MD, 단독 상품
	private String rec_cmt;

	// 상품리스트
	private int lcate_code;
	private int mcate_code;
	private int opt_code;



	//베스트 20
	private int count;

	//브랜드
	private int br_code;


	private double rv_star;
	private int c_vote;

	private int star;
	private double pstar;
	
	
	private String legal;
	   private String country;
	   private String company;
	   private String as_contact;

}
