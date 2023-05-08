package com.example.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(classes = { com.example.config.RootConfig.class,
								  com.example.config.ServletConfig.class})
@Log4j
public class MemberControllerTest {

	@Setter(onMethod_ = { @Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc; //가짜 mvc-url과 파라미터를 브라우저 사용처럼 만들어 컨트롤러 실행
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test //1.입력 테스트
	public void testRegister() throws Exception {
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders
											.post("/member/join")
											.param("id", "slwhfkf")
											.param("m_name", "자리야")
											.param("password", "rlawls18")
											.param("gender", "여")
											.param("phone", "010-8972-2559")
											.param("region", "부산")
											.param("email", "e@t"))
									.andReturn()
									.getModelAndView()
									.getViewName();
		log.info(resultPage);
	}
	
//	@Test //2.조회 테스트
	public void tetGet() throws Exception {
		
		log.info(mockMvc.perform(MockMvcRequestBuilders
								 .get("/member/get")
								 .param("id", "slwhfkf"))
						.andReturn()
						.getModelAndView()
						.getModelMap()
				);								
	}
	
//	@Test //3.수정 테스트
	public void testModify() throws Exception {
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders
											.post("/member/modify")
											.param("id", "slwhfkf")
											.param("m_name", "자리세")
											.param("password", "rlawls18")
											.param("gender", "남")
											.param("phone", "010-8972-2559")
											.param("region", "서울")
											.param("email", "e@t")
											.param("author", "관리자")
											.param("report_num", "3"))
									.andReturn()
									.getModelAndView()
									.getViewName();
		log.info(resultPage);
	}
	
//	@Test //4.삭제 테스트
	public void testRemove() throws Exception {
		// 삭제 전 데이터베이스에 게시물 번호로 확인할 것
		String resultPage = mockMvc.perform(MockMvcRequestBuilders
											.post("/member/remove")
											.param("id", "slwhfkf"))
								   .andReturn()
								   .getModelAndView()
								   .getViewName();
		log.info(resultPage);							
	}
		
//	@Test
//	public void testListPaging() throws Exception {
//		
//		log.info(mockMvc.perform(
//				MockMvcRequestBuilders.get("/member/list")
//				.param("pageNum", "1")				
//				.param("amount", "5"))
//				.andReturn().getModelAndView().getModelMap());
//	}
}
