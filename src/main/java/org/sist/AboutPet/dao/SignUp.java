package org.sist.AboutPet.dao;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.sist.AboutPet.vo.Member;
import org.springframework.stereotype.Repository;

@Repository
public interface SignUp {


	@Select("  insert into member (mem_code, mem_id, nickname , mem_pw, mem_email, MEM_INVITE ) "
			+ "    values ( seq_member.nextval ,#{mem_id}, #{nickname}, #{mem_pw},#{mem_email} ,uv||#{mem_id}) ")
	   public int signUp(Member member) throws ClassNotFoundException, SQLException; 
	
	@Select(" update member set mtag=#{mtag} where mem_code=#{mem_code} ")
	   public int updateMtag(String mtag,int mem_code) throws ClassNotFoundException, SQLException; 
	
	
	
	
}
