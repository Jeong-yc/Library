<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="./resource/css/bootstrap.min.css" />
<title>도서 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3" align="center">도서 목록</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
			<%@ include file="dbconn.jsp" %>
			
			<% 
				request.setCharacterEncoding("UTF-8");	
				String name = (request.getParameter("name") ==null) ? "" :  request.getParameter("name").trim() ;
// 				String keyword = (request.getParameter("keyword") ==null) ? "" :  request.getParameter("keyword").trim() ;
				
			%>
			<%
				String sql = "select * from book where b_name = '"+name+"' ";
// 				String sql = "select * from book where b_name like ? or b_author like ? or b_publisher like ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
// 				pstmt.setString(1, keyword);
// 				pstmt.setString(2, keyword);
// 				pstmt.setString(3, keyword);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
			<div class="col-md-3">
				<img src="./upload/<%=rs.getString("b_fileName") %>"
				" style="width: 100%" align="center">
				<h3><%=rs.getString("b_name") %></h3>
				<h4><%=rs.getString("b_author") %></h4>
				<h4><%=rs.getString("b_price") %>원</h4>
				<p>
					<a href="./book.jsp?id=<%=rs.getString("b_id")%>"
					class="btn btn-secondary" role="button"> 상세 정보</a>
			</div>
			<%
				}
				if(rs != null)
					rs.close();
				if(pstmt != null)
					pstmt.close();
				if(conn != null)
					conn.close();
				%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>