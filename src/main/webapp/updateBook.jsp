<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="./resource/css/bootstrap.min.css" />
<title>도서 수정</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3" align="center">도서 수정</h1>
		</div>
	</div>
	<%@ include file="dbconn.jsp"%>
	<%
		String bookId = request.getParameter("id");

		String sql = "select * from book where b_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bookId);
		rs = pstmt.executeQuery();
		if (rs.next()) {
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="./upload/<%=rs.getString("b_filename")%>" alt="image"
					style="width: 100%" />
			</div>
			<div class="col-md-7">
				<form name="newBook" action="./processUpdateBook.jsp"
					class="form-horizontal" method="post" enctype="multipart/form-data">
					<div class="form-group row">
						<label class="col-sm-2">도서 아이디</label>
						<div class="col-sm-3">
							<input type="text" id="bookId" name="bookId"
								class="form-control" value='<%=rs.getString("b_id")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">도서 이름</label>
						<div class="col-sm-3">
							<input type="text" id="name" name="name" class="form-control"
								value="<%=rs.getString("b_name")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">저자</label>
						<div class="col-sm-3">
							<input type="text" id="author" name="author"
								class="form-control" value="<%=rs.getString("b_author")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">출판사</label>
						<div class="col-sm-3">
							<input type="text" id="publisher" name="publisher"
								class="form-control" value="<%=rs.getString("b_publisher")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">출판일</label>
						<div class="col-sm-3">
							<input type="date" id="publisher_date" name="publisher_date" 
								class="form-control" value="<%=rs.getString("b_publisher_date")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">가격</label>
						<div class="col-sm-3">
							<input type="text" id="bookPrice"name="bookPrice" 
								class="form-control" value="<%=rs.getInt("b_bookPrice")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">이미지</label>
						<div class="col-sm-5">
							<input type="file" name="bookImage" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10 ">
							<input type="submit" class="btn btn-primary" value="등록">
							<input type="reset" class="btn btn-primary " value="취소" >
						</div>
					</div>
				</form>

			</div>
		</div>
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
</body>
</html>
