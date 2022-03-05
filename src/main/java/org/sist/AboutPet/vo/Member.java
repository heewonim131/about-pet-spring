package org.sist.AboutPet.vo;

import org.springframework.stereotype.Component;

import lombok.Data;
@Component
@Data
public class Member {


	// fields
	private int mem_code;	// 회원코드
	private String mem_id;	// 아이디
	private String mem_pw;	// 비밀번호
	private String nickname;	// 닉네임
	private String mem_name;	// 이름
	private String contact;		// 연락처
	private String mem_email;	// 이메일
	private String gr_name;	// 등급
	private int mem_point;	// 포인트
	private String mem_invite;	// 내추천코드
	private String invited;		// 추천인코드
	private String mpl_url;		// 펫로그링크
	private String mtag;	// 관심태그
	private String mpl_intro;	// 펫로그소개
	
	// 프로필 이미지
	private String mem_img;		// 프로필사진


	
	
}
