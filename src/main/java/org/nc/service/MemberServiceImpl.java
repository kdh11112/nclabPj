package org.nc.service;

import javax.servlet.http.HttpSession;

import org.nc.domain.MemberVO;
import org.nc.mapper.MemberMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@RequiredArgsConstructor
@ToString
public class MemberServiceImpl implements MemberService{

	private final MemberMapper mapper;
	
	@Override
	public String loginCheck(MemberVO membervo, HttpSession session) {
	String name = mapper.loginCheck(membervo);
	 if (name != null) { // 세션 변수 저장
	  session.setAttribute("userid", membervo.getUserid());
	  session.setAttribute("name", name);
	}
	 return name; 
	}

	@Override
	public void logout(HttpSession session) {
	 session.invalidate(); // 세션 초기화
	 }

	@Override
	public void register(MemberVO membervo) {	//회원가입
		
		mapper.register(membervo);
	}
}
