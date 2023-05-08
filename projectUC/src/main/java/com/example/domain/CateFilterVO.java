package com.example.domain;

import lombok.Data;

@Data
public class CateFilterVO {

	/* 카테고리 이름 */
	private String cateName;
	
	/* 카테고리 넘버 */
	private String cateCode;;
	
	/* 카테고리 상품 수 */
	private int cateCount;
}
