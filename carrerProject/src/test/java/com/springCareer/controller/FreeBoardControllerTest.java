package com.springCareer.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(classes = {com.springCareer.config.RootConfig.class,
								 com.springCareer.config.ServletConfig.class})
@Log4j
public class FreeBoardControllerTest 
{
	
	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;//(가짜mvc-url과 피마라미터를 브라우저 사용처럼 만들어) = (가상브라우저를 만들어) 실행
	
	@Before
	public void setup()
	{
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();  
	}
	
//	@Test //1.입력테스트
	public void testRegister() throws Exception
	{
		String resultPage = mockMvc.perform(MockMvcRequestBuilders
											.post("/board/register")
											.param("title", "텍스트 새글 제목")
											.param("content", "텍스트 새글 내용")
											.param("user_id", "user00")
											)
											.andReturn()
											.getModelAndView()
											.getViewName();
		log.info(resultPage);
	}
	
	@Test //2.조회테스트
	public void testGet() throws Exception
	{
		log.info(mockMvc.perform(MockMvcRequestBuilders
								.get("/board/get")
								.param("post_id", "2"))
								.andReturn()
								.getModelAndView()
								.getModelMap()
				);
	}
	
//	@Test //3.수정테스트
	public void testModify() throws Exception
	{
		String resultPage = mockMvc.perform(MockMvcRequestBuilders
											.post("/board/modify")
											.param("post_id", "1")
							  				.param("title", "수정된 테스트 새글 제목")
											.param("content", "수정된 테스트 새글 내용")
											.param("user_id", "user00"))
									.andReturn()
									.getModelAndView()
									.getViewName();
		log.info(resultPage);
				
	}
	
//	@Test //4.삭제테스트
	public void testRemove() throws Exception
	{
		String resultPage = mockMvc.perform(MockMvcRequestBuilders
											.post("/board/remove")
											.param("post_id", "25"))
									.andReturn()
									.getModelAndView()
									.getViewName();
		log.info(resultPage);

	}
//	@Test
	public void testListPaging() throws Exception
	{
		log.info(mockMvc.perform(
				MockMvcRequestBuilders.get("/board/list")
				.param("pageNum", "2")
				.param("amount", "5"))
				.andReturn().getModelAndView().getModelMap());
	}
}
