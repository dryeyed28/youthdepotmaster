<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login2.jsp</title>
<style>
</style>
</head>
<body>
<label>아이디<input type="text" value=""></label><br>
<labe>비밀번호<input type="text" value=""></labe><br>
<input type="checkbox" id="checkBox" checked="checked">ID 저장<br>
<button type="submit">로그인</button>
<button type="button">로그아웃</button>
<button type="button">홈</button>
<script>
var checkbox = document.getElementById("checkBox");
console.log("checkbox 값 : " + checkbox);
var idValue = document.getElementById("id");
console.log("idValue 값 : " + idValue);
var storageValue = localStorage.getItem("id");
console.log("storageValue 값 :" + storageValue);

if (storageValue != null) {
	//스토리지아이디에 값이 있는 경우
    document.getElementById("id").value = storageValue;
    checkbox.checked = true;
} else {
	if (idValue == null) {
		checkbox.checked = false;
	}
}

document.querySelector("input[type=checkbox]").onclick = function() {myFunction()};

function myFunction() {
	if (checkbox.checked) {
		localStorage.setItem("id", idValue);
	} else
		localStorage.removeItem("id");
	
};
</script>
</body>
</html>