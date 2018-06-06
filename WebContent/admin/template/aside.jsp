<%@page import="oracle.net.aso.r"%>
<%@page import="vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	$(function() {
		$('#boardlist').one('click', function () {
			 var $board = $('input[type="hidden"]').val();
			$.ajax({
				method : 'get',
				url : "<%=request.getContextPath()%>/BoardController",
				 data: 'type='+$board,
				success : function(data) {
					$('#board').append(data);
				}
			});
			return false;
		});
	});
</script>
<%
	String root = request.getContextPath();
%>
<input type="hidden" value="adminboardlist">
<div id="wrapper">
	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<li><a href="<%=root%>/admin/pages/index.jsp"><i
						class="fa fa-dashboard fa-fw"></i> home</a></li>
				<li class=member><a
					href="<%=root%>/MemberController?type=selectAll"><i
						class="fa fa-user fa-fw"></i>회원관리</a></li>
				<li><a href="<%=root%>/ProjectController?type=projectrequest"><i
						class="fa fa-table fa-fw"></i> 프로젝트 신청관리</a></li>
				<li><a href="#"><i class="fa fa-heart fa-fw"></i> 커뮤니티 관리<span
						class="fa arrow"></span></a> <!-- <a href="tables.html"><i class="fa fa-table fa-fw"></i> 커뮤니티 관리</a> -->
					<ul class="nav nav-second-level">
						<li><a
							href="<%=root%>/BoardController?type=boardmenu">게시판 관리</a></li>
						<li><a href="#" id="boardlist"> 게시 관리<span class="fa arrow"></span></a>
							<ul class="nav nav-third-level" id="board">
							</ul></li>
					</ul></li>
				<li><a href="#"><i class="fa fa-credit-card fa-fw"></i>
						결제현황 관리<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="<%=root%>/TotalPayController?type=totalpay">전체결제
								관리</a></li>
						<li><a href="<%=root%>/TotalPayController?type=yeoljeong">열정결제
								관리</a></li>
						<li><a href="<%=root%>/TotalPayController?type=refund">열정환급
								관리</a></li>
						<li><a href="<%=root%>/TotalPayController?type=profit">이익현황
								관리</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- /.sidebar-collapse -->
	</div>
	<!-- /.navbar-static-side -->
</div>
<!-- /#wrapper -->
