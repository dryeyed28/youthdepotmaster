<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@include file="../template/top.jsp" %>
<%@include file="../template/aside.jsp" %> --%>
<link href="../vendor/morrisjs/morris.css" rel="stylesheet">
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index2.jsp(회원관리테이블)</title>
<style>
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
	$("li").click(function(){
		var classValue = $(this).attr("class");
		$("section").empty();
		switch(classValue) {
		
		case "member":
			$.ajax({
				method: "POST",
				url: "member.do",
				success: function(data) {
					$("section").html(data);
				}
			});
			break;
		}
	});
	
});
</script>
</head>
<body>
<header>
 <nav>
  <ul>
   <li class="member"><a href="#">회원</a></li>
  </ul>
 </nav>
</header>
<section>

</section>
</body>
</html>