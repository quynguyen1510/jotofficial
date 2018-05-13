  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 <div class="col-md-10">
                <div class="content-box-large">
                    <div class="row">
                        <div class="panel-heading">
                            <div class="panel-title ">Quản lý slides </div>
                        </div>
                    </div>
                     <c:if test="${not empty msg }">
	                        <div class="alert alert-success">
	  							<strong>${msg }</strong>
							</div>
						</c:if>
                    <hr>
                    <div class="row">
                        <div class="col-md-8">
                            <a href="${pageContext.request.contextPath }/admin/slides/add" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm</a>

                        </div>
                        <div class="col-md-4">
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="panel-body">
                            <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Hình ảnh</th>
                                        <th>Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${arItems }" var="arItems">
	                                    <tr class="odd gradeX">
		                                        <td>${arItems.id_slide }</td>
		                                        <td>
		                                        	<img style="width: 150px;height: 100px" alt="" src="${pageContext.request.contextPath }/uploads/${arItems.hinhanh}">
		                                        </td>
		                                        <td class="center text-center">
		                                            <a href="${pageContext.request.contextPath }/admin/slides/delete/${arItems.id_slide}" title="" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa')"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
		                                        </td>
	                                    </tr>
	                                </c:forEach>
                                </tbody>
                            </table>

                            <!-- Pagination -->
                            <nav class="text-center" aria-label="...">
                                <ul class="pagination">
                                		<li ><a href="" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
                                    	<li ><a href="">1 <span class="sr-only">(current)</span></a></li>
                                    	<li ><a href="" aria-label="Next"><span aria-hidden="true">»</span></a></li>
                                </ul>
                            </nav>
                            <!-- /.pagination -->

                        </div>
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.content-box-large -->



            </div>