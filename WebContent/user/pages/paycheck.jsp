<%@page import="vo.Member"%>
<%@page import="vo.RewardPay"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../template/header.jsp"%>
<section id="content" class="gray-area">
	<div class="container">
		<div class="row">
			<div class="sidebar col-sm-4 col-md-2"></div>
			<div id="main" class="col-sm-8 col-md-8">
				<div class="booking-information travelo-box">
					<h2>결제 완료!</h2>
					<hr />
					<div class="booking-confirmation clearfix">
						<i class="soap-icon-recommend icon circle"></i>
						<%RewardPay rpay = (RewardPay)request.getAttribute("payaddressinsert"); %>
						<div class="message">
							<h4 class="main-message"><%=rpay.getMem_name()%> 서포터님 감사합니다</h4>
							<p>결제 예약 결과및 배송예상일은 나의 펀딩현황에서 확인하세요</p>
						</div>
						<a href="#" class="button print-button btn-small uppercase">펀딩
							현황 바로가기</a>
					</div>
					<hr />
					<h2>결제 내역</h2>
					<dl class="term-description">
						<dt>프로젝트이름 :</dt>
						<dd>xxx프로젝트</dd>
						<dt>상품 이름 :</dt>
						<dd><%=rpay.getrProduct_id()%></dd>
						<dt>구매 갯수 :</dt>
						<dd><%=rpay.getrProduct_ea() %></dd>
						<dt>결제금액 :</dt>
						<dd><%=rpay.getrPay_total()%>열정</dd>
					</dl>
					<hr />
					<h2>배송지 정보</h2>
					<dl class="term-description">
						<dt>수령인 :</dt>
						<dd><%=rpay.getMem_name()%></dd>
						<dt>연락처 :</dt>
						<dd><%=rpay.getrPay_phone() %></dd>
						<dt>주소 :</dt>
						<dd><%=rpay.getrPay_address() %></dd>
					</dl>
					<hr />
					<h2>청춘창고 결제 시스템은 이러합니다</h2>
					<p>Praesent dolor lectus, rutrum sit amet risus vitae,
						imperdiet cursus neque. Nulla tempor nec lorem eu suscipit. Donec
						dignissim lectus a nunc molestie consectetur. Nulla eu urna in
						nisi adipiscing placerat. Nam vel scelerisque magna. Donec justo
						urna, posuere ut dictum quis.</p>
					<br />
					<p class="red-color">Payment is made by Credit Card Via Paypal.</p>
					<hr />
				</div>
			</div>
			<div class="sidebar col-sm-4 col-md-2"></div>
		</div>
	</div>
</section>
<%@include file="../template/footer.jsp"%>