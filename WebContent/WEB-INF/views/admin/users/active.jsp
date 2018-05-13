<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose>
	<c:when test="${enable == 1 }">
		<a onclick="change(${userID},${enable})"
			href="javascript:void(0)"><img alt=""
			src="${pageContext.request.contextPath }/templates/admin/images/on.png">
		</a>
	</c:when>
	<c:otherwise>
		<a onclick="change(${userID},${enable})" href="javascript:void(0)"><img alt=""
			src="${pageContext.request.contextPath }/templates/admin/images/off.png">
		</a>
	</c:otherwise>
</c:choose>