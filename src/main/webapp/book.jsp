<%@ page contentType="text/html; charset=UTF-8"%>
<%-- <%@ page errorPage ="exceptionNoProductId.jsp"%> --%>
<html>
<head>
<link rel ="stylesheet" href ="./resource/css/bootstrap.min.css" />
<title>상세 정보</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 정보</h1>
		</div>
	</div>
	<%@ include file="dbconn.jsp"%>
	<%
		String id = request.getParameter("id");
		String sql = "select * from book where b_id = '"+id+"'";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		if(rs.next())
		{
	%>
	<div class="container">
		<div class="row">
			<div class ="col-md-5">
				<img src="./upload/<%=rs.getString("b_filename")%>" style="width: 100%" />
			</div>
			<div class="col-md-6">
				<h3><%=rs.getString("b_name")%></h3>
				<p><%=rs.getString("b_description")%></p>
				<p><b>도서 아이디 : </b><span class="badge badge-danger"> <%=rs.getString("b_id")%></span>
				<p><b>저자 </b> : <%=rs.getString("b_author")%>
				<p><b>출판사</b> : <%=rs.getString("b_publisher")%>
				<p><b>출판일</b> : <%=rs.getString("b_publisher_date")%>
				<h4><%=rs.getString("b_price")%>원</h4>
				<p><form name="addForm" action="#" method="post">
					<a href="#" class="btn btn-info" onclick="addToCart()"> 도서 대여</a> 
					<a href="./books.jsp" class="btn btn-secondary"> 도서 목록</a>
				</form>
			</div>
		</div>
		<hr>
	</div>
	<%
		}
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
		conn.close();
	%>
	
	<jsp:include page="footer.jsp" />
</body>
</html>
