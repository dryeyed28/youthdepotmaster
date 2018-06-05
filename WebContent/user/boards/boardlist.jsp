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
			<div class="booking-information travelo-box">
				<h1>게시판</h1>
				<hr><br>
				<h3>공지사항</h3>
				<%-- <h3><%=p.getBoard_id().getBrd_name() %></h3> --%>
				<p style="text-align: right">
					<% String root = request.getContextPath(); %>
					<form name="f" method="GET" action="<%= root %>/PostController">
					<select name="type">
						<option value="searchAll">전체검색</option>
						<option value="searchTitle">제목</option>
						<option value="searchWriter">작성자</option>
						<option value="searchContent">내용</option>
					</select> 
					<input type="text" name="searchText" value="" /> 
					<input type="submit" value="검색" />
					</form>
				</p>
				<form name="f" action="<%=request.getContextPath()%>/PostController?type=boardView" method="get">
				<table class="table">
					<thead>
						<tr>
							<th>글 번호</th>
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
							<td><a href="<%=request.getContextPath()%>/PostController?type=boardView&brd=<%=p.getBoard_id().getBrd_id()%>&id=<%=p.getPost_id()%>"><%=p.getPost_title() %></a></td>
							<td><%=p.getMem_nickName() %></td>
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
				<div align="right">
				  <a href="<%=request.getContextPath()%>/user/boards/boardwrite.jsp?id=<%=data.get(0).getPost_id()%>"><button>글쓰기</button></a>
				</div>
			</div>
	</div>
  </div>
</section>
<%@include file="../template/footer.jsp"%>