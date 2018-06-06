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
#button {
	margin: 10px;
}
</style>
<section id="content" class="gray-area">
	<div class="container">
		<div class="row">
			<h3>게시글 상세보기</h3>
			<div class="booking-information travelo-box">
				<%
					Post p = (Post) request.getAttribute("p");
				%>
				<h2><%=p.getPost_title()%></h2>
				<hr>
				<dl class="term-description">
				<%if(p.getBoard_id().getBrd_type().equals("일반")){ %>
					<dt>작성자</dt>
					<dd><%=p.getMem_nickName()%></dd>
				<%} else { %>
					<dt>작성자</dt>
					<dd><%=p.getAdmin_id()%></dd>
				<%} %>
					<dt>작성일</dt>
					<dd><%=p.getPost_dateTime()%></dd>
					<dt>조회수</dt>
					<dd><%=p.getPost_view_count()%></dd>
				</dl>
				<hr>
				<p><%=p.getPost_content()%></p>
				<br>
				<div  align="right">
				<button id="button" type="submit" class="green" onclick="goBack()">목록</button>
				</div>
				<%if(p.getBoard_id().getBrd_type().equals("일반")){ %>
				<div class="form-group " align="right">
					<a id="button" type="submit" class="green"
						href="<%=request.getContextPath()%>/PostController?type=boardupdate&id=<%=p.getAdmin_id()%>
						&title=<%=p.getPost_title()%>&content=<%=p.getPost_content()%>&post_id=<%=p.getPost_id()%>&brd=<%=p.getBoard_id().getBrd_id()%>">수정</a>
					<button id="button" type="submit" class="green">삭제</button>
				</div>
				<%} %>
			</div>
		</div>
	</div>
</section>
<%@include file="../template/footer.jsp"%>