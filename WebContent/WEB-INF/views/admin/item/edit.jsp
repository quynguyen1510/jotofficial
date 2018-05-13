 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <div class="col-md-10">

                <div class="row">
                    <div class="col-md-12 panel-info">
                        <div class="content-box-header panel-heading">
                            <div class="panel-title ">Sửa danh mục</div>
                        </div>
                        <form action="${pageContext.request.contextPath }/admin/items/edit/${objItems.id_items}" method="post">
	                        <div class="content-box-large box-with-header">
	                            <div>
	                                <div class="row mb-10"></div>
	                                <div class="row">
	                                    <div class="col-sm-6">
	                                        <div class="form-group">
	                                            <label for="name">Tên Danh mục</label>
	                                            <input value="${objItems.name_items }"  type="text" name="name_items" class="form-control" placeholder="Nhập tên mới danh mục">
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