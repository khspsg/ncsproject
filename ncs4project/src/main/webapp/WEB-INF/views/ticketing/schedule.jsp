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
	<form id="schedule_form" name="schedule_form" action="scheduleinsert" method="post">
		<div class="container" style="text-align: center">
			<div style="text-align: left">미션임파서블</div>
			<div style="text-align: left">2D 1관 총 124석</div>
			<div class="row" style="margin-top: 30px">
			<div class="btn-group mb-3" role="group" aria-label="...">
				<button type="button" class="btn btn-default">6:30<br>111석</button>
				<button type="button" class="btn btn-default">6:30<br>111석</button>
				<button type="button" class="btn btn-default">6:30<br>111석</button>
				<button type="button" class="btn btn-default">6:30<br>111석</button>
			</div>
			</div>
			<!-- Modal -->
			<div id="schedulemyModal" class="modal fade" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="background-color: #9999cc">
							상품 매입 체크
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title"></h4>
						</div>
						<div class="schedule-modal-body">
							<p><span id="modalmsgvender"></span></p>
							<p><span id="modalmsgproduct"></span></p>
							<p><span id="modalmsg"></span></p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-success schedule_modal_btn1" data-dismiss="modal">확인</button>
							<button type="button" class="btn btn-success schedule_modal_btn2" data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>