<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ page import="Base.MemberDAO"%>
<%@ page import="Base.MemberVO"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Object loginUser = session.getAttribute("loginUser");
		if (loginUser != null) {

			MemberDAO mDAO = MemberDAO.getInstance();
			MemberVO mVo = mDAO.getMember(loginUser.toString());
	%>
	<div class="container">

	<div>
		<h3><label for="inputId" class="col-lg-offset-5 control-label"><%=mVo.getUserid()%>님의 개인정보</label></h3>
	</div>
	<div>
		<h3><label for="inputId" class="col-lg-offset-5 control-label"><%=mVo.getName()%></label></h3>
	</div>
	<div>
		<h3><label for="inputId" class="col-lg-offset-5 control-label"><%=mVo.getPhone()%></label></h3>
	</div>
	<div>
		<h3><label for="inputId" class="col-lg-offset-5 control-label"><%=mVo.getAge()%></label></h3>
	</div>
	<div>
		<h3><label for="inputId" class="col-lg-offset-5 control-label"><%=mVo.getEmail()%></label></h3>
	</div>
	</div>
	<%
		} else {
	%>
	<jsp:forward page="Main.jsp" />
	<%
		}
	%>


</body>
</html>