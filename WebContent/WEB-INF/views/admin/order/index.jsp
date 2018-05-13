<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
 <div class="col-md-10">

                <div class="content-box-large">
                    <div class="row">
                        <div class="panel-heading">
                            <div class="panel-title ">Quản lý hóa đơn</div>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-md-8">
                        </div>
                        <div class="col-md-4">
                            <div class="input-group form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                         <button class="btn btn-primary" type="button">Search</button>
                       </span>
                            </div>
                        </div>
                    </div>
  					<c:if test="${not empty msg }">
	                        <div class="alert alert-success">
	  							<strong>${msg }</strong>
							</div>
					</c:if>
                    <div class="row">
                        <div class="panel-body">
                            <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Ngày mua hàng</th>
                                        <th>Fullname</th>
                                        <th>Phone</th>
                                         <th>Thành tiền</th>
                                         <th>Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${arOrder }" var="arOrder">
	                                    <tr class="odd gradeX">
	                                        <td>${arOrder.id_order }</td>
	                                        <td>${arOrder.date_create }</td>
	                                        <td>${arOrder.fullname }</td>
	                                        <td>${arOrder.phone }</td>
	                                         <td>${arOrder.total_price }</td>
	                                         <c:choose>
	                                         	<c:when test="${user.role_id == 3 }">
	                                         		<td class="center text-center">
	                                         			<a href="${pageContext.request.contextPath }/admin/order/detail/${arOrder.id_order}" title="" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Xem</a>
	                                         		</td>
	                                         	</c:when>
	                                         	<c:otherwise>
	                                         		<td class="center text-center">
				                                       <a href="${pageContext.request.contextPath }/admin/order/detail/${arOrder.id_order}" title="" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Xem</a>
				                                       <a href="${pageContext.request.contextPath }/admin/order/delete/${arOrder.id_order}" title="" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa.')"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
	                                        		</td>
	                                         	</c:otherwise>
	                                         </c:choose>
	                                    </tr>
	                                   </c:forEach>
                                </tbody>
                            </table>

                            <!-- Pagination -->
                            <nav class="text-center" aria-label="...">
                                <ul class="pagination">
                                	<c:choose>
                                    	<c:when test="${currentPage > 1 }">
                                    		<li ><a href="${pageContext.request.contextPath }/admin/order/page/${currentPage-1}" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
                                		</c:when>
                                		<c:otherwise>
                                				<li ><a href="${pageContext.request.contextPath }/admin/order/page/${sumPage}" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
                                		</c:otherwise>
                                	</c:choose>
                                    <c:forEach var="i" begin="1" end="${sumPage }">
                                    	<li <c:if test="${currentPage == i }">class="active"</c:if> ><a href="${pageContext.request.contextPath }/admin/product/page/${i}">${i } <span class="sr-only">(current)</span></a></li>
                                    </c:forEach>
                                    <c:choose>
                                    	<c:when test="${currentPage < sumPage }">
                                    		<li ><a href="${pageContext.request.contextPath }/admin/order/page/${currentPage+1}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
                                		</c:when>
                                		<c:otherwise>
                                				<li ><a href="${pageContext.request.contextPath }/admin/order/page/1" aria-label="Next"><span aria-hidden="true">»</span></a></li>
                                		</c:otherwise>
                                	</c:choose>
                                </ul>
                            </nav>
                            <!-- /.pagination -->

                        </div>
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.content-box-large -->



            </div>