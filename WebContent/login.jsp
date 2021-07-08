<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Login Page</title>
	<style>
		/* body
		{
			background-image: url("Images/hawa.jpg");
			background-repeat: no-repeat;
			background-position: center;
			background-size: 1400px;
			
		} */
		form .form{
			margin: 0 auto;
		}
	</style>
</head>
<body>
		<%
			session.removeAttribute("u");
    		session.invalidate();
				
			String username="",password="";
			try
			{
				Cookie ck[]=request.getCookies();
				for(Cookie c:ck)
				{
					if(c.getName().equals("un"))
					{
							username=c.getValue();
					}
					else if(c.getName().equals("pwd"))
					{
							password=c.getValue();
					}
				}
			}
			catch(Exception e)
			{
				
			}
		%>
		<div class="container">
	
		<jsp:include page="header.jsp"></jsp:include>
			<div class="card" style="width:23rem; margin-top: 10px; margin-left:400px; border:solid; border-radius: 10px;" >  
               <form class="form" action="SignIn" method="post" style="margin: 10px;" >
       					<center><img src="Images/us.png" style="height:150px; width:auto;" class="card-img-top" alt="..."></a></center>
                        <div class="card-body"><center><h1>Login</h1></center></div>

						<div class="form-group">
							<label>Enter Username</label>
							<input type="text" name="username" placeholder="Enter Username" value="<%=username%>" class="form-control"/>
						</div>
						<div class="form-group">
							<label>Enter Password</label>
							<input type="password" name="password" placeholder="Enter Password" value="<%=password%>" class="form-control"/>
							<a href="forgotpassword.jsp">forgot password...?</a>
							<input type="number" name="id" value="${cart.cartid}" hidden/>
						</div>
						<div class="form-group">
							<input type="submit" value="Login" class="btn btn-primary btn-block"/>
							<input type="reset" value="Reset" class="btn btn-danger btn-block"/>
							
						</div>
					</form>
					</div>
	
		
		
		<jsp:include page="footer.jsp"></jsp:include>
		</div>
</body>
</html>