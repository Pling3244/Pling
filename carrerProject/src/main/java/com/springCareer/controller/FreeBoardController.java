package com.springCareer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.springCareer.domain.FreeBoardVO;
import com.springCareer.service.FreeBoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class FreeBoardController {
	
	private FreeBoardService service;
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@GetMapping("/list")	//1. select 전체 list
	public void list(Model model) {
		log.info("list");
		model.addAttribute("list",service.getList());
	}
	
	@PostMapping("/register")	//2.입력 insert
	public String register(FreeBoardVO board, RedirectAttributes rttr) {
		log.info("register: " + board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getPost_id());
		return "redirect:/board/list";
	}
	
//	@GetMapping("/get")		//3.검색 select
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("post_id") Long post_id, Model model) {
		log.info("/get");
		model.addAttribute("board", service.get(post_id));
	}
	
	@PostMapping("/modify")		//4.수정
	public String modify(FreeBoardVO board, RedirectAttributes rttr) {
		log.info("modify:"+board);
		
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}
	
//	@PostMapping("/remove")		//5.삭제
//	@GetMapping("/remove")		//5.삭제
	@RequestMapping(value="/remove", method= {RequestMethod.GET, RequestMethod.POST})
	public String remove(@RequestParam("post_id") Long post_id, RedirectAttributes rttr) {
		log.info("remove..."+post_id);
		if(service.remove(post_id)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}
}
