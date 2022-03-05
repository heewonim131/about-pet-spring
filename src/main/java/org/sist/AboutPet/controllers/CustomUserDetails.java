package org.sist.AboutPet.controllers;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@Getter
public class CustomUserDetails implements org.springframework.security.core.userdetails.UserDetails{

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
//	private String filesystemname;        // 시스템파일명
//	private String originalfilename;        // 오리지널파일명
//	private long filelength;               // 파일크기
	
	
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}

}
