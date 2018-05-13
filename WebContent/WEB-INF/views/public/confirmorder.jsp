<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<form action="${pageContext.request.contextPath }/messageconfirm" method="post">
	<div class="gtco-section">
		<div class="gtco-container">
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2 text-center gtco-heading gtco-heading-sm">
					<h2>Confirm</h2>
				</div>
			</div>
			<div class="row animate-box">
				<div class="col-md-6">
					<p name="fullname" id="fullname">Fullname : ${objOrder.fullname }</p>
					<p name="phone" id="phone">Phone Number : ${objOrder.phone }</p>
					<p name="address" id="address">Address : ${objOrder.address }</p>
					<p name="date_create" id="date_create">Ngày mua hàng : ${objOrder.date_create }</p>
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
			<c:forEach items="${arDetailOrder }" var="arDetailOrder">
				<tbody>
					<tr>
						<td data-th="Product">    
							<div class="row">
								<div class="col-sm-2 hidden-xs">
									<img
										src="${pageContext.request.contextPath }/uploads/${arDetailOrder.picture}"
										alt="Sản phẩm 1" class="img-responsive" width="100">
								</div>
								<div class="col-sm-10">
									<h4 class="nomargin">${arDetailOrder.name_product }</h4>
									<p>Size:${arDetailOrder.size }</p>
								</div>
							</div>    
						</td>    
						<td data-th="Price">${arDetailOrder.price }</td> 
							<td data-th="Quantity"><p name="quantity" class="form-control text-center">${arDetailOrder.quantity }</p>   </td>    
							<td data-th="Subtotal" class="text-center">${arDetailOrder.unit_price }</td>    
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
<button type="submit" style="text-align: center;margin-left: 750px;"class="btn btn-primary"> Xác nhận</button>
</form>