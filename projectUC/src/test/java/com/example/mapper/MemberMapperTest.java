package com.example.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;




@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.example.config.RootConfig.class})
@Log4j
public class MemberMapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	/* 로그인 테스트 */
	@Test
	public void read() throws Exception{
        
        MemberVO member = new MemberVO();    // MemberVO 변수 선언 및 초기화
        
        /* 올바른 아이디 비번 입력경우 */
//        member.setId("pling3244");
//        member.setPassword("rlawls18");
        
        /* 올바른 않은 아이디 비번 입력경우 */
        member.setId("test1123");
        member.setPassword("test1321321");
        
        mapper.read(member);
        log.info("결과 값 : " + mapper.read(member));
        
    }
	
//	@Test
	public void testGetList() {
		mapper.getList().forEach(member -> log.info(member));
	}
	
//	@Test
	public void testInsert() {
		MemberVO member = new MemberVO();
		member.setId("pling");
		member.setM_name("김소금");
		member.setPassword("rlawls18");
		member.setGender("남");
		member.setPhone("010-8972-2559");
		member.setRegion("부산");
		member.setEmail("e@r");
		
		mapper.insert(member);
		log.info(member);
	}
	
	// 아이디 중복검사
		@Test
		public void memberIdChk() throws Exception{
			String id = "rlawls18";	// 존재하는 아이디
			String id2 = "test123";	// 존재하지 않는 아이디
			mapper.idCheck(id);
			mapper.idCheck(id2);
		}
	
//	@Test
//	public void testInsertSelectKey() {
//		MemberVO board = new MemberVO();
//		board.setTitle("새로 작성하는 글 select key");
//		board.setContent("새로 작성하는 내용 select key");
//		board.setWriter("newbie");
//		
//		mapper.insertSelectKey(board);
//		log.info(board);
//	}
	
//	@Test
//	public void testRead() {
//		MemberVO member = mapper.read("pling3244");
//		log.info(member);
//	}
	
//	@Test
	public void testDelete() {
		log.info("DELETE COUNT: " + mapper.delete("slwhfkf"));
	}
	
//	@Test
	public void testUpdate() {
		MemberVO member = new MemberVO();
		member.setId("pling");
		member.setM_name("김설탕");
		member.setPassword("rlawls18");
		member.setGender("여");
		member.setPhone("010-8972-2559");
		member.setRegion("부산");
		member.setEmail("e@r");
		member.setAuthor("관리자");
		member.setReport_num(1L);
		
		int count = mapper.update(member);
		log.info("UPDATE COUNT: " + count);
	}
}