package com.springCareer.mapper;

import java.util.List;

import com.springCareer.domain.Criteria;
import com.springCareer.domain.FreeBoardVO;


public interface FreeBoardMapper {
	/* @Select("select * from tbl_board where post_id>0") */
	public List<FreeBoardVO> getList();
	
	public List<FreeBoardVO> getListWithPaging(Criteria cri);

	public void insert(FreeBoardVO board);
	
	public FreeBoardVO read(Long post_id);
	
	public int delete(Long post_id);
	
	public int update(FreeBoardVO board);
}
