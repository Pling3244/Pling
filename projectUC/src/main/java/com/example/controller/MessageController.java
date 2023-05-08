package com.example.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.MessageVO;
import com.example.service.MessageService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/message/*")
@AllArgsConstructor
public class MessageController {
	
	
		@Autowired
		private MessageService service;

		// 메세지 목록
		@RequestMapping(value = "/messageList.do")
		public String message_list(HttpServletRequest request, HttpSession session) {
			// System.out.println("현대 사용자 nick : " + session.getAttribute("nick"));

			String nick = (String) session.getAttribute("nick");

			MessageVO to = new MessageVO();
			to.setNick(nick);

			// 메세지 리스트
			ArrayList<MessageVO> list = service.messageList(to);

			request.setAttribute("list", list);

			return "message/messageList";
		}

		// 메세지 목록
		@RequestMapping(value = "/messageAjax.do")
		public String message_ajax_list(HttpServletRequest request, HttpSession session) {
			// System.out.println("현대 사용자 nick : " + session.getAttribute("nick"));

			String nick = (String) session.getAttribute("nick");

			MessageVO to = new MessageVO();
			to.setNick(nick);

			// 메세지 리스트
			ArrayList<MessageVO> list = service.messageList(to);

			request.setAttribute("list", list);

			return "message/message_ajax_list";
		}

		@RequestMapping(value = "/messageContent.do")
		public String message_content_list(HttpServletRequest request, HttpSession session) {

			int room = Integer.parseInt(request.getParameter("room"));

			MessageVO to = new MessageVO();
			to.setRoom(room);
			to.setNick((String) session.getAttribute("nick"));

			// 메세지 내용을 가져온다.
			ArrayList<MessageVO> clist = service.roomContentList(to);

			request.setAttribute("clist", clist);

			return "message/message_content_list";
		}

		// 메세지 리스트에서 메세지 보내기
		@ResponseBody
		@RequestMapping(value = "/message_send_inlist.do")
		public int message_send_inlist(@RequestParam int room, @RequestParam String other_nick,
				@RequestParam String content, HttpSession session) {

			MessageVO to = new MessageVO();
			to.setRoom(room);
			to.setSend_nick((String) session.getAttribute("nick"));
			to.setRecv_nick(other_nick);
			to.setContent(content);

			int flag = service.messageSendInlist(to);

			return flag;
		}

	}	