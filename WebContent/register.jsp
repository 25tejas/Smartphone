<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Page</title>
<style>
	.myclass
	{
		margin:0 auto;
	}
</style>
</head>
<body>
		<script>
			function myfunction(element)
			{
				var url="ValidateServlet?value="+element.value+"&id="+element.id;
				var xhttp=new XMLHttpRequest();
				
				xhttp.onreadystatechange=function()
				{
					if(this.readyState==4 && this.status == 200)
					{
						document.getElementById("msg"+element.id).innerHTML=this.responseText;	
					}
				};
				
				xhttp.open("GET",url);
				xhttp.send();
			}
			function sendotp()
			{  
				var email = $("#email").val();
				var url="OtpWithVerify?email="+email;
				var xhttp = new XMLHttpRequest();
				xhttp.open("GET", url);
				xhttp.send();
			}
			function verifyotp()
			{  
				var otp= $("#otp").val();
				var url="ValidateOtp?otp="+otp;
				var xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange=function()
				{
					if(this.readyState==4 && this.status == 200)
					{
						document.getElementById("votp").innerHTML=this.responseText;	
					}
				};
				xhttp.open("GET", url);
				xhttp.send();
			}
			function vemail()
			{
				var filter1=/^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
				var email = $("#email").val();
				if (!filter1.test(email) )
			        $("#eemail").html("Email is not valid");
				else
			        $("#eemail").html("");
				
			}
			function match()
			{
				var password = $("#pwd").val();
			    var confirmPassword = $("#cpwd").val();
			    if (password != confirmPassword)
			        $("#error").html("Passwords do not match!");
			    else{
					 $("#error").html("Password is Matched");
				}
			}
			function validatePass() {
			    var password = $("#pwd").val();
			    var filter=/^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
			    
			    if (!filter.test(password) )
			        $("#serror").html("Password is week");
			    else
			    	$("#serror").html("Password is Strong");
			}
			  	
			</script>
			<%--
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function()
		    {
			    if (this.readyState == 4 && this.status == 200) 
			    {
			       document.getElementById("demo").innerHTML=xhttp.responseText;
			    }
			};
			xhttp.open("GET", "filename", true);
			xhttp.send();
			--%>

		
		<div class="container">
		<jsp:include page="header.jsp"></jsp:include>
		<div class="card" style="width:23rem; margin-top: 10px; margin-left:400px; border:solid; border-radius: 10px;" >
		<form action='SignUp' method='post'  method="post" style="margin: 10px;">
			
			<div class="card-body"><center><h1>Register</h1></center></div>
			<div class="form-group">
				<label>Enter Username : </label> <span id="msgusername" style="color:red"></span>
				<input type="text" name="username" id="username" onkeyup="myfunction(this)"  placeholder="Enter Username" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Enter Email : </label><span id="msgemail" style="color:red"></span><span id="eemail"></span>
				<input type="email" name="email" id="email" onkeyup="myfunction(this)" onkeypress="vemail()" placeholder="Enter Email" class="form-control"/>
				<small class="form-text text-muted">We'll never share your email with anyone else.</small>
			</div>
			<div class="form-group">
				<label>Enter Password : </label><span id="serror"></span>
				<input type="password" name="password" id="pwd" placeholder="Enter Password" onkeyup="validatePass()" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Enter Confirm Password : </label><span id="error"></span>
				<input type="password" name="cpassword" id="cpwd" placeholder="Enter Password" onkeyup="match()" class="form-control"/>
				
			</div>
			<div class="form-group">
				<label>Enter OTP : </label><span id="votp"></span>
				<input type="number" name="otp" min="1000" max="9999" id="otp" placeholder="Enter Password" onkeyup="verifyotp()" class="form-control"/>
			
			</div>
			<div class="form-group">
				<input type="button" value="Get OTP" onclick="sendotp()" class="btn btn-success btn-block"/> 	
				<input type="submit" value="Register" class="btn btn-primary btn-block"/>
				<input type="reset" value="Reset" class="btn btn-danger btn-block"/>
			</div>
		</form>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
		</div>
</body>
</html>