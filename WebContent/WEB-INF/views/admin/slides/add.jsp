 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix="form" %>
 <script src="${pageContext.request.contextPath }/library/ckeditor/ckeditor.js"></script>
 <div class="col-md-10">
                <div class="row">
                    <div class="col-md-12 panel-info">
                        <div class="content-box-header panel-heading">
                            <div class="panel-title ">Thêm slides</div>
                        </div>
                        <c:if test="${not empty error }">
	                        <div class="alert alert-success">
	  							<strong>${error }</strong>
							</div>
						</c:if>
                        <form action="${pageContext.request.contextPath }/admin/slides/add" method="post" enctype="multipart/form-data">
                        <div class="content-box-large box-with-header">
                            <div>
                                <div class="row mb-10"></div>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="name">Hình ảnh</label>
                                            <input type="file" name="hinhanh" class="form-control" >
                                        </div>
                                    </div>
                                    <div class="col-sm-6"></div>
									
                                    <div class="col-sm-12">
                                    </div>
                                </div>

                                <hr>

                                <div class="row">
                                    <div class="col-sm-12">
                                        <input type="submit" value="Thêm" class="btn btn-success" />
                                    </div>
                                </div>

                            </div>
                        </div>
                        </form>
                        <script type="text/javascript">
							CKEDITOR.replace('editor');
						</script>
                    </div>
                </div>
                <!-- /.row col-size -->

            </div>