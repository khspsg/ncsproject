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
function phone2_lengthchk(code) {
	if (code.value.length == 4) {
		document.member_insert_form.phone3.focus();
	}
}
function busno1_lengthchk(code) {
	if (code.value.length == 3) {
		document.vender_insert_form.busno2.focus();
	}
}
function busno2_lengthchk(code) {
	if (code.value.length == 2) {
		document.vender_insert_form.busno3.focus();
	}
}
function officeno2_lengthchk(code) {
	if (code.value.length == 4) {
		document.vender_insert_form.officeno3.focus();
	}
}
function zipcodefind() {

	new daum.Postcode({

		oncomplete : function(data) {

			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.

			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.

			var fullRoadAddr = data.roadAddress; // 도로명 주소 변수

			var extraRoadAddr = ''; // 도로명 조합형 주소 변수

			// 법정동명이 있을 경우 추가한다. (법정리는 제외)

			// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.

			if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {

				extraRoadAddr += data.bname;

			}

			// 건물명이 있고, 공동주택일 경우 추가한다.

			if (data.buildingName !== '' && data.apartment === 'Y') {

				extraRoadAddr += (extraRoadAddr !== '' ? ', '
						+ data.buildingName : data.buildingName);

			}

			// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.

			if (extraRoadAddr !== '') {

				extraRoadAddr = ' (' + extraRoadAddr + ')';

			}

			// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.

			if (fullRoadAddr !== '') {

				fullRoadAddr += extraRoadAddr;

			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.

			document.getElementById('insertpostno').value = data.zonecode; //5자리 새우편번호 사용

			document.getElementById('insertaddr1').value = fullRoadAddr;

			document.getElementById('insertaddr2').value = data.jibunAddress;

		}

	}).open();

}
$(document).ready(function() {
	$( 'iframe[src^="https://www.youtube.com/"]' ).wrap( '<div class="youtubeWrap"></div>' );
});
