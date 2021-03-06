<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../template/header.jsp" flush="false"/>
<section id="content">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div id="carousel-example-generic" class="carousel slide"
					data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol>
					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img class="d-block img-fluid" src="../Resources/images/index1.png"
								alt="First slide">
							<div class="carousel-caption">...</div>
						</div>
						<div class="item">
							<img class="d-block img-fluid" src="../Resources/images/index2.png"
								alt="Second slide">
							<div class="carousel-caption">...</div>
						</div>
						<div class="item">
							<img class="d-block img-fluid" src="../Resources/images/index3.png"
								alt="Third slide">
							<div class="carousel-caption">...</div>
						</div>
					</div>
					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic"
						role="button" data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#carousel-example-generic"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<!-- /.col-lg-9 -->
		</div>
		<!-- /.row -->
	</div>
</section>
<!-- /.container -->
<%@include file="../template/footer.jsp"%>