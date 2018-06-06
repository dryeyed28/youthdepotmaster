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
            	<td><input type="checkbox"></td>
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
                <td><input type="checkbox"></td>
                <td><%=rm.getrProject().getrPJT_id() %></td>
                <td><%=rm.getrPJT_title() %></td>
                <td class="center"><%=rm.getrProject().getMem_id() %></td>
                <td class="center"><%=rm.getrProject().getrPJT_submission() %></td>
                <td><div class="btn-group">
				  <select id="selectCategroy">
					<option>승인</option>
					<option>검토중</option>
					<option>반려</option>
				  </select>
				</div>
				</td>
			  <%} %>
              </tr>
           </tbody>
        </table>
      <hr>
      <div class="btn-center" style="text-align: right">
        <!-- 자세히 보기를 누르면 선택한 프로젝트의 내용 (projectrequestcontent.jsp) 보여주기 
        <button onclick="location.href='projectrequestcontent.jsp'" class="btn btn-outline btn-primary" >자세히 보기</button>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->
        <button class="btn btn-primary">진행사항 수정</button>&nbsp;
        <button class="btn btn-primary">삭제</button>
      </div>
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