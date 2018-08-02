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
	<form id="salary_form" name="salary_form" action="salaryinsert" method="post">
		<input type="hidden" id="salaryconfirm_yn" value="n">
		<div class="container" style="text-align: center">
			<div style="margin-top: 30px">
				<h1>Salary Register</h1>
			</div>
			<div class="row" style="margin-top: 30px">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-id-card-alt" style="font-size: 17px"> 사원번호</i></span>
					</div>
					<input type="text" class="form-control" id="empno" name="empno" style="ime-mode:disabled" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' maxlength="10" placeholder="ex)170101" required="true">
					<button type="button" id="salaryinsertconfirm" class="btn btn-primary">중복확인</button>
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-address-card" style="font-size: 17px"> 이름</i></span>
					</div>
					<input type="text" id="name" name="name" class="form-control" maxlength="20" required="true">
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-building" style="font-size: 17px"> 부서</i></span>
					</div>
					<select id="dept" name="dept" class="form-control">
					<c:forEach var="depts" items="${depts}" varStatus="status">
						<option value="${depts.code}">${depts.name}</option>
					</c:forEach>
					</select>
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-calendar-alt" style="font-size: 17px"> 생년월일</i></span>
					</div>
					<input type="date" id="birth_date" name="birth_date" class="form-control" required="true">
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-calendar-alt" style="font-size: 17px"> 입사일자</i></span>
					</div>
					<input type="date" id="input_date" name="input_date" class="form-control" required="true">
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6" style="background-color: #292929; text-align: center">
					<h6 style="color: #fff">소득 내역</h6>
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row" style="margin-top: 15px">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-3 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"><i
							class="fas fa-money-check-alt" style="font-size: 15px"> 기본급</i></span>
					</div>
					<input type="text" id="pay" name="pay" class="form-control" style="ime-mode:disabled; text-align: right" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' maxlength="9" required="true">
				</div>
				<div class="input-group mb-3 col-md-3 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"><i
							class="fas fa-money-bill-wave" style="font-size: 15px"> 수당</i></span>
					</div>
					<input type="text" id="extra" name="extra" class="form-control" style="ime-mode:disabled; text-align: right" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' maxlength="9" required="true">
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6" style="background-color: #a082cc; text-align: center">
					<h6 style="color: #fff">부양 가족 공제</h6>
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row" style="margin-top: 15px">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-3 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"><i
							class="fas fa-heart" style="font-size: 13px"> 배우자</i></span>
					</div>
					<select id="partner" name="partner" class="form-control">
						<option value="0">0</option>
						<option value="1">1</option>
					</select>
				</div>
				<div class="input-group mb-3 col-md-3 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"><i
							class="fas fa-child" style="font-size: 13px"> 부양자20</i></span>
					</div>
					<select id="dependent20" name="dependent20" class="form-control">
						<option value="0">0</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
					</select>
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-3 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"><i
							class="fas fa-users" style="font-size: 13px"> 부양자60</i></span>
					</div>
					<select id="dependent60" name="dependent60" class="form-control">
						<option value="0">0</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
					</select>
				</div>
				<div class="input-group mb-3 col-md-3 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"><i
							class="fas fa-wheelchair" style="font-size: 13px"> 장애인</i></span>
					</div>
					<select id="disabled" name="disabled" class="form-control">
						<option value="0">0</option>
						<option value="1">1</option>
					</select>
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-3 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"><i
							class="fas fa-female" style="font-size: 13px"> 부녀가장</i></span>
					</div>
					<select id="womanpower" name="womanpower" class="form-control">
						<option value="0">0</option>
						<option value="1">1</option>
					</select>
				</div>
				<div class="input-group mb-3 col-md-3 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"><i
							class="fas fa-check" style="font-size: 13px"> 급여계산</i></span>
					</div>
					<select id="yn" name="yn" class="form-control">
						<option value="y">yes</option>
						<option value="n">no</option>
					</select>
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row" style="margin-top: 30px">
				<div class="col-md-3"></div>
				<div class="col-md-2">
					<button type="submit" id="salarysave" class="btn btn-primary btn-block">저장</button>
				</div>
				<div class="col-md-2">
					<button type="reset" id="salaryreset" class="btn btn-success btn-block">초기화</button>
				</div>
				<div class="col-md-2">
					<a href="salarysearch"><button type="button" id="salarycancel" class="btn btn-warning btn-block">취소</button></a>
				</div>
				<div class="col-md-3"></div>
			</div>
			<!-- Modal -->
			<div id="salarymyModal" class="modal fade" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="background-color: #9999cc">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title"></h4>
						</div>
						<div class="salary-modal-body">
							<p>Some text in the modal.</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-success salary_modal_btn1" data-dismiss="modal">확인</button>
							<button type="button" class="btn btn-success salary_modal_btn2" data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>