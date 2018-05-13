 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <div class="col-md-10">

                <div class="row">
                    <div class="col-md-12 panel-info">
                        <div class="content-box-header panel-heading">
                            <div class="panel-title ">Đăng ký tài khoản</div>
                        </div>
                        <c:if test="${not empty check }">
							<div class="alert alert-danger">
		 						<strong>${check }</strong>
							</div>
						</c:if>
                        <form action="" method="post"  enctype="multipart/form-data">
	                        <div class="content-box-large box-with-header">
	                            <div>
	                                <div class="row mb-10"></div>
	                                <div class="row">
	                                    <div class="col-sm-6">
	                                        <div class="form-group">
	                                            <label for="name">Tên đăng nhập</label>
	                                            <input type="text" name="username" class="form-control">
	                                            <form:errors path="user.username" cssStyle="color:red;display:block;font-weight:bold"></form:errors>
	                                        </div>
	                                        <div class="form-group">
	                                            <label for="name">Hình ảnh</label>
	                                            <input type="file" name="hinhanh" class="form-control" >
                                       		</div>
	                                        <div class="form-group">
	                                            <label for="name">Fullname</label>
	                                            <input type="text" name="fullname" class="form-control" placeholder="Nhập tên đầy đủ">
	                                        	 <form:errors path="user.fullname" cssStyle="color:red;display:block;font-weight:bold"></form:errors>
	                                        </div>
	                                        
	                                        <div class="form-group">
	                                            <label for="name">Password</label>
	                                            <input value=""  type="password" name="password" class="form-control" placeholder="Nhập password">
	                                        	 <form:errors path="user.password" cssStyle="color:red;display:block;font-weight:bold"></form:errors>
	                                        </div>
	                                        
	                                    </div>
	
	                                    <div class="col-sm-6"></div>
	
	                                    <div class="col-sm-12">
	                                    </div>
	                                </div>
	
	                                <div class="row">
	                                    <div class="col-sm-12">
	                                        <input type="submit" value="Đăng ký ngay" class="btn btn-success" />
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