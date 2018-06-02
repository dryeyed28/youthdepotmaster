<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<%@include file="../template/header.jsp"%>

<script>


$(function(){
	
	$('#idchkbtn').click(function(){
		console.log("성공");
		$.ajax({ 
			method:'get',
			URl: '<%=request.getContextPath()%>/MemberController?type=idcheck',
			data: {'id':$('input[name=id]').val()},
				success : function(data) {
					console.log(data);
					if (data.trim() == 0) {
						alert('이미 사용중인 ID입니다');
					} else {
						alert('사용가능한 ID입니다.');
					}

				}
			});
		});

		$('#btnsignup').click(function(){
		//	if($('#chkConfirm').is(":checked")){	
		if($('#chkConfirm').prop("checked")){	
			alert('가입을 진행합니다');
				
			} else {
				alert('약관에 동의해 주세요');
				return false;
			}
		});

	

		$("#telconfirmbtn").click(function() {
			
			var count = $("#tel").val().length;
			console.log(count);
			//alert("tel_val : "  + $("#tel").val());
			//alert("count : "  + $("#tel").val().length);
			if (count != "11") {
				alert("번호를 다시확인해 주세요.");
			} else {
				alert("인증번호를 발송하였습니다");
			}
			return false;
		});
		
		
		$("#confirmnum").click(function(){
			
			var count1 = $("#telconfirmtxt").val().length;
			console.log(count1);
			//alert("tel_val : "  + $("#tel").val());
			//alert("count : "  + $("#tel").val().length);
			if (count1 != "6") {
				alert("인증번호를 다시확인해 주세요.");
			} else {
				alert("인증되었습니다.");
			}
			return false;
		});
		
		
		
	 
	  $("#user_pass").keyup(function(){
	   $('#passcorfim').text('');
	  }); //#user_pass.keyup

	  $("#chpass").keyup(function(){
	   if($('#user_pass').val()!=$('#chpass').val()){
	    $('#passcorfim').text('');
	    $('#passcorfim').html("비밀번호가 일치하지 않습니다");
	   }else{
	    $('#passcorfim').html("비밀번호가 일치합니다");
	   }
	  }); //#chpass.keyup
	  
	  

		  $("#zipSearchbtn").click(function(){
			  
				window.open('findZip.html', 'winzip', 'width=200px height=300');
			});
	  
	  });
</script>
<section id="content" class="gray-area">
	<div class="container">
		<div class="row">
			<div id="main" class="col-sm-8 col-md-9">
				<div class="booking-section travelo-box">
					<form class="cruise-booking-form">
						<div class="person-information">

							<div class="row">
								<div class="form-group col-sm-6 col-md-5">
									<label>이름</label> <input type="text"
										class="input-text full-width" value="" placeholder="" />
								</div>

							</div>
							<div class="row">
								<div class="form-group col-sm-6 col-md-5">
									<label>아이디</label> <input type="text" name="id"
										class="input-text full-width" required value="" />
								</div>
								<div class=" form-group col-sm-6 col-md-5">
									<label> &nbsp; </label>
									<button type="button" class="button" id="idchkbtn"
										style="width: 150px; height: 30px; font-size: 12px;">아이디
										중복확인</button>
								</div>
							</div>

							<div class="row">
								<div class="form-group col-sm-6 col-md-5">
									<label>별명</label> 
									<input type="text"	class="input-text full-width" required value="" placeholder="" />
								</div>
								<div class=" form-group col-sm-6 col-md-5">
									<label> &nbsp; </label> 
									<a href="cruise-detailed.html" class="button" style="width: 150px; height: 30px; font-size: 12px;">별명 중복확인</a>
								</div>
							</div>

							<div class="row">
								<div class=" form-group col-sm-6 col-md-5">
									<label>비밀번호</label> <input type="password" required id="user_pass" class="input-text full-width" value="" placeholder="" />
								</div>
							</div>
							<div class="row">
								<div class="form-group col-sm-6 col-md-5">
									<label>비밀번호 확인</label> <input type="password" id="chpass"
										class="input-text full-width" value="" placeholder="" />
								</div>
								<div class="form-group col-sm-6 col-md-5">
									<!-- <label>비밀번호 일치확인</label> -->
									<font id="passcorfim"
										class="input-text full-width"  ></font>
										
										
								</div>
							</div>

							<div class="form-group col-sm-6 col-md-5">
								<div class="row">
									<div class="col-xs-6">
										<label>생년월일</label>
										<div class="datepicker-wrap">
											<input type="text" class="input-text full-width"
												placeholder="일/월/년&nbsp" data-min-date="01/01/1900">
										</div>
									</div>
									<div class="col-xs-6">
										<label>성별</label>
										<div>
											<label class="radio radio-inline radio-square"> <input
												type="radio" name="radioAnswer" value="1">남자
											</label> <label class="radio radio-inline radio-square"> <input
												type="radio" name="radioAnswer" value="2">여자
											</label>
										</div>
									</div>
								</div>
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
									<label>휴대전화 번호</label> <input type="text"
										class="input-text full-width" id="tel" placeholder="숫자만 입력하세요" />
								</div>
								<div class="form-group col-sm-6 col-md-5">
									<label>&nbsp;</label> <a class="button"
										style="width: 150px; height: 30px; font-size: 12px;"
										id="telconfirmbtn">인증하기</a>
								</div>
							</div>

							<div class="row">
								<div class="form-group col-sm-6 col-md-5">
									<input type="text" class="input-text full-width"
										id="telconfirmtxt" placeholder="인증번호를 입력하세요" />
								</div>
								<div class="form-group col-sm-6 col-md-5">

									<a href="cruise-detailed.html" class="button" id="confirmnum"
										style="width: 150px; height: 30px; font-size: 12px;">인증번호
										확인</a>
								</div>
							</div>

							<div class="row">
								<div class="form-group col-sm-6 col-md-5">
									<label>주소</label>
									 <input type="search"
										class="input-text full-width"  placeholder="" readonly />
								</div>
								<div class="form-group col-sm-6 col-md-5">
									<label>&nbsp;</label> 
									<button type="button"  id= "zipSearchbtn" style="width: 150px; height: 30px; font-size: 12px;">우편번호
										찾기</button>
								</div>
							</div>

							<div class="row">
								<div class="form-group col-sm-6 col-md-5">
									<input type="text" class="input-text full-width" value=""
										placeholder="나머지 주소를 입력해 주세요." id="zipResult"/>
								</div>
								<div class="form-group col-sm-6 col-md-5">

									
								</div>
							</div>


							<hr />
							<div class="form-group">
								<div class="checkbox">
									<label> <input type="checkbox" id="chkConfirm">
										<span class="skin-color">이용약관, 개인정보 수집</span>에 모두 동의합니다.
									</label>
								</div>
							</div>
						</div>

						<div class="form-group row">
							<div class="col-sm-6 col-md-5">
								<button type="button" type="button" type="button" type="button"
									type="button" type="submit" class="full-width btn-large"
									style="font-size: 20px; font-weight: bold;" id="btnsignup">가입하기</button>
							</div>
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>
</section>
<%@include file="../template/footer.jsp"%>