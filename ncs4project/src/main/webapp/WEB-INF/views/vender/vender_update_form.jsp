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
	<form id="venderupdate_form" name="venderupdate_form" action="venderupdate" method="post">
		<input type="hidden" id="venderconfirm_yn" value="n">
		<div class="container" style="text-align: center">
			<div style="margin-top: 30px">
				<h1>거래처 수정</h1>
			</div>
			<div class="row" style="margin-top: 30px">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i class="fas fa-user-plus" style="font-size: 17px"> E-MAIL</i></span>
					</div>
					<input type="text" class="form-control" id="code" name="code" value="${vender.code}" style="ime-mode:disabled" placeholder="code 입력" required="true" maxlength="4" readonly>
				</div>
			</div>
			<div class="row">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i class="fas fa-minus-square" style="font-size: 17px"> 상호</i></span>
					</div>
					<input type="text" name="name" class="form-control" value="${vender.name}" required="true">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i class="fas fa-minus-square" style="font-size: 17px"> 대표자명</i></span>
					</div>
					<input type="text" name="ceoname" class="form-control" value="${vender.ceoname}" required="true">
				</div>
			</div>
			<div class="row">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i class="fas fa-minus-square" style="font-size: 17px"> bustype</i></span>
					</div>
					<input type="text" name="bustype" class="form-control" value="${vender.bustype}" required="true">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i class="fas fa-minus-square" style="font-size: 17px"> busconditions</i></span>
					</div>
					<input type="text" name="busconditions" class="form-control" value="${vender.busconditions}" required="true">
				</div>
			</div>
			<div class="row">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i class="fas fa-mobile-alt" style="font-size: 17px"> 사업자등록번호</i></span>
					</div>
					<input type="text" id="busno1" name="busno1" value="${vender.busno1}" style="ime-mode:disabled" onkeydown='return onlyNumber(event)' onkeyup="busno1_lengthchk(this); removeChar(event)" class="form-control" maxlength="3">
					<label>&nbsp-&nbsp</label>
					<input type="text" id="busno2" name="busno2" value="${vender.busno2}" style="ime-mode:disabled" onkeydown='return onlyNumber(event)' onkeyup="busno2_lengthchk(this); removeChar(event)" class="form-control" maxlength="2">
					<label>&nbsp-&nbsp</label>
					<input type="text" name="busno3" value="${vender.busno3}" style="ime-mode:disabled" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' class="form-control" maxlength="5">
				</div>
			</div>
			<div class="row">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i class="fas fa-mobile-alt" style="font-size: 17px"> 회사전화번호</i></span>
					</div>
					<select id="insertphone1" name="officeno1" style="width: 150px">
						<option value="010">010</option>
						<option value="011">011</option>
					</select>
					<input type="text" id="insertphone2" name="officeno2" value="${vender.officeno2}" style="ime-mode:disabled" onkeydown='return onlyNumber(event)' onkeyup="phone2_lengthchk(this); removeChar(event)" class="form-control" maxlength="4">
					<label>&nbsp-&nbsp</label>
					<input type="text" id="insertphone3" name="officeno3" value="${vender.officeno3}" style="ime-mode:disabled" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' class="form-control" maxlength="4">
				</div>
			</div>
			<div class="row">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i class="fas fa-bars" style="font-size: 17px"> ZIPCODE</i></span>
					</div>
					<input type="text" id="insertpostno" name="zipcode" class="form-control" value="${vender.zipcode}">
					<button type="button" onclick="zipcodefind()" class="btn btn-primary">검색</button>
				</div>
			</div>
			<div class="row">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i class="fas fa-map-marker-alt" style="font-size: 17px"> newaddr</i></span>
					</div>
					<input type="text" id="insertaddr1" name="newaddr" class="form-control" value="${vender.newaddr}">
				</div>
			</div>
			<div class="row">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i class="fas fa-map-marker-alt" style="font-size: 17px"> oldaddr</i></span>
					</div>
					<input type="text" id="insertaddr2" name="oldaddr" class="form-control" value="${vender.oldaddr}">
				</div>
			</div>
			<div class="row">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i class="fas fa-map-marker-alt" style="font-size: 17px"> 상세주소</i></span>
					</div>
					<input type="text" name="detailaddr" class="form-control" value="${vender.detailaddr}">
				</div>
			</div>
			<div class="row" style="margin-top: 30px">
				<div class="col-md-3"></div>
				<div class="col-md-2">
					<button type="submit" id="venderupdatesave" class="btn btn-primary btn-block">저장</button>
				</div>
				<div class="col-md-2">
					<button type="button" id="venderupdatedelete" class="btn btn-success btn-block">삭제</button>
				</div>
				<div class="col-md-2">
					<a href="vendersearch"><button type="button" id="venderupdatecancel" class="btn btn-warning btn-block">취소</button></a>
				</div>
				<div class="col-md-3"></div>
			</div>
			<!-- Modal -->
			<div id="venderupdateModal" class="modal fade" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="background-color: #9999cc">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title"></h4>
						</div>
						<div class="venderupdate-modal-body">
							<p>Some text in the modal.</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-success venderupdate_modal_btn1" data-dismiss="modal">확인</button>
							<button type="button" class="btn btn-success venderupdate_modal_btn2" data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>