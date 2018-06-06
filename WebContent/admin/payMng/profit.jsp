<%@page import="totalpay.ProfitDto"%>
<%@page import="java.util.ArrayList"%>
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
	  <h2 class="page-header">결제 관리 > 이익현황 관리</h2>
	</div>
  </div>
  
  <div class="row">
	<div class="col-lg-12">
	  <div class="panel panel-default">
		<div class="panel-heading">
			이익현황 관리
		</div>
        <!-- /.panel-heading -->
        
      <div class="panel-body">
		<table width="100%" class="table table-bordered table-hover" id="dataTables-example">
           <thead>
              <tr>
            	<td><input type="checkbox"></td>
                <th>창고지기ID</th>
                <th>프로젝트ID</th>
                <th>프로젝트현황</th>
                <th>프로젝트마감일</th>
                <th>모금액</th>
                <th>이익</th>
                <th>상태</th>
              </tr>
           </thead>
           <tbody>
           <%ArrayList<ProfitDto> profit = (ArrayList) request.getAttribute("profit");
           for(ProfitDto p : profit) {
        	   int fee = p.getrPJT_profit() * (7/100);
        	   String comma = String.format("%,d",p.getrPJT_profit());%>
              <tr>
                <td><input type="checkbox"></td>
                <td><%=p.getMem_userID() %></td>
                <td><%=p.getrPJT_id() %></td>
                <% if(p.getrPJT_progress() == 2) { %>
                <td>성공</td>
                <%} else if(p.getrPJT_progress() == 3) { %>
                <td>실패</td>
                <%} %>
                <td><%=p.getrPJT_endDay() %></td>
                <td><%=comma %></td>
                <td><%=fee %></td>
                <% if(p.getrPJT_profit() == 1) { %>
                <td>입금성공</td>
                <%} else if(p.getrPJT_progress() == 2) { %>
                <td>입금대기</td>
                <%} else {%>
                <td> - </td>
                <%} %>
              </tr>
           <%} %>
           </tbody>
        </table>
        
      <div>
        <a class="btn btn-default btn-primary">삭제</a>
      </div>   
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