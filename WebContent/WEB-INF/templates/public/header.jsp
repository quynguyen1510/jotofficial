<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>JoT Official &mdash; Streetwear</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template by gettemplates.co" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta name="author" content="gettemplates.co" />

	<!--
		Oxygen by gettemplates.co
		Twitter: http://twitter.com/gettemplateco
		URL: http://gettemplates.co
	-->

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- <link href='https://fonts.googleapis.com/css?family=Work+Sans:400,300,600,400italic,700' rel='stylesheet' type='text/css'> -->
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/templates/public/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/templates/public/css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/templates/public/css/bootstrap.css">

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/templates/public/css/magnific-popup.css">

	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/templates/public/css/owl.carousel.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/templates/public/css/owl.theme.default.min.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/templates/public/css/style.css">
	<script src="${pageContext.request.contextPath }/templates/public/js/custom.js"></script>
	<!-- Jquery -->
	<script src="${pageContext.request.contextPath }/templates/public/js/jquery-3.2.1.min.js"></script>
	<!-- -->
	<!-- Modernizr JS -->
	<script src="${pageContext.request.contextPath }/templates/public/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>
		
	<div class="gtco-loader"></div>
	
	<div id="page">
	<nav class="gtco-nav" role="navigation">
		<div class="gtco-container">
			<div class="row">
				<div class="col-xs-2">
					<div id="gtco-logo"><a href="${pageContext.request.contextPath }">JoT Official.</a></div>
				</div>
				<div class="col-xs-8 text-center menu-1">
					<ul>
						<li><a href="${pageContext.request.contextPath }">Home</a></li>
						<li class="has-dropdown">
							<a href="${pageContext.request.contextPath }/shop">Shop</a>
							<ul class="dropdown">
							 <c:forEach items="${arItems }" var="arItems">
								<li><a href="${pageContext.request.contextPath }/collections/${slugUtil.makeSlug(arItems.name_items) }-${arItems.id_items}">${arItems.name_items }</a></li>
							</c:forEach>
							</ul>
						
						</li>
						<li><a href="contact.html">Contact</a></li>
						<li>
							<a href="${pageContext.request.contextPath }/shoppingcart" id="cart"><i class="icon-shopping-cart"></i> Cart <span id="numbercart" class="badge">${numberOrder }</span></a>
						</li>
					</ul>
				</div>
				
				<div class="col-xs-2 text-right hidden-xs menu-2">
					<ul>
						<li class="btn-cta"><a href="${pageContext.request.contextPath }/login"><span>Login</span></a></li>
					</ul>
				</div>
				
				<div style="display: inline-block;position: absolute;right: 11%;" class="search">
					<form action="${pageContext.request.contextPath }/search" id="demo-2" method="post">
						<input name="search" type="search" placeholder="Search" />
					</form>
				</div>
			</div>
			
		</div>
	</nav>

	<header id="gtco-header" class="gtco-cover" role="banner" style="background-image:url(${pageContext.request.contextPath }/templates/public/images/slideshow_2.jpg);">
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center">
					<div class="display-t">
						<div class="display-tc animate-box" data-animate-effect="fadeIn">
							<h1>New In Denim</h1>
							<p><a href="${pageContext.request.contextPath }/shop" class="btn btn-default">Shop Now</a></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>