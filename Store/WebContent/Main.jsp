<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ page import="Base.InfoDAO"%>
<%@ page import="Base.InfoVO"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>BUSAN STORE</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body>
	<div class="page-wrap">
		<nav id="nav"> <jsp:include page="Side.jsp" /> </nav>

		<section id="main"> 
			<section id="banner">
				<div class="inner">
					<h1>BUSAN STORE</h1>
						<p>마! 니 이런거 입어봤나</p>
				</div>
			</section> 
			
			<section id="galleries">
			<div class="gallery">
				<header class="special">
					<h2>What's New</h2>
				</header>
				<div class="content">
					<%!InfoDAO iDAO = InfoDAO.getInstance();
						ArrayList<InfoVO> iVo = null;%>
					<%
						iVo = iDAO.getNew();
						for (int i = 0; i < iVo.size(); i++) {
					%>
					<div class="media">
						<a href="Info.do?number=<%=iVo.get(i).getNum()%>"><img
							src="images/NEW/<%=iVo.get(i).getNum()%>.jpg"
						/></a>
					</div>
					<%
						}
					%>
				</div>
				
				<header class="special">
					<h2>What's Best</h2>
				</header>

				<div class="content">
					<%
						iVo = iDAO.getBest();
						for (int i = 0; i < iVo.size(); i++) {
					%>
					<div class="media">
						<a href="Info.do?number=<%=iVo.get(i).getNum()%>"><img
							src="images/BEST/<%=iVo.get(i).getNum()%>.jpg"
						/></a>
					</div>
					<%
						}
					%>
				</div>
			</div>
			</section> 
			<jsp:include page="footer.jsp" /> 
		</section>
	</div>
</body>
</html>