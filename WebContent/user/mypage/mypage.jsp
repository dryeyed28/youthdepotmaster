<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%@page import="vo.Member"%>
<%@include file="../template/header.jsp"%>
<script>

$(function(){
	
	$("#btnCharge").click(function(){
		window.open('user/mypage/chargePopup.html', 'charge', 'width=600px height=350px, top=100px, left=300px');

	});
});

</script>
<section id="content" class="gray-area">
	<div class="container">
		<div class="row">
			<div id="main" class="col-sm-8 col-md-9">
				<div class="booking-section travelo-box">
					<form class="cruise-booking-form"name="f" action="<%=request.getContextPath()%>/MemberController?type=mypage" method="post">
						<div class="person-information">
							<div class="row">
							<% Member m = (Member)request.getAttribute("member");%>
								<div class="form-group col-sm-6 col-md-5">
									<label>아이디 </label>
								</div>
								<div class=" form-group col-sm-6 col-md-5">
								<h5><%=m.getMem_userId()%></h5>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-sm-6 col-md-5">
									<label>이름 </label>
								</div>
								<div class=" form-group col-sm-6 col-md-5">
								<h5><%=m.getMem_userName()%></h5>
								</div>
							</div>


							<div class="row">
								<div class="form-group col-sm-6 col-md-5">
									<label>나의 열정</label>
								</div>
								<div class=" form-group col-sm-6 col-md-5">
									<a href="<%=request.getContextPath()%>/user/mypage/charge.jsp"><u><%=m.getMem_passion()%></u></a>
									<button type="button" class="btn-small" id= "btnCharge" style="font-size: 12px; margin-left: 30px;">열정 충전하기</button>
								</div>
							</div>
							<div class="row">
								<a class="icon-fundinglist" href="<%=request.getContextPath()%>/user/mypage/fundingmade.jsp">
									<img src="funding.PNG">내 펀딩내역보기</a>
								<a class="icon-fundinglist" href="<%=request.getContextPath()%>/user/mypage/made.jsp">
									<img src="funding.PNG" style="margin-left: 30px;">만든 프로젝트 보기</a> 
							</div>
						</div>
						<div class="row">
							<div class="form-group col-sm-6 col-md-5">
								<label>&nbsp;</label>

							</div>
							<div class="form-group col-sm-6 col-md-5">
								<label>&nbsp;</label>
							</div>

							<div class="row">
								<div class="form-group col-sm-6 col-md-5">
									<label>휴대전화 번호 </label>
									<h5><%=m.getMem_phone()%></h5>
								</div>
								<div class="form-group col-sm-6 col-md-5">
									<button type="button" class="btn-small" id= "btn" style="font-size: 12px; margin-left: 30px;">변경하기</button>
								</div>
							</div>

							<div class="row">
								<div class="form-group col-sm-6 col-md-5">
									<label>주소</label>
									<h5><%=m.getMem_address()%></h5> 
									
								</div>
								<div class="form-group col-sm-6 col-md-5">
									<label>&nbsp;</label> <button type="button" class="btn-small" id= "btn" style="font-size: 12px; margin-left: 30px;">변경하기</button>
										
								</div>
							</div>

							<div class="row">
								<div class="form-group col-sm-6 col-md-5">
									<input type="text" class="input-text full-width" value="" placeholder="" readonly />
								</div>

							</div>


							<hr>

						</div>
						<hr>
						<div class="form-group row">
							<div class="form-group col-sm-6 col-md-5">
								<label>내 정보 변경내역</label>
							</div>
							<div class="form-group col-sm-6 col-md-5">
								<button type="submit" class="btn-small" style="font-size: 12px;">저장하기</button>
							</div>
							<div class="form-group col-sm-6 col-md-5">
								<label>더이상 청춘창고를 이용하지 않는다면</label>
							</div>
							<div class="form-group col-sm-6 col-md-5">
								<button type="submit" class="btn-small" style="font-size: 12px;">탈퇴하기</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="sidebar col-sm-4 col-md-3">
				

			
			</div>
		</div>
	</div>
</section>
<%@include file="../template/footer.jsp"%>

