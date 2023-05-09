package com.springCareer.service;

import java.util.List;

import com.springCareer.domain.Criteria;
import com.springCareer.domain.FreeBoardVO;

public interface FreeBoardService {
	public void register(FreeBoardVO board); //c
	
	public FreeBoardVO get(Long post_id); //r
	
	public boolean modify(FreeBoardVO board); //u
	
	public boolean remove(Long post_id); //d
	
	public List<FreeBoardVO> getList(); //배열로 들고옴
	
	public List<FreeBoardVO> getList(Criteria cri); //조건배열로 들고옴
	
	//추가
//	public int getTotal(Criteria cri);
}
