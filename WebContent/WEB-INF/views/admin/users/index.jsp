<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
 <div class="col-md-10">

                <div class="content-box-large">
                    <div class="row">
                        <div class="panel-heading">
                            <div class="panel-title ">Quản lý người dùng</div>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-md-8">
                            <a href="${pageContext.request.contextPath }/admin/users/add" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm</a>
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
                                        <th>Username</th>
                                        <th>Fullname</th>
                                        <th>Active</th>
                                        <th>Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${arUsers }" var="arUsers">
	                                    <tr class="odd gradeX">
	                                        <td>${arUsers.id }</td>
	                                        <td>${arUsers.username }</td>
	                                        <td>${arUsers.fullname }</td>
	                                        <td class="center text-center" id="change-${arUsers.id }">
	                                         	<c:choose>
	                                        		<c:when test="${arUsers.enable == 1 }">
	                                        			<a onclick="change(${arUsers.id},${arUsers.enable })" href="javascript:void(0)"><img alt="" src="${pageContext.request.contextPath }/templates/admin/images/on.png"></a>
	                                        		</c:when>
	                                        		<c:otherwise>
	                                        			<a onclick="change(${arUsers.id},${arUsers.enable })" href="javascript:void(0)"><img alt="" src="${pageContext.request.contextPath }/templates/admin/images/off.png"></a>
	                                        		</c:otherwise>
	                                        	</c:choose>
	                                        </td>
	                                        <td class="center text-center">
	                                            <a href="${pageContext.request.contextPath }/admin/users/edit/${arUsers.id}" title="" class="btn btn-primary"><span class="glyphicon glyphicon-pencil "></span> Sửa</a>
	                                            <a href="${pageContext.request.contextPath }/admin/users/delete/${arUsers.id}" title="" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa')"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
	                                        </td>
	                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
							<script>
								function change(userID,enable) {
									 //lấy dữ liệu từ ô input;
									$.ajax({
										url : '${pageContext.request.contextPath }/admin/users/active/'+userID+'/'+enable,
										type : 'POST',
										cache : false,
										success : function(data) {
											// Nhận dữ liệu trả về
											$('#change-'+userID).html(data)//Hiển thị ở trang web
										},
										error : function() {
											alert('Có lỗi');
										}
									});
								}
							</script>
							
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