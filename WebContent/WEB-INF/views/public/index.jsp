<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<div id="gtco-features">
		<div class="gtco-container">
			<div class="row">
			 <c:forEach items="${arHotItems }" var="arHotItems">
				<div class="col-md-4 col-sm-4">
					<div class="feature-center animate-box" data-animate-effect="fadeIn">
						<span class="icon">
							<img style="width:300px;height:300px" src="${pageContext.request.contextPath }/uploads/${arHotItems.hinhanh}" />
						</span>
						<h3>${arHotItems.name_product }</h3>
						<p>${arHotItems.price } VND</p>
						<p><a href="${pageContext.request.contextPath }/product/${slugUtil.makeSlug(arHotItems.name_product) }-${arHotItems.id_product}" class="btn btn-primary">View More</a></p>
					</div>
				</div>
			 </c:forEach>	
			</div>
		</div>
	</div>
	<div class="slideshow">
		<ul id="slider">
			<c:forEach items="${arSlides }" var="arSlides">
				<li>
					<a href="">
						<img src="${pageContext.request.contextPath }/uploads/${arSlides.hinhanh}"/>
					</a>
				</li>
			</c:forEach>
		</ul>
		<script src="${pageContext.request.contextPath }/templates/public/js/slide.js"></script>
	</div>