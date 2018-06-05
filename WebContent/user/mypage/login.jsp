<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<%@include file="../template/header.jsp"%>
<!-- <body class="soap-login-page style3 body-blank"> -->
		<section id="content">
			<div class="container">
				<div id="main">
					<h1 class="logo block">
						<a href="index.html" title="Travelo - home"></a>
					</h1>
					
					<div class="col-sm-8 col-md-6 col-lg-5 no-float no-padding center-block">
					<div class="welcome-text box" style="">환영합니다!</div>
					<p class="white-color block" style="font-size: 1.5em;">아이디와 비밀번호를 입력해 주세요 .</p>
						<form class="login-form" name="f" action="<%=request.getContextPath() %>/MemberController?type=login" method="post">
							<div class="form-group">
								<input type="text" class="input-text input-large full-width" name="userid"  placeholder="아이디" />
								
							</div>
							<div class="form-group">
								<input type="password" class="input-text input-large full-width" placeholder="비밀번호" name="pwd"/>
							</div>
							<div class="form-group">
								<label class="checkbox"> <input type="checkbox" value="">아이디 저장하기</label>
							</div>
							<button class="btn-large full-width yellow">로그인</button>
							<div class="search-id">
								<ul class="search-tabs clearfix">
									<li><a href="#id-search" data-toggle="tab">아이디 찾기</a></li>
									<li><a href="#pass_search" data-toggle="tab">비밀번호 찾기</a></li>
									<li><a href="#sign_up" data-toggle="tab">회원가입</a></li>
								</ul>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
	<%@include file="../template/footer.jsp"%>
</html>