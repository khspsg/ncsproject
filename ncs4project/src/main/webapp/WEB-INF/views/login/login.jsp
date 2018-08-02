<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<script type="text/javascript">
	$(document).ready(function(){
		
	})
</script>
<body>
	<form id="login_form" name="login_form" action="login" method="post">
		<div class="container" style="text-align: center">
			<div style="margin-top: 30px">
				<h1>Login Page</h1>
			</div>
			<div class="row" style="margin-top: 30px">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-user-plus" style="font-size: 17px"> E-MAIL</i></span>
					</div>
					<input type="email" class="form-control" id="email" name="email"
						style="ime-mode: disabled" placeholder="e-mail을 입력하세요" required="true">
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row" style="margin-top: 30px">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-user-lock" style="font-size: 17px"> PASSWORD</i></span>
					</div>
					<input type="password" id="password" name="password"
						class="form-control" placeholder="비밀번호를 입력하세요" required="true">
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row" style="margin-top: 30px">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<button type="submit" id="login" class="btn btn-primary btn-block save">Login</button>
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row" style="margin-top: 30px">
				<div class="col-md-3"></div>
				<div class="col-md-2">
					<a href="memberinsertform" style="color: #292929"><i class="fas fa-address-card"> 회원가입</i></a>
				</div>
				<div class="col-md-2">
					<a href="#" style="color: #292929"><i id="ps" class="fas fa-unlock-alt"> 비밀번호찾기</i></a>
				</div>
				<div class="col-md-2">
					<a href="index" style="color: #292929"><i class="fas fa-home"></i></a>
				</div>
				<div class="col-md-3"></div>
			</div>
			<!-- Modal -->
			<div id="loginModal" class="modal fade" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="background-color: #9999cc">
							<span style="color: #fff">비밀번호찾기</span>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title"></h4>
						</div>
						<div class="login-modal-body">
							<label id="pstext"></label>
							<div class="row">
								<div class="input-group mb-3 col-md-12 ">
									<div class="input-group-prepend">
										<span class="input-group-text" style="width: 150px"><i
											class="fas fa-user-plus" style="font-size: 17px"> E-MAIL</i></span>
									</div>
									<input type="email" class="form-control" id="findemail"
										name="findemail" style="ime-mode: disabled">
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-success login_modal_btn1" >검색</button>
							<button type="button" class="btn btn-success login_modal_btn2" data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>