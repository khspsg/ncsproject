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
	<form id="salary_search" name="salary_search" method="post" action="salarysearch">
		<div class="container">
			<div class="row" style="margin-top: 30px">
				<div class="col-md-4"></div>
				<div class="col-md-4" style="text-align: center">
					<h1>Salary</h1>
				</div>
				<div class="col-md-4"></div>
			</div>
			

			<table class="table table-bordered" id="examplesalary" style="margin-top: 30px">
				<thead class="thead-dark" style="text-align: center">
					<tr>
						<th>empno</th>
						<th>dept</th>
						<th>name</th>
						<th>input_date</th>
						<th>birth_date</th>
						<th>partner</th>
						<th>dependent20</th>
						<th>dependent60</th>
						<th>disabled</th>
						<th>womanpower</th>
						<th>pay</th>
						<th>extra</th>
						<th>yn</th>
					</tr>
				</thead>
				<c:forEach var="salary" items="${salarys}" varStatus="status">
				<tbody>
					<tr>
						<td>${salary.empno}</td>
						<td>${salary.dept_name}</td>
						<td><a href="salaryupdateform?empno=${salary.empno}" style="color: #292929">${salary.name}</a></td>
						<td>${salary.input_date}</td>
						<td>${salary.birth_date}</td>
						<td>${salary.partner}</td>
						<td>${salary.dependent20}</td>
						<td>${salary.dependent60}</td>
						<td>${salary.disabled}</td>
						<td>${salary.womanpower}</td>
						<td>${salary.pay}</td>
						<td>${salary.extra}</td>
						<td>${salary.yn}</td>
					</tr>
					</tbody>
				</c:forEach>
			</table>
			<div class="row mb-3" style="margin-top: 30px">
				<div class="col-md-4"></div>
				<div class="col-md-4" style="text-align: center">
					<a href="salaryinsertform"><button type="button" class="btn btn-primary">입력</button></a>
				</div>
				<div class="col-md-4"></div>
			</div>
			
		</div>
	</form>
</body>
</html>