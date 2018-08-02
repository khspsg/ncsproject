<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="currentscreen_form" name="currentscreen_form" action="currentscreeninsert" method="post">
		<div class="container" style="text-align: center">
			<h3>현재 상영작</h3>
			<div class="row" style="margin-top: 30px">
				<div class="col-md-3 mb-4">
					<div class="card h-100">
						<img src="resources/file/missionimpossible.jpg"
							height="400px">
						예매율 80% 평점 8.7<br>
						2018.08.01 개봉
						<div class="card-footer" style="text-align: center">
						미션임파서블:폴아웃<p></p>
							<a href="#" class="btn btn-info">상세정보</a> <a href="#"
								class="btn btn-info">예매하기</a>
						</div>
					</div>
				</div>
				<div class="col-md-3 mb-4">
					<div class="card h-100">
						<img src="resources/file/incredible.jpg"
							height="400px">
						예매율 70% 평점 8.3<br>
						2018.07.01 개봉
						<div class="card-footer" style="text-align: center">
						인크레더블2<p></p>
							<a href="#" class="btn btn-info">상세정보</a> <a href="#"
								class="btn btn-info">예매하기</a>
						</div>
					</div>
				</div>
				<div class="col-md-3 mb-4">
					<div class="card h-100">
						<img src="resources/file/inlang.jpg" height="400px">
						예매율 30% 평점 7.3<br>
						2018.07.12 개봉
						<div class="card-footer" style="text-align: center">
						인랑<p></p>
							<a href="#" class="btn btn-info">상세정보</a> <a href="#"
								class="btn btn-info">예매하기</a>
						</div>
					</div>
				</div>
				<div class="col-md-3 mb-4">
					<div class="card h-100">
						<img src="resources/file/antman.jpg" height="400px">
						예매율 20% 평점 8.5<br>
						2018.06.12 개봉
						<div class="card-footer" style="text-align: center">
						앤트맨과 와스프<p></p>
							<a href="#" class="btn btn-info">상세정보</a> <a href="#"
								class="btn btn-info">예매하기</a>
						</div>
					</div>
				</div>
			</div>
			<!-- Modal -->
			<div id="currentscreenmyModal" class="modal fade" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="background-color: #9999cc">
							상품 매입 체크
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title"></h4>
						</div>
						<div class="currentscreen-modal-body">
							<p>
								<span id="modalmsgvender"></span>
							</p>
							<p>
								<span id="modalmsgproduct"></span>
							</p>
							<p>
								<span id="modalmsg"></span>
							</p>
						</div>
						<div class="modal-footer">
							<button type="button"
								class="btn btn-success currentscreen_modal_btn1"
								data-dismiss="modal">확인</button>
							<button type="button"
								class="btn btn-success currentscreen_modal_btn2"
								data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>