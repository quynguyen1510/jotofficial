<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- header -->
<!DOCTYPE html>
<html>

<head>
    <title>JoT Official Admin</title>
    <link rel="shortcut icon" type="image/ico" href="images/icon-180x180.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/templates/admin/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- styles -->
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/templates/admin/css/style1.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>

<body>
    <div class="header">
        <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <!-- Logo -->
                    <div class="logo">
                        <h1><a href="${pageContext.request.contextPath }/admin">Jot Official-Admin</a></h1>
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="row">
                        <div class="col-lg-12"></div>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="navbar navbar-inverse" role="banner">
                    	 <c:choose>
	                      	<c:when test="${not empty user.avatar }">
	                      	 <c:set var="image" value="${pageContext.request.contextPath }/uploads/${user.avatar}"></c:set>
	                      	</c:when>
	                      	<c:otherwise>
	                      	 <c:set var="image" value="${pageContext.request.contextPath }/templates/admin/images/avar.png"></c:set>
	                      	</c:otherwise>
	                  	</c:choose>
                        <nav class="collapse navbar-collapse bs-navbar-collapse navbar-right" role="navigation">
                            <ul class="nav navbar-nav">
                                <li class="dropdown">
                                    <a style="background-image: url('${image}');background-repeat: no-repeat; background-size: 50px 50px;" href="#" class="dropdown-toggle" data-toggle="dropdown">${user.fullname} <b class="caret"></b></a>
                                    <ul class="dropdown-menu animated fadeInUp">
                                        <li><a href="${pageContext.request.contextPath}/admin/users/profile/${user.id}">Profile</a></li>
                                        <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>