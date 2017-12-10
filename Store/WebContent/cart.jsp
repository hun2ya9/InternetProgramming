<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ page import="java.util.*"%>
<%@ page import="Base.ScartVO"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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

<title>Insert title here</title>
</head>
<body>
	<div class="page-wrap">
		<nav id="nav"> <jsp:include page="Side.jsp" /> </nav>
		<section id="main"> <header id="header">
		<div>BUSAN STORE</div>
		</header>

		<div class="inner">
		
	<%!ScartVO data;
	String[] name, siz, color, cost;
	int[] amount;%>
	<%
		ArrayList<ScartVO> list = (ArrayList<ScartVO>) request.getAttribute("data"); // 건내받은 cVo 객체를 리스트에 차례로 저장

		if (request.getAttribute("data") == null) {
			%>
			<table class="table table-striped">
			<tr>
				<th colspan="2"><b>PRODUCT INFO</b> 제품정보</th>
			</tr>
			<tr>
				<td class="active">이름</td>
				<td class="active"></td>
			</tr>
			<tr>
				<td class="active">사이즈</td>
				<td class="active"></td>

			</tr>
			<tr>
				<td class="active">색깔</td>
				<td class="active"></td>
			</tr>
			<tr>
				<td class="active">판매가</td>
				<td class="active"></td>
			</tr>
			<tr>
				<td class="active">수량</td>
				<td class="active"></td>
			</tr>
		</table>
		<%
		} else {
	%>
		<% for(int i=0; i<list.size(); i++) {%>
			<table class="table table-striped">
				<tr>
					<th colspan="2"><b>PRODUCT INFO</b> 제품정보</th>
				</tr>
				<tr>
					<td class="active">이름</td>
					<td class="active"><%=list.get(i).getName()%></td>
				</tr>
				<tr>
					<td class="active">사이즈</td>
					<td class="active"><%=list.get(i).getSiz()%></td>

				</tr>
				<tr>
					<td class="active">색깔</td>
					<td class="active"><%=list.get(i).getColor()%></td>
				</tr>
				<tr>
					<td class="active">판매가</td>
					<td class="active"><h4><%=list.get(i).getCost()%></h4></td>
				</tr>
				<tr>
					<td class="active">수량</td>
					<td class="active"><h4><%=list.get(i).getAmount()%></h4></td>
				</tr>
			</table>
			<% }} %>
			<button type="button" class="btn btn-warning">비우기</button>
			<button type="button" class="btn btn-info">구매</button>
		</div>
				<jsp:include page="footer.jsp"/>
		</section>
	</div>
</body>
</html>


