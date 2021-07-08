<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Home Page</title>
	
</head>
<body>
		<div class="container">
		<jsp:include page="header.jsp"></jsp:include>
		
		<div class="jumbotron mt-2">
		  <h1 class="display-4">Hello, Welcome to Website!</h1>
		  <p class="lead">Here you will get various smartphone of Realme brand.</p>
		  <hr class="my-4">
		  <p>These Website is user friendly.</p>
		  <p class="lead">
		    <a class="btn btn-primary btn-lg" href="productjsp" role="button">Learn more</a>
		  </p>
		</div>
		 
		<jsp:include page="footer.jsp"></jsp:include>
		</div>
</body>
</html>