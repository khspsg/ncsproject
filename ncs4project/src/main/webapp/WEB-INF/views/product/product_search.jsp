<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="product_search" name="product_search" method="post" action="productsearch">
		<div class="container">
			<div class="row" style="margin-top: 30px">
				<div class="col-md-4"></div>
				<div class="col-md-4" style="text-align: center">
					<h1>Product</h1>
				</div>
				<div class="col-md-4"></div>
			</div>
			

			<table class="table table-bordered" id="examplesalary" style="margin-top: 30px">
				<thead class="thead-dark" style="text-align: center">
					<tr>
						<th>code</th>
						<th>name</th>
						<th>capacity</th>
						<th>buyprice</th>
						<th>saleprice</th>
						<th>preyystock</th>
						<th>premmstock</th>
						<th>preddstock</th>
						<th>stock</th>
						<th>explanation</th>
					</tr>
				</thead>
				<c:forEach var="product" items="${products}" varStatus="status">
				<tbody>
					<tr>
						<td><a href="productupdateform?code=${product.code}" style="color: #292929">${product.code}</a></td>
						<td>${product.name}</td>
						<td>${product.capacity}</td>
						<td>${product.buyprice}</td>
						<td>${product.saleprice}</td>
						<td>${product.preyystock}</td>
						<td>${product.premmstock}</td>
						<td>${product.preddstock}</td>
						<td>${product.stock}</td>
						<td>${product.explanation}</td>
					</tr>
				</tbody>
				</c:forEach>
			</table>
			<div class="row" style="margin-top: 30px">
				<div class="col-md-4"></div>
				<div class="col-md-4" style="text-align: center">
					<a href="productinsertform"><button type="button" class="btn btn-primary">입력</button></a>
				</div>
				<div class="col-md-4"></div>
			</div>
			
		</div>
	</form>
</body>
</html>