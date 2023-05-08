package com.example.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.CarVO;
import com.example.domain.CateVO;
import com.example.domain.Criteria;
import com.example.mapper.AttachMapper;
import com.example.mapper.CarMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class CarServiceImpl implements CarService {
	
	private CarMapper mapper;
	private AttachMapper attachmapper;
	
	/* 차량 등록 */
	@Transactional
	@Override
	public void register(CarVO car) {
		
		log.info("(service)carRegist........" + car);
		
		mapper.insert(car);
		
		if(car.getImageList() == null || car.getImageList().size() <= 0) {
			return;
		}
		
		car.getImageList().forEach(attach ->{
			
			attach.setNum(car.getNum());
			mapper.imageEnroll(attach);
			
		});
	}
	
	/* 상품 리스트 */
	@Override
	public List<CarVO> goodsGetList(Criteria cri) {
		log.info("goodsGetTotalList()..........");
		return mapper.goodsGetList(cri);
	}

	/* 상품 총 갯수 */
	public int goodsGetTotal(Criteria cri) {
		log.info("goodsGetTotal().........");
		return mapper.goodsGetTotal(cri);
	}
	
	/* 상품 정보 */
	@Override
	public CarVO getGoodsInfo(int num) {
		
		CarVO goodsInfo = mapper.getGoodsInfo(num);
		goodsInfo.setImageList(attachmapper.getAttachList(num));
		
		return goodsInfo;
}
	
	/* 상품 정보 수정 */
	@Transactional
	@Override
	public int goodsModify(CarVO car) {
		
		int result = mapper.goodsModify(car);
		
		if(result == 1 && car.getImageList() != null && car.getImageList().size() > 0) {
			
			mapper.deleteImageAll(car.getNum());
			
			car.getImageList().forEach(attach -> {
				
				attach.setNum(car.getNum());
				mapper.imageEnroll(attach);
				
			});			
		}
		
		return result;
	}
	
	/* 상품 정보 삭제 */
	@Transactional
	public int goodsDelete(int num) {

		log.info("goodsDelete..........");
		
		mapper.deleteImageAll(num);
		
		return mapper.goodsDelete(num);
	}	
	
	/* 카테고리 리스트 */
	@Override
	public List<CateVO> cateList() {
		
		log.info("(service)cateList........");
		
		return mapper.cateList();
	}
	
	/* 검색 기능 */
	@Override
	public List<CarVO> searchList(CarVO car, Criteria cri) {
		log.info("searchList()..........");
		return mapper.searchList(car, cri);
	}
}