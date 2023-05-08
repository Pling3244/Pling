<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-dark sidebar sidebar-dark accordion" id="accordionSidebar">
			<div class="col-lg-9">
						<form name='form' id="searchForm" action="search" method="get">
								<div class="form-group row">
									<div class="col-sm-2.4 mb-3 mb-sm-0">
										<b style="color:white">회사명</b>
										<select name="cop_name" class="form-control form-control-user cate1">
											<option selected value="none">-선택-</option> 											
										</select>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-2.5 mb-4 mb-sm-0">
										<b style="color:white">브랜드명</b>
										<select name="br_name" class="form-control form-control-user cate2">
											<option selected value="none">-선택-</option> 											
										</select>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-2.4 mb-1 mb-sm-0">
										<b style="color:white">매매지역</b>
										<select name="region" class="form-control form-control-user">
											<option value="">-선택-</option> 
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
								<div class="form-group row">
									<div class="col-sm-2.4 mb-3 mb-sm-0">
										<b style="color:white">연료타입</b>
										<select name="fuel_type"
											class="form-control form-control-user">
											<option value="">-선택-</option>
											<option value="가솔린">가솔린</option>
											<option value="디젤">디젤</option>
											<option value="LPG">LPG</option>
											<option value="하이브리드">하이브리드</option>
											<option value="전기">전기</option>
											<option value="기타">기타</option>
										</select>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-2.4 mb-3 mb-sm-0">
										<b style="color:white">차량색상</b>
										<select name="color" class="form-control form-control-user">
											<option value="">-선택-</option>
											<option value="검정색">검정색</option>
											<option value="흰색">흰색</option>
											<option value="은색">은색</option>
											<option value="회색">회색</option>
											<option value="빨간색">빨간색</option>
											<option value="파란색">파란색</option>
											<option value="주황색">주황색</option>
											<option value="갈색">갈색</option>
											<option value="초록색">초록색</option>
											<option value="노란색">노란색</option>
											<option value="보라색">보라색</option>
											<option value="기타">기타</option>
										</select>
									</div>	
								</div>
								<div class="form-group row">
								<div class="col-sm-2.0 mb-3 mb-sm-0">
								    <b style="color:white">주행거리(Km)이하</b>
									<input name="mileage" type="text" class="form-control form-control-user" placeholder="주행거리 이하">										
								</div>
								</div>
								<div class="form-group row">
								<div class="col-sm-2.0 mb-3 mb-sm-0">
								    <b style="color:white">최소가격(만원)</b>
									<input name="price_min" type="text" class="form-control form-control-user" placeholder="최소금액">										
								</div>
								<a style="color:white">~</a>&nbsp
								<div class="col-sm-2.0 mb-3 mb-sm-0">
								    <b style="color:white">최대가격(만원)</b>
									<input name="price_max" type="text" class="form-control form-control-user" placeholder="최대금액">										
								</div>
								</div>										
								<button class="btn btn-primary btn-user btn-block">검색</button>
						</form>
						</div>
<!--             Sidebar - Brand -->
<!--             <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html"> -->
<!--                 <div class="sidebar-brand-icon rotate-n-15"> -->
<!--                     <i class="fas fa-laugh-wink"></i> -->
<!--                 </div> -->
<!--                 <div class="sidebar-brand-text mx-3">중고카 론 <sup>$</sup></div> -->
<!--             </a> -->

<!--             Divider -->
<!--             <hr class="sidebar-divider my-0"> -->

<!--             Nav Item - Dashboard -->
<!--             <li class="nav-item active"> -->
<!--                 <a class="nav-link" href="index.html"> -->
<!--                     <i class="fas fa-fw fa-tachometer-alt"></i> -->
<!--                     <span>Dashboard</span></a> -->
<!--             </li> -->

<!--             Divider -->
<!--             <hr class="sidebar-divider"> -->

<!--             Heading -->
<!--             <div class="sidebar-heading"> -->
<!--                 Interface -->
<!--             </div> -->

<!--             Nav Item - Pages Collapse Menu -->
<!--             <li class="nav-item"> -->
<!--                 <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" -->
<!--                     aria-expanded="true" aria-controls="collapseTwo"> -->
<!--                     <i class="fas fa-fw fa-cog"></i> -->
<!--                     <span>Components</span> -->
<!--                 </a> -->
<!--                 <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar"> -->
<!--                     <div class="bg-white py-2 collapse-inner rounded"> -->
<!--                         <h6 class="collapse-header">Custom Components:</h6> -->
<!--                         <a class="collapse-item" href="buttons.html">Buttons</a> -->
<!--                         <a class="collapse-item" href="cards.html">Cards</a> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </li> -->

<!--             Nav Item - Utilities Collapse Menu -->
<!--             <li class="nav-item"> -->
<!--                 <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" -->
<!--                     aria-expanded="true" aria-controls="collapseUtilities"> -->
<!--                     <i class="fas fa-fw fa-wrench"></i> -->
<!--                     <span>Utilities</span> -->
<!--                 </a> -->
<!--                 <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" -->
<!--                     data-parent="#accordionSidebar"> -->
<!--                     <div class="bg-white py-2 collapse-inner rounded"> -->
<!--                         <h6 class="collapse-header">Custom Utilities:</h6> -->
<!--                         <a class="collapse-item" href="utilities-color.html">Colors</a> -->
<!--                         <a class="collapse-item" href="utilities-border.html">Borders</a> -->
<!--                         <a class="collapse-item" href="utilities-animation.html">Animations</a> -->
<!--                         <a class="collapse-item" href="utilities-other.html">Other</a> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </li> -->

<!--             Divider -->
<!--             <hr class="sidebar-divider"> -->

<!--             Heading -->
<!--             <div class="sidebar-heading"> -->
<!--                 Addons -->
<!--             </div> -->

<!--             Nav Item - Pages Collapse Menu -->
<!--             <li class="nav-item"> -->
<!--                 <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" -->
<!--                     aria-expanded="true" aria-controls="collapsePages"> -->
<!--                     <i class="fas fa-fw fa-folder"></i> -->
<!--                     <span>Pages</span> -->
<!--                 </a> -->
<!--                 <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar"> -->
<!--                     <div class="bg-white py-2 collapse-inner rounded"> -->
<!--                         <h6 class="collapse-header">Login Screens:</h6> -->
<!--                         <a class="collapse-item" href="login.html">Login</a> -->
<!--                         <a class="collapse-item" href="register.html">Register</a> -->
<!--                         <a class="collapse-item" href="forgot-password.html">Forgot Password</a> -->
<!--                         <div class="collapse-divider"></div> -->
<!--                         <h6 class="collapse-header">Other Pages:</h6> -->
<!--                         <a class="collapse-item" href="404.html">404 Page</a> -->
<!--                         <a class="collapse-item" href="blank.html">Blank Page</a> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </li> -->

<!--             Nav Item - Charts -->
<!--             <li class="nav-item"> -->
<!--                 <a class="nav-link" href="charts.html"> -->
<!--                     <i class="fas fa-fw fa-chart-area"></i> -->
<!--                     <span>Charts</span></a> -->
<!--             </li> -->

<!--             Nav Item - Tables -->
<!--             <li class="nav-item"> -->
<!--                 <a class="nav-link" href="tables.html"> -->
<!--                     <i class="fas fa-fw fa-table"></i> -->
<!--                     <span>Tables</span></a> -->
<!--             </li> -->

<!--             Divider -->
<!--             <hr class="sidebar-divider d-none d-md-block"> -->

<!--             Sidebar Toggler (Sidebar) -->
<!--             <div class="text-center d-none d-md-inline"> -->
<!--                 <button class="rounded-circle border-0" style="color: white" id="sidebarToggle"></button> -->
<!--             </div> -->

<!--             Sidebar Message -->
<!--             <div class="sidebar-card d-none d-lg-flex"> -->
<!--                 <img class="sidebar-card-illustration mb-2" src="/resources/img/undraw_rocket.svg" alt="..."> -->
<!--                 <p class="text-center mb-2"><strong>SB Admin Pro</strong> is packed with premium features, components, and more!</p> -->
<!--                 <a class="btn btn-success btn-sm" href="https://startbootstrap.com/theme/sb-admin-pro">Upgrade to Pro!</a> -->
<!--             </div> -->

        </ul>
        <!-- End of Sidebar -->