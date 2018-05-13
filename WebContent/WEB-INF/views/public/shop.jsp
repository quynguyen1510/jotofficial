<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<div id="gtco-features">
		<div class="gtco-container">
			<div class="sort" style="margin-left:  50%;margin-bottom: 50px;">
				<form action="${pageContext.request.contextPath }/product/sort" method="get">
                   	<select name="sort" style="padding: 15px">
		                    <option value="1">Price Low-High</option>
		                    <option value="2">Price High-Low</option>
		                    <option value="3">Product A-Z</option>
		                    <option value="4">Product Z-A</option>
                    	</select>
                    <button class="btn btn-primary" type="submit">Sort</button>
               </form>
			</div>
			<div class="row">
			 <c:forEach items="${arAllItems }" var="arAllItems">
				<div class="col-md-4 col-sm-4">
					<div class="feature-center animate-box" data-animate-effect="fadeIn">
						<span class="icon">
							<img style="width:250px;height:300px" src="${pageContext.request.contextPath }/uploads/${arAllItems.hinhanh}" />
						</span>
						<h3>${arAllItems.name_product }</h3>
						<p>${arAllItems.price } VND</p>
						<p><a href="${pageContext.request.contextPath }/product/${slugUtil.makeSlug(arAllItems.name_product) }-${arAllItems.id_product}" class="btn btn-primary">View More</a></p>
					</div>
				</div>
			 </c:forEach>
			</div>
		</div>
	</div>