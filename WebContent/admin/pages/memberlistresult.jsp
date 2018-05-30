<%@ page import="vo.PageBean" %>
<%@ page import="vo.Member" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%PageBean pb = (PageBean)request.getAttribute("pagebean"); %>
<!DOCTYPE html>
<html>
<head>
<title>memberlistresult.jsp</title>
<style></style>
<script></script>
</head>
<body>

<%-- <% 	
	//PageBean pb = (PageBean)request.getAttribute("pagebean");
	//List<RepBoard> list = (List)request.getAttribute("boardlist");
	List<RepBoard> list = pb.getList();
	for(RepBoard b : list){
%> --%>
 <div class="board">
 <c:set var="pagebean" value="${requestScope.pagebean}"/>
 <c:set var="list" value="${pagebean.list}"/>
 <c:forEach var="member" items="${list}"/>
 
 <%-- 
<div class="board">
    <div class="board_seq">
    <%for(int i=1; i<b.getLevel(); i++){
    %>	<%="▷"%>
    <%}%><%=b.getBoard_seq()%>
    </div> 
    <div class="parent_seq"><%=b.getParent_seq()%></div>
    <div class="board_subject"><%=b.getBoard_subject()%></div>
    <div class="board_writer"><%=b.getBoard_writer()%></div>
    <div class="board_date"><%=b.getBoard_date()%></div>
    <div class="board_viewcount"><%=b.getBoard_viewcount()%></div>
  </div>
 <%  
	}
%>--%>
 int i=1;
 <c:forEach begin="0" end="${member.level}-1" var="i" step="1" varStatus="status"/>
 </div>

  <div class="mem_id">{member.mem_id}</div>
  <div class="mem_userid">{member.mem_userid}</div>
  <div class="mem_password">{member.mem_password}</div>
  <div class="mem_username">{member.mem_username}</div>
  <div class="mem_nickname">{member.mem_nickname}</div>
  <div class="mem_phone">{member.mem_phone}</div>
  <div class="mem_sex">{member.mem_sex}</div>
  <div class="mem_register_datetime">{member.mem_register_datetime}</div>
  <div class="mem_lastlogin_datetime">{member.mem_lastlogin_datetime}</div>
  <div class="mem_treasurer">{member.mem_treasurer}</div>
  <div class="mem_passion">{member.mem_passion}</div>
 </div>
 
 
 <div class="pagination"></div>
 <c:set var="startPage" value="pagebean.startPage"/>
 <c:set var="endPage" value="pagebean.endPage"/>
 <c:if test="${startPage>1}">
 <a href="#">&laquo;</a>
 </c:if>
 <c:forEach begin="i=startPage" end="endPage-1" step="1">
 <a href="#">${i}</a>
 </c:forEach>
 
 </div>

</body>
</html>