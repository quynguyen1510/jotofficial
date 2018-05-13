<!-- header -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
<tiles:insertAttribute name="header"></tiles:insertAttribute>
<form action="${pageContext.request.contextPath }/login" method="post">
    <div class="page-content container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-wrapper">
                    <div class="box">
                        <div class="content-wrap">
                            <img width="100px" height="100px" class="img-circle" src="${pageContext.request.contextPath }/templates/admin/images/logo.png">
                            <h6>Đăng nhập</h6>
                             <c:if test="${not empty loginError }">
								<div class="alert alert-danger">
						  			<strong>${loginError}</strong>
								</div>
							</c:if>
							<c:if test="${not empty block }">
								<div class="alert alert-danger">
						  			<strong>${block}</strong>
								</div>
							</c:if>
							<c:if test="${not empty msg }">
								<div class="alert alert-success">
						  			<strong>${msg}</strong>
								</div>
							</c:if>
							<p>${disactive }</p>
                            <div class="form-group">
                                <label class="text-left pull-left" for="username">Tên đăng nhập</label>
                                <input class="form-control" type="text" placeholder="Username" name="username">
                            </div>

                            <div class="form-group">
                                <label class="text-left pull-left" for="password">Mật khẩu</label>
                                <input class="form-control" type="password" placeholder="Password" name="password">
                            </div>
                            <div class="action">
                            	<input class="btn btn-primary signup btn-block"  type="submit" value="Login">
                            </div>
                        </div>
                    </div>

                    <div class="already">
                        <p>Don't have an account yet?</p>
                        <a href="${pageContext.request.contextPath}/admin/users/signup">Sign Up</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<tiles:insertAttribute name="footer"></tiles:insertAttribute>