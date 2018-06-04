<%@page import="vo.RMeta"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../template/header.jsp"%>
        <section id="content">
            <div class="container">
                <div id="main">
                    <div class="row">
                    <div id="photos-tab" class="tab-pane fade in active">
                                    <div class="photo-gallery style1" data-animation="slide" data-sync="#photos-tab .image-carousel">
                                        <ul class="slides">
                                            <li><img src="http://placehold.it/900x500" alt="" /></li>
                                            <li><img src="http://placehold.it/900x500" alt="" /></li>
                                            <li><img src="http://placehold.it/900x500" alt="" /></li>
                                            <li><img src="http://placehold.it/900x500" alt="" /></li>
                                            <li><img src="http://placehold.it/900x500" alt="" /></li>
                                            <li><img src="http://placehold.it/900x500" alt="" /></li>
                                            <li><img src="http://placehold.it/900x500" alt="" /></li>
                                            <li><img src="http://placehold.it/900x500" alt="" /></li>
                                            <li><img src="http://placehold.it/900x500" alt="" /></li>
                                            <li><img src="http://placehold.it/900x500" alt="" /></li>
                                            <li><img src="http://placehold.it/900x500" alt="" /></li>
                                        </ul>
                                    </div>
                                    <div class="image-carousel style1" data-animation="slide" data-item-width="70" data-item-margin="10" data-sync="#photos-tab .photo-gallery">
                                        <ul class="slides">
                                            <li><img src="http://placehold.it/70x70" alt="" /></li>
                                            <li><img src="http://placehold.it/70x70" alt="" /></li>
                                            <li><img src="http://placehold.it/70x70" alt="" /></li>
                                            <li><img src="http://placehold.it/70x70" alt="" /></li>
                                            <li><img src="http://placehold.it/70x70" alt="" /></li>
                                            <li><img src="http://placehold.it/70x70" alt="" /></li>
                                            <li><img src="http://placehold.it/70x70" alt="" /></li>
                                            <li><img src="http://placehold.it/70x70" alt="" /></li>
                                            <li><img src="http://placehold.it/70x70" alt="" /></li>
                                            <li><img src="http://placehold.it/70x70" alt="" /></li>
                                            <li><img src="http://placehold.it/70x70" alt="" /></li>
                                        </ul>
                                    </div>
                                </div><hr>
        	 <div class="sort-by-section clearfix box">
                   <ul class="sort-bar clearfix block-sm">
                   	   <li><a href="#" class="button print-button btn-small uppercase">카테고리</a></li>
                   	   <li><a href="#" class="button print-button btn-small uppercase">카테고리</a></li>
                   	   <li><a href="#" class="button print-button btn-small uppercase">카테고리</a></li>
                   	   <li><a href="#" class="button print-button btn-small uppercase">카테고리</a></li>
                   	   <li><a href="#" class="button print-button btn-small uppercase">카테고리</a></li>
                   	   <li><a href="#" class="button print-button btn-small uppercase">카테고리</a></li>
                   	   <li><a href="#" class="button print-button btn-small uppercase">카테고리</a></li>
                   	   <li><a href="#" class="button print-button btn-small uppercase">카테고리</a></li>
                   	   <li><a href="#" class="button print-button btn-small uppercase">카테고리</a></li>
                   	   <li><a href="#" class="button print-button btn-small uppercase">카테고리</a></li>
                    </ul>
                </div>
                    <div class="travelo-box">
                            <h5 class="box-title">Search Stories</h5>
                            <div class="with-icon full-width">
                                <input type="text" class="input-text full-width" placeholder="story name or category">
                                <button class="icon green-bg white-color"><i class="soap-icon-search"></i></button>
                            </div>
                        </div>
                        <div class="col-sm-0 col-md-2">
                        </div>
                        <div class="col-sm-12 col-md-8">
                            <div class="cruise-list image-box style3 cruise listing-style1">
                                <div class="row">
                                <%ArrayList<RMeta> metalist = (ArrayList)request.getAttribute("metalist");
                                for(RMeta meta : metalist) {%>
                                    <div class="col-sm-6 col-md-4">
                                        <article class="box">
                                            <figure>
                                                <a href="ajax/cruise-slideshow-popup.html" class="hover-effect popup-gallery"><img width="270" height="160" alt="" src="http://placehold.it/270x160"></a>
                                            </figure>
                                            <div class="details">
												<h4 class="box-title"><%=meta.getrPJT_title()%></h4>
												<hr>
												<span class="">모인 금액 <%=meta.getrInvesting_amount()%>원</span>
												<div class="progress">
													<%int percent = (100 * meta.getrInvesting_amount()) / meta.getrTarget_amount();%>
													<div class="progress-bar" role="progressbar" style="width: <%=percent%>%"
														aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
													<p style="text-align:center"><%=percent%>%</p>
												</div>
												<hr>
												<span class="price">
												<%if (meta.getrProject().getrPJT_progress() == 1) {%>
												진행중
												<%} else if(meta.getrProject().getrPJT_progress() == 2) { %>
												마감
												<%} %>
												</span> <span><%=meta.getrPJT_category()%></span><br> <br>
												<div class="action">
													<a class="button btn-small full-width"
														href="<%=request.getContextPath()%>/ProjectController?type=rewardDetail&rPJT_id=<%=meta.getrProject().getrPJT_id()%>">펀딩하기</a>
												</div>
											</div>
                                        </article>
                                    </div>
                                    <%} %>
                                </div>
                            </div>
                            <a href="#" class="uppercase full-width button btn-large">load more listing</a>
                        </div>
                        <div class="col-sm-0 col-md-2">
                        </div>
                    </div>
                </div>
            </div>
        </section>
    <%@include file="../template/footer.jsp"%>
    <script>
        tjq(document).ready(function() {
            tjq("#-range").slider({
                range: true,
                min: 0,
                max: 1000,
                values: [ 100, 800 ],
                slide: function( event, ui ) {
                    tjq(".min-price-label").html( "$" + ui.values[ 0 ]);
                    tjq(".max-price-label").html( "$" + ui.values[ 1 ]);
                }
            });
            tjq(".min-price-label").html( "$" + tjq("#price-range").slider( "values", 0 ));
            tjq(".max-price-label").html( "$" + tjq("#price-range").slider( "values", 1 ));

            tjq("#cruise-length-range").slider({
                range: "min",
                min: 0,
                max: 12,
                value: 10,
                slide: function( event, ui ) {
                    tjq(".max-cruise-length").html( ui.value + " NIGHTS" );
                }
            });
            tjq(".max-cruise-length").html( tjq("#cruise-length-range").slider( "value" ) + " NIGHTS" );

            tjq("#rating").slider({
                range: "min",
                value: 40,
                min: 0,
                max: 50,
                slide: function( event, ui ) {
                    
                }
            });
        });
    </script>
