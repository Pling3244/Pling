<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>

<%@ include file="../include/modal.jsp"%>
<%@ include file="../include/header.jsp"%>

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous">	
</script>
<link href="/resources/css/page.css" rel="stylesheet">

<style type="text/css">
#result_card img {
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
</style>

<body id="page-top">

	<%@ include file="../include/content_topbar.jsp"%>

	<!-- Page Wrapper -->
	<div id="wrapper">
	
	<%@ include file="../include/sidebar.jsp"%>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="column">
		
		<!-- Main Content -->
			<div id="content">

			<!-- Begin Page Content -->
				<div class="container-fluid">
							
					<div class="row">
						<c:if test="${listcheck == 'empty'}">
						<h1>검색 결과가 없습니다.</h1>
						</c:if>
						<c:if test="${listcheck != 'empty'}">
							<!-- Earnings (Monthly) Card Example -->
							<c:forEach items="${list}" var="list">
								<div class="col-xl-3 col-md-6 mb-4">
									<a class="card border-left-primary shadow h-100 py-2" id="move"
										href="/carlist/goodsDetail/<c:out value="${list.num}"/>">
										<div class="card-body">
											<div class="row no-gutters align-items-center">
												<div class="col mr-2">
													<div class="col-auto" id="uploadResult">
													</div>
													<div class="text-xs font-weight-bold text-dark text-uppercase mb-1" style="font-size:1.5em; color: black">
														<c:out value="${list.copName}"></c:out>
														<c:out value="${list.brName}"></c:out>
														<c:out value="${list.car_name}"></c:out>
													</div>
													<div class="h5 mb-0 font-weight-bold text-dark-900 mb-1" style="display:inline; color: gray">
														<c:out value="${list.model_year}"></c:out>
														년형
													</div>
													<div style="display:inline;">
													<c:if test="${list.owner eq '실차주'}"> 
													<div class="btn btn-primary btn-xl mb-2" style="font-size:0.5em">
														<c:out value="${list.owner}"></c:out>
													</div>
													</c:if>
													<c:if test="${list.owner ne '실차주'}"> 
													<div class="btn btn-warning mb-2" style="font-size:0.5em">
														<c:out value="${list.owner}"></c:out>
													</div>
													</c:if>
													</div>
													<hr>
													<div class="h5 mb-0 font-weight-bold text-primary-900 mb-2" style="display:inline; font-size:1.3em">
														<c:out value="${list.price}"></c:out>
														만원
													</div>
													<div class="h5 mb-0 font-weight-bold text-900 mb-2" style="display:inline; font-size:1.3em; color: brown">
														<c:out value="${list.mileage}"></c:out>
														Km
													</div>
													<div class="h5 mb-0 font-weight-bold text-900 mb-2" style="line-height : 2.5; font-size:1.2em; color: gray">
														<c:out value="${list.region}"></c:out>
													</div>
									         	</div>
											</div>				
										</div>	
								  </a>			
								</div>			
							</c:forEach>
						</c:if>	
				</div>
			</div>							
									
			 			
			
					<!-- 페이지 이름 인터페이스 영역 -->
                	<div class="pageMaker_wrap">
                		<ul class="pageMaker">
                			
                			<!-- 이전 버튼 -->
                			<c:if test="${pageMaker.prev }">
                			alert(${pageMaker.prev });
                				<li class="pageMaker_btn prev">
                					<a href="${pageMaker.pageStart -1}">이전</a>
                				</li>
                			</c:if>
                			
                			<!-- 페이지 번호 -->
                			<c:forEach begin="${pageMaker.pageStart }" end="${pageMaker.pageEnd }" var="num">
                				<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? 'active':''}">
                					<a href="${num}">${num}</a>
                				</li>	
                			</c:forEach>
                		
	                    	<!-- 다음 버튼 -->
	                    	<c:if test="${pageMaker.next}">
	                    		<li class="pageMaker_btn next">
	                    			<a href="${pageMaker.pageEnd + 1 }">다음</a>
	                    		</li>
	                    	</c:if>
	                    </ul>
                	</div>
                
                	
                	<form id="moveForm" action="/carlist/search" method="get" >
 						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
                	</form>
                </div>	
					<!-- End of Main Content -->

					<%@ include file="../include/footer.jsp"%>

				</div>
				<!-- End of Content Wrapper -->

			</div>
			<!-- End of Page Wrapper -->

			<!-- Scroll to Top Button-->
			<a class="scroll-to-top rounded" href="#page-top"> <i
				class="fas fa-angle-up"></i>
			</a>
</body>

<script>

	/* 이미지 정보 호출 */

	let uploadReslut = $("#uploadResult");
	let num = 19;

	$
			.getJSON(
					"/carlist/getAttachList",
					{
						num : num
					},
					function(arr) {

						if (arr.length === 0) {

							let str = "";
							str += "<div id='result_card'>";
							str += "<img src='/resources/img/noimage.png'>";
							str += "</div>";

							uploadResult.html(str);

							return;
						}

						let str = "";
						let obj = arr[0];

						let fileCallPath = encodeURIComponent(obj.uploadPath
								+ "/s_" + obj.uuid + "_" + obj.fileName);
						str += "<div id='result_card'";
			str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
			str += ">";
						str += "<img src='/resources/upload/" + obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName +"'>";
						str += "</div>";

						uploadResult.html(str);

					});
	
	/* 페이지 이동 버튼 */
	let moveForm = $('#moveForm');
	
	$(".pageMaker_btn a").on("click", function(e){
		
		e.preventDefault();
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		
		moveForm.submit();
		
	});

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


	for(let i = 0; i < cate1Array.length; i++){
		cateSelect1.append("<option value='"+cate1Array[i].cateCode+"'>" + cate1Array[i].cateName + "</option>");
	}
	
	/* 중분류 <option> 태그 */
	$(cateSelect1).on("change",function(){
		
		let selectVal1 = $(this).find("option:selected").val();	
		
		cateSelect2.children().remove();
		
		cateSelect2.append("<option value='none'>-브랜드명-</option>");
		
		for(let i = 0; i < cate2Array.length; i++){
			if(selectVal1 === cate2Array[i].cateParent){
				cateSelect2.append("<option value='"+cate2Array[i].cateCode+"'>" + cate2Array[i].cateName + "</option>");	
			}
		}// for
	});
	
	$(document).ready(function(){
		
		/* 차량등록 성공 */
		let regist_result = '${regist_result}';
		
		if(regist_result == 1){
			alert("등록 완료");
			return;
		}
		
		/* 수정 성공 이벤트 */
		let modify_result = '${modify_result}';
		
		if(modify_result == 1){
			alert("수정 완료");
			return;
		}
		
		/* 삭제 결과 경고창 */
		let delete_result = '${delete_result}';
		
		if(delete_result == 1){
			alert("삭제 완료");
			return;
		}
	});
</script>

</html>