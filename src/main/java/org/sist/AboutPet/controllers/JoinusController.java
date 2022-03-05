package org.sist.AboutPet.controllers;

import javax.servlet.http.HttpServletRequest;

import org.sist.AboutPet.dao.SignUp;
import org.sist.AboutPet.vo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/Project/aboutPet/*")
public class JoinusController {
	
	@Autowired
	private SignUp singUp=null;
	
	@RequestMapping(value={"signUp.do"},method = RequestMethod.GET)
	   public String join() throws Exception {//회원가입 페이지 이동
		return "join1";
	   }
	
	@RequestMapping(value={"signUp.do"},method = RequestMethod.POST)
	   public String login(Member member) throws Exception {//회원가입
		singUp.signUp(member);
	      return "redirect:/Project/aboutPet/join2.do";
	   }
	@RequestMapping(value={"join2.do"},method = RequestMethod.GET)
	   public String join2() throws Exception {//회원가입 2 페이지 이동
		return "join2";
	   }
	@RequestMapping(value={"updateMtag.do"},method = RequestMethod.POST)
	   public String update(@RequestParam("mtag")String mtag,
			   @RequestParam("mem_code")int mem_code)  throws Exception {//관심태그추가
	     singUp.updateMtag(mtag, mem_code);
		return "redirect:/Project/aboutPet/join3";
	   }
	
	
	
}