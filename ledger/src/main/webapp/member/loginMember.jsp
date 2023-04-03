<%@ page contentType="text/html; charset=utf-8"%>

<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>Login</title>
</head>
<body>
	<jsp:include page="/menu.jsp" />
	
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="margin: 30px;">
<!-- 				<form method="post" action="loginAction.jsp"> -->
					<h1 style="text-align: center;">Login</h1>
					<h1 class="mb-5"></h1>
	
			<%
				String error = request.getParameter("error");
				if (error != null) {
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해 주세요");
					out.println("</div>");
				}
			%>
			<form class="form-signin" action="processLoginMember.jsp" method="post">

				<div class="form-group">
					<label for="inputUserName" class="sr-only">User Name</label> <input
						type="text" class="form-control" placeholder="ID" name='id'
						required autofocus>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label> <input
						type="password" class="form-control" placeholder="Password"
						name='password' required>
				</div>
				<button class="btn btn-dark form-control" type="submit" style="background-color: #9933FF;">로그인</button>
			</form>
			<div style="text-align: right">
			<a href = "addMember.jsp" float-right>회원가입</a>
			</div>
<!-- 			</form> -->
		</div>
	</div>
	</div>
</body>
</html>


