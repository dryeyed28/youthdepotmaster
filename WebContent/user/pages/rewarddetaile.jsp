<%@page import="vo.RStory"%>
<%@page import="vo.RPost"%>
<%@page import="vo.ROption"%>
<%@page import="java.util.ArrayList" %>
<%@page import="vo.RMeta"%>
<%@page import="vo.RKeeper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../template/header.jsp"%>
<section id="content">
	<div class="container">
		<div class="row">
			<div id="main" class="col-md-9">
				<div class="tab-container style1" id="travel-guide">
					<ul class="tabs full-width">
						<li class="active"><a href="#travel-guide-info"
							data-toggle="tab">스토리</a></li>
						<li class=""><a href="#travel-guide-sports" data-toggle="tab">댓글</a></li>
						<li><a href="#travel-guide-culture-history" data-toggle="tab">새소식</a></li>
					</ul>
					<%
					RMeta meta = (RMeta)request.getAttribute("meta");
					RStory story = (RStory)request.getAttribute("story");
					System.out.println(story.getrPJT_thumbnail());
					System.out.println(meta.getrPJT_image());
					%>
					<div class="tab-content">
						<div class="col-sm-12">
							<div class="testimonial style1 box">
								<h1><%=meta.getrPJT_title()%></h1>
								<h3><%=meta.getrPJT_subTitle()%></h3>
							</div>
						</div>
						<video poster="<%=story.getrPJT_thumbnail() %>" width="850"
							height="500" controls="controls">
							<source src="<%=story.getrPJT_url() %>" type="video/mp4" />
							<source src="Kalimba.webm" type="video/webm" />
						</video>
						<div class="tab-pane fade active in" id="travel-guide-info">
							<ul>
								<li><img src="<%=meta.getrPJT_image() %>" alt="" /></li>
								<li><img src="<%=meta.getrPJT_paper() %>" alt="" /></li>
								<li><img src="http://placehold.it/850x500" alt="" /></li>
								<li><img src="http://placehold.it/850x500" alt="" /></li>
								<li><img src="http://placehold.it/850x500" alt="" /></li>
								<li><img src="http://placehold.it/850x500" alt="" /></li>
								<li><img src="http://placehold.it/850x500" alt="" /></li>
								<li><img src="http://placehold.it/850x500" alt="" /></li>
								<li><img src="http://placehold.it/850x500" alt="" /></li>
								<li><img src="http://placehold.it/850x500" alt="" /></li>
								<li><img src="http://placehold.it/850x500" alt="" /></li>
							</ul>
							
						</div>
						<div class="tab-pane fade" id="travel-guide-sports">
							<table class="table table-condensed">
								<tr>
									<td><div class="form-inline" role="form">
										<div>
											<div class="form-group">
												<input type="text" id="commentParentName"
													name="commentParentName" class="form-control col-lg-2"
													data-rule-required="true" placeholder="이름" maxlength="10">
											</div>
											<div class="form-group">
												<input type="password" id="commentParentPassword"
													name="commentParentPassword" class="form-control col-lg-2"
													data-rule-required="true" placeholder="패스워드"
													maxlength="10">
											</div>
											<div class="form-group">
												<button type="button" id="commentParentSubmit"
													name="commentParentSubmit" class="btn btn-default">확인</button>
											</div>
										</div>
										<textarea id="commentParentText"
											class="form-control col-lg-12" style="width: 100%" rows="4"></textarea>
									</div></td>
								</tr>
							</table>
							<table class="table table-condensed">
								<thead>
									<tr>
										<td><span style='float: right'>
												<button type="button" id="list" class="btn btn-default">목록</button>
												<button type="button" id="modify" class="btn btn-default">수정</button>
												<button type="button" id="delete" class="btn btn-default">삭제</button>
												<button type="button" id="write" class="btn btn-default">글쓰기</button>
										</span></td>
									</tr>
								</thead>
							</table>
						</div>
						<div class="tab-pane fade" id="travel-guide-culture-history">
							<%ArrayList<RPost> rpost = (ArrayList)request.getAttribute("rpost");
							for(RPost rp : rpost){%>
							<table class="table table-condensed">
								<thead>
									<tr align="center">
										<th width="10%">제목</th>
										<th width="60%"><%=rp.getrPost_title()%></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>작성일</td>
										<td><%=rp.getrPost_dateTime()%></td>
									</tr>
									<tr>
										<td>글쓴이</td>
										<td><%=rp.getrPost_userID()%> </td>
									</tr>
									<tr>
										<td colspan="2">
											<p><%=rp.getrPost_content()%></p>

										</td>
									</tr>
								</tbody>
							</table>
							<%} %>
						</div>
					</div>
				</div>
			</div>
			<div class="sidebar col-md-3">
				<article class="detailed-logo">
					<div class="details">
						<div class="progress">
						<%int percent = (100 * meta.getrInvesting_amount()) / meta.getrTarget_amount();%>
							<div class="progress-bar" role="progressbar" style="width: <%=percent%>%"
								aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
							<p style="text-align:center"><%=percent%>%</p>
						</div>
						<h2 class="box-title">19일 남음</h2>
						<span class="price clearfix">
							<small class="pull-left">달성금액</small>
							<span class="pull-right"><%=meta.getrInvesting_amount()%>원</span>
							<br><small class="pull-left">목표금액</small>
							<span class="pull-right"><%=meta.getrTarget_amount()%>원</span>
						</span>
						<br>
						<%if(meta.getrProject().getrPJT_progress() == 1) { %>
						<a class="button yellow full-width uppercase btn-small"
						href="<%=request.getContextPath()%>/ProjectController?type=pay&rPJT_id=<%=meta.getrProject().getrPJT_id()%>">펀딩하기</a>
						<%} %>
						<hr>
					</div>
				</article>
				<%RKeeper keeper = (RKeeper)request.getAttribute("keeper"); %>
				<div class="travelo-box contact-box">
					<h4>창고지기 정보</h4>
					<div class="author clearfix">
						<a href="#"><img src="<%=keeper.getR_profile() %>" alt=""
							width="74" height="74" /></a>
						<h5 class="name">
							<%=keeper.getR_name()%>&nbsp;<small>guest</small>
						</h5>
					</div>
					<br> 
					<address class="contact-details">
						<span class="contact-phone"><i class="soap-icon-phone"></i>	<%=keeper.getR_tel()%> </span>
						<br><p><%=keeper.getR_email()%></p>
						<p><%=keeper.getR_url()%></p>
					</address>
				</div>
				<div class="travelo-box book-with-us-box">
					<h4>펀딩 종류</h4>
					<ul>
					<%ArrayList<ROption> option = (ArrayList)request.getAttribute("option");
					for(ROption o : option) {%>
						<li><i class="soap-icon-savings circle"></i>
							<h5 class="title">
								<%=o.getrPJT_name()%>
							</h5>
							<p><%=o.getrPJT_price()%> 원</p>
							<p><%=o.getrPJT_detail()%></p>
						</li>
					<%} %>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>
<%@include file="../template/footer.jsp"%>
<script>
	$(function() {

		//제일 하단에 있는 depth1의 댓글을 다는 이벤트
		$("div.form-group>button")
				.click(
						function(event) {
							var pName = $("input[name=commentParentName]");
							var pPassword = $("#commentParentPassword");//패스워드를 노출 시켰는데 저장하고 나서 저장한 날짜를 보여줄 예정
							var pText = $("#commentParentText");

							var commentParentText = '<tr id="r1" name="commentParentCode">'
									+ '<td colspan=2>'
									+ '<strong>'
									+ '</strong> '
									+ pPassword.val()
									+ ' <a style="cursor:pointer;" name="pAdd">답글</a> | <a style="cursor:pointer;" name="pDel">삭제</a><p>'
									+ pText.val().replace(/\n/g, "<br>")
									+ '</p>' + '</td>' + '</tr>';

							//테이블의 tr자식이 있으면 tr 뒤에 붙인다. 없으면 테이블 안에 tr을 붙인다.
							if ($('#commentTable').contents().size() == 0) {
								$('#commentTable').append(commentParentText);
							} else {
								$('#commentTable tr:last').after(
										commentParentText);
							}

							$("input[name=commentParentName]").val("");
							$("#commentParentPassword").val("");
							$("#commentParentText").val("");

						});

		//댓글의 댓글을 다는 이벤트
		$(document)
				.on(
						"click",
						"div.form-group>button",
						function() {
							var cName = $("#commentChildName");
							var cPassword = $("#commentChildPassword");
							var cText = $("#commentChildText");

							var commentChildText = '<tr name="commentChildCode">'
									+ '<td style="width:1%"><span class="glyphicon glyphicon-arrow-right"></span></td>'
									+ '<td style="width:99%">'
									+ '<strong>'
									+ cName.val()
									+ '</strong> '
									+ cPassword.val()
									+ ' <a style="cursor:pointer;" name="cAdd">답글</a> | <a style="cursor:pointer;" name="cDel">삭제</a>'
									+ '<p>'
									+ cText.val().replace(/\n/g, "<br>")
									+ '</p>' + '</td>' + '</tr>';

							//앞의 tr노드 찾기
							var prevTr = $(this).parent().parent().parent()
									.parent().prev();
							//댓글 적는 에디터 삭제
							$("#commentEditor").remove();//여기에서 삭제를 해줘야 에디터tr을 안 찾는다.

							//댓글을 타고 올라가며 부모 tr을 찾음
							while (prevTr.attr("name") != "commentParentCode") {
								prevTr = prevTr.prev();
							}
							//while를 타는지 체크
							var check = false;
							//다음 노드가 댓글(depth1)의 댓글인지 찾기위해 next
							var nextTr = prevTr.next();
							//뒤에 댓글(depth1)의 댓글(depth2_1)이 없다면 바로 붙인다.
							if (nextTr.attr("name") != "commentChildCode") {
								prevTr.after(commentChildText);
							} else {
								//댓글(depth1)의 댓글(depth2_n)이 있는경우 마지막까지 찾는다.
								while (nextTr.attr("name") == "commentChildCode") {
									nextTr = nextTr.next();
									check = true;
								}
							}

							if (check) {//댓글(depth1)의 댓글(depth2_n)이 있다면 그 댓글(depth2_n) 뒤에 댓글(depth2_n+1) 추가
								nextTr = nextTr.prev();//while문에서 검색하느라 next로 넘거갔던거 다시 앞으로 돌려줌
								nextTr.after(commentChildText);
							}

						});

		//답글링크를 눌렀을때 에디터 창을 뿌려주는 이벤트, 삭제링크를 눌렀을때 해당 댓글을 삭제하는 이벤트
		$(document)
				.on(
						"click",
						"table#commentTable a",
						function() {//동적으로 버튼이 생긴 경우 처리 방식

							if ($(this).attr("name") == "pDel") {
								if (confirm("답글을 삭제 하시면 밑에 답글도 모두 삭제 됩니다. 정말 삭제하시겠습니까?") == true) { //확인

									var delComment = $(this).parent().parent();
									var nextTr = delComment.next();
									var delTr;
									//댓글(depth1)의 댓글(depth2_1)이 있는지 검사하여 삭제
									while (nextTr.attr("name") == "commentCode") {
										nextTr = nextTr.next();
										delTr = nextTr.prev();//삭제하고 넘기면 삭제되서 없기 때문에 다음값을 가져오기 어려워 다시 앞으로 돌려서 찾은 다음 삭제
										delTr.remove();
									}

									delComment.remove();

								} else { //취소
									return;
								}
							} else if ($(this).attr("name") == "cDel") {
								if (confirm("정말 삭제하시겠습니까??") == true) { //확인
									$(this).parent().parent().remove();
								} else { //취소
									return;
								}
							} else {
								//자기 부모의 tr을 알아낸다.
								var parentElement = $(this).parent().parent();
								//댓글달기 창을 없앤다.
								$("#commentEditor").remove();
								//부모의 하단에 댓글달기 창을 삽입
								var commentEditor = '<tr id="commentEditor">'
										+ '<td style="width:1%"> </td>'
										+ '<td>'
										+ '<span class="form-inline" role="form">'
										+ '<p>'
										+ '<div class="form-group">'
										+ '<input type="text" id="commentChildName" name="commentChildName" class="form-control col-lg-2" data-rule-required="true" placeholder="이름" maxlength="10">'
										+ '</div>'
										+ '<div class="form-group">'
										+ ' <input type="password" id="commentChildPassword" name="commentChildPassword" class="form-control col-lg-2" data-rule-required="true" placeholder="패스워드" maxlength="10">'
										+ '</div>'
										+ '<div class="form-group">'
										+ '<button type="button" id="commentChildSubmit" class="btn btn-default">확인</button>'
										+ '</div>'
										+ '</p>'
										+ '<textarea id="commentChildText" name="commentChildText" class="form-control" style="width:98%" rows="4"></textarea>'
										+ '</span>' + '</td>' + '</tr>';

								parentElement.after(commentEditor);
							}
						});
	});
</script>

