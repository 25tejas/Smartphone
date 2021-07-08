<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 
<!DOCTYPE html>
<html>
	<head>
		<title>Products</title>
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
			
		<c:if test="${param.sort!=null}">
			<c:if test="${param.sort=='hightolow'}">	
				<sql:query var="rs" dataSource="${con}">
					select * from product order by price desc
				</sql:query>
			</c:if>
		
			<c:if test="${param.sort=='lowtohigh'}">
				<sql:query var="rs" dataSource="${con}">
					select * from product order by price ASC
				</sql:query>
			</c:if>
		</c:if>
		
   		<c:if test="${param.modelno!=null && param.sort==null}">
   			<sql:query var="rs" dataSource="${con}">
				select * from product where modelno like '%' ? '%'
				<sql:param>${param.modelno}</sql:param> 
			</sql:query>
   		</c:if>
	
   		<c:if test="${param.modelno==null && param.sort==null}">
   			<sql:query var="rs" dataSource="${con}">
				select * from product 
			</sql:query>
   		</c:if>
			
			

			<div class="container">
				<div class="row">
					<c:forEach items="${rs.rows}" var="row">
						<div class=m-2 style="border:solid; border-radius: 15px;" >	
							<div class="card" style="width: 16rem; margin-top:10px">
								<center><a href="phone.jsp?id=${row.pid}"><img src="ImageServlet?id=${row.pid}" style="height:250px; width:auto;" class="card-img-top" alt="..."></a></center>
								<div class="card-body">
									<h5 class="card-title">${row.brandname}</h5>
									<p class="card-text">${row.modelno}</p>
								</div>
								<ul class="list-group list-group-flush">
									<li class="list-group-item"> <s>Rs.${row.price+1000}</s> Rs.${row.price}</li>
								</ul>
								<div class="card-body">
									<a href="AddToCartServlet?id=${row.pid}&price=${row.price}" class="btn btn-block btn-primary">Add To Cart</a>
									
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>	
			
		<jsp:include page="footer.jsp"></jsp:include>
		
	
</body>
</html>