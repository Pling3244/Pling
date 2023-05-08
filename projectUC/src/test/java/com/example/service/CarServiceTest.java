package com.example.service;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.domain.CarVO;
import com.example.domain.Criteria;
import com.example.domain.ImageVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.example.config.RootConfig.class})
@Log4j
public class CarServiceTest {

	@Setter(onMethod_ = @Autowired)
	private CarService service ;
		
	/* 차량 등록 & 차량 이미지 등록 테스트 */
//	@Test
	public void CarEnrollTEsts() {

		CarVO car = new CarVO();
		// 상품 정보
		car.setCop_name("현대");
		car.setBr_name("그랜져");
		car.setCar_name("GV80");
		car.setPrice("1000");
		car.setMileage("12000");
		car.setModel_year(2020);
		car.setFuel_type("가솔린");
		car.setColor("검정");
		car.setRegion("부산");
		car.setNumber_p(5);
		car.setSeller("김캇트");
		car.setUc_text("낙장불입");
		car.setOwner("실차주");

		// 이미지 정보
		List<ImageVO> imageList = new ArrayList<ImageVO>(); 
		
		ImageVO image1 = new ImageVO();
		ImageVO image2 = new ImageVO();
		
		image1.setFileName("test Image 1");
		image1.setUploadPath("test image 1");
		image1.setUuid("test1111");
		
		image2.setFileName("test Image 2");
		image2.setUploadPath("test image 2");
		image2.setUuid("test2222");
		
		imageList.add(image1);
		imageList.add(image2);
		
		car.setImageList(imageList);        
		
		// CarEnroll() 메서드 호출
		service.register(car);
		
		System.out.println("등록된 VO : " + car);
		
		
	}
	
//	@Test
    public void carRegistTest() throws Exception {
 
        CarVO car = new CarVO();
        
        car.setCop_name("현대");
		car.setBr_name("그랜져");
		car.setCar_name("GV80");
		car.setPrice("1000");
		car.setMileage("12000");
		car.setModel_year(2020);
		car.setFuel_type("가솔린");
		car.setColor("검정");
		car.setRegion("부산");
		car.setNumber_p(5);
		car.setSeller("김캇트");
		car.setUc_text("낙장불입");
		car.setOwner("실차주");
        
        service.register(car);
        
    }

    /*상품 상세 정보*/
//	@Test
	public void getGoodsInfoTest() {
		
		int num = 19;
		
		CarVO goodsInfo = service.getGoodsInfo(num);
		
		System.out.println("==결과==");
		System.out.println("전체 : " + goodsInfo);
		System.out.println("bookId : " + goodsInfo.getNum() );
		System.out.println("이미지 정보 : " + goodsInfo.getImageList().isEmpty());
}
	
	/* 검색 기능 */
	@Test
	public void searchListTest() throws Exception{
		
		Criteria cri = new Criteria();
		CarVO car = new CarVO();		
		
//		car.setCop_name("100000");
		
//		car.setRegion("서울");
		
		List<CarVO> list = service.searchList(car, cri);
						
		System.out.println("result......." + list);
	}
}