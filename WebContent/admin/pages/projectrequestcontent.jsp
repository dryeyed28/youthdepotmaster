<%@page import="projcet.ProjectContentDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../template/top.jsp"%>
<%@include file="../template/aside.jsp"%>

<script>
	function goBack() {
		window.history.back();
	}
</script>

<div id="page-wrapper">
     <div class="row">
         <div class="col-lg-12">
             <h1 class="page-header">프로젝트 신청 내용</h1>
         </div>
         <!-- /.col-lg-12 -->
     </div>
     <!-- /.row -->
     <%ProjectContentDto pcd = (ProjectContentDto)request.getAttribute("content"); %>
     <div class="row">
       <div class="col-lg-12">
    	  <div class="panel panel-default">
             <div class="panel-body">
               	<div class="form-group">
                    <label>프로젝트 번호 : <%=pcd.getrPjt_id() %></label>
                    <div class="btn-group">
                    	<select id="selectCategroy">
						  <option>승인</option>
						  <option>검토중</option>
						  <option>반려</option>
				 		</select>
					</div>
                </div>
                <div class="form-group">
                    <label>프로젝트 제목 : <%=pcd.getPjt_title() %></label>
                </div>
                <div class="form-group">
                    <label>목표 금액</label>
                    <p class="form-control-static"><%=pcd.getTarget_amount() %>원</p>
                </div>
                <div class="form-group">
                    <label>카테고리</label>
                    <p class="form-control-static"><%=pcd.getPjt_category() %></p>
                </div>
                <div class="form-group">
                    <label>핵심메시지</label>
                    <textarea class="form-control" rows="3"><%=pcd.getPjt_subtitle() %></textarea>
                </div>
                <div class="form-group">
                    <label>프로젝트 스토리</label>
                    <textarea class="form-control" rows="10"><%=pcd.getPjt_story() %></textarea>
                </div>
                <div class="form-group">
                    <label>프로젝트 대표 이미지</label><br>
                    <a href="<%=pcd.getPjt_thumnail()%>" target="_blank"><%=pcd.getPjt_thumnail()%></a>
                </div>
                <div class="form-group">
                    <label>프로젝트 파일</label><br>
                    <a href="<%=pcd.getPjt_paper() %>" target="_blank"><%=pcd.getPjt_paper()%></a>
                </div>
                <div class="form-group">
                    <label>프로젝트 영상</label><br>
                    <a href="<%=pcd.getPjt_url() %>" target="_blank"><%=pcd.getPjt_url()%></a>
                </div>
                
            	<button class="btn btn-primary" onclick="goBack()">목록</button>&nbsp;
   				<button class="btn btn-primary">승인</button>&nbsp;
				<button class="btn btn-primary">삭제</button>
	         </div>
	         <!-- /.panel -->
         </div>
         <!-- /.col-lg-12 -->
     </div>
     <!-- /.row -->
 </div>
 <!-- /#page-wrapper -->