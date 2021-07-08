<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 
<!DOCTYPE html>
<html>
	<head>
		<title>Product</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<style>
/* @import url(http://fonts.googleapis.com/css?family=Roboto:500,100,300,700,400); */

* {
  margin: 0;
  padding: 0;
  font-family: roboto;
}

/* body { background: #000; } */

/* .cont {
  width: 93%;
  max-width: 350px;
  text-align: center;
  margin: 4% auto;
  padding: 30px 0;
  background: #000;
  color: #EEE;
  border-radius: 5px;
  border: thin solid #444;
  overflow: hidden;
} */

hr {
  margin: 20px;
  border: none;
  border-bottom: thin solid rgba(255,255,255,.1);
}

div.title { font-size: 2em; }

h1 span {
  font-weight: 300;
  color: #Fd4;
}

div.stars {
  width: 270px;
  display: inline-block;
}

input.star { display: none; }

label.star {
  float: right;
  padding: 10px;
  font-size: 36px;
  color: #444;
  transition: all .2s;
}

input.star:checked ~ label.star:before {
  content: '\f005';
  color: #FD4;
  transition: all .25s;
}

input.star-5:checked ~ label.star:before {
  color: #FE7;
  text-shadow: 0 0 20px #952;
}

input.star-1:checked ~ label.star:before { color: #F62; }

label.star:hover { transform: rotate(-15deg) scale(1.3); }

label.star:before {
  content: '\f006';
  font-family: FontAwesome;
}
</style>

	
	</head>
<body>
		 
			<jsp:include page="header.jsp"></jsp:include>
			<sql:setDataSource driver="com.mysql.jdbc.Driver"
							   url="jdbc:mysql://localhost:3306/osps"
							   user="root"
							   password="root"
							   var="con"/>
							   
			<sql:query var="rs" dataSource="${con}">
				select * from product where pid=?
				<sql:param>${param.id}</sql:param>
			</sql:query>
					
			<div class="container">
				<div class="row">
					<c:forEach items="${rs.rows}" var="row">
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
								  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" style="color:black;" data-slide="prev">
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
									<li class="list-group-item"><s>Rs.${row.price+1000}</s> Rs.${row.price}</li>
									<li class="list-group-item">Description :  </li>
									<li class="list-group-item">${row.description}</li>
								</ul>
								<div class="card-body">
									<a href="AddToCartServlet?id=${row.pid}&price=${row.price}" class="btn btn-block btn-primary">Add To Cart</a>
									
									<c:if test="${u.role=='admin'}">
									<a href="editPhone.jsp?id=${row.pid}" class="btn btn-block btn-success">Edit</a>
									</c:if>
								</div>
								<div class="card-body">
								<div class="stars">
    <form action="AddReview" class="form">
    	<input type="number" name="pid" value="${row.pid}" hidden/>
      <input class="star star-5" id="star-5-2" value="5"  type="radio" name="star"/>
      <label class="star star-5" for="star-5-2"></label>
      <input class="star star-4" id="star-4-2" value="4" type="radio" name="star"/>
      <label class="star star-4" for="star-4-2"></label>
      <input class="star star-3" id="star-3-2" value="3" type="radio" name="star"/>
      <label class="star star-3" for="star-3-2"></label>
      <input class="star star-2" id="star-2-2" value="2" type="radio" name="star"/>
      <label class="star star-2" for="star-2-2"></label>
      <input class="star star-1" id="star-1-2" value="1" checked="checked" type="radio" name="star"/>
      <label class="star star-1" for="star-1-2"></label>
      <div class="form-group" >
      <input type="text" name="review" placeholder="Write Review" class="form-control" required>
      
      </div>
      <div class="form-group" >
				<input type="submit" value="Add" class="btn btn-block btn-success "/>
				<input type="reset" value="Reset" class="btn btn-block btn-danger"/>
			</div>
    </form>
  </div>
  </div>
							</div>
						</div>
						<div class=m-2 style="border:solid; border-radius: 10px;" >	
							<div class="card" style="width: 67.5rem; margin-top: 20px">
							<center><h1>Reviews</h1></center>
							
							<sql:query var="r" dataSource="${con}">
								select * from review where pid=?
								<sql:param>${row.pid}</sql:param>
							</sql:query>
					
								<c:forEach items="${r.rows}" var="review">
									<div class=m-2 style="border:solid; border-radius: 10px;" >	
										<div class="card" style="width: rem;">
											<div class="card-body" style="background-color: grey;">
												<h3 class="card-title">${review.username}</h5>
												
											</div>
											<ul class="list-group list-group-flush">
												<li class="list-group-item">Ratings : ${review.rating}/5</li>
												<li class="list-group-item">Review :  ${review.review}</li>
												<li class="list-group-item"></li>
											</ul>
												
										</div>
									</div>							
								</c:forEach>
							
							</div>
						</div>
					</c:forEach>
				</div>
			</div>	  
		<jsp:include page="footer.jsp"></jsp:include>
		
	
</body>
</html>