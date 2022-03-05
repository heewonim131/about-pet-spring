package org.sist.AboutPet.vo;

import java.sql.Date;

public class Order {

	private int item_code;
	private String item_name;	// 상품명
	private String item_img;	// 상품이미지
	private int item_price;	// 상품가격(정가)
	private int sale_rate;	// 할인가격
	
	// 옵션
	private int opt_code;	// 옵션코드
	private String opt_name;	// 옵션명
	private int extra_price;	// 추가가격
	
	// 장바구니
	private int cart_code;
	private int cart_cnt;	// 상품개수
	
	private int br_code;	// 브랜드코드
	private String br_name;	// 브랜드명
	

	// 업체...
	private int cpn_code;	// 업체코드
	private String cpn_name;	// 업체명
	private int item_fee;	// 배송비
	private int free_fee;	// 무료배송 금액
	private String cpn_type;	// 업체타입
	
	
	// 주문
	private String ord_code;
	private String odd_code;
	private Date ord_date;
	private String dt_type;
	private Date d_time;
	private String ord_status;
	private int odd_cnt;
	
	// 취소
	private String cc_code;
	
	
	public int getItem_code() {
		return item_code;
	}
	public void setItem_code(int item_code) {
		this.item_code = item_code;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getItem_img() {
		return item_img;
	}
	public void setItem_img(String item_img) {
		this.item_img = item_img;
	}
	public int getItem_price() {
		return item_price;
	}
	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}
	public int getSale_rate() {
		return sale_rate;
	}
	public void setSale_rate(int sale_rate) {
		this.sale_rate = sale_rate;
	}
	public int getOpt_code() {
		return opt_code;
	}
	public void setOpt_code(int opt_code) {
		this.opt_code = opt_code;
	}
	public String getOpt_name() {
		return opt_name;
	}
	public void setOpt_name(String opt_name) {
		this.opt_name = opt_name;
	}
	public int getExtra_price() {
		return extra_price;
	}
	public void setExtra_price(int extra_price) {
		this.extra_price = extra_price;
	}
	public int getCart_code() {
		return cart_code;
	}
	public void setCart_code(int cart_code) {
		this.cart_code = cart_code;
	}
	public int getCart_cnt() {
		return cart_cnt;
	}
	public void setCart_cnt(int cart_cnt) {
		this.cart_cnt = cart_cnt;
	}
	public int getBr_code() {
		return br_code;
	}
	public void setBr_code(int br_code) {
		this.br_code = br_code;
	}
	public String getBr_name() {
		return br_name;
	}
	public void setBr_name(String br_name) {
		this.br_name = br_name;
	}
	public int getCpn_code() {
		return cpn_code;
	}
	public void setCpn_code(int cpn_code) {
		this.cpn_code = cpn_code;
	}
	public String getCpn_name() {
		return cpn_name;
	}
	public void setCpn_name(String cpn_name) {
		this.cpn_name = cpn_name;
	}
	public int getItem_fee() {
		return item_fee;
	}
	public void setItem_fee(int item_fee) {
		this.item_fee = item_fee;
	}
	public int getFree_fee() {
		return free_fee;
	}
	public void setFree_fee(int free_fee) {
		this.free_fee = free_fee;
	}
	public String getCpn_type() {
		return cpn_type;
	}
	public void setCpn_type(String cpn_type) {
		this.cpn_type = cpn_type;
	}
	public String getOrd_code() {
		return ord_code;
	}
	public void setOrd_code(String ord_code) {
		this.ord_code = ord_code;
	}
	public String getOdd_code() {
		return odd_code;
	}
	public void setOdd_code(String odd_code) {
		this.odd_code = odd_code;
	}
	public Date getOrd_date() {
		return ord_date;
	}
	public void setOrd_date(Date ord_date) {
		this.ord_date = ord_date;
	}
	public String getDt_type() {
		return dt_type;
	}
	public void setDt_type(String dt_type) {
		this.dt_type = dt_type;
	}
	public Date getD_time() {
		return d_time;
	}
	public void setD_time(Date d_time) {
		this.d_time = d_time;
	}
	public String getOrd_status() {
		return ord_status;
	}
	public void setOrd_status(String ord_status) {
		this.ord_status = ord_status;
	}
	public int getOdd_cnt() {
		return odd_cnt;
	}
	public void setOdd_cnt(int odd_cnt) {
		this.odd_cnt = odd_cnt;
	}
	public String getCc_code() {
		return cc_code;
	}
	public void setCc_code(String cc_code) {
		this.cc_code = cc_code;
	}
	
}
