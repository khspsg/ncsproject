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
	<form id="pay_form" name="pay_form" action="payinsert" method="post">
		<input type="hidden" id="vendname" name="vendname">
		<input type="hidden" id="seq" name="seq" value="0">
		<input type="hidden" id="beforepayway" name="beforepayway">
		<input type="hidden" id="beforeamount" name="beforeamount" value="0">
		<div class="container" style="text-align: center">
			<div style="margin-top: 30px">
				<h1>지불방법</h1>
			</div>
			<div class="row" style="margin-top: 30px">
				<div class="input-group mb-3 col-md-6">
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" style="width: 100px"><i
								class="fas fa-address-card" style="font-size: 15px"> 거래처</i></span>
						</div>
						<select id="selectpayvender" name="vendcode" class="form-control">
							<c:forEach var="vender" items="${venders}">
								<option value="${vender.code}"<c:if test="${vender.code == pay.vendcode}">selected</c:if>>${vender.name}</option>
							</c:forEach>
						</select>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" style="width: 100px"><i
								class="fas fa-address-card" style="font-size: 15px"> 지불번호</i></span>
						</div>
						<input type="text" id="yyyy" name="yyyy" class="form-control" style="background-color: #fff" value="${pay.yyyy}" readonly>
						&nbsp-&nbsp
						<input type="text" id="mm" name="mm" class="form-control" style="background-color: #fff" value="${pay.mm}" readonly>
						&nbsp-&nbsp
						<input type="text" id="dd" name="dd" class="form-control" style="background-color: #fff" value="${pay.dd}" readonly>
						&nbsp-&nbsp
						<input type="text" id="no" name="no" class="form-control" style="background-color: #fff" value="${pay.no}" readonly>
						&nbsp-&nbsp
						<input type="text" id="hang" name="hang" class="form-control" style="background-color: #fff" value="${pay.hang}" readonly>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" style="width: 100px"><i
								class="fas fa-address-card" style="font-size: 15px"> 지불방법</i></span>
						</div>
						<select id="payway" name="payway" class="form-control">
							<option value="cash">현금</option>
							<option value="check">어음</option>
							<option value="card">카드</option>
							<option value="etc">기타</option>
						</select>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" style="width: 100px"><i
								class="fas fa-address-card" style="font-size: 15px"> 금액</i></span>
						</div>
						<input type="text" id="amount" name="amount" class="form-control"
							maxlength="9" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" style="width: 100px"><i
								class="fas fa-address-card" style="font-size: 15px"> 비고</i></span>
						</div>
						<input type="text" id="memo" name="memo" class="form-control"
							maxlength="30">
					</div>
				</div>
				<div class="input-group mb-3 col-md-6" style="overflow:auto; height:254px">
					<div class="input-group mb-3">
						<table class="table table-bordered">
							<thead class="thead-dark">
								<tr style="text-align: left">
									<c:choose>
										<c:when test="${y == null}">
											<th colspan="2">(${pay.vendname})</th>
											<th colspan="2">${pay.yyyy}-${pay.mm}-${pay.dd}</th>
										</c:when>
										<c:otherwise>
											<th colspan="2">${vn}</th>
											<th colspan="2">
											<c:choose>
												<c:when test="${d != 0}">${y}-${m}-${d}</c:when>
												<c:otherwise>${y}-${m}</c:otherwise>
											</c:choose>
											</th>
										</c:otherwise>
									</c:choose>
								</tr>
								<tr>
									<th>No</th>
									<th>항번</th>
									<th>지불방법</th>
									<th>금액</th>
								</tr>
							</thead>
							<c:forEach var="pay" items="${pays}" varStatus="status">
								<tbody>
									<tr>
									<c:choose>
										<c:when test="${pay.hang==0 && pay.no !=0}">
											<td> </td>
											<td>소계</td>
											<td> </td>
											<td>${pay.total}</td>
										</c:when>
										<c:when test="${pay.hang==0 && pay.no ==0}">
											<td></td>
											<td>총계</td>
											<td></td>
											<td>${pay.total}</td>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${d != 0}">
													<td>${pay.no}</td>
												</c:when>
												<c:otherwise>
													<td>${pay.dd}-${pay.no}</td>
												</c:otherwise>
											</c:choose>
											<td>${pay.hang}</td>
											<td><a href="#" onclick="selectedpaySeq(${pay.seq})">${pay.payway}</a></td>
											<td>${pay.amount}</td>
										</c:otherwise>
									</c:choose>
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
			</form>
			<form id="paysearch_form" action="paysearch" method="get">
			<div class="row">
				<div class="input-group mb-3 col-md-6">
					<button type="button" id="paysave" class="btn btn-primary">저장</button>
					&nbsp&nbsp
					<button type="button" id="payupdate" class="btn btn-success" style="display: none">update</button>
					<button type="reset" id="payreset" class="btn btn-success">초기화</button>
					&nbsp&nbsp
					<a href="index"><button type="button" id="paycancel"
							class="btn btn-warning">취소</button></a>
					&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					<a href="payinsertform"><button type="button" id="paynew" class="btn btn-danger">New</button></a>
					&nbsp&nbsp
					<button type="button" id="paydelete" class="btn btn-default"  style="display: none">삭제</button>
				</div>
				<div class="input-group mb-3 col-md-6">
					<select id="searchvender" name="searchvender" class="form-control">
						<c:forEach var="vender" items="${venders}">
							<option value="${vender.code}"<c:if test="${vender.code == vn}">selected</c:if>>${vender.name}</option>
						</c:forEach>
					</select>
					<select id="searchyyyy" name="searchyyyy" class="form-control">
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
					<select id="searchmm" name="searchmm" class="form-control">
						<c:forEach var="i" begin="1" end="12" step="1">
							<option value="${i}"<c:if test="${i == m}">selected</c:if>>${i}월</option>
						</c:forEach>
					</select>
					<select id="searchdd" name="searchdd" class="form-control">
						<c:forEach var="i" begin="0" end="31" step="1">
							<option value="${i}"<c:if test="${i == d}">selected</c:if>>${i}일</option>
						</c:forEach>
					</select>
					<button type="button" id="paysearch" class="btn btn-primary">검색</button>
				</div>
			</div>
			<!-- Modal -->
			<div id="paymyModal" class="modal fade" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="background-color: #9999cc">
							상품 지불 체크
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title"></h4>
						</div>
						<div class="pay-modal-body">
							<p><span id="modalmsgvender"></span></p>
							<p><span id="modalmsgproduct"></span></p>
							<p><span id="modalmsg"></span></p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-success pay_modal_btn1" data-dismiss="modal">확인</button>
							<button type="button" class="btn btn-success pay_modal_btn2" data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>