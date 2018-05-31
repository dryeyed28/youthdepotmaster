<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 페이지 요청시 : 게시글에서 값 가져와서 출력 --%>
<%-- 답변등록 버튼누르면 : UserBoardUpdateController에 데이터 전달 --%>
<%@include file="../template/header.jsp"%>
 <div id="page-wrapper">
        <section id="content" class="gray-area">
            <div class="container">
                <div class="row">
                    <div id="main" class="col-sms-6 col-sm-8 col-md-9">
                        <div class="booking-section travelo-box">

                            <form class="booking-form" method="post" action="booking-handler.php" onsubmit="return false;">
                                <div class="alert small-box" style="display: none;"></div>
                                <div class="person-information">
                                    <h2>게시판</h2>
                                    <hr>
                                    <div class="form-group row">
                                        <div class="col-sm-6 col-md-5">
                                            <h4>작성자</h4>
                                            <input type="text" name="name" class="input-text full-width" value="" placeholder="">
                                        </div>
                                        <div class="col-sm-6 col-md-5">
                                            <h4>이메일</h4>
                                            <input type="text" name="email" class="input-text full-width" value="" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group row">

                                        <div class="col-sm-6 col-md-10">
                                            <h4>제목</h4>
                                            <input type="text" name="title" class="input-text full-width" value="" placeholder="">
                                        </div>
                                        <div class="col-sm-6 col-md-10">
                                         <h4>내용</h4>
                                         <textarea name="content"  style="margin: 0px; width: 668px; height: 247px;">                                                
                                         </textarea>

                                     </div>

                                     <div class="col-sm-6 col-md-5">
                                        <h4>비밀번호</h4>
                                        <input type="text" name="passward" class="input-text full-width" value="" placeholder="">
                                    </div>
                                </div>
                                <div class="form-group">

                                </div>
                            </div>
                            <hr>

                            <div class="form-group row">
                                <div class="col-sm-6 col-md-3">
                                    <button type="submit" class="green" >등록</button>
                                    
                                    <button type="submit"  class="green" >취소</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </section>
</div>

<%@include file="../template/footer.jsp"%>

