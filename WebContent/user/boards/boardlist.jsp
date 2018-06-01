<%@page import="java.util.ArrayList" %>
<%@page import="vo.Post"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--페이지 요청됬을때 : UserBoardListController >> 받은데이터 출력 --%>
<%--검색기능 : ajax요청 >> UserBoardSerchController >> boardserchrslt.jsp에서 데이터받아옴  --%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
<%@include file="../template/header.jsp"%>
<script type="text/javascript">
	function goUrl(url) {
		location.href = url;
	}
</script>

<section id="content" class="gray-area">
  <div class="container">
	<div class="row">
		<div id="main" class="col-sm-8 col-md-9">
			<div class="booking-information travelo-box">
				<h1>게시판</h1>
				<hr><br>
				<h3>공지사항</h3>
				<%-- <h3><%=p.getBoard_id().getBrd_name() %></h3> --%>
				<p style="text-align: right">
					<select name="searchType">
						<option value="ALL">전체검색</option>
						<option value="SUBJECT">제목</option>
						<option value="WRITER">작성자</option>
						<option value="CONTENTS">내용</option>
					</select> <input type="text" name="searchText" value="" /> <input
						type="submit" value="검색" />
				</p>
				<form name="f" action="<%=request.getContextPath()%>/PostController?type=boardView" method="post">
				<table class="table">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록 일시</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<!-- 게시물이 0개일때,
						<tr>
							<td align="center" colspan="5">등록된 게시물이 없습니다.</td>
						</tr>
						 -->
<%
	ArrayList<Post> data = (ArrayList)request.getAttribute("data");
	for(Post p : data){
%>
						<tr>
							<td><%=p.getPost_id() %></td>
							<td><a id="<%=p.getPost_id() %>" href="<%=request.getContextPath()%>/PostController?type=boardView&id=<%=p.getPost_id()%>"><%=p.getPost_title() %></a></td>
							<td><%=p.getAdmin_id() %></td>
							<td><%=p.getPost_dateTime() %></td>
							<td><%=p.getPost_view_count() %></td>
						</tr>
					</tbody>
<%} %>
					<tfoot>
						<tr>
							<td align="center" colspan="5">1</td>
						</tr>
					</tfoot>
				</table>
				</form>
				<p>
					<input type="button" value="목록" onclick="goUrl('boardlist.jsp');" />
					<input type="button" value="글쓰기"
						onclick="goUrl('boardWriteForm.jsp');" />
				</p>
			</div>
		</div>
		
		<div class="sidebar col-sm-4 col-md-3">
			<div class="travelo-box contact-box">
				<h4>도움이 필요하신가요?</h4>
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
<%@include file="../template/footer.jsp"%>