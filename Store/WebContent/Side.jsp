<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous"
>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"
></script>
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"
></script>

<script type="text/javascript" src="script/member.js"></script>
</head>
<body>
	<ul>
		<li><a href="Main.jsp" class="active"><span class="icon fa-home"></span></a></li>
		<%
			Object loginUser = session.getAttribute("loginUser");
			if (loginUser != null) {
		%>
		<li><a href="bag.do" class="active"><span class="glyphicon glyphicon-shopping-cart"></span></a></li>
		<li><a href="#"><h4><%=loginUser%></h4></a></li>
		<li><a href="logout.jsp">Logout</a></li>
		<li><a href="myPage.jsp">MyPage</a></li>
		<%
			} else {
		%>
		<!-- 		<li><a href="login.do">Login</a></li>-->
		<li><a data-toggle="modal" href="#myModal">Login</a> <!--class="btn btn-default btn-lg"  --></li>
		<li><a data-toggle="modal" href="#joinModal">Join</a></li>
		<br>
		<%
			}
		%>
		<div class="modal" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
		>
			<div class="modal-dialog">
				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true"
						>&times;</button>
						<h4 class="modal-title">Login</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" action="login.do" method="post"name="ch">
							<%!String message;%>
							<%
								if (request.getAttribute("message") != null) {
									message = request.getAttribute("message").toString();
									if (message == "1") {
							%>
							<%
								} else if (message == "0") {
							%>
							<div class="alert alert-danger">비밀번호가 맞지 않습니다.</div>
							<script>
								$('#myModal').modal('show')
							</script>
							<%
								} else if (message == "-1") {
							%>
							<div class="alert alert-danger">존재하지 않는 회원입니다.</div>
							<script>
								$('#myModal').modal('show')
							</script>
							<%
								}
								}
							%>
							<div class="form-group form-group-lg has-success">
								<div class="col-lg-offset-3 col-md-5">
									<input type="text" class="form-control" name="userid"
										placeholder="ID"
									>
								</div>
							</div>
							<div class="form-group form-group-lg has-success">
								<div class="col-lg-offset-3 col-md-5">
									<input type="password" class="form-control" name="pwd"
										placeholder="Password"
									>
								</div>
							</div>

							<div class="form-group">
								<div class="col-lg-offset-3 col-md-5">
									<button type="submit" class="btn btn-default btn-lg btn-block">Login</button>
								</div>
							</div>
						</form>
					</div>
					<!-- <div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save
							changes</button>
					</div> -->
				</div>
			</div>
		</div>

		<div class="modal" id="joinModal" tabindex="-1" role="dialog"
			aria-labelledby="joinModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">Join</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" action="join.do" method="post" name="jo">
							<%	if (request.getAttribute("message2") != null) {
									String message2 = request.getAttribute("message2").toString();
									if (message2 == "0") {
							%>
									<div class="alert alert-danger">이미 존재하는 아이디입니다.</div>
									<script>
										$('#joinModal').modal('show')
									</script>
							<%
									}
								}
							%>
							<div class="form-group">
								<label for="inputId" class="col-lg-3 control-label">아이디</label>
								<div class="col-lg-4">
									<input type="text" class="form-control" name="userid" style="ime-mode: disabled">
								</div>
							</div>

							<div class="form-group">
								<label for="inputPassword" class="col-lg-3 control-label">비밀번호</label>
								<div class="col-lg-4">
									<input type="password" class="form-control" name="pwd">
								</div>
							</div>

							<div class="form-group">
								<label for="inputPasswordCheck" class="col-lg-3 control-label">비밀번호
									확인</label>
								<div class="col-lg-4">
									<input type="password" class="form-control" name="pwd_check">
								</div>
							</div>

							<div class="form-group">
								<label for="inputName" class="col-lg-3 control-label">이름</label>
								<div class="col-lg-4">

									<input type="text" class="form-control" name="name">
								</div>
							</div>

							<div class="form-group">
								<label for="inputDay" class="col-lg-3 control-label">생년월일</label>
								<div class="col-lg-4">

									<input type="text" class="form-control" name="age">
								</div>								
								<label for="inputDayEX" class="col-lg-3 control-label">예시)19951017</label>
							</div>

							<div class="form-group">
								<label for="inputPhone" class="col-lg-3 control-label">전화번호</label>
								<div class="col-lg-4">
									<input type="text" class="form-control" name="phone">
								</div>
								<label for="inputPhoneEX" class="col-lg-3 control-label">예시)010-1234-5678</label>								
							</div>

							<div class="form-group">
								<label for="inputEmail" class="col-lg-3  control-label">이메일</label>
								<div class="col-lg-4">
									<input type="text" class="form-control" name="email">
								</div>
								<label for="intputEmailEX" class="col-lg-3  control-label">예시)ss@naver.com</label>
							</div>

							<div class="form-group">
								<div class="col-lg-offset-3 col-md-5">
								<button type="submit" class="btn btn-default" onclick="return JoinCheck()">확인</button>
								&nbsp;&nbsp;<button type="reset" class="btn btn-default">취소</button>&nbsp;&nbsp;
							</div>
					</div>
					</form>
				</div>
				<!-- <div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save
							changes</button>
					</div> -->
			</div>
		</div>
		</div>
		<li class="selected"><a href="Category.do?type=NEW">NEW</a></li>
		<li class="selected"><a href="Category.do?type=BEST">BEST</a></li>
		<li class="selected"><a href="Category.do?type=OUTER">OUTER</a></li>
		<li class="selected"><a href="Category.do?type=TOP">TOP</a></li>
		<li class="selected"><a href="Category.do?type=BOTTOM">BOTTOM</a></li>
		<li class="selected"><a href="Category.do?type=SHOES">SHOES</a></li>
	</ul>
</body>
</html>