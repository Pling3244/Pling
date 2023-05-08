package com.example.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class Criteria {

	/* 현재 페이지 번호 */
	private int pageNum;
	
	/* 페이지 표시 개수 */
	private int amount;
	
	/* 검색 타입 */
	private String type;
	
	/* 검색 키워드 */
	private String keyword;
	
	/* Criteria 기본 생성자 */
	public Criteria() {
		this(1, 10);
	}
	
	/* Criteria 생성자 */
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}	
	
	/* 검색 타입 데이터 배열 변환 */
    public String[] getTypeArr() {
        return type == null? new String[] {}:type.split("");
    }
}
