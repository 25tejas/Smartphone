<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<%
			session.removeAttribute("u");
			session.invalidate();
		%>
		<Center><h1>You have succesfully logout</h1></Center>
		<%
		out.println(""
				+ "<script>"
				+ "alert('Succesfully logout');"
				+ "window.location='login.jsp';"
				+ "</script>");
		%>
</body>
</html>