<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 
<!DOCTYPE html>
<html>
	<head>
		<title>Address</title>
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
				select * from address where uid=?
				<sql:param>${u.uid}</sql:param>
			</sql:query>
					
			<div class="container">
				<div class="row">
					<c:forEach items="${rs.rows}" var="row">
						<div class=m-2 style="border:solid; border-radius: 10px;" >	
							<div class="card" style="width: 34rem;">
								<div class="card-body">
									<h3 class="card-title">${row.name}</h3>
									<p class="card-text">${row.mobile}</p>
								</div>
								<ul class="list-group list-group-flush">
									<li class="list-group-item">${row.pincode}</li>
									<li class="list-group-item">${row.house} </li>
									<li class="list-group-item">${row.area}</li>
									<li class="list-group-item">${row.landmark}</li>
									<li class="list-group-item">${row.city}</li>
									<li class="list-group-item">${row.state}</li>
									<li class="list-group-item">${row.type}</li>
								</ul>
								<div class="card-body">
									<a href="OrderController?add=${row.aid}&id=${cart.cartid}&qty=${cart.quantity}&pid=${cart.phone_id}&price=${row.price*cart.quantity}" class="btn btn-success btn-block">Buy</a>
								</div>
							</div>
						</div>
					</c:forEach>
					<a href="addAddress.jsp" >
					<div class=m-2 style="border:solid; border-radius: 10px;" >	
							<div class="card" style="width: 34rem; height:34rem">
								
								<ul class="list-group list-group-flush">
									<center><h1>Add New Address</h1></center>
								</ul>
								<div class="card-body">
									
								</div>
							</div>
						</div>
					</a>
				</div>
			</div>	  
		<jsp:include page="footer.jsp"></jsp:include>
		
	
</body>
</html>