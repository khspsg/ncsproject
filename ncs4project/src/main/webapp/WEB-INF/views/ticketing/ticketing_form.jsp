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
	<form id="ticketing_form" name="ticketing_form" action="ticketinginsert" method="post">
		<div class="container" style="text-align: center">
			<div class="row" style="margin-top: 30px">
				<div class="input-group col-md-1">
					<div class="input-group">
						<table class="table table-striped table-borderless">
							<thead>
								<tr class="thead-dark">
									<th colspan="2">날짜</th>
								</tr>
								<tr>
									<th colspan="2">2018</th>
								</tr>
								<tr>
									<th colspan="2">8</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach begin="1" end="8" step="1" var="x">
								<tr>
									<td>수</td>
									<td>${x}</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="input-group col-md-5" style="overflow:auto; height:540px">
					<div class="input-group">
						<table class="table table-borderless">
							<thead>
								<tr class="thead-dark">
									<th colspan="2">영화</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach begin="1" end="10" step="1" var="x">
								<tr>
									<td>${x}</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="input-group col-md-6" style="overflow:auto; height:540px">
					<div class="input-group">
						<table class="table table-borderless">
							<thead>
								<tr class="thead-dark">
									<th colspan="2">시간</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach begin="0" end="24" step="1" var="x">
								<tr>
									<td>미션임파서블 ${x}</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="row" style="background-color: #dad2b4">
				<div class="input-group col-md-4">
					<div class="input-group mb-3" style="margin-top: 15px">
						<h3>영화 : 미션임파서블 2D</h3>
					</div>
				</div>
				<div class="input-group col-md-4" style="margin-top: 15px">
					<div class="input-group mb-3">
						<h3>일시 : 2018년 8월 1일</h3>
					</div>
				</div>
				<div class="input-group col-md-2" style="margin-top: 15px">
					<div class="input-group mb-3">
						<h3>상영관 : 1관</h3>
					</div>
				</div>
				<div class="input-group col-md-2" style="margin-top: 15px">
					<div class="input-group mb-3">
						<button type="submit" class="btn btn-info btn-block">좌석선택</button>
					</div>
				</div>
			</div>
			<!-- Modal -->
			<div id="ticketingmyModal" class="modal fade" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="background-color: #9999cc">
							상품 매입 체크
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title"></h4>
						</div>
						<div class="ticketing-modal-body">
							<p><span id="modalmsgvender"></span></p>
							<p><span id="modalmsgproduct"></span></p>
							<p><span id="modalmsg"></span></p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-success ticketing_modal_btn1" data-dismiss="modal">확인</button>
							<button type="button" class="btn btn-success ticketing_modal_btn2" data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>