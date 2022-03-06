package org.sist.AboutPet.dao;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.sist.AboutPet.vo.Member;
import org.springframework.stereotype.Repository;

@Repository
public interface SignUp {

	@Select(" INSERT INTO MEMBER " +
			" (MEM_CODE, MEM_ID, NICKNAME, MEM_PW, MEM_EMAIL, MEM_INVITE) ")
   public int signUp(Member member)
			throws ClassNotFoundException, SQLException;
	
	@Select(" UPDATE MEMBER " +
			" SET MTAG = ${mtag} " +
			" WHERE MEM_CODE = #{mem_code} ")
   public int updateMtag(String mtag, int mem_code)
			throws ClassNotFoundException, SQLException;

}
