<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String root = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<title>login.jsp</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>login.jsp</title>

    <!-- Bootstrap Core CSS -->
   <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!--     Custom CSS -->
   <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

<!--     Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script>

var checkbox = document.querySelector("input[type=checkbox]");
console.log("checkbox 값 : " + checkbox);
var idValue = document.getElementById("id").value;
console.log("idValue 값 : " + idValue);
var storageValue = localStorage.getItem("id");
console.log("storageValue 값 :" + storageValue);

if (storageValue != null) {
	//스토리지아이디에 값이 있는 경우
    document.getElementById("id").value = storageValue;
	checkbox.checked = true;
} else {
	checkbox.checked = false;
}

document.querySelector("input[type=checkbox]").onclick = function() {myFunction()};

function myFunction() {
	if (checkbox.checked) {
		localStorage.setItem("id", idValue);
	} else
		localStorage.removeItem("id");
	
}


// document.querySelector("form").submit(function(){
// 	if (check.checked = true) {
// 		localStorage.setItem("id", idValue);
// 	} else {
// 		localStorage.removeItem("id");
// 	}
// });


</script>
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">로그인</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" name="f" method="post" action="<%= root %>/AdminController?type=login">
                           <div class="form-group">
                               <input class="form-control" placeholder="ID" required name="admin_id" id="id" type="text" autofocus>
                           </div>
                           <div class="form-group">
                               <input class="form-control" placeholder="Password" required name="admin_pwd" id="pwd" type="password">
                           </div>
                           <div class="checkbox">
                               <label>
                                   <input type="checkbox" >ID 저장
                               </label>
                           </div>
                           <!-- Change this to a button or input when using this as a form -->
                           <button type="submit" class="btn-lg btn-success btn-block">로그인</button>
                   		</form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

</body>
</html>
