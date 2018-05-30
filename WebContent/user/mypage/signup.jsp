<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<%@include file="../template/header.jsp"%>

<script>






$(function(){
	
	$('#idchk').click(function(){
		console.log('중복확인버튼클릭 id='+$('#idchk').val());
		$.ajax({ 
			method:'post',
			data:'id='+$('#idchk').val(),
			url:'idcheck.do',
			success:function(data){
				//$('div.id>div.dup').html(data).css('color', 'red').show();
				data = data.trim();
				if(data == '1'){
					var result = '사용가능한 ID입니다.'
					$('div.id>div.dup').html(result).css('color', 'red').show();
				}else if(data == '-1'){
					var result = '이미사용중인ID입니다.'
					$('div.id>div.dup').html(result).css('color', 'red').show();
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

	var count=$("#tel").val().length;
	
	
	
	if(count==0){
		$('#telconfirmbtn').prop("disabled","disabled");
		//alert("버튼비활성화");
	}else{
		
	}
		
	

	$("#telconfirmbtn").click(function(){
		
		
		   //alert("tel_val : "  + $("#tel").val());
			//alert("count : "  + $("#tel").val().length);
		    if(count != "11"){
		      alert("다시확인.");
		    } else {
		    	alert("발송");
		    }

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
                                            <label>이름</label>
                                            <input type="text" class="input-text full-width" value="" placeholder="" />
                                        </div>
                                       
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-sm-6 col-md-5">
                                            <label>아이디</label>
                                            <input type="text" class="input-text full-width" value="" placeholder="" />
                                        </div>
	                                    <div class=" form-group col-sm-6 col-md-5">
	                                     	<label>  &nbsp; </label>
	                                   		<button class="button" id="idchk"  style="width:150px; height:30px;font-size:12px;">아이디 중복확인</button>
	                                    </div> 
                                   </div>
                                   
                                   <div class="row">
                                        <div class="form-group col-sm-6 col-md-5">
                                            <label>별명</label>
                                            <input type="text" class="input-text full-width" value="" placeholder="" />
                                        </div>
	                                    <div class=" form-group col-sm-6 col-md-5">
	                                     	<label>  &nbsp; </label>
	                                   		<a href="cruise-detailed.html" class="button"   style="width:150px; height:30px;font-size:12px;">별명 중복확인</a>  
	                                    </div> 
                                   </div>	       	                                     
                                        
                                     <div class="row">
                                       <div class=" form-group col-sm-6 col-md-5">
                                            <label>비밀번호</label>
                                            <input type="text" class="input-text full-width" value="" placeholder="" />
                                        </div>
                                     </div>  
                                    <div class="row">
                                        <div class="form-group col-sm-6 col-md-5">
                                    	     <label>비밀번호 확인</label>
                                             <input type="text" class="input-text full-width" value="" placeholder=""  />
                                              </div> 
                                        <div class="form-group col-sm-6 col-md-5">
                                              <label>비밀번호 일치확인</label>
                                        </div>
                                     </div>
                                        
                                        <div class="form-group col-sm-6 col-md-5">
                                            <div class="row">
                                                <div class="col-xs-6">
                                                    <label>생년월일</label>
                                                    <div class="datepicker-wrap">
                                                        <input type="text" class="input-text full-width" placeholder="일/월/년&nbsp" data-min-date="01/01/1900">
                                                    </div>
                                                </div>
                                                <div class="col-xs-6">
                                                    <label>성별</label>
                                                    <div>
                                                        <label class="radio radio-inline radio-square">
                                                            <input type="radio" name="radioAnswer" value="1" >남자
                                                        </label>
                                                        <label class="radio radio-inline radio-square">
                                                            <input type="radio" name="radioAnswer" value="2">여자
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
                                            <label>휴대전화 번호</label>
                                            <input type="text" class="input-text full-width" id="tel" value="" placeholder="숫자만 입력하세요" />
                                        </div>
                                        <div class="form-group col-sm-6 col-md-5">
                                            <label>&nbsp;</label>
                                            <a class="button" style="width:150px; height:30px;font-size:12px;" id="telconfirmbtn">인증하기</a> 
                                        </div>   
                                   </div>
                                        
                                    <div class="row"> 
                                        <div class="form-group col-sm-6 col-md-5">
                                           <input type="text" class="input-text full-width" value="" placeholder="인증번호를 입력하세요" />
                                        </div>
                                        <div class="form-group col-sm-6 col-md-5">
                                           
                                            <a href="cruise-detailed.html" class="button" text-align:center;  style="width:150px; height:30px;font-size:12px;">인증번호 확인</a>
                                        </div>
                                    </div>
                                    
                                     <div class="row">
                                        <div class="form-group col-sm-6 col-md-5">
                                            <label>주소</label>
                                            <input type="text" class="input-text full-width" value="" placeholder="" readonly/>
                                        </div>
                                        <div class="form-group col-sm-6 col-md-5">
                                            <label>&nbsp;</label>
                                            <a href="cruise-detailed.html" class="button"  style="width:150px; height:30px;font-size:12px;">우편번호 찾기</a> 
                                        </div>   
                                   </div>
                                   
                                   <div class="row">
                                        <div class="form-group col-sm-6 col-md-5">
                                        <input type="text"  class="input-text full-width" value="" placeholder="" readonly />
                                        </div>
                                        <div class="form-group col-sm-6 col-md-5">
                                         
                                           <input type="text" class="input-text full-width" value="" placeholder="나머지 주소를 입력해 주세요." />
                                        </div>   
                                   </div>
                                   
                                  
                                <hr />
  									<div class="form-group">
                                        <div class="checkbox" >
                                            <label>
                                                <input type="checkbox" id="chkConfirm"> <span class="skin-color">이용약관, 개인정보 수집</span>에 모두 동의합니다.
                                            </label>
                                        </div>
                                    </div>
                                </div>
                              
                                <div class="form-group row" >
                                    <div class="col-sm-6 col-md-5">
                                        <button type="submit" class="full-width btn-large" style="font-size:20px;font-weight:bold;" id="btnsignup" >가입하기</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                   
                </div>
            </div>
        </section>
<%@include file="../template/footer.jsp"%>