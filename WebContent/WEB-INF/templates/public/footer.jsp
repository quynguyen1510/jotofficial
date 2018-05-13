<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="gtco-started">
		<div class="gtco-container">
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
					<h2>Get Started</h2>
				</div>
			</div>
			<c:if test="${not empty check }">
                        	<div class="alert alert-danger">
 								 <strong>${check }</strong>
							</div>
           	</c:if>
           	<c:if test="${not empty msg }">
                        	<div class="alert alert-success">
 								 <strong>${msg }</strong>
							</div>
           	</c:if>
			<div class="row animate-box">
				<div class="col-md-12">
					<form class="form-inline" action="${pageContext.request.contextPath }/joinWithUs" method="post">
						<div class="col-md-4 col-sm-4">
							<div class="form-group">
								<label for="username" class="sr-only">Username</label>
								<input type="text" class="form-control" name="username" id="username" placeholder="Username">
								<form:errors path="user.username" cssStyle="color:red;display:block;font-weight:bold"></form:errors>
							</div>
						</div>
						<div class="col-md-4 col-sm-4">
							<div class="form-group">
								<label for="password" class="sr-only">Password</label>
								<input type="password" class="form-control" name="password" id="password" placeholder="Password">
								<form:errors path="user.password" cssStyle="color:red;display:block;font-weight:bold"></form:errors>
							</div>
						</div>
						<div class="col-md-4 col-sm-4">
							<div class="form-group">
								<label for="fullname" class="sr-only">Fullname</label>
								<input type="text" class="form-control" name="fullname" id="fullname" placeholder="Fullname">
								<form:errors path="user.fullname" cssStyle="color:red;display:block;font-weight:bold"></form:errors>
							</div>
						</div>
						<div class="col-md-4 col-sm-4">
							<button type="submit" class="btn btn-default btn-block">Join with us</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<footer id="gtco-footer" role="contentinfo">
		<div class="gtco-container">
			<div class="row row-pb-md">
				<div class="col-md-4 gtco-widget">
					<h3>Our Brands</h3>
					<p>Our brand was founded by my team since 2016 . The first streetwear local brand in Da Nang to head a liberal and break the old order of streetstyle</p>
					<p><a href="#">Learn More</a></p>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6 col-md-push-1">
					<ul class="gtco-footer-links">
						<li><a href="#">About</a></li>
						<li><a href="#">Help</a></li>
						<li><a href="#">Contact</a></li>
						<li><a href="#">Terms</a></li>
						<li><a href="#">Meetups</a></li>
					</ul>
				</div>

			</div>

			<div class="row copyright">
				<div class="col-md-12">
					<p class="pull-left">
						<small class="block">&copy; 2018 QuyNguyen. All Rights Reserved.</small> 
						<small class="block">Designed by <a href="http://gettemplates.co/" target="_blank">QuyNguyen</a> Demo Images: <a href="http://unsplash.co/" target="_blank">Unsplash</a></small>
					</p>
					<p class="pull-right">
						<ul class="gtco-social-icons pull-right">
							<li><a href="#"><i class="icon-twitter"></i></a></li>
							<li><a href="#"><i class="icon-facebook"></i></a></li>
							<li><a href="#"><i class="icon-linkedin"></i></a></li>
							<li><a href="#"><i class="icon-dribbble"></i></a></li>
						</ul>
					</p>
				</div>
			</div>

		</div>
	</footer>
	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
	
	<!-- jQuery -->
	<script src="${pageContext.request.contextPath }/templates/public/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="${pageContext.request.contextPath }/templates/public/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="${pageContext.request.contextPath }/templates/public/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="${pageContext.request.contextPath }/templates/public/js/jquery.waypoints.min.js"></script>
	<!-- Carousel -->
	<script src="${pageContext.request.contextPath }/templates/public/js/owl.carousel.min.js"></script>
	<!-- countTo -->
	<script src="${pageContext.request.contextPath }/templates/public/js/jquery.countTo.js"></script>
	<!-- Magnific Popup -->
	<script src="${pageContext.request.contextPath }/templates/public/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath }/templates/public/js/magnific-popup-options.js"></script>
	<!-- Main -->
	<script src="${pageContext.request.contextPath }/templates/public/js/main.js"></script>
	<script src="${pageContext.request.contextPath }/templates/public/js/custom.js"></script>
	</body>
</html>