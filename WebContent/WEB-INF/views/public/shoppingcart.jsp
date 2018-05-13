<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div style="margin-top: 20px ">
	<c:choose>
	<c:when test="${empty order }">
		<p style="text-align: center; font-size: 20px;">Have no product <a href="${pageContext.request.contextPath }/shop" class="btn btn-primary">Go to shopping now</a></p>
	</c:when>
	<c:otherwise>
	<div class="container">
		<table id="cart" class="table table-hover table-condensed">
			<thead>
				<tr>
					<th style="width: 50%">Tên sản phẩm</th>     
					<th style="width: 10%">Giá</th>     
					<th style="width: 8%">Số lượng</th>     
					<th style="width: 22%" class="text-center">Thành tiền</th>     
					<th style="width: 10%"> </th>    
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
					<form action="${pageContext.request.contextPath }/updateCart/${order.id_product}" method="get">   
						<td data-th="Quantity"><input name="quantity" class="form-control text-center" value="${order.quantity }" type="number">    </td>    
						<td data-th="Subtotal" class="text-center">${order.unit_price }</td>    
						<td class="actions" data-th="">    
							<button class="btn btn-info btn-sm"><i class="fa fa-edit">Update</i></button>     
							<a href="${pageContext.request.contextPath }/deleteCart/${order.id_product}" class="btn btn-danger btn-sm"><i class="fa fa-trash-o">Delete</i></a>    
						</td>
					</form>   
				</tr>
			</tbody>
			</c:forEach>
					<tfoot> 
					   <tr class="visible-xs"> 
					    <td class="text-center">
					    </td> 
					   </tr> 
					   <tr> 
					    <td><a href="${pageContext.request.contextPath }/shop" class="btn btn-warning"><i class="fa fa-angle-left"></i> Tiếp tục mua hàng</a>
					    </td> 
					    <td colspan="2" class="hidden-xs"> </td> 
					    <td class="hidden-xs text-center"><strong>Tổng tiền ${checkOut } đ</strong>
					    </td> 
					    <td><a href="${pageContext.request.contextPath}/checkOrder" class="btn btn-success btn-block">Thanh toán <i class="fa fa-angle-right"></i></a>
					    </td> 
					   </tr> 
				  </tfoot> 
			
		</table>
	</div>
	</c:otherwise>
	</c:choose>
</div>
