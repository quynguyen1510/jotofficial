<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
	<div class="gtco-section">
		<div class="gtco-container">
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2 text-center gtco-heading gtco-heading-sm">
					<h2>${objProduct.name_product }</h2>
				</div>
			</div>
			<div class="row animate-box">
				<div class="col-md-6">
					<img style="width:485px;height:485px;" src="${pageContext.request.contextPath }/uploads/${objProduct.hinhanh}" />
				 <c:if test="${not empty objProduct.picture_description }">
					<img style="width:485px;height:485px;" src="${pageContext.request.contextPath }/uploads/${objProduct.picture_description}" />
				 </c:if>
				</div>
				<div class="col-md-6">
					<p>${objProduct.description }</p>
					<p class="price">${objProduct.price }</p>
					<form action="${pageContext.request.contextPath }/shoppingcart/${objProduct.id_product}/1" method="post">
						<div class="dropdown-size">
						<select name="size" id = "size" class="dropdown-select">
						 <c:forEach items="${arSize }" var="arSize">
						 	<c:choose>
						 		<c:when test="${arSize.in_stock == 0}">
						 			<option  disabled="disabled" value="${arSize.name_size }">${arSize.name_size } - SOLD OUT</option>
						 		</c:when>
						 		<c:otherwise>
						 			<option value="${arSize.name_size }">${arSize.name_size }</option>
						 		</c:otherwise>
						 	</c:choose>
						 </c:forEach>
						</select>
						</div>
						<p><button type="submit" class="btn btn-primary">Add To Cart</button></p>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div id="gtco-team" class="gtco-section">
		<div class="gtco-container">
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
					<h2>Wear it with</h2>
				</div>
			</div>
			<div class="row">
				<c:forEach items="${arProductByCat }" var="arProductByCat">
					<div class="col-md-4 animate-box" data-animate-effect="fadeIn">
						<div class="gtco-staff">
							<img src="${pageContext.request.contextPath }/uploads/${arProductByCat.hinhanh}" alt="">
							<h3>${arProductByCat.name_product }</h3>
							<strong class="role">${arProductByCat.name_items }</strong>
							<p>${arProductByCat.price }</p>
							<p><a href="${pageContext.request.contextPath }/product/${slugUtil.makeSlug(arProductByCat.name_product) }-${arProductByCat.id_product}" class="btn btn-primary">View More</a></p>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
