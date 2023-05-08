package com.example.service;

import java.util.ArrayList;

import com.example.domain.MessageVO;

public interface MessageService {

	public ArrayList<MessageVO> messageList(MessageVO to);
	
	public ArrayList<MessageVO> roomContentList(MessageVO to);
	
	public int messageSendInlist(MessageVO to);
	
	
}
