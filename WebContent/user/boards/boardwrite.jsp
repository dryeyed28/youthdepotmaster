<%@page import="vo.Post"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 페이지 요청시 : 게시글에서 값 가져와서 출력 --%>
<%-- 답변등록 버튼누르면 : UserBoardUpdateController에 데이터 전달 --%>
<%@include file="../template/header.jsp"%>
<%Post p = (Post)request.getAttribute("p"); %>
<div id="page-wrapper">
	<section id="content" class="gray-area">
		<div class="container">
			<div class="row">
				<div id="main" class="col-sms-6 col-sm-8 col-md-9">
					<div class="booking-section travelo-box">

						<form name="f" action="<%=request.getContextPath()%>/PostController?type=boardwrite" method="post">
						  <input type="hidden" name="bid">
						  <input type="hidden" name="admin_id">
						  <input type="hidden" name="board_id">
						  <input type="hidden" name="board_id">
							<div class="alert small-box" style="display: none;"></div>
							<div class="person-information">
								<h2>게시판</h2>
								<hr>
								<div class="form-group row">
									<div class="col-sm-6 col-md-4">
										<h4>작성자</h4>
										<input type="text" name="name" class="input-text full-width" readonly>
									</div>
								</div>
								<div class="form-group row">

									<div class="col-sm-6 col-md-8">
										<h4>제목</h4>
										<input type="text" name="title" class="input-text full-width">
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-6 col-md-8">
										<h4>내용</h4>
										<input type="textarea" name="content"
											style="margin: 0px; width: 528px; height: 296px;">

									</div>
								</div>
<%-- 								<div class="form-group row">

									<div class="col-sm-6 col-md-3">
										<h4>비밀번호</h4>
										<input type="text" name="passward"
											class="input-text full-width" value="<%=p.getAdmin_pwd()%>" placeholder="">
									</div>
								</div> --%>
							</div>
							<hr>

							<div class="form-group row">
								<div class="col-sm-6 col-md-3">
									<button type="submit" class="green">등록</button>

									<button type="submit" class="green">취소</button>
								</div>
							</div>
						</form>
					</div>
				</div>

				<div class="sidebar col-sm-4 col-md-3">
					<div class="travelo-box contact-box">
						<h4>Need Travelo Help?</h4>
						<p>We would be more than happy to help you. Our team advisor
							are 24/7 at your service to help you.</p>
						<address class="contact-details">
							<span class="contact-phone"><i class="soap-icon-phone"></i>
								1-800-123-HELLO</span> <br> <a class="contact-email" href="#">help@travelo.com</a>
						</address>
					</div>
					<div class="travelo-box book-with-us-box">
						<h4>Why Book with us?</h4>
						<ul>
							<li><i class="soap-icon-hotel-1 circle"></i>
								<h5 class="title">
									<a href="#">135,00+ Hotels</a>
								</h5>
								<p>Nunc cursus libero pur congue arut nimspnty.</p></li>
							<li><i class="soap-icon-savings circle"></i>
								<h5 class="title">
									<a href="#">Low Rates &amp; Savings</a>
								</h5>
								<p>Nunc cursus libero pur congue arut nimspnty.</p></li>
							<li><i class="soap-icon-support circle"></i>
								<h5 class="title">
									<a href="#">Excellent Support</a>
								</h5>
								<p>Nunc cursus libero pur congue arut nimspnty.</p></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<%@include file="../template/footer.jsp"%>