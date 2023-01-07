package org.nc.mapper;

import org.nc.domain.MemberVO;

public interface MemberMapper {

	//로그인
	public String loginCheck(MemberVO membervo); 
		
	
	//회원가입
	public void register(MemberVO membervo);
}
