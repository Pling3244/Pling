package com.example.service;

import java.util.List;

import com.example.domain.ImageVO;

public interface AttachService {

	/* 이미지 데이터 반환 */
	public List<ImageVO> getAttachList(int num);
}
