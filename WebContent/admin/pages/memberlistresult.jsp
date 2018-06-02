<%@ page import="vo.PageBean" %>
<%@ page import="vo.Member" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<title>memberlistresult.jsp</title>
<style></style>
<script>
<script>
$(document).ready(function() {
    $('#dataTables-example').DataTable({
        responsive: true
    });
});
</script>
<script>
$(function() {
$('button#modify').click(function() {
	$.ajax({
		method: "POST",
		url:"memModify.jsp",
		success: function(data){ 
			$("div#page-wrapper").empty();
			$('div#page-wrapper').html(data.trim());		
		}
	});
	return false;
});
});
</script>
</head>
<body>
<c:set var="pb" value="${requestScope.pagebean}"/>
<c:set var="list" value="${pb.list}"/>
<div id="page-wrapper">
  <div class="row">
	<div class="col-lg-12">
	  <h2 class="page-header">회원관리</h2>
	</div>
  </div>
  
  <div class="row">
	<div class="col-lg-12">
	  <div class="panel panel-default">
		<div class="panel-heading">
			회원정보 관리
		</div>
        <!-- /.panel-heading -->
        
      <div class="panel-body">
		<table width="100%" class="table table-bordered table-hover" id="dataTables-example">
           <thead>
              <tr>
            	<th><input type="checkbox"></th>
            	<th>멤버고유번호</th>
                <th>아이디</th>
                <th>이메일</th>
                <th>비밀번호</th>
                <th>이름</th>
                <th>별명</th>
                <th>연락처</th>
                <th>성별</th>
                <th>가입일</th>
                <th>최종로그인</th>
                <th>창고지기</th>
                <th>열정보유액</th>
              </tr>
           </thead>
           <tbody>
            <c:forEach var="member" items="${list}">
              <tr>
                <td><input type="checkbox"></td>
                <td>${member.mem_id}</td>
                <td>${member.mem_userId}</td>
                <td>${member.mem_email}</td>
                <td>${member.mem_password}</td>
                <td>${member.mem_userName}</td>
                <td>${member.mem_nickName}</td>
                <td>${member.mem_phone}</td>
                <td>${member.mem_sex}</td>
                <td>${member.mem_register_dateTime}</td>
                <td>${member.mem_lastLogin_dateTime}</td>
                <td>${member.mem_treasurer}</td>
                <td>${member.mem_passion}</td>
            </tr>
            </c:forEach>
     
           </tbody>
        </table>
      <br>
      <div class="btn-member" style="text-align: right">
        <button id="modify" class="btn btn-outline btn-primary">회원 수정</button>
        <button id="del" class="btn btn-outline btn-danger">회원 탈퇴</button>
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
</html>