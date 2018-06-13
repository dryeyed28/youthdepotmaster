<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String root = request.getContextPath(); %>
<style>
select{
	border:solid 1px;
}
</style>
<c:set var="pagebean" value="${sessionScope.pagebean}"/>
<c:set var="list" value="${pagebean.list}"/>
<div class="col-lg-12">
  <h2 class="page-header">회원수정</h2>
</div>

<div class="col-lg-12">
	<div class="container-fluid" style="padding-top: 50px;">
	  <form class="boardSubmit">
	    <table class="table table-bordered">
	    <c:forEach var="member" items="${list}">
	       <tr>
	        <th>회원번호</th>
	        <td>
	          <input type="text" name="id" readonly="readonly" value="${member.mem_id}">
	        </td>
	      </tr>
	      <tr>
	        <th>아이디</th>
	        <td>
	          <input type="text" name="id" readonly="readonly" value="${member.mem_userId}">
	        </td>
	      </tr>
	      <tr>
	        <th>패스워드</th>
	        <td>
	          <input type="password" name="pass" value="${member.mem_password}">
	        </td>
	      </tr>
	      <tr>
	        <th>이름</th>
	        <td>
	          <input type="text" name="name" value="${member.mem_userName}">
	        </td>
	      </tr>
	      <tr>
	        <th>닉네임</th>
	        <td>
	          <input type="text" name="phone" value="${member.mem_phone}">
	        </td>
	      </tr>
	      <tr>
	      <tr>
	        <th>전화번호</th>
	        <td>
	          <input type="text" name="phone" value="${member.mem_phone}">
	        </td>
	      </tr>
	      <tr>
	        <th>성별</th>
	        <td>
	          <input type="text" name="mail" value="${member.mem_sex}">
	        </td>
	      </tr>
	      <tr>
	        <th>가입일</th>
	        <td>
	          <input type="text" name="phone" value="${member.mem_register_dateTime}">
	        </td>
	      </tr>
	      <tr>
	        <th>최종로그인</th>
	        <td>
	          <input type="text" name="phone" value="${member.mem_lastLogin_dateTime}">
	        </td>
	      </tr>	     
	      <tr>
	        <th>창고지기</th>
	        <td>
	          <input type="text" name="phone" value="${member.mem_treasurer}">
	        </td>
	      </tr>	   
	      <tr>
	        <th>주소</th>
	        <td>
	          <input type="text" size="35" name="address" value="${member.mem_address}">
	        </td>
	      </tr>
	      </c:forEach>
		  <tr>
			<td colspan="2" align="center">
			<form method="POST" action="<%= root %>/MemberController?type=modify">
				<input type="button" value="수정완료" id="btnModify" />
				&nbsp;&nbsp;
				</form>
				<form method="POST" action="<%= root %>/MemberController?type=cancel">
				<input type="button" value="수정취소" id="btnModifyCancel" />
				</form>
				<form method="POST" action="<%= root %>/MemberController?type=delete">
				<input type="button" value="회원탈되" id="btnDelete" />
				</form>
			</td>
		</tr>
	   </table>
	  </form>
	</div>
</div>


