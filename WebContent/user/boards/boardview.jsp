<%@page import="vo.Post"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../template/header.jsp"%>
<script>
function goBack() {
    window.history.back();
}
</script>
<style>
#button{
margin:10px;
}
</style>
<section id="content" class="gray-area">
	<div class="container">
		<div class="row">
		<h3>게시글 상세보기</h3>
			<div id="main" class="col-sm-8 col-md-9">
				<div class="booking-information travelo-box">
				<%Post p = (Post)request.getAttribute("p"); %>
					<h2><%=p.getPost_title()%></h2>
					<hr>
					<dl class="term-description">
						<dt>작성자</dt><dd><%=p.getAdmin_id()%></dd>
						<dt>작성일</dt><dd><%=p.getPost_dateTime()%></dd>
						<dt>조회수</dt><dd><%=p.getPost_view_count()%></dd>
					</dl>
					<hr>

					<p><%=p.getPost_content()%></p>
					<br>
					<div class="form-group row" align="right">
						<button id="button" type="submit" class="green" onclick="goBack()">목록</button>
						<a id="button" type="submit" class="green" href="<%=request.getContextPath()%>/PostController?type=boardupdate&id=<%=p.getAdmin_id()%>&title=<%=p.getPost_title()%>&content=<%=p.getPost_content() %>">수정</a>
						<button id="button" type="submit" class="green">삭제</button>
					</div>
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
<!-- 
<section id="content" class="gray-area">
	<div class="container">
		<div class="row">
			<div id="main" class="col-sm-8 col-md-9">
				<div class="booking-information travelo-box">
					<h2>게시판</h2>
					<hr />
					<form name="BoardViewForm" method="post">
						<h3>게시글 상세보기</h3>
						<%-- <%Post p = (Post)request.getAttribute("p"); %>
						<table>
							<tr>
								<td bgcolor=#dddddd>작성자</td>
								<td><%=p.getAdmin_id()%></td>
								<td bgcolor=#dddddd>작성일</td>
								<td><%=p.getPost_dateTime()%></td>
							</tr>
							<tr>
								<td bgcolor=#dddddd>제목</td>
								<td><%=p.getPost_title()%></td>
								<td bgcolor=#dddddd>조회수</td>
								<td><%=p.getPost_view_count()%></td>
							</tr>
							<tr>
								<td>내용</td>
								<td colspan=4><%=p.getPost_content()%></td>
							</tr>
						</table> --%>
						<hr size=1>
						<div align="center">
							[ <input type="button" value="목록"
								onclick="move('Board_List.jsp');"> | <input
								type="button" value="수정" onclick="move('Board_Update.jsp');">
							| <input type="button" value="답변"
								onclick="move('Board_Reply.jsp');"> | <input
								type="button" value="삭제" onclick="move('Board_Delete.jsp');">]<br>
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
 -->
<%@include file="../template/footer.jsp"%>