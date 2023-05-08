package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.CarVO;
import com.example.domain.CateVO;
import com.example.domain.Criteria;
import com.example.domain.ImageVO;

public interface CarMapper {

	/* 차량 등록 */
	public void insert(CarVO car);
	
	/* 이미지 등록 */
	public void imageEnroll(ImageVO vo);

	/* 차량 리스트 */
	public List<CarVO> goodsGetList(Criteria cri);
	
	/* 차량 총 대수 */
	public int goodsGetTotal(Criteria cri);
	
	/* 상품 정보 */
	public CarVO getGoodsInfo(int num);
	
	/* 상품 수정 */
	public int goodsModify(CarVO car);
	
	/* 지정 상품 이미지 전체 삭제 */
	public void deleteImageAll(int num);
	
	/* 상품 정보 삭제 */
	public int goodsDelete(int num);
	
	/* 카테고리 리스트 */
	public List<CateVO> cateList();
	
	/* 검색 기능 */
	public List<CarVO> searchList(@Param("car") CarVO car, @Param("cri") Criteria cri);	
	
//	/* 검색 대상 카테고리 리스트 */
//	public String[] getCateList(Criteria cri);
//	
//	/* 카테고리 정보(+검색대상 갯수) */
//	public CateFilterVO getCateInfo(Criteria cri);
	
}
