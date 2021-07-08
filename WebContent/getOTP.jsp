<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert OTP</title>
</head>
<body>
		
		<div class="container">
		<jsp:include page="header.jsp"></jsp:include>
		
		<form class="col-lg-6 col-md-9 col-sm-12 col-xs-12 myclass" action="verifyOTP" method="post">
			<div class="form-group">
				<label>Enter OTP</label>
				<input type="text" name="OTP" placeholder="Enter OTP" class="form-control"/>
			</div>

			<div class="form-group">
				<input type="submit" value="submit" class="btn btn-primary btn-block"/>
				<input type="reset" value="Reset" class="btn btn-danger btn-block"/>
			</div>
		</form>
		
		<jsp:include page="footer.jsp"></jsp:include>
		</div>
</body>
</html>