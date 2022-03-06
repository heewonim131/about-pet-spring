package org.sist.AboutPet.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	private SignUp singUp = null;
	@Autowired
	private HttpSession session;

	// 회원가입 페이지
	@RequestMapping(value={"signUp.do"}, method = RequestMethod.GET)
   public String join() throws Exception {
		return "join";
   }

	// 회원가입 요청
	@RequestMapping(value={"signUp.do"}, method = RequestMethod.POST)
   	public String signUp(Member member) throws Exception {
		singUp.signUp(member);
	  	return "redirect:/Project/aboutPet";
   	}

	// 로그인 요청
	@RequestMapping(value={"signIn.do"}, method = RequestMethod.POST)
	public String signIn(Member member) throws Exception {
		session.setAttribute("member", member);
		return "redirect:/Project/aboutPet";
	}

}