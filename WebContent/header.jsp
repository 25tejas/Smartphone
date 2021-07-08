<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Header</title>
		
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

		<style type="text/css">
		.header{
			color:#C0C0C0;
			margin-left:10px;	
		}
		#lblCartCount {
				    font-size: 12px;
				    background: #ff0000;
				    color: #fff;
				    padding: 0 5px;
				    vertical-align: top;
					}
		.myclass
		{
			margin:0 auto;
		}
		*{
		font-family: FontAwesome;
		}
		</style>
</head>
<body>
	<div class="card" style="border:solid; border-radius: 15px; height:90px;">
		<h1 style="text-align:center; margin-top: 10px;">Online Smartphone Shopping</h1>
	</div>
	 
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  		<a class="navbar-brand" href="index.jsp">Home</a>
	  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    		<span class="navbar-toggler-icon"></span>
	  		</button>
	
	  		<div class="collapse navbar-collapse" id="navbarSupportedContent">
	    	<ul class="navbar-nav mr-auto">
	      
	       		<li class="nav-item">
		        	<a class="nav-link" href="product.jsp" data-toggle="tooltip" data-placement="top" title="See Phones">Phone</a>
	      		</li>
		  
				<c:if test="${u==null}">
		       		<li class="nav-item">
		        		<a class="nav-link" href="login.jsp">Login</a>
			      	</li>
			      	<li class="nav-item">
			        	<a class="nav-link" href="register.jsp">Register</a>
			      	</li>
	      		</c:if>
	 
		      	<c:if test="${u!=null}">
			      	<li class="nav-item">
			           	<a class="nav-link" href="yourOrdered.jsp">Your Ordered</a>
			     	</li>
		     	</c:if>
		     	
		      	<c:if test="${u.role=='admin'}">
			      	<li class="nav-item">
			           	<a class="nav-link" href="addPhone.jsp">Add Phone</a>
			     	</li>
			     	<li class="nav-item">
			           	<a class="nav-link" href="listUser.jsp">Users</a>
			     	</li>
	      		</c:if>
				<c:if test="${u!=null}">
				  	<li class="nav-item dropdown">
			        	<a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Sort by:</a>
			        	<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
				          	<span><a class="dropdown-item" href="product.jsp?sort=lowtohigh">Price:Low to High</a></span>
				          	<span><a class="dropdown-item" href="product.jsp?sort=hightolow">Price:High to Low</a></span>
			        	</div>
			      	</li>	
				</c:if> 
			</ul>
	    
	    	<ul class="navbar-nav justify-content-end">
		    	<form id="myform" class="form-inline" action="product.jsp">
				    <input class="form-control mr-sm-2" type="search" id="modelno" name="modelno" placeholder="Search" aria-label="Search" required>
				 	<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			 	</form>
			 	
		 		<button id="start-btn" class="btn btn-outline-primary ml-2">
				 	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-mic" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
			  			<path fill-rule="evenodd" d="M3.5 6.5A.5.5 0 0 1 4 7v1a4 4 0 0 0 8 0V7a.5.5 0 0 1 1 0v1a5 5 0 0 1-4.5 4.975V15h3a.5.5 0 0 1 0 1h-7a.5.5 0 0 1 0-1h3v-2.025A5 5 0 0 1 3 8V7a.5.5 0 0 1 .5-.5z"/>
			  			<path fill-rule="evenodd" d="M10 8V3a2 2 0 1 0-4 0v5a2 2 0 1 0 4 0zM8 0a3 3 0 0 0-3 3v5a3 3 0 0 0 6 0V3a3 3 0 0 0-3-3z"/>
					</svg>
				</button>
				
	    		<c:if test="${u!=null}">
	    		
	    		<div class="header">
					<li class="nav-item">
					 <a  href="cart.jsp">
				     <i class="fa fa-shopping-cart"></i>
				     <a href="Cart.jsp" class="icon-shopping-cart" style="font-size:25px" data-toggle="tooltip" data-placement="top" title="Tap to speak">
				     <asp:Label ID="lblCartCount" runat="server" CssClass="badge badge-info" ForeColor="white"/><%=(request.getSession().getAttribute("count"))%></a>
					 </a>
					</li>
				</div>
				
			  	<li class="nav-item">
			        <a class="nav-link" href="logout.jsp">Logout</a>
		        </li>
		       
		        
	        	</c:if>
			</ul>
	  		</div>
		</nav> 
	<div>
	<c:if test="${u.username!=null}">
		<h3>Welcome <%=(request.getSession().getAttribute("username"))%></h3>
	</c:if>
	</div>
</div>
</body>
<script src="script.js" type="text/javascript"></script>	
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	
</html>