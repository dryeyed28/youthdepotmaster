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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <title>mermberlistresult2.jsp</title> -->
<!-- <style src="/css/memberlistresult2.css"></style> -->
<link rel="stylesheet" type="text/css" href="/youthdepotmaster/admin/css/memberlistresult2.css">
<script></script>
</head>
<body>
<%--<% 
  //PageBean pb = (PageBean)request.getAttribute("pagebean");
  //List<RepBoard>list = (List)request.getAttribute("boardlist");
  List<RepBoard>list = pb.getList();
  for(RepBoard b:list){	  
%><div class="board">
    <div class="board_seq">
    <%for(int i=1; i<b.getLevel(); i++){
    %>	<%="▷"%>
    <%}%><%=b.getBoard_seq()%>
    </div>
    <%-- <div class="parent_seq"><%=b.getParent_seq()%></div> 
    <div class="board_subject"><%=b.getBoard_subject()%></div>
    <div class="board_writer"><%=b.getBoard_writer()%></div>
    <div class="board_date"><%=b.getBoard_date()%></div>
    <div class="board_viewcount"><%=b.getBoard_viewcount()%></div>
  </div>  
<%	  
  }
%><div class="pagination">  
<%int startPage = pb.getStartPage();
  int endPage = pb.getEndPage();
  if(startPage > 1){%>
	  <a href="#">&laquo;</a>  
<%}  
  for(int i=startPage; i<=endPage; i++){  
%><a href="#"><%=i%></a>	  
<%}  
  System.out.println(pb);
  
  if(endPage < pb.getTotalPage()){%>
	<a href="#">&raquo;</a>  
<%}
%></div>
</div> --%>
		
		<%-- 리퀘스트 어튜리뷰트에 담긴 pagebean(member list 포함) 객체를 jsp에서 받아온다 --%>
		<%-- PageBean pb = (PageBean) request.getAttribute("pagebean") --%>
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
	
 	<c:forEach var="member" items="${list}">
 		<%-- list에 있는 member 객체 전부 가져와서 반복 --%>
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