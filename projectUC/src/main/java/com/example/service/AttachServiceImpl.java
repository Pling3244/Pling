package com.example.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.domain.ImageVO;
import com.example.mapper.AttachMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AttachServiceImpl implements AttachService {

	private AttachMapper mapper;
	
	/* 이미지 데이터 반환 */
	@Override
	public List<ImageVO> getAttachList(int num) {
		
		log.info("getAttachList.........");
		
		return mapper.getAttachList(num);
	}

}
