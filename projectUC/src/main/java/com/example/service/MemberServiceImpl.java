package com.example.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.domain.MemberVO;
import com.example.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	private MemberMapper mapper;
	
	/* 회원가입 */
	@Override
	public void register(MemberVO member) throws Exception {
		log.info("register......" + member);
		mapper.insert(member);	
	}

	/* 로그인 */
	@Override
    public MemberVO get(MemberVO member) throws Exception {
        
        return mapper.read(member);
    }
	
	/* 아이디 중복검사 */
	@Override
	public int idCheck(String id) throws Exception {
		
		return mapper.idCheck(id);
	}
	
//	@Override
//	public MemberVO get(String id) {
//		log.info("get......" + id);
//		return mapper.read(id);
//	}

	@Override
	public boolean modify(MemberVO member) {
		log.info("modify......" + member);
		return mapper.update(member) == 1;
	}

	@Override
	public boolean remove(String id) {
		log.info("remove......" + id);
		return mapper.delete(id) == 1;	
	}

	@Override
	public List<MemberVO> getList() {
		log.info("getList......");
		return mapper.getList();	
	}
	
}