<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>

<%@include file="../include/header.jsp"%>

<body class="bg-gradient-primary">

	
	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-5">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">게시글 수정</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">

							<div class="panel-heading">Board Modify</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<form role="form" action="/board/modify" method="post" id="form">

									<div class="form-group">
										<label>Post Number</label>
										<input class="form-control" name='post_id' value='<c:out value="${board.post_id }"/>' readonly="readonly">
									</div>

									<div class="form-group">
										<label>Title</label>
										<input class="form-control" name='title' value='<c:out value="${board.title }"/>'>
									</div>
									
									<div class="form-group">
										<label>User</label> 
<%-- 						   			<% String sessionId = (String) session.getAttribute("sessionId"); %>
										<input class="form-control" name='user_id' value='<%=sessionId %>' readonly="readonly"> --%>
										<input class="form-control"	name='user_id' value="newbie" readonly="readonly">
									</div>

									<div class="form-group">
										<label>Text area</label>
										<textarea class="form-control" rows="5" name='content'>
											<c:out value="${board.content}" />
										</textarea>
									</div>

									<div class="form-group">
										<label>Update Date</label> <input class="form-control" name='created_at' value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.created_at}" />' readonly="readonly">
									</div>

									<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
									<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
									<button type="submit" data-oper='list' class="btn btn-info">List</button>
								</form>

							</div>
							<!--  end panel-body -->

						</div>
						<!--  end panel-body -->
					</div>
					<!-- end panel -->
				</div>
				<!-- /.row -->

			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			
			const formObj = $("form");
			alert(formObj)
			$('button').on("click",
					function(e) 
					{
						e.preventDefault();

						const operation = $(this).data("oper");

						console.log(formObj.action);
						alert(formObj.action)

						if (operation === 'remove') 
						{
							formObj.attr("action", "/board/remove");
						}
						else if (operation === 'list') 
						{
							//self.location="/board/list";
							formObj.attr("action", "/board/list").attr("method","get");
							formObj.empty();
							//return;
						}
						alert(formObj.action);
						formObj.submit();
					});
		});
	</script>
	
</body>

</html>

