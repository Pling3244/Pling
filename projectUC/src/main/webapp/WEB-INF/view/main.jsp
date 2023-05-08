<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<%@ include file="./include/modal.jsp" %>
<%@ include file="./include/header.jsp" %>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

<%--         <%@ include file="./include/sidebar.jsp" %> --%>
		
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            
            <%@ include file="./include/content.jsp" %>
            <h1>현재 판매등록 차량 ${total}</h1>
            <div style="display: flex"; "justify-content: center";>
            <img src="/resources/img/car.png"/>
			</div>	
			
			<%@ include file="./include/footer.jsp" %>
            
        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
          
</body>

</html>