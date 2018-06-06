<%@page import="vo.RMeta"%>
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
<style>
a:link { color: black; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:hover { color: blue; text-decoration: underline;}
</style>
<body>
<div id="page-wrapper">
  <div class="row">
	<div class="col-lg-12">
	  <h2 class="page-header">청춘 프로젝트</h2>
	</div>
  </div>
  
  <div class="row">
	<div class="col-lg-12">
	  <div class="panel panel-default">
		<div class="panel-heading">
			프로젝트 신청 관리
		</div>
        <!-- /.panel-heading -->
        
      <div class="panel-body">
		<table class="table table-bordered table-hover" id="dataTables-example">
           <thead>
              <tr>
                <th>프로젝트 번호</th>
                <th>프로젝트 제목</th>
                <th>창고지기</th>
                <th>신청일</th>
                <th>진행사항</th>
              </tr>
           </thead>
           <tbody>
           <%ArrayList<RMeta> project = (ArrayList)request.getAttribute("project");
           for(RMeta rm : project) {%>
              <tr>
                <td><%=rm.getrProject().getrPJT_id() %></td>
                <td><a href="<%=root%>/ProjectController?type=content&id=<%=rm.getrProject().getrPJT_id()%>"> <%=rm.getrPJT_title() %> </a></td>
                <td class="center"><%=rm.getrProject().getMem_id() %></td>
                <td class="center"><%=rm.getrProject().getrPJT_submission() %></td>
                <% if(rm.getrProject().getrPJT_state() == 1) { %>
                <td>검토중</td>
                <%} else if(rm.getrProject().getrPJT_state() == 2) { %>
                <td>승인</td>
                <%}else if(rm.getrProject().getrPJT_state() == 3) { %>
                <td>반려</td>
                <%} %>
			  <%} %>
              </tr>
           </tbody>
        </table>
      <hr>
	  </div>
      <!-- /.panel-body -->
      </div>
      <!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
   </div>
 </div>
 <!-- /#page-wrapper -->
</body>