<%@page import="vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
<head>
<script>
function goGo() {
	onclick="location.href='address'"
}
</script>

    <!-- Page Title -->
    <title>youthdepot</title>
    
    <!-- Meta Tags -->
    <meta charset="utf-8">
    <meta name="keywords" content="HTML5 Template" />
    <meta name="description" content="YouthDepot_kitri_2nd_project">
    <meta name="author" content="kitri25th">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    
    <!-- Theme Styles -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/user/Resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/user/Resources/css/font-awesome.min.css">
    <link href='http://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/user/Resources/css/animate.min.css">
    
    <!-- Current Page Styles -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/user/Resources/components/revolution_slider/css/settings.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/user/Resources/components/revolution_slider/css/style.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/user/Resources/components/jquery.bxslider/jquery.bxslider.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/user/Resources/components/flexslider/flexslider.css" media="screen" />
    
    
    <!-- Main Style -->
    <link id="main-style" rel="stylesheet" href="<%=request.getContextPath() %>/user/Resources/css/style.css">
    
    <!-- Updated Styles -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/user/Resources/css/updates.css">

    <!-- Custom Styles -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/user/Resources/css/custom.css">
    
    <!-- Responsive Styles -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/user/Resources/css/responsive.css">
    
    
	<script type="text/javascript" src="<%=request.getContextPath() %>/user/Resources/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/user/Resources/js/jquery.noconflict.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/user/Resources/js/modernizr.2.7.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/user/Resources/js/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/user/Resources/js/jquery.placeholder.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/user/Resources/js/jquery-ui.1.10.4.min.js"></script>
    
    <!-- Twitter Bootstrap -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/user/Resources/js/bootstrap.js"></script>
    
    <!-- load revolution slider scripts -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/user/Resources/components/revolution_slider/js/jquery.themepunch.tools.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/user/Resources/components/revolution_slider/js/jquery.themepunch.revolution.min.js"></script>
    
    <!-- load BXSlider scripts -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/user/Resources/components/jquery.bxslider/jquery.bxslider.min.js"></script>
    
	<!-- load FlexSlider scripts -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/user/Resources/components/flexslider/jquery.flexslider-min.js"></script>
    
    <!-- parallax -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/user/Resources/js/jquery.stellar.min.js"></script>
    
    <!-- waypoint -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/user/Resources/js/waypoints.min.js"></script>

    <!-- load page Javascript -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/user/Resources/js/theme-scripts.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/user/Resources/js/scripts.js"></script>
    
</head>
<boby>
<div id="page-wrapper">
	<header id="header" class="navbar-static-top style4">
		<div class="container">
			<h1 class="logo navbar-brand">
				<a href="<%=request.getContextPath()%>/user/pages/index.jsp" title="YouthDepot"> <img
					src="/images/logo.png" alt="YouthDeopot welcome" />
				</a>
			</h1>

			<div class="pull-right hidden-mobile">
				<form method="post" class="quick-search">
					<div class="with-icon">
						<input type="text" class="input-text" value="" name="q"
							placeholder="SEARCH" />
						<button class="icon" type="submit">
							<i class="soap-icon-search"></i>
						</button>
					</div>
				</form>
				<% HttpSession session2 = request.getSession();
					if (session2.getAttribute("mem_id") == null){
					
				%>
				<button 
					data-target="#travelo-signup" onclick="location.href='<%=request.getContextPath()%>/user/mypage/signup.jsp'">회원가입</button>
				<button 
					data-target="#travelo-login" onclick="location.href='<%=request.getContextPath()%>/user/mypage/login.jsp'">로그인</button>
					<%} else {%>
					<h4><%= session2.getAttribute("nickname") %>님환영합니다</h4>
					<% } %>
			</div>
		</div>
		<a href="#mobile-menu-01" data-toggle="collapse"
			class="mobile-menu-toggle"> Mobile Menu Toggle </a>

		<div class="main-navigation">
			<div class="container">
				<nav id="main-menu" role="navigation">
					<ul class="menu">
						<li class="menu-item-has-children"><a href="<%=request.getContextPath()%>/user/pages/index.jsp">청년창고</a>
							</li>
						<li class="menu-item-has-children"><a href="<%=request.getContextPath()%>/ProjectController?type=rewardMain">리워드·후원</a>
							</li>
						<li class="menu-item-has-children"><a href="community.html">열정창고</a>
							</li>
						<li class="menu-item-has-children"><a>커뮤니티</a>
							<ul>
								<li><a href="<%=request.getContextPath()%>/PostController?type=boardList&brd_id=10">공지사항</a></li>
								<li><a href="<%=request.getContextPath()%>/PostController?type=boardList&brd_id=30">FAQ</a></li>
								<li><a href="<%=request.getContextPath()%>/PostController?type=boardList&brd_id=20">커뮤니티</a></li>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
		</div>

		<nav id="mobile-menu-01" class="mobile-menu collapse">
			<ul id="mobile-primary-menu" class="menu">
				<li class="menu-item-has-children"><a href="investment.html">청년창고</a>
					</li>
				<li class="menu-item-has-children"><a href="investment.html">투자·후원</a>
					</li>
				<li class="menu-item-has-children"><a href="reward.html">리워드·후원</a>
					</li>
				<li class="menu-item-has-children"><a href="community.html">커뮤니티</a>
					</li>
			</ul>

			<ul class="mobile-topnav container">
				<li><a href="#">MY ACCOUNT</a></li>
				<li class="ribbon language menu-color-skin"><a href="#"
					data-toggle="collapse">ENGLISH</a>
					<ul class="menu mini">
						<li><a href="#" title="Dansk">Dansk</a></li>
					</ul></li>
				<li><a href="#travelo-login" class="soap-popupbox">LOGIN</a></li>
				<li><a href="#travelo-signup" class="soap-popupbox">SIGNUP</a></li>
				<li class="ribbon currency menu-color-skin"><a href="#">USD</a>
					<ul class="menu mini">
						<li><a href="#" title="AUD">AUD</a></li>
						<li class="active"><a href="#" title="USD">USD</a></li>
					</ul></li>
			</ul>

		</nav>
		<div id="travelo-signup" class="travelo-signup-box travelo-box">
			<div class="login-social">
				<a href="#" class="button login-facebook"><i
					class="soap-icon-facebook"></i>Login with Facebook</a> <a href="#"
					class="button login-googleplus"><i class="soap-icon-googleplus"></i>Login
					with Google+</a>
			</div>
			<div class="seperator">
				<label>OR</label>
			</div>
			<div class="simple-signup">
				<div class="text-center signup-email-section">
					<a href="#" class="signup-email"><i class="soap-icon-letter"></i>Sign
						up with Email</a>
				</div>
				<p class="description">By signing up, I agree to Travelo's Terms
					of Service, Privacy Policy, Guest Refund olicy, and Host Guarantee
					Terms.</p>
			</div>
			<div class="email-signup">
				<form>
					<div class="form-group">
						<input type="text" class="input-text full-width"
							placeholder="first name">
					</div>
					<div class="form-group">
						<input type="text" class="input-text full-width"
							placeholder="last name">
					</div>
					<div class="form-group">
						<input type="text" class="input-text full-width"
							placeholder="email address">
					</div>
					<div class="form-group">
						<input type="password" class="input-text full-width"
							placeholder="password">
					</div>
					<div class="form-group">
						<input type="password" class="input-text full-width"
							placeholder="confirm password">
					</div>
					<div class="form-group">
						<div class="checkbox">
							<label> <input type="checkbox"> Tell me about
								Travelo news
							</label>
						</div>
					</div>
					<div class="form-group">
						<p class="description">By signing up, I agree to Travelo's
							Terms of Service, Privacy Policy, Guest Refund Policy, and Host
							Guarantee Terms.</p>
					</div>
					<button type="submit" class="full-width btn-medium">SIGNUP</button>
				</form>
			</div>
			<div class="seperator"></div>
			<p>
				Already a Travelo member? <a href="#travelo-login"
					class="goto-login soap-popupbox">Login</a>
			</p>
		</div>
		<div id="travelo-login" class="travelo-login-box travelo-box">
			<div class="login-social">
				<a href="#" class="button login-facebook"><i
					class="soap-icon-facebook"></i>Login with Facebook</a> <a href="#"
					class="button login-googleplus"><i class="soap-icon-googleplus"></i>Login
					with Google+</a>
			</div>
			<div class="seperator">
				<label>OR</label>
			</div>
			<div class="seperator"></div>
			<p>
				Don't have an account? <a href="#travelo-signup"
					class="goto-signup soap-popupbox">Sign up</a>
			</p>
		</div>
		<form action=""></form>
	</header>