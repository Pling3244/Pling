package com.example.service;

import java.util.List;

import com.example.domain.MemberVO;

public interface MemberService {

	//회원가입
	public void register(MemberVO member) throws Exception;
	
	//로그인
	public MemberVO get(MemberVO member) throws Exception;
	
	// 아이디 중복 검사
	public int idCheck(String id) throws Exception;
	
	public boolean modify(MemberVO member);
	public boolean remove(String id);
	public List<MemberVO> getList();
//	public List<BoardVO> getList(Criteria cri);
}
