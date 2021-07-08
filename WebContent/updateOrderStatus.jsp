<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Update Order Status</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
	</head>
<body>
		 
			<jsp:include page="header.jsp"></jsp:include>
			<sql:setDataSource driver="com.mysql.jdbc.Driver"
							   url="jdbc:mysql://localhost:3306/osps"
							   user="root"
							   password="root"
							   var="con"/>
			
   		
   		<sql:query var="rs" dataSource="${con}">
			select * from cart where not (order_status='notOrdered' OR order_status='deleted')
		</sql:query>
   		
			
			<div class="container">
				<div class="m-2">
				<table class="table table-hover">
					<tr>
						<th>Cart ID</th>
						<th>Phone ID</th>
						<th>Uid</th>
						<th>Quantity</th>
						<th>Price</th>
						<th>Status</th>
						
					</tr>
					<c:forEach items="${rs.rows}" var="row">
						<tr>
							<td>${row.cartid}</td>
							<td>${row.phone_id}</td>
							<td>${row.uid}</td>
							<td>${row.quantity}</td>
							<td>${row.price}</td>
							<td><${row.order_status}</td>
							<td><a href=""><button class="btn btn-primary">Update Order Status</button></a></td>
						</tr>
					</c:forEach>
				</table>
				</div>
			</div>	
			
		<jsp:include page="footer.jsp"></jsp:include>
		
	
</body>
</html>