<%@page import="vo.ROption"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
div.paybox {
	width: 70%;
	background: white;
	margin: 0 auto;
	border-radius: 20px;
	border-style: solid;
}

div.paybox>h1, p {
	padding-left: 100px;
}

div.paybox>input {
	padding-left: 100px;
}

div input {
	text-align: left;
}

div.icondiv {
	height: 25px;
	line-height: 25px;
	border-radius: 20px;
	width: 100px;
	text-align: center;
	background: black;
	color: white;
	margin: 0 auto;
}

div.text {
	width: 70%;
	margin: 10px auto;
}

</style>
<%@include file="../template/header.jsp"%>
<section id="content" class="gray-area">
	<div class="container">
		<form name="f"
			action="<%=request.getContextPath()%>/ProjectController?type=payaddress"
			method="post">
			<div class="row">
				<div id="main" class="col-sm-8 col-md-9">

					<div class="travelo-box">
						<div class="icondiv">리워드 선택</div>
						<br>
						<div class="text">펀딩해주시는 금액에 따라 감사의 의미로 리워드를 제공해드립니다</div>
						<%
							ArrayList<ROption> option = (ArrayList) request.getAttribute("option");
							for (ROption o : option) {
						%>
						<div class="paybox">
							<input type="checkbox" name='pqy1' value="<%=o.getReward_id()%>" >
							<h1><%=o.getrPJT_price()%>원 펀딩합니다.
							</h1>
							<p>
								<%=o.getrPJT_name()%>
								<br>
								<%=o.getrPJT_detail()%>
								<br>
							</p>
						</div>
						<%
							}
						%>
						<input type="hidden" name="rPJT_id"
							value="<%=option.get(0).getrProject().getrPJT_id()%>"> <br>
					</div>

					<div class="travelo-box">
						<div class="icondiv">리워드 선택</div>
						<div class="text">후원금을 더하여 후원할수 있습니다 추가로 후원하시겠습니까?</div>
						<div class="text">
							<input type="number" value="">원을 추가로 후원합니다.
						</div>
						<hr>
						<div class="text">집에서도,밖에서도 자유로운 당신만의 라이프웨어에 0 원을 펀딩합니다.</div>

					</div>
					<div
						style="margin: 0 auto; width: 200px; height: 100px; text-align: center;">
						<button style="width: 120px; height: 30px;">다음 단계로</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</section>
<%@include file="../template/footer.jsp"%>