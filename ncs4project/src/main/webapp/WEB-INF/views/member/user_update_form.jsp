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
</head>
<script type="text/javascript">
	function onlyNumber(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
			return;
		else
			return false;
	}
	function removeChar(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
			return;
		else
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
	}
	$(document).ready(function(){
		$('#confirm').on('click',function(){
			var code = $('#code').val();
			if(code==""){
				$('#myModal').modal('show');
				$('.modal-body').text("CODE를 입력하세요");
				$('.modal_btn1').text("확인");
				$('.modal_btn2').hide();
			}else{
				$.ajax({
					type : 'POST',
					data : "code="+code,
					url : 'userconfirm',
					success : function(data){
						if(data == 0){
							$('#myModal').modal('show');
							$('.modal-body').text("사용가능한 CODE");
							$('.modal_btn1').on('click', function(){
								$('#confirm_yn').val("y");
								$('#code_yn').val($('#code').val());
							});
						}else{
							$('#myModal').modal('show');
							$('.modal-body').text("중복 CODE");
							$('#email').val("");
							$('#email').focus();
							$('#confirm_yn').val("n");
						}
					},
					error : function(xr, status, error){
						alert('ajax error');
					}
				});
			}
		});
		$('.save').on('click',function(){
			if($('#code').val() != $('#code_yn').val()){
				$('#myModal').modal('show');
				$('.modal-body').text("CODE 중복체크를 하세요");
				$('#confirm_yn').val("n");
				return;
			}
			if($('#confirm_yn').val() == "n"){
				$('#myModal').modal('show');
				$('.modal-body').text("CODE 중복체크를 하세요");
				$('#confirm_yn').val("n");
				return;
			}
			$('#myModal').modal('show');
			$('.modal-body').text("입력완료");
			$('.modal_btn1').on('click', function(){
				$('#user_insert_form').parsley().validate();
				$('#user_insert_form').submit();
			});
		});
	});
</script>
<body>
	<form id="user_insert_form" name="user_insert_form" method="post" action="userinsert" data-parsley-validate="true" enctype="multipart/form-data">
		<input type="hidden" id="code_yn" value="">
		<input type="hidden" id="confirm_yn" value="n">
		<div class="container">
			<div class="row" style="margin-top: 30px">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i class="fas fa-user-plus" style="font-size: 17px"> CODE</i></span>
					</div>
					<input type="text" class="form-control" id="code" name="code" value="${user.code}" style="ime-mode:disabled" maxlength="6" placeholder="code를 입력하세요" required="true" data-parsley-error-message="사용가능한 코드가 아닙니다" data-parsley-errors-container="div[id='codeerror']" disabled>
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="codeerror" style="color: #f00"></div>
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row" style="margin-top: 30px">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i class="fas fa-user-plus" style="font-size: 17px"> 이름</i></span>
					</div>
					<input type="text" class="form-control" id="name" name="name" value="${user.name}" maxlength="20" placeholder="이름을 입력하세요" required="true" data-parsley-error-message="이름을 입력하세요" data-parsley-errors-container="div[id='nameerror']">
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="nameerror" style="color: #f00"></div>
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row" style="margin-top: 30px">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i class="fas fa-user-plus" style="font-size: 17px"> 나이</i></span>
					</div>
					<input type="text" class="form-control" id="age" name="age" value="${user.age}" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' maxlength="3" placeholder="나이를 입력하세요" required="true" data-parsley-error-message="나이를 입력하세요" data-parsley-errors-container="div[id='ageerror']">
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="ageerror" style="color: #f00"></div>
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row" style="margin-top: 30px">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i class="fas fa-user-plus" style="font-size: 17px"> 성별</i></span>
					</div>
					<div class="form-control">
					남자&nbsp&nbsp&nbsp<input type="radio" id="gender" name="gender" value="0" required="true" data-parsley-error-message="성별을 선택하세요" data-parsley-errors-container="div[id='gendererror']">
					&nbsp&nbsp&nbsp여자&nbsp&nbsp&nbsp<input type="radio" id="gender" name="gender" value="1">
					</div>
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="gendererror" style="color: #f00"></div>
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row" style="margin-top: 30px">
				<div class="col-md-4"></div>
				<div class="col-md-2" style="text-align: center">
					<button type="button" id="save" class="btn btn-primary btn-block save">확인</button>
				</div>
				<div class="col-md-2">
					<button type="reset" class="btn btn-primary btn-block">취소</button>
				</div>
				<div class="col-md-4"></div>
			</div>
			<div id="myModal" class="modal fade" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="background-color: #9999cc">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title"></h4>
						</div>
						<div class="modal-body">
							<p>Some text in the modal.</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-success modal_btn1" data-dismiss="modal">확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>