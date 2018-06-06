<%@page import="vo.Deposit"%>
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
	  <h2 class="page-header">결제 관리 > 열정환불 관리</h2>
	</div>
  </div>
  
  <div class="row">
	<div class="col-lg-12">
	  <div class="panel panel-default">
		<div class="panel-heading">
			열정환불 관리
		</div>
        <!-- /.panel-heading -->
        
      <div class="panel-body">
		<table width="100%"  class="table table-bordered table-hover" id="dataTables-example">
           <thead>
              <tr>
            	<td><input type="checkbox"></td>
                <th>결제번호</th>
                <th>아이디</th>
                <th>신청금액</th>
                <th>환급신청날짜</th>
                <th>환급여부</th>
              </tr>
           </thead>
           <tbody>
           <%ArrayList<Deposit> yeoljeong = (ArrayList)request.getAttribute("yeoljeong");
           for(Deposit d : yeoljeong){
           		String comma = String.format("%,d",d.getDep_request());%>
              <tr>
                <td><input type="checkbox"></td>
                <td><%=d.getDep_id() %></td>
                <td><%=d.getMem_userID() %></td>
                <td><%=comma %></td>
                <td><%=d.getDep_date() %></td>
                <% if(d.getDep_type() == 3) { %>
                <td>환급대기</td>
                <%} else if(d.getDep_type() == 4) { %>
                <td>환급완료</td>
                <%} %>
              </tr>
           <%} %>
           </tbody>
        </table>
        
      <div>
        <a class="btn btn-default btn-primary">삭제</a>&nbsp;&nbsp;
        <a class="btn btn-default btn-primary">환급수락</a>
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