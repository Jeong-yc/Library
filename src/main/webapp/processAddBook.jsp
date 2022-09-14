<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	String filename = "";
	String realFolder = getServletContext().getRealPath("/") + "upload";
	System.out.println("경로확인--->" + realFolder);
	
	String encType = "utf-8";
	int maxSize = 5 * 1024 * 1024;

	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, 
			encType, new DefaultFileRenamePolicy());

	String bookId = multi.getParameter("bookId");
	String name = multi.getParameter("name");
	String author = multi.getParameter("author");
	String publisher = multi.getParameter("publisher");
	String publisher_date = multi.getParameter("publisher_date");
	String bookPrice = multi.getParameter("bookPrice");
	
	Integer price;
	
	if(bookPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(bookPrice);
	
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	String sql = "INSERT INTO book VALUES(?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, bookId);
	pstmt.setString(2, name);
	pstmt.setString(3, author);
	pstmt.setString(4, publisher);
	pstmt.setString(5, publisher_date);
	pstmt.setInt(6, price);
	pstmt.setString(7, fileName);
	pstmt.executeUpdate();
	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("books.jsp");
%>