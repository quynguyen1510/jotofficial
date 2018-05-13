<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<div id="gtco-features">
		<div class="gtco-container">
			<div class="row">
			<c:if test="${not empty noti }">
				<p style="font-weight: bold;font-size: 20px">${noti }</p>
				<a style="margin-left: 50%;" href="${pageContext.request.contextPath }/shop" class="btn btn-primary">Go back Shop </a>
			</c:if>
			 <c:forEach items="${arSearch }" var="arSearch">
				<div class="col-md-4 col-sm-4">
					<div class="feature-center animate-box" data-animate-effect="fadeIn">
						<span class="icon">
							<img style="width:250px;height:300px" src="${pageContext.request.contextPath }/uploads/${arSearch.hinhanh}" />
						</span>
						<h3>${arSearch.name_product }</h3>
						<p>${arSearch.price } VND</p>
						<p><a href="${pageContext.request.contextPath }/product/${arSearch.name_product}-${arSearch.id_product}" class="btn btn-primary">View More</a></p>
					</div>
				</div>
			 </c:forEach>
			</div>
		</div>
	</div>