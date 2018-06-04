<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String root = request.getContextPath();
%>
<div id="wrapper">
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li>
                        <a href="<%=root%>/admin/pages/index.jsp"><i class="fa fa-dashboard fa-fw"></i> home</a>
                    </li>
                    <li class=member>
                        <a href="#"><i class="fa fa-user fa-fw"></i>회원관리</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-table fa-fw"></i> 프로젝트 관리<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=root%>/projectMgr/projectrequest.jsp">프로젝트 신청관리</a>
                            <li>
                                <a href="<%=root%>/projectMgr/projectNews.jsp">프로젝트 새소식관리</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-heart fa-fw"></i> 커뮤니티 관리<span class="fa arrow"></span></a>
                        <!-- <a href="tables.html"><i class="fa fa-table fa-fw"></i> 커뮤니티 관리</a> -->
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=root%>/BoardController?type=boardmenu">게시판 관리</a>
                            </li>
                            <li>
                                <a href="#"> 게시 관리<span class="fa arrow"></span></a>
                                  <ul class="nav nav-third-level">
                             	  <li>
                                 	<a href="<%=root%>/admin/boardMng/board1.jsp">공지사항</a>
                             	  </li>
                             	  <li>
                                 	<a href="<%=root%>/admin/boardMng/board2.jsp">FAQ</a>
                             	  </li>
                            	  </ul>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-credit-card fa-fw"></i> 결제현황 관리<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=root%>/admin/payMng/totalpay.jsp">전체결제 관리</a>
                            </li>
                            <li>
                                <a href="<%=root%>/admin/payMng/yeoljeongpay.jsp">열정결제 관리</a>
                            </li>
                            <li>
                                <a href="<%=root%>/admin/payMng/profit.jsp">이익현황 관리</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="<%=root%>/admin/pages/morris.jsp"><i class="fa fa-bar-chart-o fa-fw"></i>통계</a>
                    </li>
                </ul>
            </div>
            <!-- /.sidebar-collapse -->
        </div>
        <!-- /.navbar-static-side -->
</div>
<!-- /#wrapper -->
