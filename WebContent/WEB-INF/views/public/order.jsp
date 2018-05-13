<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<div class="gtco-section">
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-6 animate-box">
					<h3>Kiểm tra đơn hàng </h3>
					<p style="font-size: 20px;color: red;">(Hãy điền chính xác thông tin để thuận lợi cho thanh toán)</p>
						<c:if test="${not empty msg }">
                        	<div class="alert alert-danger">
 								 <strong>${msg }</strong>
							</div>
           				</c:if>
					<form action="${pageContext.request.contextPath }/checkOrder" method="post">
						<div class="row form-group">
							<div class="col-md-6">
								<label for="fname">Họ và tên</label>
								<input type="text" id="fullname" name="fullname" class="form-control" placeholder="Your name">
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-12">
								<label for="subject">Số điện thoại</label>
								<input type="text" id="phone" name ="phone" class="form-control" placeholder="Your phone number">
								<c:if test="${not empty checkPhone }">
									<p style="color: red;">${checkPhone }</p>
								</c:if>
							</div>
						</div>
						
						<div class="row form-group">
							<div class="col-md-12">
								<label for="subject">Địa chỉ</label>
								<input type="text" id="address" name="address" class="form-control" placeholder="Your address">
							</div>
						</div>

						<div class="form-group">
							<input type="submit" value="Tiếp tục" class="btn btn-primary">
						</div>

					</form>		
				</div>
				<div class="col-md-5 col-md-push-1 animate-box">
					
					<div class="gtco-contact-info">
						<h3>Contact Information</h3>
						<ul>
							<li class="address">198 West 21th Street, <br> Suite 721 New York NY 10016</li>
							<li class="phone"><a href="tel://1234567920">+ 1235 2355 98</a></li>
							<li class="email"><a href="mailto:info@yoursite.com">info@yoursite.com</a></li>
						</ul>
					</div>

				</div>
			</div>
			
		</div>
	</div>
	<div style="margin-top: 20px ">
	<div class="container">
		<table id="cart" class="table table-hover table-condensed">
			<thead>
				<tr>
					<th style="width: 50%">Tên sản phẩm</th>     
					<th style="width: 10%">Giá</th>     
					<th style="width: 8%">Số lượng</th>     
					<th style="width: 22%" class="text-center">Thành tiền</th>     
				</tr>
			</thead>
			<c:forEach items="${order }" var="order">
			<tbody>
				<tr>
					<td data-th="Product">    
						<div class="row">
							<div class="col-sm-2 hidden-xs">
								<img
									src="${pageContext.request.contextPath }/uploads/${order.picture}"
									alt="Sản phẩm 1" class="img-responsive" width="100">
							</div>
							<div class="col-sm-10">
								<h4 class="nomargin">${order.name_product }</h4>
								<p>Size:${order.size }</p>
							</div>
						</div>    
					</td>    
					<td data-th="Price">${order.price }</td> 
						<td data-th="Quantity"><p name="quantity" class="form-control text-center">${order.quantity }</p>   </td>    
						<td data-th="Subtotal" class="text-center">${order.unit_price }</td>    
				</tr>
			</tbody>
			</c:forEach>
					<tfoot> 
					   <tr class="visible-xs"> 
					    <td class="text-center">
					    </td> 
					   </tr> 
					   <tr> 
					    </td> 
					    <td colspan="2" class="hidden-xs"> </td> 
					    <td class="hidden-xs text-center"><strong>Tổng tiền ${checkOut } đ</strong>
					    </td> 
					    </td> 
					   </tr> 
				  </tfoot> 
		</table>
	</div>
</div>