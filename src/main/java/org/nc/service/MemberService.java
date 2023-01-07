package org.nc.service;

import javax.servlet.http.HttpSession;

import org.nc.domain.MemberVO;

public interface MemberService {

	public String loginCheck(MemberVO membervo, HttpSession session);	//로그인 세션
	
	public void logout(HttpSession session);
	
	public void register(MemberVO membervo);	//회원가입
}
