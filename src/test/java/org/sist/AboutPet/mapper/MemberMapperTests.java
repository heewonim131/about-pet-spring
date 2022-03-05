package org.sist.AboutPet.mapper;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runner.Runner;
import org.sist.AboutPet.vo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@ContextConfiguration("filfile:src/main/webapp/WEB-INF/spring/root-context.xml")
@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
public class MemberMapperTests {


	@Setter(onMethod_ =@Autowired )
	private MemberMapper mapper;
	
	@Test
	public void test() {
		
		Member vo=mapper.read("Ukleouk	");
		System.out.println(vo);
		
	}

}
