<%@page import="vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../template/top.jsp"%>
<%@include file="../template/aside.jsp"%>
<%Board b = (Board)request.getAttribute("board"); %>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h2 class="page-header">게시판 관리 > 게시판 수정</h2>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="container"
				style="margin: 0px; padding: 0px; padding-top: 20px;">
				<form class="boardSubmit"
					action="<%=request.getContextPath()%>/BoardController?type=updateok"
					method="post">
					<input type="hidden" name="brd" value="<%= b.getBrd_id() %>">
					<table class="table table-bordered">
						<tr>
							<th>게시판 이름</th>
							<td><input type="text" name="name" class="form-control" value="<%= b.getBrd_name() %>"/></td>
						</tr>
						<tr>
							<th>분류</th>
							<td><label><input type="radio" name="brd_type"
									value="운영" <% if(b.getBrd_type().equals("운영")){ %>checked="checked"<%}%> /> 운영</label> <label><input type="radio"
									name="brd_type" value="일반" <% if(b.getBrd_type().equals("일반")) { %>checked="checked"<%}%>/> 일반</label></td>
						</tr>
					</table>
					<button class="btn btn-primary" >확인</button>
					<a class="btn btn-primary" href='javascript:history.back()'> 취소</a>
				</form>
			</div>
		</div>
	</div>
</div>


