<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<div id="gtco-features">
		<div class="gtco-container">
			<div class="row">
			 <c:forEach items="${arCat }" var="arCat">
				<div class="col-md-4 col-sm-4">
					<div class="feature-center animate-box" data-animate-effect="fadeIn">
						<span class="icon">
							<img style="width:250px;height:300px" src="${pageContext.request.contextPath }/uploads/${arCat.hinhanh}" />
						</span>
						<h3>${arCat.name_product }</h3>
						<p>${arCat.price } VND</p>
						<p><a href="${pageContext.request.contextPath }/product/${slugUtil.makeSlug(arCat.name_product) }-${arCat.id_product}" class="btn btn-primary">View More</a></p>
					</div>
				</div>
			 </c:forEach>
			</div>
		</div>
	</div>