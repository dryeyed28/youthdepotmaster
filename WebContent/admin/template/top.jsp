<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.Admin" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String root1 = request.getContextPath();
%>
<c:set var="admin" value="${sessionScope.admin}" scope="session"/>
<head>

<%--<% Admin adim = (Admin) session.getAttribute("admin"); --%>
 
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <title>YouthDepot</title>

    <!-- Bootstrap Core CSS -->
    <link href="<%=root1%>/admin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<%=root1%>/admin/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=root1%>/admin/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=root1%>/admin/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <!-- DataTables CSS -->
    <link href="<%=root1%>/admin/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="<%=root1%>/admin/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

</head>

<body>

    <div id="wrapper">
    	<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<%=root1%>/admin/pages/index.jsp">청춘창고</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
           <c:if test="${!empty admin}">
            	<li>${admin.admin_name}님</li>
            </c:if>
               <li><a href="<%=root1%>/admin/pages/login.jsp"><i class="fa fa-sign-out fa-fw"></i> 로그아웃</a>
               </li>
            </ul>
            <!-- /.navbar-top-links -->  
         </nav>    
    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="<%=root1%>/admin/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<%=root1%>/admin/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="<%=root1%>/admin/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="<%=root1%>/admin/dist/js/sb-admin-2.js"></script>
    
    <!-- DataTables JavaScript -->
    <script src="<%=root1%>/admin/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="<%=root1%>/admin/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="<%=root1%>/admin/vendor/datatables-responsive/dataTables.responsive.js"></script>
  
</body>
