<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
 <div class="col-md-10">

                <div class="content-box-large">
                    <div class="row">
                        <div class="panel-heading">
                            <div class="panel-title ">Quản lý danh mục</div>
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
                            <a href="${pageContext.request.contextPath }/admin/items/add" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm</a>

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
                                        <th>Tên Danh mục</th>
                                        <th>Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${arItems }" var="arItems">
	                                    <tr class="odd gradeX">
	                                        <td>${arItems.id_items }</td>
	                                        <td>${arItems.name_items }</td>
	                                        <td class="center text-center">
	                                            <a href="${pageContext.request.contextPath }/admin/items/edit/${arItems.id_items}" title="" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
	                                            <a href="${pageContext.request.contextPath }/admin/items/delete/${arItems.id_items}" title="" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa. Xóa danh mục sẽ xóa luôn cả sản phẩm!')"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
	                                        </td>
	                                    </tr>
	                                  </c:forEach>
                                </tbody>
                            </table>

                            <!-- Pagination -->
                            <nav class="text-center" aria-label="...">
                                <ul class="pagination">
                                    <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
                                    <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#">5</a></li>
                                    <li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
                                </ul>
                            </nav>
                            <!-- /.pagination -->

                        </div>
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.content-box-large -->



            </div>