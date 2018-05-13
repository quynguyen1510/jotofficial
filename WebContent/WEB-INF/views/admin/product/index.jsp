  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 <div class="col-md-10">
                <div class="content-box-large">
                    <div class="row">
                        <div class="panel-heading">
                            <div class="panel-title ">Quản lý sản phẩm </div>
                        </div>
                    </div>
                    <hr>
                    <c:if test="${not empty msg }">
	                        <div class="alert alert-success">
	  							<strong>${msg }</strong>
							</div>
					</c:if>
                    <div class="row">
                        <div class="col-md-8">
                            <a href="${pageContext.request.contextPath }/admin/product/add" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm</a>

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

                    <div class="row">
                        <div class="panel-body">
                            <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên Sản phẩm</th>
                                        <th>Mô tả</th>
                                        <th>Hình ảnh mô tả</th>
                                        <th>Hình ảnh</th>
                                        <th>Size</th>
                                        <th>Giá</th>
                                        <th>Số lượng</th>
                                        <th>Tên danh mục</th>
                                        <th>Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${arProduct}" var="arProduct">
	                                    <tr class="odd gradeX">
		                                        <td>${arProduct.id_product}</td>
		                                        <td>${arProduct.name_product}</td>
		                                        <td>${arProduct.description}</td>
		                                        <td>${arProduct.picture_description}</td>
					                            <c:choose>
					                            	<c:when test="${not empty arProduct.hinhanh }">
					                            		<td>
		                                        			<img style="width: 50px;height: 50px" src="${pageContext.request.contextPath }/uploads/${arProduct.hinhanh}">
		                                        		</td>
					                            	</c:when>
					                            	<c:otherwise>
					                            		<td>
		                                        			<img style="width: 50px;height: 50px" src="${pageContext.request.contextPath }/templates/public/images/Basicdenim_brightblue2.jpg">
		                                        		</td>
					                            	</c:otherwise>
					                            </c:choose>           
		                                        <td>${arProduct.name_size}</td>
		                                    	<td>${arProduct.price}</td>
		                                    	<td>${arProduct.in_stock}</td>
		                                        <td class="center text-center">
		                                        	<p>${arProduct.name_items}</p>
		                                        </td>
		                                        <td class="center text-center">
		                                            <a href="${pageContext.request.contextPath }/admin/product/edit/${arProduct.id_product}" title="" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
		                                            <a href="${pageContext.request.contextPath }/admin/product/delete/${arProduct.id_product}" title="" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa')"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
		                                        </td>
	                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                            <!-- Pagination -->
                            <nav class="text-center" aria-label="...">
                                <ul class="pagination">
                                	<c:choose>
                                    	<c:when test="${currentPage > 1 }">
                                    		<li ><a href="${pageContext.request.contextPath }/admin/product/page/${currentPage-1}" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
                                		</c:when>
                                		<c:otherwise>
                                				<li ><a href="${pageContext.request.contextPath }/admin/product/page/${sumPage}" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
                                		</c:otherwise>
                                	</c:choose>
                                    <c:forEach var="i" begin="1" end="${sumPage }">
                                    	<li <c:if test="${currentPage == i }">class="active"</c:if> ><a href="${pageContext.request.contextPath }/admin/product/page/${i}">${i } <span class="sr-only">(current)</span></a></li>
                                    </c:forEach>
                                    <c:choose>
                                    	<c:when test="${currentPage < sumPage }">
                                    		<li ><a href="${pageContext.request.contextPath }/admin/product/page/${currentPage+1}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
                                		</c:when>
                                		<c:otherwise>
                                				<li ><a href="${pageContext.request.contextPath }/admin/product/page/1" aria-label="Next"><span aria-hidden="true">»</span></a></li>
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