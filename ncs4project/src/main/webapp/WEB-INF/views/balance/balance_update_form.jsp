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
	<form id="balance_update_form" name="balance_update_form" action="balanceupdate" method="post">
		<input type="hidden" id="balanceconfirm_yn" value="n">
		<div class="container" style="text-align: center">
			<div style="margin-top: 30px">
				<h1>balance 수정</h1>
			</div>
			<div class="row" style="margin-top: 30px">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-id-card-alt" style="font-size: 17px"> 년도</i></span>
					</div>
					<input type="text" class="form-control" id="yyyy" name="yyyy" value="${balance.yyyy}" readonly>
				</div>
			</div>
			<div class="row">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-id-card-alt" style="font-size: 17px"> 코드</i></span>
					</div>
					<input type="text" class="form-control" id="vendcode" name="vendcode" value="${balance.vendcode}" readonly>
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-id-card-alt" style="font-size: 17px"> 회사명</i></span>
					</div>
					<input type="text" class="form-control" id="vendname" name="vendname" value="${balance.vendname}">
				</div>
			</div>
			<div class="row" style="margin-top: 15px">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 1월 거래</span>
					</div>
					<input type="text" id="deal01" name="deal01" class="form-control" value="${balance.deal01}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 1월 지불</span>
					</div>
					<input type="text" id="pay01" name="pay01" class="form-control" value="${balance.pay01}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 7월 거래</span>
					</div>
					<input type="text" id="deal07" name="deal07" class="form-control" value="${balance.deal07}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 7월 지불</span>
					</div>
					<input type="text" id="pay07" name="pay07" class="form-control" value="${balance.pay07}" maxlength="9">
				</div>
			</div>
			<div class="row">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 2월 거래</span>
					</div>
					<input type="text" id="deal02" name="deal02" class="form-control" value="${balance.deal02}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 2월 지불</span>
					</div>
					<input type="text" id="pay02" name="pay02" class="form-control" value="${balance.pay02}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 8월 거래</span>
					</div>
					<input type="text" id="deal08" name="deal08" class="form-control" value="${balance.deal08}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 8월 지불</span>
					</div>
					<input type="text" id="pay08" name="pay08" class="form-control" value="${balance.pay08}" maxlength="9">
				</div>
			</div>
			<div class="row">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 3월 거래</span>
					</div>
					<input type="text" id="deal03" name="deal03" class="form-control" value="${balance.deal03}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 3월 지불</span>
					</div>
					<input type="text" id="pay03" name="pay03" class="form-control" value="${balance.pay03}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 9월 거래</span>
					</div>
					<input type="text" id="deal09" name="deal09" class="form-control" value="${balance.deal09}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 9월 지불</span>
					</div>
					<input type="text" id="pay09" name="pay09" class="form-control" value="${balance.pay09}" maxlength="9">
				</div>
			</div>
			<div class="row" >
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 4월 거래</span>
					</div>
					<input type="text" id="deal04" name="deal04" class="form-control" value="${balance.deal04}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 4월 지불</span>
					</div>
					<input type="text" id="pay04" name="pay04" class="form-control" value="${balance.pay04}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 10월 거래</span>
					</div>
					<input type="text" id="deal10" name="deal10" class="form-control" value="${balance.deal10}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 10월 지불</span>
					</div>
					<input type="text" id="pay10" name="pay10" class="form-control" value="${balance.pay10}" maxlength="9">
				</div>
			</div>
			<div class="row" >
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 5월 거래</span>
					</div>
					<input type="text" id="deal05" name="deal05" class="form-control" value="${balance.deal05}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 5월 지불</span>
					</div>
					<input type="text" id="pay05" name="pay05" class="form-control" value="${balance.pay05}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 11월 거래</span>
					</div>
					<input type="text" id="deal11" name="deal11" class="form-control" value="${balance.deal11}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 11월 지불</span>
					</div>
					<input type="text" id="pay11" name="pay11" class="form-control" value="${balance.pay11}" maxlength="9">
				</div>
			</div>
			<div class="row" >
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 6월 거래</span>
					</div>
					<input type="text" id="deal06" name="deal06" class="form-control" value="${balance.deal06}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 6월 지불</span>
					</div>
					<input type="text" id="pay06" name="pay06" class="form-control" value="${balance.pay06}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 12월 거래</span>
					</div>
					<input type="text" id="deal12" name="deal12" class="form-control" value="${balance.deal12}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 12월 지불</span>
					</div>
					<input type="text" id="pay12" name="pay12" class="form-control" value="${balance.pay12}" maxlength="9">
				</div>
			</div>
			<div class="row" style="margin-top: 15px">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 1월 현금</span>
					</div>
					<input type="text" id="cash01" name="cash01" class="form-control" value="${balance.cash01}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 1월 어음</span>
					</div>
					<input type="text" id="check01" name="check01" class="form-control" value="${balance.check01}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 7월 현금</span>
					</div>
					<input type="text" id="cash07" name="cash07" class="form-control" value="${balance.cash07}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 7월 어음</span>
					</div>
					<input type="text" id="check07" name="check07" class="form-control" value="${balance.check07}" maxlength="9">
				</div>
			</div>
			<div class="row">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 2월 현금</span>
					</div>
					<input type="text" id="cash02" name="cash02" class="form-control" value="${balance.cash02}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 2월 어음</span>
					</div>
					<input type="text" id="check02" name="check02" class="form-control" value="${balance.check02}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 8월 현금</span>
					</div>
					<input type="text" id="cash08" name="cash08" class="form-control" value="${balance.cash08}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 8월 어음</span>
					</div>
					<input type="text" id="check08" name="check08" class="form-control" value="${balance.check08}" maxlength="9">
				</div>
			</div>
			<div class="row">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 3월 현금</span>
					</div>
					<input type="text" id="cash03" name="cash03" class="form-control" value="${balance.cash03}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 3월 어음</span>
					</div>
					<input type="text" id="check03" name="check03" class="form-control" value="${balance.check03}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 9월 현금</span>
					</div>
					<input type="text" id="cash09" name="cash09" class="form-control" value="${balance.cash09}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 9월 어음</span>
					</div>
					<input type="text" id="check09" name="check09" class="form-control" value="${balance.check09}" maxlength="9">
				</div>
			</div>
			<div class="row" >
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 4월 현금</span>
					</div>
					<input type="text" id="cash04" name="cash04" class="form-control" value="${balance.cash04}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 4월 어음</span>
					</div>
					<input type="text" id="check04" name="check04" class="form-control" value="${balance.check04}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 10월 현금</span>
					</div>
					<input type="text" id="cash10" name="cash10" class="form-control" value="${balance.cash10}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 10월 어음</span>
					</div>
					<input type="text" id="check10" name="check10" class="form-control" value="${balance.check10}" maxlength="9">
				</div>
			</div>
			<div class="row" >
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 5월 현금</span>
					</div>
					<input type="text" id="cash05" name="cash05" class="form-control" value="${balance.cash05}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 5월 어음</span>
					</div>
					<input type="text" id="check05" name="check05" class="form-control" value="${balance.check05}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 11월 현금</span>
					</div>
					<input type="text" id="cash11" name="cash11" class="form-control" value="${balance.cash11}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 11월 어음</span>
					</div>
					<input type="text" id="check11" name="check11" class="form-control" value="${balance.check11}" maxlength="9">
				</div>
			</div>
			<div class="row" >
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 6월 현금</span>
					</div>
					<input type="text" id="cash06" name="cash06" class="form-control" value="${balance.cash06}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 6월 어음</span>
					</div>
					<input type="text" id="check06" name="check06" class="form-control" value="${balance.check06}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 12월 현금</span>
					</div>
					<input type="text" id="cash12" name="cash12" class="form-control" value="${balance.cash12}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 12월 어음</span>
					</div>
					<input type="text" id="check12" name="check12" class="form-control" value="${balance.check12}" maxlength="9">
				</div>
			</div>
			<div class="row" style="margin-top: 15px">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 1월 카드</span>
					</div>
					<input type="text" id="card01" name="card01" class="form-control" value="${balance.card01}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 1월 기타</span>
					</div>
					<input type="text" id="etc01" name="etc01" class="form-control" value="${balance.etc01}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 7월 카드</span>
					</div>
					<input type="text" id="card07" name="card07" class="form-control" value="${balance.card07}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 7월 기타</span>
					</div>
					<input type="text" id="etc07" name="etc07" class="form-control" value="${balance.etc07}" maxlength="9">
				</div>
			</div>
			<div class="row">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 2월 카드</span>
					</div>
					<input type="text" id="card02" name="card02" class="form-control" value="${balance.card02}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 2월 기타</span>
					</div>
					<input type="text" id="etc02" name="etc02" class="form-control" value="${balance.etc02}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 8월 카드</span>
					</div>
					<input type="text" id="card08" name="card08" class="form-control" value="${balance.card08}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 8월 기타</span>
					</div>
					<input type="text" id="etc08" name="etc08" class="form-control" value="${balance.etc08}" maxlength="9">
				</div>
			</div>
			<div class="row">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 3월 카드</span>
					</div>
					<input type="text" id="card03" name="card03" class="form-control" value="${balance.card03}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 3월 기타</span>
					</div>
					<input type="text" id="etc03" name="etc03" class="form-control" value="${balance.etc03}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 9월 카드</span>
					</div>
					<input type="text" id="card09" name="card09" class="form-control" value="${balance.card09}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 9월 기타</span>
					</div>
					<input type="text" id="etc09" name="etc09" class="form-control" value="${balance.etc09}" maxlength="9">
				</div>
			</div>
			<div class="row" >
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 4월 카드</span>
					</div>
					<input type="text" id="card04" name="card04" class="form-control" value="${balance.card04}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 4월 기타</span>
					</div>
					<input type="text" id="etc04" name="etc04" class="form-control" value="${balance.etc04}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 10월 카드</span>
					</div>
					<input type="text" id="card10" name="card10" class="form-control" value="${balance.card10}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 10월 기타</span>
					</div>
					<input type="text" id="etc10" name="etc10" class="form-control" value="${balance.etc10}" maxlength="9">
				</div>
			</div>
			<div class="row" >
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 5월 카드</span>
					</div>
					<input type="text" id="card05" name="card05" class="form-control" value="${balance.card05}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 5월 기타</span>
					</div>
					<input type="text" id="etc05" name="etc05" class="form-control" value="${balance.etc05}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 11월 카드</span>
					</div>
					<input type="text" id="card11" name="card11" class="form-control" value="${balance.card11}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 11월 기타</span>
					</div>
					<input type="text" id="etc11" name="etc11" class="form-control" value="${balance.etc11}" maxlength="9">
				</div>
			</div>
			<div class="row" >
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 6월 카드</span>
					</div>
					<input type="text" id="card06" name="card06" class="form-control" value="${balance.card06}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 6월 기타</span>
					</div>
					<input type="text" id="etc06" name="etc06" class="form-control" value="${balance.etc06}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 12월 카드</span>
					</div>
					<input type="text" id="card12" name="card12" class="form-control" value="${balance.card12}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 12월 기타</span>
					</div>
					<input type="text" id="etc12" name="etc12" class="form-control" value="${balance.etc12}" maxlength="9">
				</div>
			</div>
			<div class="row" style="margin-top: 15px">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 1월 전월잔고</span>
					</div>
					<input type="text" id="prebalance01" name="prebalance01" class="form-control" value="${balance.prebalance01}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 1월 잔고</span>
					</div>
					<input type="text" id="balance01" name="balance01" class="form-control" value="${balance.balance01}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 7월 전월잔고</span>
					</div>
					<input type="text" id="prebalance07" name="prebalance07" class="form-control" value="${balance.prebalance07}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 7월 잔고</span>
					</div>
					<input type="text" id="balance07" name="balance07" class="form-control" value="${balance.balance07}" maxlength="9">
				</div>
			</div>
			<div class="row">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 2월 전월잔고</span>
					</div>
					<input type="text" id="prebalance02" name="prebalance02" class="form-control" value="${balance.prebalance02}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 2월 잔고</span>
					</div>
					<input type="text" id="balance02" name="balance02" class="form-control" value="${balance.balance02}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 8월 전월잔고</span>
					</div>
					<input type="text" id="prebalance08" name="prebalance08" class="form-control" value="${balance.prebalance08}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 8월 잔고</span>
					</div>
					<input type="text" id="balance08" name="balance08" class="form-control" value="${balance.balance08}" maxlength="9">
				</div>
			</div>
			<div class="row">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 3월 전월잔고</span>
					</div>
					<input type="text" id="prebalance03" name="prebalance03" class="form-control" value="${balance.prebalance03}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 3월 잔고</span>
					</div>
					<input type="text" id="balance03" name="balance03" class="form-control" value="${balance.balance03}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 9월 전월잔고</span>
					</div>
					<input type="text" id="prebalance09" name="prebalance09" class="form-control" value="${balance.prebalance09}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 9월 잔고</span>
					</div>
					<input type="text" id="balance09" name="balance09" class="form-control" value="${balance.balance09}" maxlength="9">
				</div>
			</div>
			<div class="row" >
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 4월 전월잔고</span>
					</div>
					<input type="text" id="prebalance04" name="prebalance04" class="form-control" value="${balance.prebalance04}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 4월 잔고</span>
					</div>
					<input type="text" id="balance04" name="balance04" class="form-control" value="${balance.balance04}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 10월 전월잔고</span>
					</div>
					<input type="text" id="prebalance10" name="prebalance10" class="form-control" value="${balance.prebalance10}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 10월 잔고</span>
					</div>
					<input type="text" id="balance10" name="balance10" class="form-control" value="${balance.balance10}" maxlength="9">
				</div>
			</div>
			<div class="row" >
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 5월 전월잔고</span>
					</div>
					<input type="text" id="prebalance05" name="prebalance05" class="form-control" value="${balance.prebalance05}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 5월 잔고</span>
					</div>
					<input type="text" id="balance05" name="balance05" class="form-control" value="${balance.balance05}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 11월 전월잔고</span>
					</div>
					<input type="text" id="prebalance11" name="prebalance11" class="form-control" value="${balance.prebalance11}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 11월 잔고</span>
					</div>
					<input type="text" id="balance11" name="balance11" class="form-control" value="${balance.balance11}" maxlength="9">
				</div>
			</div>
			<div class="row" >
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 6월 전월잔고</span>
					</div>
					<input type="text" id="prebalance06" name="prebalance06" class="form-control" value="${balance.prebalance06}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 6월 잔고</span>
					</div>
					<input type="text" id="balance06" name="balance06" class="form-control" value="${balance.balance06}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 12월 전월잔고</span>
					</div>
					<input type="text" id="prebalance12" name="prebalance12" class="form-control" value="${balance.prebalance12}" maxlength="9">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> 12월 잔고</span>
					</div>
					<input type="text" id="balance12" name="balance12" class="form-control" value="${balance.balance12}" maxlength="9">
				</div>
			</div>
			<div class="row" style="margin-top: 30px">
				<div class="col-md-3"></div>
				<div class="col-md-2">
					<a href="balancedetail?yyyy=${balance.yyyy}&vendcode=${balance.vendcode}"><button type="submit" id="balanceupdatesave" class="btn btn-primary btn-block">저장</button></a>
				</div>
				<div class="col-md-2">
					<button type="button" id="balanceupdatedelete" class="btn btn-success btn-block">삭제</button>
				</div>
				<div class="col-md-2">
					<a href="balancedetail?yyyy=${balance.yyyy}&vendcode=${balance.vendcode}"><button type="button" id="balanceupdatecancel" class="btn btn-warning btn-block">취소</button></a>
				</div>
				<div class="col-md-3"></div>
			</div>
			<!-- Modal -->
			<div id="balanceupdateModal" class="modal fade" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="background-color: #9999cc">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title"></h4>
						</div>
						<div class="balanceupdate-modal-body">
							<p>Some text in the modal.</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-success balanceupdate_modal_btn1" data-dismiss="modal">확인</button>
							<button type="button" class="btn btn-success balanceupdate_modal_btn2" data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>