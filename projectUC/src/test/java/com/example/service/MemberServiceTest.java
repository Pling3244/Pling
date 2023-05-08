package com.example.service;

import static org.junit.Assert.assertNotNull;

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
public class MemberServiceTest {

	@Setter(onMethod_ = { @Autowired })
	private MemberService service;
	
//	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
//	@Test
	public void testRegister()
 {
		MemberVO member = new MemberVO();
		member.setId("slwhfkf");
		member.setM_name("김캇트");
		member.setPassword("rlawls18");
		member.setGender("남");
		member.setPhone("010-8972-2559");
		member.setRegion("부산");
		member.setEmail("e@r");
		
		service.register(member);
		log.info("생성된 계정: " + member.getId());
 }
	
//	@Test
	public void testGetList() {
		service.getList().forEach(member -> log.info(member));
//		service.getList(new Criteria(2, 10)).forEach(board -> log.info(board));
	}
//	@Test
	public void testGet() {
		log.info(service.get("slwhfkf"));
	}
//	@Test
	public void testDelete() {
		log.info("REMOVE RESULT: " + service.remove("slwhfkf"));
	}
//	@Test
	public void testUpdate()
	{
		MemberVO member = service.get("pling3244");
		if (member == null) {
			return;
		}
		member.setM_name("김풀잎");
		member.setGender("남");
		log.info("MODIFY RESULT: " + service.modify(member));
	}
	}
