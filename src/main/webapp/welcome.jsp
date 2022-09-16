<%@page import="java.net.URI"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resource/css/bootstrap.min.css" />
<link rel="stylesheet" href="./resource/css/main.css" />

<meta name="viewport" content="width-device-width">
<meta charset="UTF-8">
<title>Welcome!</title>
</head>
<body>
	<%@ include file = "menu.jsp" %>
	<%!String greeting = "Welcome";%>
			<div class = "container">
		       <div class="main-view">
		          <ul>
		            <li><img src="./resource/images/lib1.jpg" width="100%" /></li>
		            <li><img src="./resource/images/lib2.jpg" width="100%" /></li>
		            <li><img src="./resource/images/lib3.jpg" width="100%" /></li>
		          </ul>
		        </div>
		        
	        <div class="cater3-movingBG">
				<div class="flyinTxtCont">
					<div class="flyIn lineOne">WELCOME</div>
					<div class="flyIn lineTwo">LIBRARY </div>	
					<div class="flyIn lineFour"></div>
				</div>
			</div>
	
	<div class="container">
		<div class="text-center">
			<%
				response.setIntHeader("Refresh", 60);
				Date day = new java.util.Date();
				String am_pm;
				int hour = day.getHours();
				int minute = day.getMinutes();
				int second = day.getSeconds();
				if (hour / 12 == 0) {
					am_pm = "AM";
				} else {
					am_pm = "PM";
					hour = hour - 12;
				}
				String CT = hour + ":" + minute + ":" + second + " " + am_pm;
				out.println("현재 접속  시각: " + CT + "\n");
			%>
		</div>
		<hr>
	</div>	
</body>
</html>