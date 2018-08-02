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
	<form id="salary_tax" name="salary_tax" action="salarytax" method="post">
		<div class="container" style="text-align: center">
			<div style="margin-top: 30px">
				<h1>Salary Tax</h1>
			</div>
			<div class="row" style="margin-top: 30px">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-id-card-alt" style="font-size: 17px"> 처리년도</i></span>
					</div>
					<input type="text" class="form-control" id="yyyy" name="yyyy" value="${yyyy}" style="ime-mode:disabled" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' maxlength="4" required="true">
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-building" style="font-size: 17px"> 처리 월</i></span>
					</div>
					<select id="mm" name="mm" class="form-control">
					<c:forEach begin="1" end="12" var="x" step="1">
						<option value="${x}">${x}월</option>
					</c:forEach>
					</select>
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row" style="margin-top: 30px">
				<div class="col-md-3"></div>
				<div class="col-md-2">
					<button type="button" id="salarytaxsave" class="btn btn-primary btn-block">급여생성</button>
				</div>
				<div class="col-md-2">
					<button type="reset" id="salarytaxreset" class="btn btn-success btn-block">생성삭제</button>
				</div>
				<div class="col-md-2">
					<a href="salarysearch"><button type="button" id="salarytaxcancel" class="btn btn-warning btn-block">취소</button></a>
				</div>
				<div class="col-md-3"></div>
			</div>
			<!-- Modal -->
			<div id="salarytaxmyModal" class="modal fade" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="background-color: #9999cc">
							<span style="color: #fff">급여계산 CHECK</span>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title"></h4>
						</div>
						<div class="salarytax-modal-body">
							<p>데이터가 지워지고 다시 생성됩니다</p>
							<p>계산처리 하시겠습니까?</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-success salarytax_modal_btn1" data-dismiss="modal">확인</button>
							<button type="button" class="btn btn-danger salarytax_modal_btn2" data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>