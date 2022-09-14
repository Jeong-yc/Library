<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  		<a class="navbar-brand" href="<c:url value="/welcome.jsp"/>">Home</a>
 		<button class="navbar-toggler" type="button" 
 				data-toggle="collapse" data-target="#navbarColor01" 
 				aria-controls="navbarColor01" aria-expanded="false" 
 				aria-label="Toggle navigation">
    		<span class="navbar-toggler-icon"></span>
  		</button>
		
		<div class="collapse navbar-collapse" id="navbarColor01">
			<ul class = "navbar-nav mr-auto">
				<c:choose>
					<c:when test="${empty sessionId}">
						<li class="nav-item active">
							<a class="nav-link" href="<c:url
							value="/member/loginMember.jsp"/>">Log-in
							<span class="sr-only">(current)</span></a></li>
						<li class="nav-item"><a class="nav-link" href="<c:url
						value="/member/addMember.jsp"/>">회원 가입</a></li>
					</c:when>
					<c:otherwise>
						<li style="padding-top: 7px; color: white">
						[<%=sessionId%>님]</li>
						<li class="nav-item active">
							<a class="nav-link" href="<c:url
							value="/member/logoutMember.jsp"/>">Log-out
							<span class="sr-only">(current)</span></a></li>
						<li class="nav-item"><a class="nav-link" href="<c:url
						value="/member/updateMember.jsp"/>">회원 수정</a></li>
						
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<div class="collapse navbar-collapse" id="navbarColor01">
	  		<ul class="navbar-nav mr-auto">
		      	<li class="nav-item">
		        	<a class="nav-link" href="<c:url value="/books.jsp"/>">도서 목록</a>
		      	</li>
		      	<li class="nav-item">
		        	<a class="nav-link" href="#">도서 대여</a>
		      	</li>
		      	<li class="nav-item">
		        	<a class="nav-link" href="<c:url value="/addBook.jsp"/>">도서 등록</a>
		      	</li>
		      	<li class="nav-item">
		        	<a class="nav-link" href="<c:url value="/editBook.jsp"/>">도서 수정</a>
		      	</li>
		      	<li class="nav-item">
		        	<a class="nav-link" href="#">도서 삭제</a>
		      	</li>
	    	</ul>
	    	<form class="form-inline my-2 my-lg-0">
	      		<input class="form-control mr-sm-2" type="text" placeholder="도서 검색">
	      		<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
	    	</form>
	  	</div>
	</nav>