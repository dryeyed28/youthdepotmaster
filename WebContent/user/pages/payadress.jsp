<%@page import="java.util.ArrayList"%>
<%@page import="vo.Deposit"%>
<%@page import="vo.ROption"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
div.box {
	width: 70%;
	background: white;
	margin: 0 auto;
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

div.icon {
	height: 40px;
	line-height: 40px;
	text-align: center;
	background: yellow;
	margin: 0 auto;
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

div.textleft {
	width: 90%;
	margin: 1px auto;
	text-align: left;
}

div.textright {
	width: 90%;
	margin: 1px auto;
	text-align: right;
}

div.left {
	padding-left: 20px;
	width: 90%;
	margin: 1px auto;
	text-align: left;
	display: inline-block;
}

div.leftwight {
	padding-left: 5px;
	width: 90%;
	margin: 5px auto;
	text-align: left;
}

div.right {
	width: 90%;
	margin: 1px auto;
	text-align: right;
	display: inline;
} /* 
.travelo-box {
  background: #fff;
  padding: 20px;
  margin-bottom: 30px;
  height: 400px;
} */
input {
	width: 80%;
}
</style>


<%@include file="../template/header.jsp"%>
<section id="content" class="gray-area">
	<div class="container">
		<div class="row">
			<div id="main" class="col-sm-8 col-md-10">
				<form name="f"
					action="<%=request.getContextPath()%>/ProjectController?type=payaddressinsert"
					method="post">
					<div class="travelo-box">
						<div class="icon">리워드</div>
						<br>
						<%-- <%Deposit deposit = (Deposit)request.getAttribute("deposit"); %> --%>
						<%
							ArrayList<ROption> payaddress = (ArrayList) request.getAttribute("payaddress");
							int price = 0;
							int charge = payaddress.get(0).getrPJT_charge();
						%>
					<input type="hidden" name="rpjt_id" value="<%=payaddress.get(0).getrProject().getrPJT_id() %>">
						<div>
							<h1 style="padding-left: 10px; font-weight: bold;">주문 선택내용</h1>
							<hr>
							<%
								for (ROption ro : payaddress) {
									price += ro.getrPJT_price();
							%>
							<h3 style="padding-left: 10px">
								<input type="text" name="pjtname" value="<%=ro.getrPJT_name()%>"
									style="border: 0px;" readonly>
							</h3>

							<%
								}
							%>
							<hr>
							
							<div class="left">펀딩금액</div>
							<div class="right">
								<input type="text" name="price" value="<%=price%>원"
									style="border: 0px;" readonly> <br>
							</div>
							<br> <br>
							<div class="left">추가 후원금</div>
							<div class="right">
								<input type="text" name="addcharge" value="0원"
									style="border: 0px;" readonly>
							</div>
							<br> <br>
							<div class="left">배송비</div>
							<div class="right">
								<input type="text" name="charge" value="<%=charge%>원"
									style="border: 0px;" readonly>
							</div>
							<br> <br>
							<%
								int total = price + charge;
								String comma = String.format("%d", total);
							%>
							<div class="left">최종결제열정</div>
							<div class="right">
								<input type="text" name="comma" value="<%=comma%>"
									style="border: 0px;" readonly>
							</div>
						</div>
					</div>


					<div class=" col-md-4"
						style="background: white; height: 400px; padding: 20px;">
						<div class="icondiv">배송안내</div>
						<hr>
						<div class="text">내용</div>
						<div class="text">내용</div>
						<div class="text">내용</div>
						<div class="text">내용</div>
						<div class="text">내용</div>
						<div class="text">내용</div>
						<div class="text">내용</div>
						<div class="text">내용</div>
					</div>

					<div class=" col-md-4"
						style="background: white; height: 400px; padding: 20px;">
						<div class="icondiv">리워드 선택</div>
						<hr>
						<div class="leftwight">
							<h2>이름</h2>
						</div>
						<input type="text" name="name" placeholder="이름을 입력해주세요"
							required>
						<div class="leftwight">
							<h2>휴대폰번호</h2>
						</div>
						<input type="tel" name="tel" placeholder="-뺴고 입력해주세욘"
							required>
						<hr>
						<br> <br>

					</div>

					<div class=" col-md-4"
						style="background: white; height: 400px; padding: 20px;">
						<div class="icondiv">리워드 선택</div>
						<hr>
						<label><input type="radio" name="address"> 기존배송지 <input
							type="text" placeholder="기존배송지입력"> </label> <label><input
							type="radio" name="address"> 새로입력</label> <input type="text"
							placeholder="새로운 배송지 입력">
						<hr>
						<div class="leftwight">
							<h2>배송시 요청사항 (선택)</h2>
						</div>
						<textarea style="margin: 0px; width: 270px; height: 101px;"
							name="addressrequest" placeholder="배송에 관련된 내용만 적어주세요! "></textarea>
					</div>
					<div style="margin: 0 auto; width: 200px; height: 100px;">
						<button style="width: 200px; height: 50px; border-radius: 20px;">결제
							예약하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>


<%@include file="../template/footer.jsp"%>

