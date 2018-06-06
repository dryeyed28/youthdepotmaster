<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../template/top.jsp"%>
<%@include file="../template/aside.jsp"%> 
<%-- <jsp:include page="../template/top.jsp"/> --%>
<!-- Morris Charts CSS -->
<link href="../vendor/morrisjs/morris.css" rel="stylesheet">

<!-- Morris Charts JavaScript -->
<script src="../vendor/raphael/raphael.min.js"></script>
<script src="../vendor/morrisjs/morris.min.js"></script>
<script src="../data/morris-data.js"></script>
<%-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>
<script>
</script>
<section>
<div id="page-wrapper">
     <div class="row">
         <div class="col-lg-12">
             <h1 class="page-header">Home</h1>
         </div>
         <!-- /.col-lg-12 -->
     </div>
     <!-- /.row -->
     <div class="row">
         <div class="col-lg-3 col-md-6">
             <div class="panel panel-primary">
                 <div class="panel-heading">
                     <div class="row">
                         <div class="col-xs-3">
                             <i class="fa fa-user fa-5x"></i>
                         </div><div class="col-xs-9 text-right"><div style="font-size:23px">회원 관리</div>
                         </div>
                        
                     </div>
                 </div>
                 <a href="<%=root%>/MemberController?type=selectAll">
                     <div class="panel-footer">
                         <span class="pull-left">상세보기</span>
                         <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                         <div class="clearfix"></div>
                     </div>
                 </a>
             </div>
         </div>
         <div class="col-lg-3 col-md-6">
             <div class="panel panel-green">
                 <div class="panel-heading">
                     <div class="row">
                         <div class="col-xs-3">
                             <i class="fa fa-tasks fa-5x"></i>
                         </div>
                         <div class="col-xs-9 text-right">
                             <div style="font-size:25px">프로젝트 신청관리</div>
                         </div>
                     </div>
                 </div>
                 <a href="<%=root%>/ProjectController?type=projectrequest">
                     <div class="panel-footer">
                         <span class="pull-left">상세보기</span>
                         <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                         <div class="clearfix"></div>
                     </div>
                 </a>
             </div>
         </div>
         <div class="col-lg-3 col-md-6">
             <div class="panel panel-yellow">
                 <div class="panel-heading">
                     <div class="row">
                         <div class="col-xs-3">
                             <i class="fa fa-heart fa-5x"></i>
                         </div>
                         <div class="col-xs-9 text-right">
                             <div style="font-size:25px">커뮤니티 관리</div>
                         </div>
                     </div>
                 </div>
                 <a href="<%=root%>/BoardController?type=boardmenu">
                     <div class="panel-footer">
                         <span class="pull-left">상세보기</span>
                         <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                         <div class="clearfix"></div>
                     </div>
                 </a>
             </div>
         </div>
         <div class="col-lg-3 col-md-6">
             <div class="panel panel-red">
                 <div class="panel-heading">
                     <div class="row">
                         <div class="col-xs-3">
                             <i class="fa fa-credit-card fa-5x"></i>
                         </div>
                         <div class="col-xs-9 text-right">
                             <div style="font-size:25px">결제현황 관리</div>
                         </div>
                     </div>
                 </div>
                 <a href="<%=root%>/TotalPayController?type=totalpay">
                     <div class="panel-footer">
                         <span class="pull-left">상세보기</span>
                         <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                         <div class="clearfix"></div>
                     </div>
                 </a>
             </div>
         </div>
     </div>
 </section>