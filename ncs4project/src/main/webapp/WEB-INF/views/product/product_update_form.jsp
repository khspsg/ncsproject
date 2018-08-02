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
	<form id="product_update_form" name="product_update_form" action="productupdate" method="post">
		<input type="hidden" id="productconfirm_yn" value="n">
		<div class="container" style="text-align: center">
			<div style="margin-top: 30px">
				<h1>상품 수정</h1>
			</div>
			<div class="row" style="margin-top: 30px">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-id-card-alt" style="font-size: 17px"> code</i></span>
					</div>
					<input type="text" class="form-control" id="code" name="code" style="ime-mode:disabled" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' value="${product.code}" maxlength="10" placeholder="barcode 13자리" required="true" readonly>
				</div>
			</div>
			<div class="row">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-address-card" style="font-size: 17px"> 상품명</i></span>
					</div>
					<input type="text" id="name" name="name" class="form-control" value="${product.name}" maxlength="25" required="true" readonly>
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-address-card" style="font-size: 17px"> 상품규격</i></span>
					</div>
					<input type="text" id="capacity" name="capacity" class="form-control" value="${product.capacity}" maxlength="25" required="true">
				</div>
			</div>
			<div class="row">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-address-card" style="font-size: 17px"> 매입단가</i></span>
					</div>
					<input type="text" id="buyprice" name="buyprice" class="form-control" value="${product.buyprice}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-address-card" style="font-size: 17px"> 매출단가</i></span>
					</div>
					<input type="text" id="saleprice" name="saleprice" class="form-control" value="${product.saleprice}" maxlength="9">
				</div>
			</div>
			<div class="row">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-calendar-alt" style="font-size: 17px"> 상품설명</i></span>
					</div>
					<input type="text" id="explanation" name="explanation" class="form-control" value="${product.explanation}">
				</div>
			</div>
			<div class="row">
				<div class="col-md-12" style="background-color: #006d34; text-align: center">
					<h6 style="color: #fff">재고 현황</h6>
				</div>
			</div>
			<div class="row" style="margin-top: 15px">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 전년말재고</span>
					</div>
					<input type="text" id="preyystock" name="preyystock" class="form-control" value="${product.preyystock}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 전월말재고</span>
					</div>
					<input type="text" id="premmstock" name="premmstock" class="form-control" value="${product.premmstock}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 전일재고</span>
					</div>
					<input type="text" id="preddstock" name="preddstock" class="form-control" value="${product.preddstock}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 현재재고</span>
					</div>
					<input type="text" id="stock" name="stock" class="form-control" value="${product.stock}" maxlength="9">
				</div>
			</div>
			<div class="row">
				<div class="col-md-12" style="background-color: #a082cc; text-align: center">
					<h6 style="color: #fff">매입 매출 현황</h6>
				</div>
			</div>
			<div class="row" style="margin-top: 15px">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 1월 매입</span>
					</div>
					<input type="text" id="buy01" name="buy01" class="form-control" value="${product.buy01}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 1월 매출</span>
					</div>
					<input type="text" id="sale01" name="sale01" class="form-control" value="${product.sale01}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 7월 매입</span>
					</div>
					<input type="text" id="buy07" name="buy07" class="form-control" value="${product.buy07}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 7월 매출</span>
					</div>
					<input type="text" id="sale07" name="sale07" class="form-control" value="${product.sale07}" maxlength="9">
				</div>
			</div>
			<div class="row">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 2월 매입</span>
					</div>
					<input type="text" id="buy02" name="buy02" class="form-control" value="${product.buy02}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 2월 매출</span>
					</div>
					<input type="text" id="sale02" name="sale02" class="form-control" value="${product.sale02}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 8월 매입</span>
					</div>
					<input type="text" id="buy08" name="buy08" class="form-control" value="${product.buy08}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 8월 매출</span>
					</div>
					<input type="text" id="sale08" name="sale08" class="form-control" value="${product.sale08}" maxlength="9">
				</div>
			</div>
			<div class="row">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 3월 매입</span>
					</div>
					<input type="text" id="buy03" name="buy03" class="form-control" value="${product.buy03}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 3월 매출</span>
					</div>
					<input type="text" id="sale03" name="sale03" class="form-control" value="${product.sale03}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 9월 매입</span>
					</div>
					<input type="text" id="buy09" name="buy09" class="form-control" value="${product.buy09}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 9월 매출</span>
					</div>
					<input type="text" id="sale09" name="sale09" class="form-control" value="${product.sale09}" maxlength="9">
				</div>
			</div>
			<div class="row" >
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 4월 매입</span>
					</div>
					<input type="text" id="buy04" name="buy04" class="form-control" value="${product.buy04}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 4월 매출</span>
					</div>
					<input type="text" id="sale04" name="sale04" class="form-control" value="${product.sale04}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 10월 매입</span>
					</div>
					<input type="text" id="buy10" name="buy10" class="form-control" value="${product.buy10}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 10월 매출</span>
					</div>
					<input type="text" id="sale10" name="sale10" class="form-control" value="${product.sale10}" maxlength="9">
				</div>
			</div>
			<div class="row" >
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 5월 매입</span>
					</div>
					<input type="text" id="buy05" name="buy05" class="form-control" value="${product.buy05}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 5월 매출</span>
					</div>
					<input type="text" id="sale05" name="sale05" class="form-control" value="${product.sale05}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 11월 매입</span>
					</div>
					<input type="text" id="buy11" name="buy11" class="form-control" value="${product.buy11}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 11월 매출</span>
					</div>
					<input type="text" id="sale11" name="sale11" class="form-control" value="${product.sale11}" maxlength="9">
				</div>
			</div>
			<div class="row" >
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 6월 매입</span>
					</div>
					<input type="text" id="buy06" name="buy06" class="form-control" value="${product.buy06}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 6월 매출</span>
					</div>
					<input type="text" id="sale06" name="sale06" class="form-control" value="${product.sale06}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 12월 매입</span>
					</div>
					<input type="text" id="buy12" name="buy12" class="form-control" value="${product.buy12}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 12월 매출</span>
					</div>
					<input type="text" id="sale12" name="sale12" class="form-control" value="${product.sale12}" maxlength="9">
				</div>
			</div>
			<div class="row" style="margin-top: 30px">
				<div class="col-md-3"></div>
				<div class="col-md-2">
					<button type="submit" id="productupdatesave" class="btn btn-primary btn-block">저장</button>
				</div>
				<div class="col-md-2">
					<button type="button" id="productupdatedelete" class="btn btn-success btn-block">삭제</button>
				</div>
				<div class="col-md-2">
					<a href="productsearch"><button type="button" id="productupdatecancel" class="btn btn-warning btn-block">취소</button></a>
				</div>
				<div class="col-md-3"></div>
			</div>
			<!-- Modal -->
			<div id="productupdateModal" class="modal fade" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="background-color: #9999cc">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title"></h4>
						</div>
						<div class="productupdate-modal-body">
							<p>Some text in the modal.</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-success productupdate_modal_btn1" data-dismiss="modal">확인</button>
							<button type="button" class="btn btn-success productupdate_modal_btn2" data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>