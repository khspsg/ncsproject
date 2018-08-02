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
	<form id="balance_search" name="balance_search" method="get" action="balancesearch">
		<div class="container">
			<div class="row" style="margin-top: 30px">
				<div class="col-md-4"></div>
				<div class="col-md-4" style="text-align: center">
					<h1>Balance</h1>
				</div>
				<div class="col-md-4"></div>
			</div>
			<table class="table table-bordered" id="balancesearch" style="margin-top: 30px">
				<thead class="thead-dark" style="text-align: center">
					<tr>
						<th>${y}년</th>
						<th>vendcode</th>
						<th>전년 이월</th>
						<th>거래액</th>
						<th>지불액</th>
						<th>잔액</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="balance" items="${balances}" varStatus="status">
					<tr>
						<td><a href="balancedetail?vendcode=${balance.vendcode}&yyyy=${balance.yyyy}" style="color: #292929">${balance.vendname}</a></td>
						<td>${balance.vendcode}</td>
						<td>${balance.preyybalance}</td>
						<td>${balance.deal01+balance.deal02+balance.deal03+balance.deal04+balance.deal05+balance.deal06+balance.deal07+balance.deal08+balance.deal09+balance.deal10+balance.deal11+balance.deal12}</td>
						<td>${balance.pay01+balance.pay02+balance.pay03+balance.pay04+balance.pay05+balance.pay06+balance.pay07+balance.pay08+balance.pay09+balance.pay10+balance.pay11+balance.pay12}</td>
						<td>${balance.balance01+balance.balance02+balance.balance03+balance.balance04+balance.balance05+balance.balance06+balance.balance07+balance.balance08+balance.balance09+balance.balance10+balance.balance11+balance.balance12}</td>
<%-- 						<td>${balance.balance}</td> --%>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<div class="row" style="margin-top: 30px">
				<div class="col-md-4"></div>
				<div class="col-md-2" style="text-align: center">
<!-- 					<input type="text" class="form-control" id="yyyy" name="yyyy" style="ime-mode:disabled" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' maxlength="4" required="true"> -->
					<select id="yyyy" name="yyyy" class="form-control">
					<c:forEach begin="1" end="18" var="x" step="1">
						<c:choose>
							<c:when test="${x <= 9}">
								<option value="20${19-x}">20${19-x}년</option>
							</c:when>
							<c:otherwise>
								<option value="200${19-x}">200${19-x}년</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					</select>
				</div>
				<div class="col-md-2">
					<button type="submit" class="btn btn-primary btn-block">확인</button>
				</div>
				<div class="col-md-4"></div>
			</div>
			
		</div>
	</form>
</body>
</html>