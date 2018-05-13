 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix="form" %>
 <script src="${pageContext.request.contextPath }/library/ckeditor/ckeditor.js"></script>
 <div class="col-md-10">

                <div class="row">
                    <div class="col-md-12 panel-info">
                        <div class="content-box-header panel-heading">
                            <div class="panel-title ">Sửa sản phẩm</div>
                        </div>
                        <form action="${pageContext.request.contextPath }/admin/product/edit/${objProduct.id_product }" method="post"  enctype="multipart/form-data">
                        <div class="content-box-large box-with-header">
                            <div>
                                <div class="row mb-10"></div>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="name">Tên sản phẩm</label>
                                            <input type="text" name="name_product" value="${objProduct.name_product }" class="form-control" placeholder="Nhập tên sản phẩm">
                                        </div>
                                        <div class="form-group">
                                       		<label for="name">Danh mục sản phẩm</label></br>
	                                        <select name="id_items">
		                                        <c:forEach items="${arItems }" var="arItems">
		                                        	<c:choose>
		                                        		<c:when test="${objProduct.id_items == arItems.id_items }">
		                                        			<option selected="selected" value="${arItems.id_items }">${arItems.name_items }</option>
		                                        		</c:when>
		                                        		<c:otherwise>
		                                        			<option value="${arItems.id_items }">${arItems.name_items }</option>
		                                        		</c:otherwise>
		                                        	</c:choose>
												</c:forEach>
											</select>
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Hình ảnh</label>
                                            <img style="width: 100px;height:100px" src="${pageContext.request.contextPath }/uploads/${objProduct.hinhanh}">
                                            <input type="file" name="hinhanh" class="form-control" >
                                        </div>
                                        <div class="form-group">
                                        	<label for="name">Danh mục size</label></br>
	                                        <select name="id_size">
		                                        <c:forEach items="${arSize }" var="arSize">
		                                        	<c:choose>
		                                        		<c:when test="${objProduct.id_size == arSize.id_size }">
		                                        			<option selected="selected" value="${arSize.id_size}">${arSize.name_size}</option>
		                                        		</c:when>
		                                        		<c:otherwise>
		                                        			<option value="${arSize.id_size}">${arSize.name_size}</option>
		                                        		</c:otherwise>
		                                        	</c:choose>
												</c:forEach>
											</select>
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Giá</label>
                                            <input type="number" name="price" value="${objProduct.price }" class="form-control" placeholder="Nhập giá">
                                        </div>
                                         <div class="form-group">
                                            <label for="name">Số lượng </label>
                                            <input type="number" name="in_stock" value="${objProduct.in_stock }" class="form-control" placeholder="Nhập số lượng">
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Mô tả</label>
                                            <textarea id="editor" name="description" class="form-control">${objProduct.description }</textarea>
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
                                        <input type="submit" value="Sửa" class="btn btn-success" />
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