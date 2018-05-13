 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <div class="col-md-10">

                <div class="row">
                    <div class="col-md-12 panel-info">
                        <div class="content-box-header panel-heading">
                            <div class="panel-title ">Thông tin người dùng</div>
                        </div>
                        <form action="${pageContext.request.contextPath }/admin/users/profile/${objUsers.id}" method="post"  enctype="multipart/form-data">
	                        <div class="content-box-large box-with-header">
	                            <div>
	                                <div class="row mb-10"></div>
	                                <div class="row">
	                                    <div class="col-sm-6">
	                                    	<div>
					                        	<c:if test="${not empty msg }">
					                        		<div class="alert alert-success">
						 								<strong>${msg }</strong>
													</div>
					                        	</c:if>
                       						</div>
	                                        <div class="form-group">
	                                            <label for="name">Tên đăng nhập</label>
	                                            <input value="${objUsers.username }" disabled="disabled" type="text" name="username" class="form-control">
	                                        </div>
	                                        <div class="form-group">
	                                            <label for="name">Avatar</label>
	                                            <c:choose>
	                                            	<c:when test="${not empty objUsers.avatar }">
	                                            		<img style="width: 100px;height: 100px" alt="" src="${pageContext.request.contextPath }/uploads/${objUsers.avatar}">
	                                            	</c:when>
	                                            	<c:otherwise>
	                                            		<img style="width: 100px;height: 100px"  alt="" src="${pageContext.request.contextPath }/templates/admin/images/avar.png">
	                                            	</c:otherwise>
	                                            </c:choose>
	                                            <input type="file" name="hinhanh" class="form-control" >
	                                            <c:if test="${not empty error }">
	                                            	<div class="alert alert-danger">
		 												<strong>${error }</strong>
													</div>
	                                            </c:if>
                                       		</div>
	                                        <div class="form-group">
	                                            <label for="name">Fullname</label>
	                                            <input value="${objUsers.fullname }"  type="text" name="fullname" class="form-control" placeholder="Nhập tên đầy đủ">
	                                        </div>
	                                        
	                                        <div class="form-group">
	                                            <label for="name">Password</label>
	                                            <input value=""  type="password" name="password" class="form-control" placeholder="Nhập password">
	                                        </div>
	                                        
	                                    </div>
	
	                                    <div class="col-sm-6"></div>
	
	                                    <div class="col-sm-12">
	                                    </div>
	                                </div>
	
	                                <div class="row">
	                                    <div class="col-sm-12">
	                                        <input type="submit" value="Cập nhật" class="btn btn-success" />
	                                        <input type="reset" value="Nhập lại" class="btn btn-default" />
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
                        </form>
                    </div>
                </div>
                <!-- /.row col-size -->

            </div>