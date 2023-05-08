<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<%@ include file="../include/modal.jsp"%>
<%@ include file="../include/header.jsp"%>

<style type="text/css">
	#result_card img{
		max-width: 100%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
	#result_card {
		position: relative;
	}
	.ck_warn{						
/* 입력란 공란 경고 태그 */
	display: none;
    padding-top: 10px;
    text-align: center;
    color: #e05757;
    font-weight: 300;    
}	
</style>

<c:if test="${member == null }">
	<script>
	 	alert("로그인 하신 후에 사용해주세요");
	 	location.href="/member/login";
	</script>
</c:if>

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous">  </script>

<body class="bg-gradient-dark">

	<%@ include file="../include/content_topbar.jsp"%>

	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h1 text-gray-900 mb-4">중고차 판매수정</h1>
							</div>
							<form name='form' id="modify_form" method="post"
								enctype="multipart/form-data">
<%-- 								<input name="num" type="hidden" value="${goodInfo.num}"> --%>
<%-- 								<input name="seller" type="hidden" value="${member.id}"> --%>
								<div class="form-group row">
									<b>회사명</b>
									<div class="col-sm-6 mb-3 mb-sm-0">
										<select name="cop_name" class="form-control form-control-user cate1">
											<option selected value="">--회사명--</option> 											
										</select>
									</div>
									<span class="ck_warn cop_name_warn">회사명을 선택해주세요.</span>
								</div>
								<div class="form-group row">
									<b>브랜드명</b>
									<div class="col-sm-6 mb-3 mb-sm-0 ">
										<select name="br_name" class="form-control form-control-user cate2">
											<option selected value="">--브랜드명--</option>
										</select>
									</div>
									<span class="ck_warn br_name_warn">브랜드를 선택해주세요.</span>
								</div>
								<div class="form-group  row">
									<b>차량모델명</b>
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input name="car_name" type="text"
											class="form-control form-control-user"
											value="<c:out value='${goodsInfo.car_name}'></c:out>">
									</div>
									<span class="ck_warn car_name_warn">모델명을 입력해주세요.</span>
								</div>
								<div class="form-group  row">
									<b>차량연식(년)</b>
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input name="model_year" type="text"
											class="form-control form-control-user" value="<c:out value='${goodsInfo.model_year}'></c:out>">
									</div>
									<span class="ck_warn model_year_warn">연식을 입력해주세요.</span>
								</div>
								<div class="form-group  row">
									<b>주행거리(Km)</b>
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input name="mileage" type="text"
											class="form-control form-control-user"
											value="<c:out value='${goodsInfo.mileage}'></c:out>">
									</div>
									<span class="ck_warn mileage_warn">주행거리를 입력해주세요.</span>
								</div>
								<div class="form-group  row">
									<b>승차정원(인)</b>
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input name="number_p" type="text"
											class="form-control form-control-user" value="<c:out value='${goodsInfo.number_p}'></c:out>">
									</div>
									<span class="ck_warn number_p_warn">승차정원을 입력해주세요.</span>
								</div>
								<div class="form-group  row">
									<b>연료타입</b>
									<div class="col-sm-6 mb-3 mb-sm-0">
										<select name="fuel_type"
											class="form-control form-control-user">
											<option value="">--연료타입--</option>
											<option value="가솔린" <c:out value="${goodsInfo.fuel_type eq '가솔린' ?'selected':''}"/>>가솔린</option>
											<option value="디젤" <c:out value="${goodsInfo.fuel_type eq '디젤' ?'selected':''}"/>>디젤</option>
											<option value="LPG" <c:out value="${goodsInfo.fuel_type eq 'LPG' ?'selected':''}"/>>LPG</option>
											<option value="하이브리드" <c:out value="${goodsInfo.fuel_type eq '하이브리드' ?'selected':''}"/>>하이브리드</option>
											<option value="전기" <c:out value="${goodsInfo.fuel_type eq '전기' ?'selected':''}"/>>전기</option>
											<option value="기타" <c:out value="${goodsInfo.fuel_type eq '기타' ?'selected':''}"/>>기타</option>
										</select>
									</div>
									<span class="ck_warn fuel_type_warn">연료타입을 선택해주세요.</span>
								</div>
								<div class="form-group  row">
									<b>차량색상</b>
									<div class="col-sm-6 mb-3 mb-sm-0">
										<select name="color" class="form-control form-control-user">
											<option value="">--차량색상--</option>
											<option value="검정색" <c:out value="${goodsInfo.color eq '검정색' ?'selected':''}"/>>검정색</option>
											<option value="흰색" <c:out value="${goodsInfo.color eq '흰색' ?'selected':''}"/>>흰색</option>
											<option value="은색" <c:out value="${goodsInfo.color eq '은색' ?'selected':''}"/>>은색</option>
											<option value="회색" <c:out value="${goodsInfo.color eq '회색' ?'selected':''}"/>>회색</option>
											<option value="빨간색" <c:out value="${goodsInfo.color eq '빨간색' ?'selected':''}"/>>빨간색</option>
											<option value="파란색" <c:out value="${goodsInfo.color eq '파란색' ?'selected':''}"/>>파란색</option>
											<option value="주황색" <c:out value="${goodsInfo.color eq '주황색' ?'selected':''}"/>>주황색</option>
											<option value="갈색" <c:out value="${goodsInfo.color eq '갈색' ?'selected':''}"/>>갈색</option>
											<option value="초록색" <c:out value="${goodsInfo.color eq '초록색' ?'selected':''}"/>>초록색</option>
											<option value="노란색" <c:out value="${goodsInfo.color eq '노란색' ?'selected':''}"/>>노란색</option>
											<option value="보라색" <c:out value="${goodsInfo.color eq '보라색' ?'selected':''}"/>>보라색</option>
											<option value="기타" <c:out value="${goodsInfo.color eq '기타' ?'selected':''}"/>>기타</option>
										</select>
									</div>
									<span class="ck_warn color_warn">차량색상을 선택해주세요.</span>
								</div>
								<div class="form-group  row">
									<b>매매지역</b>
									<div class="col-sm-6 mb-3 mb-sm-0">
										<select name="region" class="form-control form-control-user">
											<option value="">--매매지역--</option>
											<option value="서울" <c:out value="${goodsInfo.region eq '서울' ?'selected':''}"/>>서울</option>
											<option value="인천" <c:out value="${goodsInfo.region eq '인천' ?'selected':''}"/>>인천</option>
											<option value="대전" <c:out value="${goodsInfo.region eq '대전' ?'selected':''}"/>>대전</option>
											<option value="대구" <c:out value="${goodsInfo.region eq '대구' ?'selected':''}"/>>대구</option>
											<option value="광주" <c:out value="${goodsInfo.region eq '광주' ?'selected':''}"/>>광주</option>
											<option value="부산" <c:out value="${goodsInfo.region eq '부산' ?'selected':''}"/>>부산</option>
											<option value="울산" <c:out value="${goodsInfo.region eq '울산' ?'selected':''}"/>>울산</option>
											<option value="세종" <c:out value="${goodsInfo.region eq '세종' ?'selected':''}"/>>세종</option>
											<option value="경기" <c:out value="${goodsInfo.region eq '경기' ?'selected':''}"/>>경기</option>
											<option value="강원" <c:out value="${goodsInfo.region eq '강원' ?'selected':''}"/>>강원</option>
											<option value="경남" <c:out value="${goodsInfo.region eq '경남' ?'selected':''}"/>>경남</option>
											<option value="경북" <c:out value="${goodsInfo.region eq '경북' ?'selected':''}"/>>경북</option>
											<option value="전남" <c:out value="${goodsInfo.region eq '전남' ?'selected':''}"/>>전남</option>
											<option value="전북" <c:out value="${goodsInfo.region eq '전북' ?'selected':''}"/>>전북</option>
											<option value="충남" <c:out value="${goodsInfo.region eq '충남' ?'selected':''}"/>>충남</option>
											<option value="충북" <c:out value="${goodsInfo.region eq '충북' ?'selected':''}"/>>충북</option>
											<option value="제주" <c:out value="${goodsInfo.region eq '제주' ?'selected':''}"/>>제주</option>
											<option value="기타" <c:out value="${goodsInfo.region eq '기타' ?'selected':''}"/>>기타</option>
										</select>
									</div>
									<span class="ck_warn region_warn">매매지역을 선택해주세요.</span>
								</div>
								<div class="form-group  row">
									<div class="col-sm-5">
										<input name="owner" type="radio" value="실차주" <c:out value="${goodsInfo.owner eq '실차주' ?'checked' : ''}"/>> 실차주 
										<input name="owner" type="radio" value="실차주 아님" <c:out value="${goodsInfo.owner eq '실차주 아님' ?'checked' : ''}"/>> 실차주아님
									</div>
									<span class="ck_warn owner_warn">실차주 여부를 선택해주세요.</span>
								</div>
								<div class="form-group  row">
									<b>판매가격(만원)</b>
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input name="price" type="text"
											class="form-control form-control-user" value="<c:out value='${goodsInfo.price}'></c:out>">
									</div>
									<span class="ck_warn price_warn">판매가격을 입력해주세요.</span>
								</div>
								<div class="form-group row">
									<b>차량사진첨부</b> <input type="file" multiple="multiple"
										id="fileItem" name="car_img" style="height: 30px;">
									<div id="uploadResult"></div>
								</div>
								<div class="form-group row">
									<b>알림사항</b>
									<div class="col-sm-8">
										<textarea name="uc_text" cols="50" rows="5"
											class="form-control"><c:out value='${goodsInfo.uc_text}'/></textarea>
									</div>
								</div>

								<a class="modify_button">
									<button class="btn btn-primary btn-user btn-block">수정</button>
								</a>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
</body>

	<script>
		/* 이미지 업로드 */
		$("input[type='file']").on("change", function(e) {
			
			/* 이미지 존재시 삭제 */
			for (let i = 0; i < $(".imgDeleteBtn").length; i++) {
				deleteFile();
		    }
// 			while($(".imgDeleteBtn").length > 0){
// 				deleteFile();
// 				if ($(".imgDeleteBtn").length == 0 )
// 					break;
// 			}

			let formData = new FormData();
			let fileInput = $('input[name="car_img"]');
			let fileList = fileInput[0].files;
			let fileObj = fileList[0];

			for (let i = 0; i < fileList.length; i++) {
				formData.append("car_img", fileList[i]);
			}

			$.ajax({
				url : '/carlist/uploadAjaxAction',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				dataType : 'json',
				success : function(result) {
					console.log(result);
					showUploadImage(result);
				},
				error : function(result) {
					alert("이미지 파일이 아닙니다.");
				}
			});
		});

		/* var, method related with attachFile */
		let regex = new RegExp("(.*?)\.(jpg|png)$");
		let maxSize = 1048576; //1MB	

		function fileCheck(fileName, fileSize) {

			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}

			if (!regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;

		}
		/* 기존 이미지 출력 */
		
 $(document).ready(function(){

		let num = '<c:out value="${goodsInfo.num}"/>';
		let uploadResult = $("#uploadResult");		
		
		$.getJSON("/carlist/getAttachList", {num : num}, function(arr){
			
			console.log(arr);			
						
			for (let i = 0; i < arr.length; i++) {
			
		    let obj = arr[i];	
			let str = "";			
			
			let fileCallPath = obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName;
			str += "<div id='result_card'";
			str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
			str += ">";
			str += "<img src='/resources/upload/" + fileCallPath +"'>";
			str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'></div>";
			str += "<input type='hidden' name='imageList["+i+"].fileName' value='"+ obj.fileName +"'>";
			str += "<input type='hidden' name='imageList["+i+"].uuid' value='"+ obj.uuid +"'>";
			str += "<input type='hidden' name='imageList["+i+"].uploadPath' value='"+ obj.uploadPath +"'>";				
			str += "</div>";

			uploadResult.append(str);
			}			
		});// GetJSON
});		
		
		/* 이미지 출력 */
		function showUploadImage(uploadResultArr) {			

			/* 전달받은 데이터 검증 */
			if (!uploadResultArr || uploadResultArr.length == 0) {
				return
			}
			
			let uploadResult = $("#uploadResult");

			for (let i = 0; i < uploadResultArr.length; i++) {
			
			let obj = uploadResultArr[i];

			let str = "";

			let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);

			str += "<div id='result_card'>";
			str += "<img src='/carlist/display?fileName=" + fileCallPath + "'>";
			str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'></div>";
			str += "<input type='hidden' name='imageList["+i+"].fileName' value='"+ obj.fileName +"'>";
			str += "<input type='hidden' name='imageList["+i+"].uuid' value='"+ obj.uuid +"'>";
			str += "<input type='hidden' name='imageList["+i+"].uploadPath' value='"+ obj.uploadPath +"'>";
			str += "</div>";
						
			uploadResult.append(str); 
			}
		}
						
		function deleteFile(){
			
			let targetFile = $(".imgDeleteBtn").data("file");
			
			let targetDiv = $("#result_card");
			
			$.ajax({
				url: '/carlist/deleteFile',
				data : {fileName : targetFile},
				dataType : 'text',
				type : 'POST',
				success : function(result){
					console.log(result);
					
					targetDiv.remove();
					$("input[type='file']").val("");
					
				},
				error : function(result){
					console.log(result);
					
					alert("파일을 삭제하지 못하였습니다.")
				}
			});
		}
		
		/* 상품 수정 버튼 */
		$(".modify_button").on("click", function(e) {

			e.preventDefault();
			
			/* 체크 변수 */
			let cop_nameCk = false;
			let br_nameCk = false;
			let car_nameCk = false;
			let model_yearCk = false;
			let mileageCk = false;			
			let number_pCk = false;
			let fuel_typeCk = false;
			let colorCk = false;
			let regionCk = false;
			let ownerCk = false;
			let priceCk = false;
			
			/* 체크 대상 변수 */
			let cop_name = $("select[name='cop_name']").val();
			let br_name = $("select[name='br_name']").val();
			let car_name = $("input[name='car_name']").val();
			let model_year = $("input[name='model_year']").val();
			let mileage = $("input[name='mileage']").val();
			let number_p = $("input[name='number_p']").val();
			let fuel_type = $("select[name='fuel_type']").val();
			let color = $("select[name='color']").val();
			let region = $("select[name='region']").val();
			let owner = $("input[name='owner']:radio:checked").length;
			let price = $("input[name='price']").val();
			
			if(cop_name != ''){
				$(".cop_name_warn").css('display','none');
				cop_nameCk = true;
			} else {
				$(".cop_name_warn").css('display','block');
				cop_nameCk = false;
			}
			
			if(br_name != ''){
				$(".br_name_warn").css('display','none');
				br_nameCk = true;
			} else {
				$(".br_name_warn").css('display','block');
				br_nameCk = false;
			}
			
			if(car_name){
				$(".car_name_warn").css('display','none');
				car_nameCk = true;
			} else {
				$(".car_name_warn").css('display','block');
				car_nameCk = false;
			}	
			
			if(model_year){
				$(".model_year_warn").css('display','none');
				model_yearCk = true;
			} else {
				$(".model_year_warn").css('display','block');
				model_yearCk = false;
			}
			
			if(mileage){
				$(".mileage_warn").css('display','none');
				mileageCk = true;
			} else {
				$(".mileage_warn").css('display','block');
				mileageCk = false;
			}	
			
			if(number_p){
				$(".number_p_warn").css('display','none');
				number_pCk = true;
			} else {
				$(".number_p_warn").css('display','block');
				number_pCk = false;
			}	
			
			if(fuel_type != ''){
				$(".fuel_type_warn").css('display','none');
				fuel_typeCk = true;
			} else {
				$(".fuel_type_warn").css('display','block');
				fuel_typeCk = false;
			}		
			
			if(color != ''){
				$(".color_warn").css('display','none');
				colorCk = true;
			} else {
				$(".color_warn").css('display','block');
				colorCk = false;
			}	
			
			if(region != ''){
				$(".region_warn").css('display','none');
				regionCk = true;
			} else {
				$(".region_warn").css('display','block');
				regionCk = false;
			}
			
			if(owner > 0){
				$(".owner_warn").css('display','none');
				ownerCK = true;
			} else {
				$(".owner_warn").css('display','block');
				ownerCK = false;
			}	
			
			if(price){
				$(".price_warn").css('display','none');
				priceCk = true;
			} else {
				$(".price_warn").css('display','block');
				pricesCk = false;
			}				
			
			if(cop_nameCk && br_nameCk && car_nameCk && model_yearCk && mileageCk && number_pCk && fuel_typeCk && colorCk && regionCk && ownerCK && priceCk ){
				//alert('통과');
			$("#modify_form").submit();
			}
			return false;
		});
		
		/* 카테고리 */

$(document).ready(function(){
	
		let cateList = JSON.parse('${cateList}');
		
		let cate1Array = new Array();
		let cate2Array = new Array();		
		let cate1Obj = new Object();
		let cate2Obj = new Object();
		
		let cateSelect1 = $(".cate1");		
		let cateSelect2 = $(".cate2");
		
		/* 카테고리 배열 초기화 메서드 */
		function makeCateArray(obj,array,cateList, tier){
			for(let i = 0; i < cateList.length; i++){
				if(cateList[i].tier === tier){
					obj = new Object();
					
					obj.cateName = cateList[i].cateName;
					obj.cateCode = cateList[i].cateCode;
					obj.cateParent = cateList[i].cateParent;
					
					array.push(obj);				
					
				}
			}
		}	
		
		/* 배열 초기화 */
		makeCateArray(cate1Obj,cate1Array,cateList,1);
		makeCateArray(cate2Obj,cate2Array,cateList,2);

		let targetCate1 = '${goodsInfo.cop_name}';
		let targetCate2 = '${goodsInfo.br_name}';
		
		/* 중분류 */
		for(let i = 0; i < cate2Array.length; i++){
			if(targetCate2 === cate2Array[i].cateCode){
				targetCate2 = cate2Array[i];
			}
		}// for			
		
		for(let i = 0; i < cate2Array.length; i++){
			if(targetCate2.cateParent === cate2Array[i].cateParent){
				cateSelect2.append("<option value='"+cate2Array[i].cateCode+"'>" + cate2Array[i].cateName + "</option>");
			}
		}				
		
		$(".cate2 option").each(function(i,obj){
			if(targetCate2.cateCode === obj.value){
				$(obj).attr("selected", "selected");
			}
		});
		
		/* 대분류 */
		for(let i = 0; i < cate1Array.length; i++){
			cateSelect1.append("<option value='"+cate1Array[i].cateCode+"'>" + cate1Array[i].cateName + "</option>");
		}	
		
		$(".cate1 option").each(function(i,obj){
			if(targetCate2.cateParent === obj.value){
				$(obj).attr("selected", "selected");
			}
		});	
});
	</script>
	<script>
	
	/* 카테고리 */
	let cateList = JSON.parse('${cateList}');
	
	let cate1Array = new Array();
	let cate2Array = new Array();		
	let cate1Obj = new Object();
	let cate2Obj = new Object();
	
	let cateSelect1 = $(".cate1");		
	let cateSelect2 = $(".cate2");
	
	/* 카테고리 배열 초기화 메서드 */
	function makeCateArray(obj,array,cateList, tier){
		for(let i = 0; i < cateList.length; i++){
			if(cateList[i].tier === tier){
				obj = new Object();
				
				obj.cateName = cateList[i].cateName;
				obj.cateCode = cateList[i].cateCode;
				obj.cateParent = cateList[i].cateParent;
				
				array.push(obj);				
				
			}
		}
	}	
	
	/* 배열 초기화 */
	makeCateArray(cate1Obj,cate1Array,cateList,1);
	makeCateArray(cate2Obj,cate2Array,cateList,2);
	
// 	for(let i = 0; i < cate1Array.length; i++){
// 		cateSelect1.append("<option value='"+cate1Array[i].cateCode+"'>" + cate1Array[i].cateName + "</option>");
// 	}
	
	/* 중분류 <option> 태그 */
	$(cateSelect1).on("change",function(){
		
		let selectVal1 = $(this).find("option:selected").val();	
		
		cateSelect2.children().remove();
		
		cateSelect2.append("<option value=''>--브랜드명--</option>");
		
		for(let i = 0; i < cate2Array.length; i++){
			if(selectVal1 === cate2Array[i].cateParent){
				cateSelect2.append("<option value='"+cate2Array[i].cateCode+"'>" + cate2Array[i].cateName + "</option>");	
			}
		}// for
	});
	</script>	
</html>