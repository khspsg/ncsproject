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
	<form id="trailer_form" name="trailer_form" action="trailerinsert" method="post">
		<h3>윈터솔져 트레일러</h3>
		<div class="youtubeWrap" style="margin-top: 30px">
			<iframe id="maintrailer" width="560" height="315" src="https://www.youtube.com/embed/D4Z2nEdzkdc" frameborder="0" allowfullscreen></iframe>
		</div>
		<div class="container">
			<div class="row">
				<div class="input-group col-md-3">
					<img id="trailer1" src="resources/file/missionimpossible.jpg" width="400px" height="200px">
					미션임파서블 트레일러<br>
					2018.08.01
				</div>
				<div class="input-group col-md-3">
					<img src="resources/file/missionimpossible.jpg" width="400px" height="200px">
					미션임파서블 트레일러<br>
					2018.08.01
				</div>
				<div class="input-group col-md-3">
					<img src="resources/file/missionimpossible.jpg" width="400px" height="200px">
					미션임파서블 트레일러<br>
					2018.08.01
				</div>
				<div class="input-group col-md-3">
					<img src="resources/file/missionimpossible.jpg" width="400px" height="200px">
					미션임파서블 트레일러<br>
					2018.08.01
				</div>
			</div>
			<!-- Modal -->
			<div id="trailermyModal" class="modal fade" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="background-color: #9999cc">
							상품 매입 체크
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title"></h4>
						</div>
						<div class="trailer-modal-body">
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
								class="btn btn-success trailer_modal_btn1"
								data-dismiss="modal">확인</button>
							<button type="button"
								class="btn btn-success trailer_modal_btn2"
								data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>