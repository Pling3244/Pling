package com.example.controller;


import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.domain.Criteria;
import com.example.service.CarService;

@Controller
public class HomeController {

	
		
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private CarService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}." + locale);
		
//		Date date = new Date();
//		DateFormat dateFormat
//			= DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		model.addAttribute("serverTime", formattedDate);
		return "redirect:/main";
	}
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public void goosTotalGET(Criteria cri, Model model) {
		
		int total = service.goodsGetTotal(cri);
		model.addAttribute("total", total);
	
	}
}


