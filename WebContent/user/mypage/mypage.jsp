<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../template/header.jsp"%>
<section id="content" class="gray-area">
	<div class="container">
		<div class="row">
			<div id="main" class="col-sm-8 col-md-9">
				<div class="booking-section travelo-box">
					<form class="cruise-booking-form">
						<div class="person-information">
							<h2></h2>
							<div class="row">
								<div class="form-group col-sm-6 col-md-5">
									<label>아이디 &nbsp; My Id</label>
								</div>
								<div class=" form-group col-sm-6 col-md-5"></div>
							</div>
							<div class="row">
								<div class="form-group col-sm-6 col-md-5">
									<label>이름 &nbsp;NAME</label>
								</div>
								<!-- <div class=" form-group col-sm-6 col-md-5">
	                                     	<label></label>
	                                    </div>  -->
							</div>
							<div class="row">
								<div class="form-group col-sm-6 col-md-5">
									<label>나의 열정</label>
								</div>
								<div class=" form-group col-sm-6 col-md-5">
									<a href="링크 할 주소"><u>0p</u></a>
									<button type="submit" class="btn-small"
										style="font-size: 12px; margin-left: 30px;">열정 충전하기</button>
								</div>
							</div>
							<div class="row">
								<a class="icon-fundinglist"
									href="/web/wmypage/myfunding/fundinglist"><img
									src="funding.PNG">내 펀딩내역보기</a> <a class="icon-fundinglist"
									href="/web/wmypage/myfunding/fundinglist"><img
									src="funding.PNG" style="margin-left: 30px;">만든 프로젝트 보기</a> <a
									class="icon-fundinglist"
									href="/web/wmypage/myfunding/fundinglist"><img
									src="heart.PNG" style="margin-left: 30px"> 좋아한 프로젝트 보기</a>
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
									<label>휴대전화 번호 &nbsp;010-1111-2222 </label>
								</div>
								<div class="form-group col-sm-6 col-md-5">

									<a href="cruise-detailed.html" class="button"
										style="width: 100px; height: 30px;">변경하기</a>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-sm-6 col-md-5">
									<label>주소</label> <input type="text"
										class="input-text full-width" value="" placeholder="" readonly />
								</div>
								<div class="form-group col-sm-6 col-md-5">
									<label>&nbsp;</label> <a href="cruise-detailed.html"
										class="button" style="width: 100px; height: 30px;">변경하기</a>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-sm-6 col-md-5">
									<input type="text" class="input-text full-width" value=""
										placeholder="" readonly />
								</div>
							</div>
							<hr/ >
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
				<div class="booking-details travelo-box">
					<h4>
						<img src="alam.PNG"> 내 알림내역
					</h4>
					<article class="image-box cruise listing-style1">

						<div class="travel-title">
							<label>내 프로젝트 알림 <a href="링크 할 주소"><u>0개</u></a></label> <label>내
								활동 알림 <a href="링크 할 주소"><u>0개</u></a>
							</label> <label> <a href="링크 할 주소"><u>0개</u></a></label>

						</div>
						
					</article>

					
				</div>
			</div>
		</div>
	</div>
</section>
<%@include file="../template/footer.jsp"%>

