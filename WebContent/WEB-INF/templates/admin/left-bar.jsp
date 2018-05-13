<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul class="nav">
    <!-- Main menu -->
    <li><a href="${pageContext.request.contextPath }/admin"><i class="glyphicon glyphicon-home"></i> Trang chủ</a></li>
    <li><a href="${pageContext.request.contextPath }/admin/items"><i class="glyphicon glyphicon-list"></i> Danh mục</a></li>
    <li><a href="${pageContext.request.contextPath }/admin/product"><i class="glyphicon glyphicon-gift"></i> Sản phẩm</a></li>
     <li><a href="${pageContext.request.contextPath }/admin/order"><i class="glyphicon glyphicon-file"></i> Hóa đơn</a></li>
    <li><a href="${pageContext.request.contextPath }/admin/users"><i class="glyphicon glyphicon-user"></i>Người dùng</a></li>
    <li class="submenu">
         <a href="#">
            <i class="glyphicon glyphicon-list"></i> Pages
            <span class="caret pull-right"></span>
         </a>
         <!-- Sub menu -->
         <ul>
            <li><a href="${pageContext.request.contextPath }/admin/slides">Slides</a></li>
            <li><a href="javascript:void(0)">Signup</a></li>
        </ul>
    </li>
</ul>