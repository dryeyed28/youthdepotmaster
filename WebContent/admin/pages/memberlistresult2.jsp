<%@ page import="vo.PageBean" %>
<%@ page import="vo.Member" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../template/top.jsp"%>
<%@include file="../template/aside.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <title>mermberlistresult2.jsp</title> -->
<!-- <style src="/css/memberlistresult2.css"></style> -->
<link rel="stylesheet" type="text/css" href="/youthdepotmaster/admin/css/memberlistresult2.css">
<script>
</script>
</head>
<body>
<c:set var="pb" value="${requestScope.pagebean}"/>
<c:set var="list" value="${pb.list}"/>
<div class="list">
 <div class="member1">
  <div class="mem_id">회원고유번호</div>
  <!-- 테이블행 --> 
   <div class="mem_userid">아이디</div>
   <div class="mem_email">이메일</div>
   <div class="mem_password">비밀번호</div>
   <div class="mem_username">이름</div>
   <div class="mem_nickname">별명</div>
   <div class="mem_phone">연락처</div>
   <div class="mem_sex">성별</div>
   <div class="mem_register_datetime">가입일</div>
   <div class="mem_lastLogin_datetime">최종 로그인</div>
   <div class="mem_treasurer">창고지기</div>
   <div class="mem_passion">열정</div>
 </div>
</div>
	
 <c:forEach var="member" items="${list}">s
  <div class="member2">
   <div class="mem_id">${member.mem_id}</div>
   <div class="mem_userid">${member.mem_userId}</div>
   <div class="mem_email">${member.mem_email}</div>
   <div class="mem_password">${member.mem_password}</div>
   <div class="mem_username">${member.mem_userName}</div>
   <div class="mem_nickname">${member.mem_nickName}</div>
   <div class="mem_phone">${member.mem_phone}</div>
   <div class="mem_sex">${member.mem_sex}</div>
   <div class="mem_register_datetime">${member.mem_register_dateTime}</div>
   <div class="mem_lastlogin_datetime">${member.mem_lastLogin_dateTime}</div>
   <div class="mem_treasurer">${member.mem_treasurer}</div>
   <div class="mem_passion">${member.mem_passion}</div>
  </div>
  </c:forEach>
 </div>
</body>
</html>