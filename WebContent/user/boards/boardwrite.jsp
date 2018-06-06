<%@page import="vo.Post"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 페이지 요청시 : 게시글에서 값 가져와서 출력 --%>
<%-- 답변등록 버튼누르면 : UserBoardUpdateController에 데이터 전달 --%>
<%@include file="../template/header.jsp"%>
<%HttpSession session1 = request.getSession();%>
<div id="page-wrapper">
	<section id="content" class="gray-area">
		<div class="container">
			<div class="row">
				<div id="main" class="col-sms-6 col-sm-8 col-md-9">
					<div class="booking-section travelo-box">

						<form name="f" action="<%=request.getContextPath()%>/PostController?type=boardwrite" method="post">
						  <input type="hidden" name="brd_id" value="<%=request.getParameter("brd_id")%>">
							<div class="alert small-box" style="display: none;"></div>
							<div class="person-information">
								<h2>게시판</h2>
								<hr>
								<div class="form-group row">
									<div class="col-sm-6 col-md-4">
										<h4>작성자</h4>
										<input type="text" name="nickname" class="input-text full-width" value="<%= session1.getAttribute("nicname")%>" readonly>
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
										<textarea name="content"
											style="margin: 0px; width: 528px; height: 296px;"></textarea>

									</div>
								</div>
							</div>
							<hr>

							<div class="form-group row">
								<div class="col-sm-6 col-md-3">
									<button class="green">등록</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				</div>
		</div>
	</section>
</div>
<%@include file="../template/footer.jsp"%>