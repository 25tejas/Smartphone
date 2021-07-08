<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Orders</title>

</head>
<body>
		<jsp:include page="header.jsp"></jsp:include>
			<sql:setDataSource driver="com.mysql.jdbc.Driver"
							   url="jdbc:mysql://localhost:3306/osps"
							   user="root"
							   password="root"
							   var="con"/>
					

	<sql:query var="rs" dataSource="${con}">
		select * from cart where (order_status='Ordered') AND uid=?
		<sql:param>${u.uid}</sql:param>
	</sql:query>
	
	<c:forEach items="${rs.rows}" var="cart">
	<sql:query var="rs2" dataSource="${con}">
		select * from product where pid=?
		<sql:param>${cart.phone_id}</sql:param>
	</sql:query>

	<div class="container">
		<div class="row">
			<c:forEach items="${rs2.rows}" var="row">
						
						<div class=m-2 style="border:solid; border-radius: 10px;" >	
							<div class="card" style="width: 27rem; margin-top: 20px">
							
								<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
									  <ol class="carousel-indicators">
									    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
									    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
									    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
								      </ol>
								  	  <div class="carousel-inner">
								    	<div class="carousel-item active">
								      		<center><img src="ImageServlet?id=${row.pid}" style="height:350px; width:auto;"alt="..."></center>
								      	</div>
								      	<div class="carousel-item">
								      		<center><img src="ImageServlet1?id=${row.pid}" style="height:350px; width:auto;"alt="..."></center>
								      	</div>
								      	<div class="carousel-item">
								      		<center><img src="ImageServlet2?id=${row.pid}" style="height:350px; width:auto;"alt="..."></center>
								      	</div>
							  		  </div>
								  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
								    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								    <span class="sr-only">Previous</span>
								  </a>
								  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
								    <span class="carousel-control-next-icon" aria-hidden="true"></span>
								    <span class="sr-only">Next</span>
								  </a>
								</div>
							
							</div>
						</div>
				
						<div class=m-2 style="border:solid; border-radius: 10px;" >	
							<div class="card" style="width: 39rem;">
								<div class="card-body">
									<h3 class="card-title">${row.brandname}</h5>
									<p class="card-text">${row.modelno}</p>
								</div>
								<ul class="list-group list-group-flush">
									<li class="list-group-item">Rs.${row.price}</li>
		
										<input type="number" name="id" value="${cart.cartid}" hidden/>
										<li class="list-group-item">Quantity : ${cart.quantity} Nos</li>
										<li class="list-group-item">Total Price: ${row.price*cart.quantity}</li>
										<div class="card-body">
											<a href="AddToCartServlet?id=${row.pid}" class="btn btn-primary btn-block">Buy it Again</a>	
											<a href="phone.jsp?id=${row.pid}" class="btn btn-info btn-block">View Product</a>
										</div>
												
								</ul>
								
							</div>
						</div>
						
			</c:forEach>
			
				
		</div>
	</div>	
	</c:forEach>    
	
</body>
</html>