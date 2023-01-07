package org.nc.controller;

import javax.servlet.http.HttpSession;

import org.nc.domain.MemberVO;
import org.nc.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/eHR/*")
@Log4j
public class MemberController {

	private final MemberService memberservice;
	

	@RequestMapping("/login.do")
	 public String login() {
	  return "/eHR/member/login";
	}

	@RequestMapping("/login_check.do")
	public ModelAndView login_check(@ModelAttribute MemberVO membervo, HttpSession session) {
	 String name = memberservice.loginCheck(membervo, session);  
	 ModelAndView mav = new ModelAndView();
	  if (name != null) { // 로그인 성공 시
	   mav.setViewName("home"); // 뷰의 이름
	   } else { // 로그인 실패 시
	     mav.setViewName("member/login"); 		
	     mav.addObject("message", "error");
	     }
	     return mav;
	   }
	   
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		memberservice.logout(session); 
		mav.setViewName("member/login"); 
		mav.addObject("message", "logout"); 
	  return mav;
	  }
	
	// 회원가입 get
		@RequestMapping(value = "/register", method = RequestMethod.GET)
		public void getRegister() throws Exception {
			log.info("get register");
			
		}
		
		// 회원가입 post
		@RequestMapping(value = "/register", method = RequestMethod.POST)
		public String postRegister(MemberVO vo) throws Exception {
			log.info("post register");
			
			memberservice.register(vo);
			
			return null;
		}
	
}
