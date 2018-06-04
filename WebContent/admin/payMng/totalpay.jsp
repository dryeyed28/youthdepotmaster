<%@page import="vo.RewardPay"%>
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
	  <h2 class="page-header">결제 관리 > 전체결제 관리</h2>
	</div>
  </div>
  
  <div class="row">
	<div class="col-lg-12">
	  <div class="panel panel-default">
		<div class="panel-heading">
			전체결제 관리
		</div>
        <!-- /.panel-heading -->
        
      <div class="panel-body">
		<table width="100%" class="table table-bordered table-hover" id="dataTables-example">
           <thead>
              <tr>
                <th>결제번호</th>
                <th>아이디</th>
                <th>프로젝트ID</th>
                <th>금액</th>
                <th>수량</th>
                <th>날짜</th>
                <th>상태</th>
              </tr>
           </thead>
           <tbody>
           <%ArrayList<RewardPay> totalpay = (ArrayList)request.getAttribute("totalpay");
           for(RewardPay rpay : totalpay){%>
              <tr>
                <td><%=rpay.getrPay_id() %></td>
	            <td><a href=""><%=rpay.getMem_id() %></a></td>
	            <td><%=rpay.getrPJT_id() %></td>
	            <td><%=rpay.getrPay_total() %></td>
	            <td><%=rpay.getrProduct_ea() %></td>
	            <td><%=rpay.getrPay_date() %></td>
	            <td>입금완료</td>
              </tr>
           <%} %>
           </tbody>
        </table>
        
      <div>
        <a class="btn btn-default btn-primary">삭제</a>&nbsp;&nbsp;
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