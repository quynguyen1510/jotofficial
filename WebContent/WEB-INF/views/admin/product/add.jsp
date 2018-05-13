 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix="form" %>
 <script src="${pageContext.request.contextPath }/library/ckeditor/ckeditor.js"></script>
 <div class="col-md-10">
                <div class="row">
                    <div class="col-md-12 panel-info">
                        <div class="content-box-header panel-heading">
                            <div class="panel-title ">Thêm sản phẩm</div>
                        </div>
                        <c:if test="${not empty error }">
	                        <div class="alert alert-danger">
	  							<strong>${error }</strong>
							</div>
						</c:if>
                        <form action="${pageContext.request.contextPath }/admin/product/add" method="post" enctype="multipart/form-data">
                        <div class="content-box-large box-with-header">
                            <div>
                                <div class="row mb-10"></div>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="name">Tên sản phẩm</label>
                                            <input type="text" name="name_product" class="form-control" placeholder="Nhập tên sản phẩm">
                                        </div>
                                        <div class="form-group">
                                       		<label for="name">Danh mục sản phẩm</label></br>
	                                        <select name="id_items">
		                                        <c:forEach items="${arItems }" var="arItems">
													  <option value="${arItems.id_items }">${arItems.name_items }</option>
												</c:forEach>
											</select>
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Hình ảnh</label>
                                            <input type="file" name="hinhanh" class="form-control" >
                                        </div>
                                        <div class="form-group">
                                        	<label for="name">Size sản phẩm</label></br>
	                                        <select name="id_size">
		                                        <c:forEach items="${arSize }" var="arSize">
													  <option value="${arSize.id_size}">${arSize.name_size }</option>
												</c:forEach>
											</select>
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Giá</label>
                                            <input type="number" name="price" class="form-control" placeholder="Nhập giá">
                                        </div>
                                         <div class="form-group">
                                            <label for="name">Số lượng </label>
                                            <input type="number" name="in_stock" class="form-control" placeholder="Nhập số lượng">
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Mô tả</label>
                                            <textarea id="editor" name="description" class="form-control"></textarea>
                                        </div>
                                         <div class="form-group">
                                            <label for="name">Hình ảnh Mô tả thêm</label>
                                            <input type="file" name="picture_description" class="form-control" >
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
                                        <input type="reset" value="Nhập lại" class="btn btn-default" />
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