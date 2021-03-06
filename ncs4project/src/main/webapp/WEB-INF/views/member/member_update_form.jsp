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
</head>
<script type="text/javascript">
</script>
<body>
	<form id="member_update_form" name="member_update_form" method="post" action="memberupdate" data-parsley-validate="true" enctype="multipart/form-data">
		<input type="hidden" id="confirm_yn" value="n">
		<div class="container">
			<div class="row" style="margin-top: 30px">
				<div class="col-md-4"></div>
				<div class="col-md-4" style="text-align: center">
<!-- 				<i class="fas fa-camera" id="icon" title="클릭 후 이미지 변경" alt="클릭 후 이미지 변경" style="font-size: 100px" width="100px" height="100px"></i> -->
				<a href=#><img id="updateimage" name="updateimage" src="${member.photo}" title="클릭 후 이미지 변경" alt="클릭 후 이미지 변경" class="rounded-circle" width="150px" height="150px"></a>
				<input type ="hidden" name="beforephoto" value="${member.photo}">
				</div>
				<div class="col-md-4"></div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div>
						<input type="file" id="updatephoto" name="imgfile" style="visibility: hidden">
					</div>
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row" style="margin-top: 30px">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i class="fas fa-user-plus" style="font-size: 17px"> E-MAIL</i></span>
					</div>
					<input type="email" class="form-control" id="email" name="email" value="${member.email}" style="ime-mode:disabled" readonly="readonly" placeholder="e-mail을 입력하세요" required="true" data-parsley-error-message="사용가능한 이메일이 아닙니다" data-parsley-errors-container="div[id='emailerror']">
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="emailerror" style="color: #f00"></div>
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i class="fas fa-user-lock" style="font-size: 17px"> PASSWORD</i></span>
					</div>
					<input type="password" id="password" name="password" class="form-control" placeholder="비밀번호를 입력하세요" required="true" data-parsley-error-message="사용가능한 비밀번호가 아닙니다" data-parsley-errors-container="div[id='passwordError']">
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="passwordError" style="color: #f00"></div>
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i class="fas fa-user-lock" style="font-size: 17px"> P.WCHECK</i></span>
					</div>
					<input type="password" id="passwordcheck" name="passwordcheck" class="form-control" placeholder="비밀번호를 입력하세요" required="true" data-parsley-equalto="#password" data-parsley-error-message="비밀번호가 일치하지 않습니다" data-parsley-errors-container="div[id='passwordcheckError']">
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="passwordcheckError" style="color: #f00"></div>
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i class="fas fa-minus-square" style="font-size: 17px"> NAME</i></span>
					</div>
					<input type="text" id="name" name="name" value="${member.name}" class="form-control" placeholder="이름을 입력하세요" required="true" data-parsley-error-message="이름을 입력하세요" data-parsley-errors-container="div[id='nameError']">
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="nameError" style="color: #f00"></div>
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i class="fas fa-mobile-alt" style="font-size: 17px"> PHONE</i></span>
					</div>
					<select id="phone1" name="phone1">
						<option value="010" <c:if test="${member.phone1 == '010'}">selected</c:if>>010</option>
						<option value="011" <c:if test="${member.phone1 == '011'}">selected</c:if>>011</option>
					</select>
					<input type="text" id="phone2" name="phone2" value="${member.phone2}" style="ime-mode:disabled" onkeydown='return onlyNumber(event)' onkeyup="phone2_lengthchk(this); removeChar(event)" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1" maxlength="4">
					<label>&nbsp-&nbsp</label>
					<input type="text" id="phone3" name="phone3" value="${member.phone3}" style="ime-mode:disabled" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1" maxlength="4">
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i class="fas fa-bars" style="font-size: 17px"> ZIPCODE</i></span>
					</div>
					<input type="text" id="postno" name="postno" value="${member.postno}" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1">
					<button type="button" onclick="zipcodefind()" class="btn btn-primary">검색</button>
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i class="fas fa-map-marker-alt" style="font-size: 17px"> ADRESS1</i></span>
					</div>
					<input type="text" id="addr1" name="addr1" value="${member.addr1}" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1">
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i class="fas fa-map-marker-alt" style="font-size: 17px"> ADRESS2</i></span>
					</div>
					<input type="text" id="addr2" name="addr2" value="${member.addr2}" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1">
				</div>
				<div class="col-md-3"></div>
			</div>
			<div class="row" style="margin-top: 30px">
				<div class="col-md-3"></div>
				<div class="col-md-2" style="text-align: center">
					<button type="submit" id="save" class="btn btn-primary btn-block save">확인</button>
				</div>
				<div class="col-md-2">
					<button type="button" id="updatedelete" class="btn btn-danger btn-block">삭제</button>
				</div>
				<div class="col-md-2">
					<button type="reset" class="btn btn-primary btn-block">취소</button>
				</div>
				<div class="col-md-3"></div>
			</div>
			<!-- Modal -->
			<div id="updateModal" class="modal fade" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="background-color: #9999cc">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title"></h4>
						</div>
						<div class="update-modal-body">
							<p>Some text in the modal.</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-success update_modal_btn1" data-dismiss="modal">close</button>
							<button type="button" class="btn btn-success update_modal_btn2" data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>