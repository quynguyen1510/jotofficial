<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<body>
	<div class="container">
		<table id="cart" class="table table-hover table-condensed">
			<thead>
				<tr>
					<th style="width: 50%">Tên sản phẩm</th>     
					<th style="width: 10%">Mã hóa đơn</th>     
					<th style="width: 8%">Số lượng</th>     
					<th style="width: 22%" class="text-center">Giá tiền</th>     
					<th style="width: 10%"> Thành tiền </th>    
				</tr>
			</thead>
			<c:forEach items="${detail_order }" var="detail_order">
			<tbody>
				<tr>
					<td data-th="Product">    
						<div class="row">
							<div class="col-sm-10">
								<h4 class="nomargin">${detail_order.name_product }</h4>
							</div>
						</div>    
					</td>    
					<td data-th="Price">${detail_order.id_order }</td>    
					<td data-th="Quantity"><input class="form-control text-center"
						value="${detail_order.quantity }" type="number">    </td>    
					<td data-th="Subtotal" class="text-center">${detail_order.price }</td> 
					<td data-th="Subtotal" class="text-center">${detail_order.unit_price }</td>    
					</td>   
				
				</tr>
			</tbody>
			 </c:forEach>
		</table>
	</div>
</body>
</html>