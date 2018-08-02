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
	<form id="buy_form" name="buy_form" action="buyinsert" method="post">
		<input type="hidden" id="vendname" name="vendname">
		<input type="hidden" id="seq" name="seq" value="0">
		<input type="hidden" id="beforeqty" name="beforeqty" value="0">
		<input type="hidden" id="beforeprocode" name="beforeprocode" value="0">
		<input type="hidden" id="beforeprice" name="beforeprice" value="0">
		<div class="container" style="text-align: center">
			<div style="margin-top: 30px">
				<h1>매입</h1>
			</div>
			<div class="row" style="margin-top: 30px">
				<div class="input-group mb-3 col-md-6">
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" style="width: 100px"><i
								class="fas fa-address-card" style="font-size: 15px"> 거래처</i></span>
						</div>
						<select id="selectvender" name="vendcode" class="form-control">
							<c:forEach var="vender" items="${venders}">
								<option value="${vender.code}"<c:if test="${vender.code == buy.vendcode}">selected</c:if>>${vender.name}</option>
							</c:forEach>
						</select>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" style="width: 100px"><i
								class="fas fa-address-card" style="font-size: 15px"> 매입번호</i></span>
						</div>
						<input type="text" id="yyyy" name="yyyy" class="form-control" style="background-color: #fff" value="${buy.yyyy}" readonly>
						&nbsp-&nbsp
						<input type="text" id="mm" name="mm" class="form-control" style="background-color: #fff" value="${buy.mm}" readonly>
						&nbsp-&nbsp
						<input type="text" id="dd" name="dd" class="form-control" style="background-color: #fff" value="${buy.dd}" readonly>
						&nbsp-&nbsp
						<input type="text" id="no" name="no" class="form-control" style="background-color: #fff" value="${buy.no}" readonly>
						&nbsp-&nbsp
						<input type="text" id="hang" name="hang" class="form-control" style="background-color: #fff" value="${buy.hang}" readonly>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" style="width: 100px"><i
								class="fas fa-address-card" style="font-size: 15px"> 상품명</i></span>
						</div>
						<select id="selectproduct" name="procode" class="form-control">
							<c:forEach var="product" items="${products}">
								<option value="${product.code}">
								<c:choose>
									<c:when test="${product.code == 0000000000000}">${product.name}</c:when>
									<c:otherwise>${product.name} (${product.capacity})</c:otherwise>
								</c:choose>
								</option>
							</c:forEach>
						</select>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" style="width: 100px"><i
								class="fas fa-address-card" style="font-size: 15px"> 상품코드</i></span>
						</div>
						<input type="text" id="productcode" name="productcode" class="form-control"
							maxlength="25" readonly>
						<div class="input-group-prepend">
							<span class="input-group-text" style="width: 100px"><i
								class="fas fa-address-card" style="font-size: 15px"> 현재재고</i></span>
						</div>
						<input type="text" id="stock" name="stock"
							class="form-control" maxlength="3" readonly>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" style="width: 100px"><i
								class="fas fa-address-card" style="font-size: 15px"> 단가</i></span>
						</div>
						<input type="text" id="price" name="price" class="form-control"
							maxlength="9">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" style="width: 100px"><i
								class="fas fa-address-card" style="font-size: 15px"> 수량</i></span>
						</div>
						<input type="text" id="qty" name="qty" class="form-control"
							maxlength="3">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" style="width: 100px"><i
								class="fas fa-address-card" style="font-size: 15px"> 금액</i></span>
						</div>
						<input type="text" id="total" name="total" class="form-control" style="background-color: #fff" value="0"
							maxlength="9" readonly>
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
				<div class="input-group mb-3 col-md-6" style="overflow:auto; height:415px">
					<div class="input-group mb-3">
						<table class="table table-bordered">
							<thead class="thead-dark">
								<tr style="text-align: left">
									<c:choose>
										<c:when test="${y == null}">
											<th colspan="3">(${buy.vendname})</th>
											<th colspan="3">${buy.yyyy}-${buy.mm}-${buy.dd}</th>
										</c:when>
										<c:otherwise>
											<th colspan="3">${vn}</th>
											<th colspan="3">
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
									<th>품명</th>
									<th>단가</th>
									<th>수량</th>
									<th>금액</th>
								</tr>
							</thead>
							<c:forEach var="buy" items="${buys}" varStatus="status">
								<tbody>
									<tr>
									<c:choose>
										<c:when test="${buy.hang==0 && buy.no !=0}">
											<td> </td>
											<td> </td>
											<td>소계</td>
											<td> </td>
											<td>${buy.qty}</td>
											<td>${buy.total}</td>
										</c:when>
										<c:when test="${buy.hang==0 && buy.no ==0}">
											<td></td>
											<td></td>
											<td>총계</td>
											<td></td>
											<td>${buy.qty}</td>
											<td>${buy.total}</td>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${d != 0}">
													<td>${buy.no}</td>
												</c:when>
												<c:otherwise>
													<td>${buy.dd}-${buy.no}</td>
												</c:otherwise>
											</c:choose>
											<td>${buy.hang}</td>
											<td><a href="#" onclick="selectedSeq(${buy.seq})">${buy.proname}</a></td>
											<td>${buy.price}</td>
											<td>${buy.qty}</td>
											<td>${buy.total}</td>
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
			<form id="buysearch_form" action="buysearch" method="get">
			<div class="row">
				<div class="input-group mb-3 col-md-6">
					<button type="button" id="buysave" class="btn btn-primary">저장</button>
					&nbsp&nbsp
					<button type="button" id="buyupdate" class="btn btn-success" style="display: none">update</button>
					<button type="reset" id="buyreset" class="btn btn-success">초기화</button>
					&nbsp&nbsp
					<a href="index"><button type="button" id="buycancel"
							class="btn btn-warning">취소</button></a>
					&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					<a href="buyinsertform"><button type="button" id="buynew" class="btn btn-danger">New</button></a>
					&nbsp&nbsp
					<button type="button" id="buydelete" class="btn btn-default"  style="display: none">삭제</button>
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
					<button type="button" id="buysearch" class="btn btn-primary">검색</button>
				</div>
			</div>
			<!-- Modal -->
			<div id="buymyModal" class="modal fade" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="background-color: #9999cc">
							상품 매입 체크
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title"></h4>
						</div>
						<div class="buy-modal-body">
							<p><span id="modalmsgvender"></span></p>
							<p><span id="modalmsgproduct"></span></p>
							<p><span id="modalmsg"></span></p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-success buy_modal_btn1" data-dismiss="modal">확인</button>
							<button type="button" class="btn btn-success buy_modal_btn2" data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>