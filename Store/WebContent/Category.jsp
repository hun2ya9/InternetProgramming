<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ page import="java.util.*"%>
<%@ page import="Base.InfoVO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"
></script>

<title>Category</title>
</head>
<body>
	<%
		String type = request.getAttribute("type").toString();
		ArrayList<InfoVO> list = (ArrayList<InfoVO>) request.getAttribute("list"); // 건내받은 cVo 객체를 리스트에 차례로 저장
	%>

	<div class="page-wrap">
		<nav id="nav"> <jsp:include page="Side.jsp" /> </nav>
		
		<section id="main"> 
			<header id="header">
				<div>BUSAN STORE</div>
			</header> 
		
		<section id="galleries">
		<div class="gallery">
			<header>
			<h1><%=type%></h1>
			<ul class="tabs">
				<li><a href="#" data-tag="all" class="button active">All</a></li>

				<%
					switch (type) {
						case "NEW" :
				%>
				<li><a href="#" data-tag="NEW" class="button">New</a></li>
				<%
					break;
						case "BEST" :
				%>
				<li><a href="#" data-tag="BEST" class="button">Best</a></li>
				<%
					break;
						case "OUTER" :
				%>
				<li><a href="#" data-tag="COAT" class="button">Coat</a></li>
				<li><a href="#" data-tag="PADDING" class="button">Padding</a></li>
				<%
					break;
						case "TOP" :
				%>
				<li><a href="#" data-tag="KNIT" class="button">Knit</a></li>
				<li><a href="#" data-tag="SWEATSHIRT" class="button">Sweat
						Shirt</a></li>
				<%
					break;
						case "BOTTOM" :
				%>
				<li><a href="#" data-tag="SLACKS" class="button">Slacks</a></li>
				<li><a href="#" data-tag="DENIM" class="button">Denim</a></li>
				<%
					break;
						case "SHOES" :
				%>
				<li><a href="#" data-tag="LOAFERS" class="button">Loafers</a></li>
				<li><a href="#" data-tag="SHOES" class="button">Shoes</a></li>
				<%
					break;
						case "" :
							break;
					}
				%>
			</ul>
			</header>

			<div class="content">

				<%
					if (type == "NEW" || type == "BEST") {
						for (int i = 0; i < list.size(); i++) {
				%>
				<div class="media all <%=type%>">
					<a href="Info.do?number=<%=list.get(i).getNum()%>"><img
						src="images/<%=type%>/<%=list.get(i).getNum()%>.jpg"
					/></a>
				</div>
				<%
					}
					} else {
						for (int i = 0; i < list.size(); i++) {
				%>
				<div class="media all <%=list.get(i).getSubtype()%>">
					<a href="Info.do?number=<%=list.get(i).getNum()%>"><img
						src="images/<%=list.get(i).getSubtype()%>/<%=list.get(i).getNum()%>.jpg"
					/></a>
				</div>
				<%
					}
					}
				%>
			</div>
		</div>
		</section>
		<jsp:include page="footer.jsp" />
		</section>
	</div>
	<script src="script/jquery.min.js"></script>
	<script src="script/tag.js"></script>
</body>
</html>