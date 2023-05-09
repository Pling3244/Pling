<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<%@ include file="../include/header.jsp" %>
<body class="bg-gradient-primary">
	<script type="text/javascript">
		$(function() {
			
			let formObj = $("#operForm");//id라서 #을 붙인다. role 아님!
			
			$('button').on("click",
					function(e) 
					{
						e.preventDefault();

						const operation = $(this).data("oper");

						console.log(operation);

						if (operation === 'remove') 
						{
							formObj.attr("action", "/board/remove");
						}
						else if (operation === 'list') 
						{
							//self.location="/board/list";
							formObj.find("#post_id").remove();
							formObj.attr("action","/board/list")
						}

						formObj.submit();
					});
		});
	</script>
    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-5">
                <!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">게시글 1개 조회</h1>
					</div>
					<!--  /.col-lg-12 -->
				</div>
				<!--  /.row -->
				
				<div class="row">
					<div class="col-lg-12">
						<div class="panel-heading">Board Read Page</div>
						<!--  /.panel-heading -->
						<div class="panel-body">
							
							<div class="form-group">
								<label>Post_id</label>
								<input class="form-control" name='post_id' value='<c:out value="${board.post_id }"/>' readonly="readonly">
							</div>
							
							<div class="form-group">
								<label>Title</label>
								<input class="form-control" name='title' value='<c:out value="${board.title}"/>' readonly="readonly">
							</div>
							
							<div class="form-group">
								<label>User ID</label>
								<%-- <% String sessionId = (String) session.getAttribute("sessionId"); %>
								<input class="form-control" name='user_id' value='<%=sessionId %>' readonly="readonly"> --%>
								<input class="form-control" name='user_id' value="newbie" readonly="readonly">
							</div>
							
							<div class="form-group">
								<label>Text area</label>
								<textarea class="form-control" rows="5" name='content' readonly="readonly"><c:out value="${board.content}" /></textarea>
							</div>
							
							
								<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
								<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
								<button type="submit" data-oper='list' class="btn btn-info">List</button>

								<form id='operForm' action="/board/modify" method="get"><!-- get방식, 수정창 띄우는거니까 -->
									<input type='hidden' id='post_id' name='post_id' value='<c:out value="${board.post_id}"/>'> 
								</form>
							
							
							<!-- end panel-body -->
           			 	</div>
       			 	</div>
	  			</div>
    		</div>
  		</div>
  	</div>
</body>
</html>