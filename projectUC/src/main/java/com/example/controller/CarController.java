package com.example.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.domain.CarVO;
import com.example.domain.Criteria;
import com.example.domain.ImageVO;
import com.example.domain.PageVO;
import com.example.service.AttachService;
import com.example.service.CarService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

@Controller
@Log4j
@RequestMapping("/carlist/*")
@AllArgsConstructor
public class CarController {

	private static final Logger logger = LoggerFactory.getLogger(CarController.class);

	@Autowired
	private CarService service;
	private AttachService AttachService;
	

	/* 상품목록 페이지 접속 */
	@RequestMapping(value = "goods", method = RequestMethod.GET)
	public void goodsGET(Criteria cri, Model model) throws Exception{
	
		logger.info("상품목록 페이지 접속");
		
		/* 상품 리스트 데이터 */
		List list = service.goodsGetList(cri);
		
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
		} else {
			model.addAttribute("listCheck", "empty");
			return;
		}
		
//		/* 검색 데이터 */
//		List search = service.searchList(car);
//		
//		model.addAttribute("search", search);
						
		/* 페이지 인터페이스 데이터 */
		model.addAttribute("pageMaker", new PageVO(cri, service.goodsGetTotal(cri)));
	}
	
	/* 상품 검색 */
	@RequestMapping(value="search",  method = RequestMethod.GET)
	public String searchGoodsGET(CarVO car, Criteria cri, Model model) throws Exception {
		
		logger.info("car, cri : " + car + cri);
		
		List<CarVO> list = service.searchList(car, cri);
		logger.info("pre list : " + list);
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
			logger.info("list : " + list);
		} else {
			model.addAttribute("listcheck", "empty");
						
		}

		model.addAttribute("pageMaker", new PageVO(cri, service.goodsGetTotal(cri)));
		
		ObjectMapper objl = new ObjectMapper();
		
		List list1 = service.cateList();
		
		String cateList = objl.writeValueAsString(list1);
		
		model.addAttribute("cateList", cateList);
		
		return "carlist/search";
				
	}	
	
	/* 상품 상세 */
	@GetMapping("/goodsDetail/{num}")
	public String goodsDetailGET(@PathVariable("num")int num, Model model) {
		
		logger.info("goodsDetailGET()..........");
		
		model.addAttribute("goodsInfo", service.getGoodsInfo(num));
		
		return "/carlist/goodsDetail";
	}
	
	/* 차량수정 페이지 이동 */
	@RequestMapping(value = "goodsModify", method = RequestMethod.GET)
	public void updateGET(int num, Model model) throws JsonProcessingException {
											
		logger.info("판매수정 페이지 진입");
		
		ObjectMapper obj2 = new ObjectMapper();
										
		model.addAttribute("cateList", obj2.writeValueAsString(service.cateList()));
		
		model.addAttribute("goodsInfo", service.getGoodsInfo(num));
		
	}

	/* 상품 정보 수정 */
	@PostMapping("/goodsModify")
	public String goodsModifyPOST(CarVO car, RedirectAttributes rttr) {
		
		logger.info("goodsModifyPOST.........." + car);
		
		int result = service.goodsModify(car);
		
		rttr.addFlashAttribute("modify_result", result);
		
		return "redirect:/carlist/search";		
		
	}
	
	/* 상품 정보 삭제 */
	@PostMapping("/goodsDelete")
	public String goodsDeletePOST(int num, RedirectAttributes rttr) {
		
		logger.info("goodsDeletePOST..........");
		
		int result = service.goodsDelete(num);
		
		rttr.addFlashAttribute("delete_result", result);
		
		return "redirect:/carlist/search";
		
	}
	
	/* 차량등록 페이지 이동 */
	@RequestMapping(value = "carRegist", method = RequestMethod.GET)
	public void carRegistGET(Model model) throws Exception {

		logger.info("판매등록 페이지 진입");
		
		ObjectMapper objm = new ObjectMapper();
		
		List list = service.cateList();
		
		String cateList = objm.writeValueAsString(list);
		
		model.addAttribute("cateList", cateList);
		
//		logger.info("변경 전.........." + list);
//		logger.info("변경 후.........." + cateList);

	}

	/* 차량 등록 */
	@Transactional
	@RequestMapping(value = "carRegist", method = RequestMethod.POST)
	public String carRegistPOST(CarVO car, RedirectAttributes rttr) throws Exception {

		logger.info("carPOST......" + car);

		service.register(car);

		rttr.addFlashAttribute("regist_result", car.getNum());

		return "redirect:/carlist/search";
	}

	/* 첨부 파일 업로드 */
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<ImageVO>> uploadAjaxActionPOST(MultipartFile[] car_img) {

		logger.info("uploadAjaxActionPOST..........");

		/* 이미지 파일 체크 */
		for (MultipartFile multipartFile : car_img) {

			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;

			try {
				type = Files.probeContentType(checkfile.toPath());
				logger.info("MIME TYPE : " + type);
			} catch (IOException e) {
				e.printStackTrace();
			}

			if (!type.startsWith("image")) {

				List<ImageVO> list = null;

				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
			}
		}

		String uploadFolder = "C:\\Users\\admin\\git\\project\\projectUC\\src\\main\\webapp\\resources\\upload";

		/* 날짜 폴더 경로 */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		String datePath = str.replace("-", File.separator);

		/* 폴더 생성 */
		File uploadPath = new File(uploadFolder, datePath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		/* 이미지 정보 담는 객체 */
		List<ImageVO> list = new ArrayList();

		// 향상된 for
		for (MultipartFile multipartFile : car_img) {
					
			/* 이미지 정보 객체 */
			ImageVO vo = new ImageVO();

			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();
			vo.setFileName(uploadFileName);
			vo.setUploadPath(datePath);

			/* uuid 적용 파일 이름 */
			String uuid = UUID.randomUUID().toString();
			vo.setUuid(uuid);

			uploadFileName = uuid + "_" + uploadFileName;

			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);

			/* 파일 저장 */
			try {
				multipartFile.transferTo(saveFile);

				/* 썸네일 생성 */
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);

				BufferedImage bo_image = ImageIO.read(saveFile);

				// 비율
				double ratio = 3;
				// 넓이 높이
				int width = (int) (bo_image.getWidth() / ratio);
				int height = (int) (bo_image.getHeight() / ratio);

				Thumbnails.of(saveFile).size(width, height).toFile(thumbnailFile);

			} catch (Exception e) {
				e.printStackTrace();
			}
			list.add(vo);
		}
		ResponseEntity<List<ImageVO>> result = new ResponseEntity<List<ImageVO>>(list, HttpStatus.OK);
		
		return result;
	}

	/* 이미지 출력 */
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getImage(String fileName) {

		logger.info("getImage()........" + fileName);

		File file = new File(
				"C:\\Users\\admin\\git\\project\\projectUC\\src\\main\\webapp\\resources\\upload\\" + fileName);

		ResponseEntity<byte[]> result = null;

		try {

			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-type", Files.probeContentType(file.toPath()));

			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);

		} catch (IOException e) {
			e.printStackTrace();
		}

		return result;
	}
	
	/* 이미지 파일 삭제 */
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName){
		
		logger.info("deleteFile........" + fileName);
		
		File file = null;
		
		try {
			/* 썸네일 파일 삭제 */
			file = new File("C:\\\\Users\\\\admin\\\\git\\\\project\\\\projectUC\\\\src\\\\main\\\\webapp\\\\resources\\\\upload\\\\" + URLDecoder.decode(fileName, "UTF-8"));
			
			file.delete();
			
			/* 원본 파일 삭제 */
			String originFileName = file.getAbsolutePath().replaceAll("s_", "");
			
			logger.info("originFileName : " + originFileName);
			
			file = new File(originFileName);
			
			file.delete();
			
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
			
		}
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	/* 이미지 정보 반환 */
	@GetMapping(value="getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<ImageVO>> getAttachList(int num){
		
		logger.info("getAttachList.........." + num);
		
		return new ResponseEntity<List<ImageVO>>(AttachService.getAttachList(num), HttpStatus.OK);
		
	}
}