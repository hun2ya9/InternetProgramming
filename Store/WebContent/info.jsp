<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ page import="java.util.*"%>
<%@ page import="Base.InfoVO"%>

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
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"
></script>

<title>info</title>
</head>
<body>
	<% InfoVO data = (InfoVO) request.getAttribute("data"); %>
	<div class="page-wrap">
		<nav id="nav"> <jsp:include page="Side.jsp" />
		</nav>
		<section id="main"> 
			<header id="header">
				<div>BUSAN STORE</div>
			</header>
			<div class="inner">
				<h1><%=data.getName()%></h1>
				<ol class="breadcrumb">
					<li>제품분류</li>
					<li><a href="Category.do?type=<%=data.getMaintype()%>"><%=data.getMaintype()%></a>
					<li class="active"><%=data.getSubtype()%>
				</ol>
			</div>
			<section id="galleries">
				<div class="gallery">
				<div class="content">
					<img src="images/<%=data.getSubtype()%>/<%=data.getNum()%>.jpg">
					<div class="li_inner"style="position:absolute;width:40%;margin:auto;">
						<form action="cart.do" method="post">
						<table class="table table-striped">
						<tr>
							<th colspan="2"><b>PRODUCT INFO</b> 제품정보</th>
						</tr>
						<tr>
							<td class="active">제품번호</td>
							<td class="active"><%=data.getNum()%></td>					
						</tr>
						<tr>
							<td class="active">시즌</td>
							<td class="active"><%=data.getSeason()%></td>
							
						</tr>
						<tr>
							<td class="active">사이즈</td>
							<td class="active"> <%=data.getSiz()%></td>
						
						</tr>
						<tr>
							<td class="active">색깔</td>
							<td class="active"><%=data.getColor()%></td>
						</tr>
						<tr>
							<th colspan="2"><b>PRICE INFO</b> 가격정보</th>
						</tr>
						<tr>
							<td class="active">판매가</td>
							<td class="active"><h4><%=data.getCost()%></h4></td>
						</tr>
						<tr>
							<th colspan="2"><b>SELECT OPTION</b> 옵션선택</th>
						</tr>
						<tr>
							<td><select class="form-control" name="option" id="option">
								<option id="option" value="<%=data.getColor() %>-S size" selected><%=data.getColor() %>S size
								<option id="option" value="<%=data.getColor() %>-M size"><%=data.getColor() %>M size
								<option id="option" value="<%=data.getColor() %>-L size"><%=data.getColor() %>L size
							</select></td>
						</tr>
					</table>
					<button type="submit" class="btn btn-default">장바구니</button>
					<a href="Main.jsp" type="button" class="btn btn-info">바로구매</a>
					</form>
				</div>
			</div>
		</div>
		</section> 
		<div class="container">
			<%! int i; %>
			<img src="images/<%=data.getSubtype()%>/<%=data.getNum()%>-1.jpg">
		</div>
		<jsp:include page="footer.jsp" />
		</section>
	</div>
</body>
</html>