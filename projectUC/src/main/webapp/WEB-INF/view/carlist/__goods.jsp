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

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">



				<!-- Begin Page Content -->
				<div class="container-fluid">
				
				<div class="d-sm align-items-center justify-content-between mb-4">
<!-- 						<h3 class="h5 mb-0 text-gray-800">검색 카테고리</h3> -->
						<div class="col-lg-7">
						<form name='form' id="searchForm" action="search" method="get">								
								<div class="form-group row">
									<div class="col-sm-2.4 mb-1 mb-sm-0">
										<select name="region" class="form-control form-control-user cate1">
											<option value="">-매매지역-</option> 
											<option value="서울">서울</option>
											<option value="인천">인천</option>
											<option value="대전">대전</option>
											<option value="대구">대구</option>
											<option value="광주">광주</option>
											<option value="부산">부산</option>
											<option value="울산">울산</option>
											<option value="세종">세종</option>
											<option value="경기">경기</option>
											<option value="강원">강원</option>
											<option value="경남">경남</option>
											<option value="경북">경북</option>
											<option value="전남">전남</option>
											<option value="전북">전북</option>
											<option value="충남">충남</option>
											<option value="충북">충북</option>
											<option value="제주">제주</option>
											<option value="기타">기타</option>											
										</select>
									</div>	
								</div>
								<button class="btn btn-primary btn-user btn-block">검색</button>
						</form>
						</div>
				</div>

					<hr>									

					<div class="row">
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
														${list.num}
														<!--  <i class="fas fa-calendar fa-2x text-gray-300"></i>  -->
													</div>
													<div
														class="text-xs font-weight-bold text-dark text-uppercase mb-1">
														<c:out value="${list.copName}"></c:out>
														<c:out value="${list.brName}"></c:out>
														<c:out value="${list.car_name}"></c:out>
													</div>
													<div class="h5 mb-0 font-weight-bold text-gray-800">
														<c:out value="${list.price}"></c:out>
														만원
													</div>
													<div
														class="text-xs font-weight-bold text-primary text-uppercase mb-1">
														<c:out value="${list.seller}"></c:out>
													</div>
												</div>
											</div>
										</div>

									</a>
								</div>
							</c:forEach>
						</c:if>
					</div>
					
					<!-- 페이지 이름 인터페이스 영역 -->
                	<div class="pageMaker_wrap">
                		<ul class="pageMaker">
                			
                			<!-- 이전 버튼 -->
                			<c:if test="${pageMaker.prev }">
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
                	
                	<form id="moveForm" action="/admin/goodsManage" method="get" >
 						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
                	</form>
                	
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
	$(".pageMaker_btn a").on("click", function(e){
		
		e.preventDefault();
		
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		
		moveForm.submit();
		
	});
</script>

</html>