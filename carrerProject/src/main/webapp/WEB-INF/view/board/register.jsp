<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<%@ include file="../include/header.jsp" %>
<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-5">
                <!-- Nested Row within Card Body -->
                <div class="row">
					<div class="col-lg-12">
						<div class="panel-healing">Board Register</div>
						
						<!--  /.panel-heading -->						
						<div class="panel-body">
							<form role="form" action="/board/register" method="post">
								
								<div class="form-group">
									<label>Title</label>
									<input class="form-control" name='title'>
								</div>
									
								<%-- <div class="form-group">
									<label>Writer</label>
									<% String sessionId = (String) session.getAttribute("sessionId"); %>
									<input class="form-control" type="text" name='user_id' value="<%=sessionId%>" readonly>
								</div> --%>
- 								<div class="form-group">
									<label>Writer</label>
									<% String sessionId = (String) session.getAttribute("sessionId"); %>
									<input class="form-control" name='user_id'>
								</div>
								
								<div class="form-group">
									<label>Text area</label>
									<textarea class="form-control" rows="4" name='content'></textarea>
								</div>

								<button type="submit" class="btn btn-default">Submit Button</button>
								<button type="reset" class="btn btn-default">Reset Button</button>
							</form>
						</div>
						<!-- end panel-body -->
						
					</div>
					<!-- end panel-body -->
				</div>
				<!-- end panel-body -->
            </div>
        </div>

    </div>

</body>
</html>