<%@ page contentType="text/html; charset=UTF-8" isErrorPage="true"%>
<html>
<head>
<link rel="stylesheet" href="./resource/css/bootstrap.min.css" />
<title>도서 아이디 오류</title>
</head>
<body>
	
	<jsp:include page="menu.jsp" />	
	
	<p>오류가 발생하였습니다.
	<p>	예외 : <%=exception%>
	<p>	toString() : <%=exception.toString()%>
	<p>	getClass().getName() :	<%=exception.getClass().getName()%>
	<p>	getMessage() :	<%=exception.getMessage()%>
	
	<div class="jumbotron">
		<div class="container">
			<h2 class="alert alert-danger">해당 상품이 존재하지 않습니다.</h2>
		</div>
	</div>
	<div class="container">
		<p><%=request.getRequestURL()%>?<%=request.getQueryString()%>
		<p><a href="books.jsp" class="btn btn-secondary"> 도서 목록 &raquo;</a>			
	</div>
</body>
</html>
