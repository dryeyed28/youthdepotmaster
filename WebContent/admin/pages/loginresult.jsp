<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>loginresult.jsp</title>
<style></style>
<script>

</script>
</head>
<body>
<c:set var="loginResult" value="${requestScope.loginResult}"/>
<c:if test="${loginResult == '1'}">
<div>로그인 성공</div>
</c:if>
<c:if test="${loginResult == '-1'}">
<div>로그인 실패. 아이디와 비밀번호가 맞지 않습니다.</div>
</c:if>
</body>
</html>