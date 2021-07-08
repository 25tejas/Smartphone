<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Address</title>
</head>
<body>
<div class="container">
		<jsp:include page="header.jsp"></jsp:include>
		<div class="card" style="width:50rem; margin-top: 10px; margin-left:200px; border:solid; border-radius: 10px;" >
		<form action='AddAddress' method='post'  method="post" style="margin: 10px;">
			
			<div class="card-body"><center><h1>Add Address</h1></center></div>
				 <div class="form-group">
			 <div class="form-row">
			<div class="col-lg-4 col-md-3 col-sm-6 col-xs-12">
				<label>Enter Name: </label>
				<input type="text" name="name" id="name"  placeholder="Enter Name" class="form-control" required/>
			</div>
			<div class="col-lg-4 col-md-3 col-sm-6 col-xs-12">
				<label>Enter Mobile :</label>
				<input type="number" name="mobile" id="number" placeholder="Enter Mobile" class="form-control" required/>
			</div>
			<div class="col-lg-4 col-md-3 col-sm-6 col-xs-12">
				<label>Enter pincode : </label>
				<input type="number" name="pincode" id="pincode" placeholder="Enter pincode" class="form-control" required/>
			</div>
			</div>
			 <div class="form-row">
			<div class="col-lg-4 col-md-3 col-sm-6 col-xs-12">
				<label>Enter house : </label>
				<input type="text" name="house" id="house" placeholder="Enter House"  class="form-control" required/>
				
			</div>
			<div class="col-lg-4 col-md-3 col-sm-6 col-xs-12">
				<label>Enter area : </label>
				<input type="text" name="area" id="area" placeholder="Enter Area" class="form-control" required/>
				
			</div>
			<div class="col-lg-4 col-md-3 col-sm-6 col-xs-12">
				<label>Enter landmark : </label>
				<input type="text" name="landmark" id="landmark" placeholder="Enter landmark" class="form-control"  required/>
				
			</div>
			</div>
			 <div class="form-row">
			<div class="col-lg-4 col-md-3 col-sm-6 col-xs-12">
				<label>Enter city : </label>
				<input type="text" name="city" id="city" placeholder="Enter City" class="form-control" required/>
				
			</div>
			<div class="col-lg-4 col-md-3 col-sm-6 col-xs-12">
				<label>Enter state : </label>
				<input type="text" name="state" id="state" placeholder="Enter State" class="form-control" required/>
				
			</div>
			<div class="col-lg-4 col-md-3 col-sm-6 col-xs-12">
				<label>Enter type : </label>
				<input type="text" name="type" id="type" placeholder="Enter Type" class="form-control" required/>
				
			</div>
			</div>
		
			 </div>
			<div class="form-group">
				<input type="submit" value="Add Address" class="btn btn-primary btn-block"/>
				<input type="reset" value="Reset" class="btn btn-danger btn-block"/>
			</div>
			
		</form>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
		</div>
</body>
</html>