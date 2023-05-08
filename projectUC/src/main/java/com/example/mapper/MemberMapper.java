package com.example.mapper;

import java.util.List;

import com.example.domain.MemberVO;

public interface MemberMapper {

//	@Select("select * from uc_member")
	public List<MemberVO> getList();
	
	//회원가입
	public void insert(MemberVO member);
//	public Integer insertSelectKey(MemberVO member);
	
	//로그인
	public MemberVO read(MemberVO member);
	
	// 아이디 중복 검사
	public int idCheck(String id);
	
	public int delete(String id);
	public int update(MemberVO member);
}
