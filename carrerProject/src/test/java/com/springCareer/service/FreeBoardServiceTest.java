package com.springCareer.service;

import static org.junit.Assert.assertNotNull;

import java.time.LocalDateTime;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.springCareer.domain.FreeBoardVO;
import com.springCareer.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes= {com.springCareer.config.RootConfig.class})
@Log4j
public class FreeBoardServiceTest {
	
	@Setter(onMethod_= {@Autowired})
	private FreeBoardService service;
	
//	@Test
	public void testExist()
	{
		log.info(service);
		assertNotNull(service);
	}
	
//	@Test //c
	public void testRegister()
	{
		FreeBoardVO board = new FreeBoardVO();
		
		board.setUser_id("kim");
		board.setTitle("새로 작성하는 글9");
		board.setContent("새로 작성하는 내용9");
		
		
		service.register(board);
		
		log.info("생성된 게시물의 번호: "+board.getPost_id());
	}

//	@Test //r
	public void testGetList() {
		service.getList().forEach(board -> log.info(board));
		service.getList(new Criteria(1,10)).forEach(board -> log.info(board));
	}
	
//	@Test //r
	public void testGet()
	{
		log.info(service.get(52L));
	}
	
//	@Test //delete
	public void testDelete()
	{
		log.info("REMOVE RESULT: " + service.remove(36L));
	}
	
	@Test //update
	public void testUpdate()
	{
		FreeBoardVO board = service.get(52L);
		if(board == null) {
			return;
		}
		board.setTitle("제목을 수정합니다.");
		log.info("MODIFY RESULT: "+service.modify(board));
		log.info(board);
	}
}
