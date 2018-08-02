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
	<form id="salary_update_form" name="salary_update_form" action="salaryupdate" method="post">
		<div class="container" style="text-align: center">
			<div style="margin-top: 30px">
				<h1>Salary Modify</h1>
			</div>
			<div class="row" style="margin-top: 30px">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-id-card-alt" style="font-size: 17px"> 사원번호</i></span>
					</div>
					<input type="text" class="form-control" id="empno" name="empno" value="${salary.empno}" readonly>
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
					<input type="text" id="name" name="name" class="form-control" value="${salary.name}" readonly>
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
							<option value="${depts.code}" <c:if test="${depts.code == salary.dept}">selected</c:if>>${depts.name}</option>
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
					<input type="date" id="birth_date" name="birth_date" class="form-control" value="${salary.birth_date}">
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
					<input type="date" id="input_date" name="input_date" class="form-control" value="${salary.input_date}">
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
					<input type="text" id="pay" name="pay" class="form-control" value="${salary.pay}">
				</div>
				<div class="input-group mb-3 col-md-3 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"><i
							class="fas fa-money-bill-wave" style="font-size: 15px"> 수당</i></span>
					</div>
					<input type="text" id="extra" name="extra" class="form-control" value="${salary.extra}">
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
						<option value="0" <c:if test="${salary.partner == '0'}">selected</c:if>>0</option>
						<option value="1" <c:if test="${salary.partner == '1'}">selected</c:if>>1</option>
					</select>
				</div>
				<div class="input-group mb-3 col-md-3 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"><i
							class="fas fa-child" style="font-size: 13px"> 부양자20</i></span>
					</div>
					<select id="dependent20" name="dependent20" class="form-control">
						<option value="0" <c:if test="${salary.dependent20 == '0'}">selected</c:if>>0</option>
						<option value="1" <c:if test="${salary.dependent20 == '1'}">selected</c:if>>1</option>
						<option value="2" <c:if test="${salary.dependent20 == '2'}">selected</c:if>>2</option>
						<option value="3" <c:if test="${salary.dependent20 == '3'}">selected</c:if>>3</option>
						<option value="4" <c:if test="${salary.dependent20 == '4'}">selected</c:if>>4</option>
						<option value="5" <c:if test="${salary.dependent20 == '5'}">selected</c:if>>5</option>
						<option value="6" <c:if test="${salary.dependent20 == '6'}">selected</c:if>>6</option>
						<option value="7" <c:if test="${salary.dependent20 == '7'}">selected</c:if>>7</option>
						<option value="8" <c:if test="${salary.dependent20 == '8'}">selected</c:if>>8</option>
						<option value="9" <c:if test="${salary.dependent20 == '9'}">selected</c:if>>9</option>
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
						<option value="0" <c:if test="${salary.dependent60 == '0'}">selected</c:if>>0</option>
						<option value="1" <c:if test="${salary.dependent60 == '1'}">selected</c:if>>1</option>
						<option value="2" <c:if test="${salary.dependent60 == '2'}">selected</c:if>>2</option>
						<option value="3" <c:if test="${salary.dependent60 == '3'}">selected</c:if>>3</option>
						<option value="4" <c:if test="${salary.dependent60 == '4'}">selected</c:if>>4</option>
						<option value="5" <c:if test="${salary.dependent60 == '5'}">selected</c:if>>5</option>
						<option value="6" <c:if test="${salary.dependent60 == '6'}">selected</c:if>>6</option>
						<option value="7" <c:if test="${salary.dependent60 == '7'}">selected</c:if>>7</option>
						<option value="8" <c:if test="${salary.dependent60 == '8'}">selected</c:if>>8</option>
						<option value="9" <c:if test="${salary.dependent60 == '9'}">selected</c:if>>9</option>
					</select>
				</div>
				<div class="input-group mb-3 col-md-3 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"><i
							class="fas fa-wheelchair" style="font-size: 13px"> 장애인</i></span>
					</div>
					<select id="disabled" name="disabled" class="form-control">
						<option value="0" <c:if test="${salary.disabled == '0'}">selected</c:if>>0</option>
						<option value="1" <c:if test="${salary.disabled == '1'}">selected</c:if>>1</option>
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
						<option value="0" <c:if test="${salary.womanpower == '0'}">selected</c:if>>0</option>
						<option value="1" <c:if test="${salary.womanpower == '1'}">selected</c:if>>1</option>
					</select>
				</div>
				<div class="input-group mb-3 col-md-3 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"><i
							class="fas fa-check" style="font-size: 13px"> 급여계산</i></span>
					</div>
					<select id="yn" name="yn" class="form-control">
						<option value="y" <c:if test="${salary.yn == 'y'}">selected</c:if>>yes</option>
						<option value="n" <c:if test="${salary.yn == 'n'}">selected</c:if>>no</option>
					</select>
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row" style="margin-top: 30px">
				<div class="col-md-3"></div>
				<div class="col-md-2">
					<button type="submit" id="salaryupdateconfirm" class="btn btn-primary btn-block">저장</button>
				</div>
				<div class="col-md-2">
					<button type="button" id="salaryupdatedelete" class="btn btn-success btn-block">삭제</button>
				</div>
				<div class="col-md-2">
					<a href="salarysearch"><button type="button" id="salaryupdatecancel" class="btn btn-warning btn-block">취소</button></a>
				</div>
				<div class="col-md-3"></div>
			</div>
			<!-- Modal -->
			<div id="salaryupdateModal" class="modal fade" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="background-color: #9999cc">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title"></h4>
						</div>
						<div class="salary-update-modal-body">
							<p>Some text in the modal.</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-success salary_update_modal_btn1" data-dismiss="modal">close</button>
							<button type="button" class="btn btn-success salary_update_modal_btn2" data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>