<%@page import="vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%ArrayList<Board> list = (ArrayList)request.getAttribute("boardlist"); %>
	<%for(int i = 0; i < list.size(); i++){ %>
	<li><a href="<%=request.getContextPath()%>/PostController?type=boardList&brd_id=<%=list.get(i).getBrd_id()%>&brd_name=<%= list.get(i).getBrd_name()%>&brd_type=<%=list.get(i).getBrd_type()%>"><%= list.get(i).getBrd_name() %></a></li>
<%}  %>