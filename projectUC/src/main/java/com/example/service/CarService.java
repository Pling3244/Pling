package com.example.service;

import java.util.List;

import com.example.domain.CarVO;
import com.example.domain.CateVO;
import com.example.domain.Criteria;

public interface CarService {

	/* 차량 등록 */
	public void register(CarVO car);	
	
	/* 상품 리스트 */
	public List<CarVO> goodsGetList(Criteria cri);
	
	/* 상품 총 개수 */
	public int goodsGetTotal(Criteria cri);	
	
	/* 상품 정보 */
	public CarVO getGoodsInfo(int num);
	
	/* 상품 수정 */
	public int goodsModify(CarVO car);
	
	/* 상품 정보 삭제 */
	public int goodsDelete(int num);
	
	/* 카테고리 리스트 */
	public List<CateVO> cateList();
	
	/* 검색 기능 */
	public List<CarVO> searchList(CarVO car, Criteria cri);

}
