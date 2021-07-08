<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Phone</title>
</head>
<body>
		<div class="container">
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
		<c:forEach items="${rs.rows}" var="row">
		<div class="card" style="width:50rem; margin-top: 10px; margin-left:180px; border:solid; border-radius: 10px;" >
		<form action="UpdatePhone" method='post' class="form"  style="margin:10px;">
			<div class="card-body"><center><h1>Edit Phone</h1></center></div>
			<div class="form-group">
				<label>Enter ID:</label>
				<input type="text" name="id" value="${row.pid}" placeholder="Enter Brand Name" class="form-control" readonly/>
			</div>
			<div class="form-group">
				<label>Enter model No</label>
				<input type="text" name="modelno" value="${row.modelno}" placeholder="Enter Model NO" class="form-control" />
			</div>
			<div class="form-group">
				<label>Enter Description</label>
				<input type="text" name="description" value="${row.description}" placeholder="Enter Description" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Enter Price</label>
				<input type="text" name="price" value="${row.price}" placeholder="Enter Price" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Enter Quantity</label>
				<input type="text" name="qty" value="${row.qty}"placeholder="Enter Quantity" class="form-control"/>
			</div>
			
			<div class="form-group">
				<input type="submit" value="Update Product" class="btn btn-primary btn-block"/>
				<input type="reset" value="Reset" class="btn btn-danger btn-block"/>
			</div>
		</form>
		</div>
		</c:forEach>
		</div>
</body>
</html>