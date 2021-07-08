<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="ISO-8859-1">
		<title>Add Phone</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
		
</head>
<body>
		<div class="container">
		<jsp:include page="header.jsp"></jsp:include>
		<div class="card" style="width:23rem; margin-top: 10px; margin-left:400px; border:solid; border-radius: 10px;" >
		<form action='AddPhone' enctype="multipart/form-data"  method='post' style="margin: 10px;" class="form">
			<div class="card-body"><center><h1>Add Phone</h1></center></div>
			<div class="form-group">
				<label>Enter model No</label>
				<input type="text" name="modelno" placeholder="Enter Model NO" class="form-control" required/>
			</div>
			<div class="form-group">
				<label>Enter Description</label>
				<input type="text" name="description" placeholder="Enter description" class="form-control" required/>
			</div>
			<div class="form-group">
				<label>Enter Price</label>
				<input type="text" name="price" placeholder="Enter Price" class="form-control" required/>
			</div>
			<div class="form-group">
				<label>Select File</label>
				<input type="file" name="image" placeholder="Select image" class="form-control" required/>
			</div>
			<div class="form-group">
				<label>Enter Quantity</label>
				<input type="text" name="qty" placeholder="Enter Quantity" class="form-control" required/>
			</div>
			<div class="form-group">
				<input type="submit" value="Add Product" class="btn btn-primary btn-block"/>
				<input type="reset" value="Reset" class="btn btn-danger btn-block"/>
			</div>
		</form>
		</div>
		</div>
</body>
</html>