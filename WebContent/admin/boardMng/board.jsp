<%@page import="vo.Post"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../template/top.jsp"%>
<%@include file="../template/aside.jsp"%>
<script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
</script>

<% ArrayList<Post> data = (ArrayList) request.getAttribute("data"); %>
<div id="page-wrapper">
  <div class="row">
	<div class="col-lg-12">
	  <h2 class="page-header">게시 관리 > <%=data.get(0).getBoard_id().getBrd_name()%></h2>
	</div>
  </div>
  
  <div class="row">
	<div class="col-lg-12">
	  <div class="panel panel-default">
		<div class="panel-heading">
			<%=data.get(0).getBoard_id().getBrd_name()%>
		</div>
        <!-- /.panel-heading -->
      <div class="panel-body">
		<table width="100%" class="table table-bordered table-hover" id="dataTables-example">
           <thead>
              <tr>
            	<th><input type="checkbox"></th>
                <th>번호</th>
                <th>제목</th>
                <th>작성일자</th>
              </tr>
           </thead>
           <tbody>
           <%
				for (Post p : data) {
			%>
              <tr>
                <td><input type="checkbox"></td>
                <td><%-- <%=p.getRownum()%> --%></td>
                <td><%=p.getPost_title()%></td>
                <td><%=p.getPost_dateTime()%></td>
              </tr>
            <%
				}
			%>
           </tbody>
        </table>
      <div>
   		 선택글 &nbsp;
        <a class="btn btn-default">삭제</a>&nbsp;&nbsp;
        <a class="btn btn-default">이동</a>
      </div>
      <hr>
      <button id="edit" onclick="location.href='<%= request.getContextPath()%>/admin/boardMng/edit.jsp'" class="btn btn-outline btn-primary">글쓰기</button>&nbsp;&nbsp;
      <button id="modify" onclick="location.href='postupdaterslt.jsp'" class="btn btn-outline btn-primary">수정</button>
	  </div>
      <!-- /.panel-body -->
      </div>
      <!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
   </div>
 </div>
 <!-- /#page-wrapper -->