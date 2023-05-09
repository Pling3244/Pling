package com.springCareer.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.springCareer.domain.Criteria;
import com.springCareer.domain.FreeBoardVO;
import com.springCareer.mapper.FreeBoardMapper;

import lombok.AllArgsConstructor;
//import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class FreeBoardServiceImpl implements FreeBoardService {
	//@Setter(onMethod_ = @Autowired) 대신 -> @AllArgsConstructor
	private FreeBoardMapper mapper;
	
	@Override //c
	public void register(FreeBoardVO board) {
		log.info("register......" + board);
		mapper.insert(board);
	}

	@Override //r
	public FreeBoardVO get(Long post_id) {
		log.info("get......" + post_id);
		return mapper.read(post_id);
	}

	@Override //u
	public boolean modify(FreeBoardVO board) {
		log.info("modify......" + board);
		return mapper.update(board) == 1;
	}

	@Override //d
	public boolean remove(Long post_id) {
		log.info("remove......" + post_id);
		return mapper.delete(post_id) == 1;
	}

	@Override
	public List<FreeBoardVO> getList() {
		log.info("getList......");
		return mapper.getList();
	}

	@Override
	public List<FreeBoardVO> getList(Criteria cri) {
		log.info("getList with Criteria: "+cri);
		return mapper.getListWithPaging(cri);
	}
	

//	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}

}
