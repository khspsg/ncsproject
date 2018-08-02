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
	<form id="balance_detail" name="balance_detail" method="post" action="balanceupdateform">
		<div class="container">
			<div class="row" style="margin-top: 30px">
				<div class="col-md-4"></div>
				<div class="col-md-4" style="text-align: center">
					<h1>detail</h1>
				</div>
				<div class="col-md-4"></div>
			</div>
			<table class="table table-bordered" id="balancedetail" style="margin-top: 30px">
				<thead class="thead-dark" style="text-align: center">
					<tr>
						<th>${balance.yyyy}년</th>
						<th>prebalance</th>
						<th>balance</th>
						<th>deal</th>
						<th>pay</th>
						<th>cash</th>
						<th>check</th>
						<th>card</th>
						<th>etc</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1월</td>
						<td>${balance.prebalance01}</td>
						<td>${balance.balance01}</td>
						<td>${balance.deal01}</td>
						<td>${balance.pay01}</td>
						<td>${balance.cash01}</td>
						<td>${balance.check01}</td>
						<td>${balance.card01}</td>
						<td>${balance.etc01}</td>
					</tr>
					<tr>
						<td>2월</td>
						<td>${balance.prebalance02}</td>
						<td>${balance.balance02}</td>
						<td>${balance.deal02}</td>
						<td>${balance.pay02}</td>
						<td>${balance.cash02}</td>
						<td>${balance.check02}</td>
						<td>${balance.card02}</td>
						<td>${balance.etc02}</td>
					</tr>
					<tr>
						<td>3월</td>
						<td>${balance.prebalance03}</td>
						<td>${balance.balance03}</td>
						<td>${balance.deal03}</td>
						<td>${balance.pay03}</td>
						<td>${balance.cash03}</td>
						<td>${balance.check03}</td>
						<td>${balance.card03}</td>
						<td>${balance.etc03}</td>
					</tr>
					<tr>
						<td>4월</td>
						<td>${balance.prebalance04}</td>
						<td>${balance.balance04}</td>
						<td>${balance.deal04}</td>
						<td>${balance.pay04}</td>
						<td>${balance.cash04}</td>
						<td>${balance.check04}</td>
						<td>${balance.card04}</td>
						<td>${balance.etc04}</td>
					</tr>
					<tr>
						<td>5월</td>
						<td>${balance.prebalance05}</td>
						<td>${balance.balance05}</td>
						<td>${balance.deal05}</td>
						<td>${balance.pay05}</td>
						<td>${balance.cash05}</td>
						<td>${balance.check05}</td>
						<td>${balance.card05}</td>
						<td>${balance.etc05}</td>
					</tr>
					<tr>
						<td>6월</td>
						<td>${balance.prebalance06}</td>
						<td>${balance.balance06}</td>
						<td>${balance.deal06}</td>
						<td>${balance.pay06}</td>
						<td>${balance.cash06}</td>
						<td>${balance.check06}</td>
						<td>${balance.card06}</td>
						<td>${balance.etc06}</td>
					</tr>
					<tr>
						<td>7월</td>
						<td>${balance.prebalance07}</td>
						<td>${balance.balance07}</td>
						<td>${balance.deal07}</td>
						<td>${balance.pay07}</td>
						<td>${balance.cash07}</td>
						<td>${balance.check07}</td>
						<td>${balance.card07}</td>
						<td>${balance.etc07}</td>
					</tr>
					<tr>
						<td>8월</td>
						<td>${balance.prebalance08}</td>
						<td>${balance.balance08}</td>
						<td>${balance.deal08}</td>
						<td>${balance.pay08}</td>
						<td>${balance.cash08}</td>
						<td>${balance.check08}</td>
						<td>${balance.card08}</td>
						<td>${balance.etc08}</td>
					</tr>
					<tr>
						<td>9월</td>
						<td>${balance.prebalance09}</td>
						<td>${balance.balance09}</td>
						<td>${balance.deal09}</td>
						<td>${balance.pay09}</td>
						<td>${balance.cash09}</td>
						<td>${balance.check09}</td>
						<td>${balance.card09}</td>
						<td>${balance.etc09}</td>
					</tr>
					<tr>
						<td>10월</td>
						<td>${balance.prebalance10}</td>
						<td>${balance.balance10}</td>
						<td>${balance.deal10}</td>
						<td>${balance.pay10}</td>
						<td>${balance.cash10}</td>
						<td>${balance.check10}</td>
						<td>${balance.card10}</td>
						<td>${balance.etc10}</td>
					</tr>
					<tr>
						<td>11월</td>
						<td>${balance.prebalance11}</td>
						<td>${balance.balance11}</td>
						<td>${balance.deal11}</td>
						<td>${balance.pay11}</td>
						<td>${balance.cash11}</td>
						<td>${balance.check11}</td>
						<td>${balance.card11}</td>
						<td>${balance.etc11}</td>
					</tr>
					<tr>
						<td>12월</td>
						<td>${balance.prebalance12}</td>
						<td>${balance.balance12}</td>
						<td>${balance.deal12}</td>
						<td>${balance.pay12}</td>
						<td>${balance.cash12}</td>
						<td>${balance.check12}</td>
						<td>${balance.card12}</td>
						<td>${balance.etc12}</td>
					</tr>
				</tbody>
			</table>
			<div class="row" style="margin-top: 30px">
				<div class="col-md-4"></div>
				<div class="col-md-2">
					<a href="balanceupdateform?vendcode=${balance.vendcode}&yyyy=${balance.yyyy}"><button type="button" class="btn btn-primary btn-block">수정</button></a>
				</div>
				<div class="col-md-2">
					<a href="balancesearch?yyyy=${balance.yyyy}&vendcode=${balance.vendcode}"><button type="button" class="btn btn-primary btn-block">취소</button></a>
				</div>
				<div class="col-md-4"></div>
			</div>
			
		</div>
	</form>
</body>
</html>