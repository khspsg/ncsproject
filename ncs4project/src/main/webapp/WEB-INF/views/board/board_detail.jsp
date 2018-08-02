<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/parsely.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script><script src="http://t1.daumcdn.net/postcode/api/core/180619/1529384927473/180619.js" type="text/javascript" charset="UTF-8"></script>
<script src="//cdn.ckeditor.com/4.6.2/standard/ckeditor.js"></script>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		
	})
</script>
<body>
	<form id="board_detail" name="board_detail" action="boardupdate" method="post" enctype="multipart/form-data">
		<div class="container" style="text-align: center">
			<input type="hidden" id="b_seq" name="b_seq" value="${board.b_seq}">
			<input type="hidden" id="b_ref" name="b_ref" value="${board.b_ref}">
			<div style="margin-top: 30px">
				<h1>게시글</h1>
			</div>
			<div class="row" style="margin-top: 30px">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-user-plus" style="font-size: 17px"> E-MAIL</i></span>
					</div>
					<input type="text" class="form-control" id="b_email" name="b_email" value="${board.b_email}" readonly>
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-user-lock" style="font-size: 17px"> 이름</i></span>
					</div>
					<input type="text" id="b_name" name="b_name" class="form-control" value="${board.b_name}" readonly>
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<c:choose>
						<c:when test="${sessionemail == board.b_email || sessionemail == 'a@a.a'}">
							<div class="input-group-prepend">
								<span class="input-group-text" style="width: 150px"><i
									class="fas fa-user-lock" style="font-size: 17px"> 제목</i></span>
							</div>
							<input type="text" id="b_title" name="b_title"
								value="${board.b_title}" class="form-control" required="true">
						</c:when>
						<c:otherwise>
							<div class="input-group-prepend">
								<span class="input-group-text" style="width: 150px"><i
									class="fas fa-user-lock" style="font-size: 17px"> 제목</i></span>
							</div>
							<input type="text" id="b_title" name="b_title"
								value="${board.b_title}" class="form-control" style="background-color: #fff" required="true" readonly>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-user-lock" style="font-size: 17px"> 첨부파일</i></span>
					</div>
					<input type="file" id="file" name="file" class="form-control">
					<input type="text" name="b_beforeattach" class="form-control" value="${board.b_attach}">
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<textarea id="b_content" name="b_content" class="form-control" rows="10" style="background-color: #fff; resize: none" required="true" readonly>${board.b_content}</textarea>
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row" style="margin-top: 30px">
				<div class="col-md-3"></div>
				<div class="col-md-2">
					<a href="boardpagelist"><button type="button" id="list" class="btn btn-primary btn-block">목록</button></a>
				</div>
				<div class="col-md-2">
					<c:choose>
						<c:when test="${sessionemail == board.b_email || sessionemail == 'a@a.a'}">
							<button id="modify" class="btn btn-success btn-block">수정</button>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-md-2">
					<c:choose>
						<c:when test="${sessionemail == board.b_email || sessionemail == 'a@a.a'}">
							<button type="button" id="boarddelete" class="btn btn-danger btn-block">삭제</button>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-md-1">
					<c:if test="${sessionemail != null}">
						<button type="button" id="reply" onclick="location.href='boardreplyform?b_title=${board.b_title}&b_ref=${board.b_ref}'" class="btn btn-warning btn-block">댓글</button>
					</c:if>
				</div>
				<div class="col-md-2"></div>
				<!-- Modal -->
				<div id="boardDeleteModal" class="modal fade" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header" style="background-color: #9999cc">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title"></h4>
							</div>
							<div class="boarddelete-modal-body">
								<p>Some text in the modal.</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-success boarddelete_modal_btn1"
									data-dismiss="modal">확인</button>
								<button type="button" class="btn btn-success boarddelete_modal_btn2"
									data-dismiss="modal">취소</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>