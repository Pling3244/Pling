package com.example.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.domain.MessageVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.example.config.RootConfig.class})
@Log4j
public class MessageMapperTest {

	@Setter(onMethod_ = @Autowired)
	private MessageMapper mapper;
	
	/* 메세지 보내기 테스트 */
	@Test
	public void insertTest() throws Exception{
		
		MessageVO to = new MessageVO();
		
		to.setRoom(1);
		to.setSend_nick("pling");
		to.setRecv_nick("rlawls18");
		to.setContent("니조랄");
		
		log.info("메세지 : " + mapper.messageSendInlist(to));
}
}