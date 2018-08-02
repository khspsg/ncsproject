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
	<form id="salaryroll_search" name="salaryroll_search" method="post" action="salaryrollsearch">
<!-- 		<div class="container"> -->
			<div class="row" style="margin-top: 30px">
				<div class="col-md-4"></div>
				<div class="col-md-4" style="text-align: center">
					<h1>Salary</h1>
				</div>
				<div class="col-md-4"></div>
			</div>
			

			<table class="table table-bordered" id="salaryrollsearch" style="margin-top: 30px">
				<thead class="thead-dark" style="text-align: center">
					<tr>
						<th>ym</th>
						<th>dept</th>
						<th>no</th>
						<th>name</th>
						<th>pay</th>
						<th>id</th>
						<th>ia</th>
						<th>pd</th>
						<th>ai</th>
						<th>sd</th>
						<th>sa</th>
						<th>ct</th>
						<th>itd</th>
						<th>dt</th>
						<th>st</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="salary" items="${salaryrolls}" varStatus="status">
				<c:choose>
                          <c:when test="${(salary.yyyy == '총계' && salary.empno == '부서소계')
                          || (salary.mm == '총계' && salary.empno == '부서소계')}">
                             <tr>
                             </tr>
                          </c:when>
                          <c:otherwise>
                             <tr>
                                <c:choose>
                                	<c:when test="${(salary.dept != '소계') && (salary.empno == '부서소계')}">
                                      <td></td>
                                        <td>${salary.dept}</td>
                                        <td>${salary.empno}</td>
                                      <td></td>
                                    </c:when>
                                    <c:when test="${(salary.dept == '소계') && (salary.empno == '부서소계')}">
                                      <td></td>
                                        <td>총계</td>
                                        <td></td>
                                      <td></td>
                                    </c:when>
                                    <c:otherwise>
                                      <td>${salary.yyyy}-${salary.mm}</td>
                                        <td>${salary.dept}</td>
                                        <td>${salary.empno}</td>
                                        <td>${salary.name}</td>
                                    </c:otherwise>
                                </c:choose>
                                    
				
						<td>${salary.pay12}</td>
						<td>${salary.incomededuction}</td>
						<td>${salary.incomeamount}</td>
						<td>${salary.personaldeduction}</td>
						<td>${salary.annuityinsurance}</td>
						<td>${salary.specialdeduction}</td>
						<td>${salary.standardamount}</td>
						<td>${salary.calculatedtax}</td>
						<td>${salary.incometaxdeduction}</td>
						<td>${salary.decidedtax}</td>
						<td>${salary.simpletax}</td>
					</tr>
				</c:otherwise>
				</c:choose>
				</c:forEach>
				</tbody>
			</table>
			<div class="row" style="margin-top: 30px">
				<div class="col-md-3"></div>
				<div class="col-md-2" style="text-align: center">
					<input type="text" class="form-control" id="yyyy" name="yyyy" value="${yyyy}" style="ime-mode:disabled" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' maxlength="4" required="true">
				</div>
				<div class="col-md-2">
					<select id="mm" name="mm" class="form-control">
					<c:forEach begin="1" end="12" var="x" step="1">
						<option value="${x}">${x}월</option>
					</c:forEach>
					</select>
				</div>
				<div class="col-md-2">
					<button type="submit" class="btn btn-primary btn-block">확인</button>
				</div>
				<div class="col-md-3"></div>
			</div>
			
		</div>
	</form>
</body>
</html>