package com.example.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.example.config.RootConfig.class})
@Log4j
public class AttachMapperTest {

	@Setter(onMethod_ = @Autowired)
	private AttachMapper mapper;
	
	/*이미지 정보 반환*/
	@Test
	public void getAttachListTests() {
		
		int num = 11;
		
		System.out.println("이미지 정보 : " + mapper.getAttachList(num));
		
		
	}
}
