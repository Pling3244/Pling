package com.example.mapper;

import java.util.List;

import com.example.domain.ImageVO;

public interface AttachMapper {

	/* 이미지 데이터 반환 */
	public List<ImageVO> getAttachList(int num);
	
}
