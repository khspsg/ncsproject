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
	<form id="vender_search" name="vender_search" method="post" action="vendersearch">
		<div class="container">
			<div class="row" style="margin-top: 30px">
				<div class="col-md-4"></div>
				<div class="col-md-4" style="text-align: center">
					<h1>Vender</h1>
				</div>
				<div class="col-md-4"></div>
			</div>
			

			<table class="table table-bordered" style="margin-top: 30px">
				<thead class="thead-dark" style="text-align: center">
					<tr>
						<th>code</th>
						<th>name</th>
						<th>busno</th>
						<th>ceoname</th>
						<th>bt</th>
						<th>bc</th>
						<th>zipcode</th>
						<th>newaddr</th>
						<th>oldaddr</th>
						<th>detailaddr</th>
						<th>officeno</th>
					</tr>
				</thead>
				<c:forEach var="vender" items="${venders}" varStatus="status">
				<tbody>
					<tr>
						<td><a href="venderupdateform?code=${vender.code}" style="color: #292929">${vender.code}</a></td>
						<td>${vender.name}</td>
						<td>${vender.busno1}-${vender.busno2}-${vender.busno3}</td>
						<td>${vender.ceoname}</td>
						<td>${vender.bustype}</td>
						<td>${vender.busconditions}</td>
						<td>${vender.zipcode}</td>
						<td>${vender.newaddr}</td>
						<td>${vender.oldaddr}</td>
						<td>${vender.detailaddr}</td>
						<td>${vender.officeno1}-${vender.officeno2}-${vender.officeno3}</td>
					</tr>
				</tbody>
				</c:forEach>
			</table>
			<div class="row" style="margin-top: 30px">
				<div class="col-md-4"></div>
				<div class="col-md-4" style="text-align: center">
					<a href="venderinsertform"><button type="button" class="btn btn-primary">입력</button></a>
				</div>
				<div class="col-md-4"></div>
			</div>
			
		</div>
	</form>
</body>
</html>