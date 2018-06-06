<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.a1 {
	width: 200px;
	height: 150px;
	display: block;
	padding: 10px;
	white-space: nowrap;
	overflow: hidden; /*
  	text-align: center;*/
	text-overflow: ellipsis;
}

.c1 {
	border: solid 1px;
	display: inline-block;
	margin: 10px;
}

.tab-content {
	width: 1000px;
}

.button {
	width: 180px;
}

.img {
	width: 200px;
	height: 200px;
}
</style>
<%@include file="../template/header.jsp"%>
<section id="content" class="gray-area">
	<div class="container shortcode">
		<div class="block">
			<div class="row">
			
				<div class="col-md-6">
					<h2>내 펀딩내역</h2>
					<div class="tab-container box">
					<a href="#reward" data-toggle="tab"></a>
						
						<div class="tab-content">

							<div class="tab-pane fade in active" id="all">
								<div class="c1">
									<img src="http://placehold.it/200x200" alt="" class="img">
									<div class="a1">
										<h4>제목</h4>
										<h5>작성자이름</h5>
										<p>rPJT_state</p>
										<!-- <a class="button btn-medium silver">편집하기</a> -->
									</div>
								</div>

								<div class="c1">
									<img src="http://placehold.it/200x200" alt="" class="img">
									<div class="a1">
										<h4>제목</h4>
										<h5>작성자이름</h5>
										<p>rPJT_state</p>
										<!-- <a class="button btn-medium silver">편집하기</a> -->
									</div>
								</div>
							</div>

						</div>

					</div>
				</div>

			</div>
		</div>


	</div>
</section>
<%@include file="../template/footer.jsp"%>

