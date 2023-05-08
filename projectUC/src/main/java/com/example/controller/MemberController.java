package com.example.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.domain.MemberVO;
import com.example.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {

	
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService service;
	
	//회원가입 페이지 이동
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public void joinGET() {
		
		logger.info("회원가입 페이지 진입");
		
	}
	
	//회원가입
	    @ResponseBody 
		@RequestMapping(value="join", method=RequestMethod.POST)
		public String joinPOST(MemberVO member) throws Exception{
			
			logger.info("join 진입");
			
			// 회원가입 서비스 실행
			service.register(member);
			
			logger.info("join Service 성공");
			
			String message = "<script>alert('Join Complete!');location.href='/member/login';</script>";
			
			return message;
//			return "redirect:/member/login";
			
		}	
		
	//로그인 페이지 이동
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void loginGET() {
		
		logger.info("로그인 페이지 진입");
		
	}
	
	// 아이디 중복 검사
		@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
		@ResponseBody
		public String memberIdChkPOST(String id) throws Exception{
			
			logger.info("memberIdChk() 진입");
			
			int result = service.idCheck(id);
			
			logger.info("결과값 = " + result);
			
			if(result != 0) {
				
				return "fail";	// 중복 아이디가 존재
				
			} else {
				
				return "success";	// 중복 아이디 x
				
			}				
		} // memberIdChkPOST() 종료
	
	/* 로그인 */
    @RequestMapping(value="login", method=RequestMethod.POST)
    public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception{
        
//    	logger.info("login 메서드 진입");
//    	logger.info("전달된 데이터 : " + member);
    	
    	HttpSession session = request.getSession();
    	MemberVO lvo = service.get(member);
    	
    	if(lvo == null) {                                // 일치하지 않는 아이디, 비밀번호 입력 경우
            
            int result = 0;
            rttr.addFlashAttribute("result", result);
            return "redirect:/member/login";
            
        }
        
        session.setAttribute("member", lvo);             // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
        return "redirect:/main";
    }
    
    /* 로그아웃 */
    @RequestMapping(value="logout.do", method=RequestMethod.GET)
    public String logoutMainGET(HttpServletRequest request) throws Exception{
        
    	logger.info("logoutMainGET메서드 진입");
        
        HttpSession session = request.getSession();
        
        session.invalidate();
        
        return "redirect:/main";
    }
	
	
    
//	@GetMapping("/register")
//	public void register() {
//		
//	}
	
	@GetMapping("/list") //1.목록 조회
	public void list(Model model) {
		log.info("list");
		model.addAttribute("list", service.getList());
	}
//	public void list(Criteria cri, Model model) {
//		
//	log.info("list: " + cri);
//	model.addAttribute("list", service.getList(cri));
//	}
	
//	@PostMapping("/register") //2.입력
//	public String register(MemberVO member, RedirectAttributes rttr) {
//		
//		log.info("register: " + member);
//		service.register(member);
//		rttr.addFlashAttribute("result", member.getId());
//		return "redirect:/member/list";
//	}
//	
	
	
//	@GetMapping({"/get", "/modify"}) //3.검색
//	public void get(@RequestParam("id") String id, Model model) {
//		log.info("/get");
//		model.addAttribute("member", service.get(id));
//	}
	
	@PostMapping("/modify") //4.수정
	public String modify(MemberVO member, RedirectAttributes rttr) {
		log.info("modify: " + member);
		
		if (service.modify(member)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/member/list";
	}
	
//	@PostMapping("/remove") //5.삭제
//	@GetMapping("/remove") //5.삭제
	@RequestMapping(value = "/remove", method = { RequestMethod.GET, RequestMethod.POST })
	public String remove(@RequestParam("id") String id, RedirectAttributes rttr) {
		
		log.info("remove..." + id);
		if (service.remove(id)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/member/list";
		
	}
}
