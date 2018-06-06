<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
select{
	border:solid 1px;
}
</style>
<c:set var="pagebean" value="${requestScope.pagebean}"/>
<c:set var="list" value="${pagebean.list}"/>
<c:forEach var="member" items="${list}"/>
<div class="col-lg-12">
  <h2 class="page-header">회원수정</h2>
</div>

<div class="col-lg-12">
	<div class="container-fluid" style="padding-top: 50px;">
	  <form class="boardSubmit">
	    <table class="table table-bordered">
	      <tr>
	        <th>아이디</th>
	        <td>
	          <input type="text" name="id" readonly="readonly" value="${member.mem_id}">
	        </td>
	      </tr>
	      <tr>
	        <th>패스워드</th>
	        <td>
	          <input type="password" name="pass" value="${member.mem_password} }">
	        </td>
	      </tr>
	      <tr>
	        <th>이름</th>
	        <td>
	          <input type="text" name="name" value="${member.mem_userName}">
	        </td>
	      </tr>
	      <tr>
	        <th>전화번호</th>
	        <td>
	          <input type="text" name="phone" value="jsp_expression">
	        </td>
	      </tr>
	      <tr>
	        <th>이메일</th>
	        <td>
	          <input type="text" name="mail" value="jsp_expression">
	        </td>
	      </tr>
	      <tr>
	        <th>우편번호</th>
	        <td>
	          <input type="text" name="zipcode" value="jsp_expression"> 
			  <input type="button" value="우편번호찾기" id="btnZip" >
	        </td>
	      </tr>
	      <tr>
	        <th>주소</th>
	        <td>
	          <input type="text" size="35" name="address" value="jsp_expression">
	        </td>
	      </tr>
	      <tr>
	        <th>창고지기</th>
	        <td>
	          <select>
	          	<option id="1">None</option>
	          	<option id="2">리워드</option>
	          	<option id="3">투자</option>
	          </select>
	        </td>
	      </tr>
		  <tr>
			<td colspan="2" align="center">
				<input type="button" value="수정완료" id="btnModify" />
				&nbsp;&nbsp;
				<input type="button" value="수정취소" id="btnModifyCancel" />
				<input type="button" value="회원탈되" id="btnDelete" />
			</td>
		</tr>
	   </table>
	  </form>
	</div>
</div>


