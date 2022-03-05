package org.sist.AboutPet.vo;

import org.springframework.stereotype.Component;

@Component
public class Pet {

	// fields
	private int pet_code;
	private int mem_code;
	private String pet_img;
	private String pet_name;
	private String pet_cate;
	private String pt_name;
	private int pet_age;
	private String pet_gen;
	private int pet_wei;
	private String pet_neut;
	private String alg;
	private String dise;
	
	// getter, setter
	public int getPet_code() {
		return pet_code;
	}
	public void setPet_code(int pet_code) {
		this.pet_code = pet_code;
	}
	public String getPet_img() {
		return pet_img;
	}
	public void setPet_img(String pet_img) {
		this.pet_img = pet_img;
	}
	public String getPet_name() {
		return pet_name;
	}
	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}
	public String getPet_cate() {
		return pet_cate;
	}
	public void setPet_cate(String pet_cate) {
		this.pet_cate = pet_cate;
	}
	public String getPt_name() {
		return pt_name;
	}
	public void setPt_name(String pt_name) {
		this.pt_name = pt_name;
	}
	public int getPet_age() {
		return pet_age;
	}
	public void setPet_age(int pet_age) {
		this.pet_age = pet_age;
	}
	public String getPet_gen() {
		return pet_gen;
	}
	public void setPet_gen(String pet_gen) {
		this.pet_gen = pet_gen;
	}
	public int getPet_wei() {
		return pet_wei;
	}
	public void setPet_wei(int pet_wei) {
		this.pet_wei = pet_wei;
	}
	public String getPet_neut() {
		return pet_neut;
	}
	public void setPet_neut(String pet_neut) {
		this.pet_neut = pet_neut;
	}
	public String getAlg() {
		return alg;
	}
	public void setAlg(String alg) {
		this.alg = alg;
	}
	public String getDise() {
		return dise;
	}
	public void setDise(String dise) {
		this.dise = dise;
	}
	public int getMem_code() {
		return mem_code;
	}
	public void setMem_code(int mem_code) {
		this.mem_code = mem_code;
	}
}
