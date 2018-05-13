 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <div class="col-md-10">

                <div class="row">
                    <div class="col-md-12 panel-info">
                        <div class="content-box-header panel-heading">
                            <div class="panel-title ">Sửa người dùng</div>
                        </div>
                        <form action="" method="post">
	                        <div class="content-box-large box-with-header">
	                            <div>
	                                <div class="row mb-10"></div>
	                                <div class="row">
	                                    <div class="col-sm-6">
	                                        <div class="form-group">
	                                            <label for="name">Tên đăng nhập</label>
	                                            <input value="${objUsers.username }" disabled="disabled" type="text" name="username" class="form-control">
	                                        </div>
	                                        
	                                        <div class="form-group">
	                                            <label for="name">Fullname</label>
	                                            <input value="${objUsers.fullname }"  type="text" name="fullname" class="form-control" placeholder="Nhập tên đầy đủ">
	                                        </div>
	                                        
	                                        <div class="form-group">
	                                            <label for="name">Password</label>
	                                            <input value=""  type="password" name="password" class="form-control" placeholder="Nhập password">
	                                        </div>
	                                        
	                                        <div class="form-group">
	                                            <label for="name">Quyền hạn</label>
	                                            <select name="role_id">
		                                        	<c:forEach items="${arRoles }" var="arRoles">
		                                        		<c:choose>
		                                        			<c:when test="${arRoles.role_id == objUsers.role_id }">
		                                        				<option selected="selected" value="${arRoles.role_id }">${arRoles.name }</option>
		                                        			</c:when>
		                                        			<c:otherwise>
		                                        				<option value="${arRoles.role_id }">${arRoles.name }</option>
		                                        			</c:otherwise>
		                                        		</c:choose>
													</c:forEach>
												</select>
	                                        </div>
	                                        
	                                    </div>
	
	                                    <div class="col-sm-6"></div>
	
	                                    <div class="col-sm-12">
	                                    </div>
	                                </div>
	
	                                <div class="row">
	                                    <div class="col-sm-12">
	                                        <input type="submit" value="Sửa" class="btn btn-success" />
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