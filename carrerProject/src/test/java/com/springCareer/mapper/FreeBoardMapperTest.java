package com.springCareer.mapper;

import java.time.LocalDateTime;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.springCareer.domain.FreeBoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.springCareer.config.RootConfig.class})
@Log4j
public class FreeBoardMapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private FreeBoardMapper mapper;
	
//	@Test
	public void testGetList() {
		mapper.getList().forEach(board -> log.info(board));
	}
	
//   @Test
   public void testInsert()
   {
      FreeBoardVO board = new FreeBoardVO();
      board.setTitle("새로 작성하는 글10");
      board.setContent("새로 작성하는 내용10");
      board.setUser_id("kim2");
      
      
      
      mapper.insert(board);
      
      log.info(board);
   }
//	 @Test
	 public void testRead()
	 {
	    // 존재하는 게시물 번호로 테스트
	    FreeBoardVO board = mapper.read(25L);
	    log.info(board);
	 }
	 
//	@Test
	public void testDelete()
	{
	   log.info("DELETE COUNT: " + mapper.delete(25L));
	}
	
  @Test
  public void testUpdate()
  {
     //실행 전 존재하는 번호인지 확인할 것
     FreeBoardVO board = new FreeBoardVO();
     board.setPost_id(52L);
     board.setTitle("수정된 123");
     board.setContent("수정된 321");
     
     
     
     int count = mapper.update(board);
     log.info("UPDATE COUNT: "+count);
  }
 
	 
}
