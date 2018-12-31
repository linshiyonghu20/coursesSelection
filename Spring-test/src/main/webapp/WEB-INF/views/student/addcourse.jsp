<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Join courses</title>
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/joincourse.css"/>">
</head>
<body>
<div class="main">
	<form action="${pageContext.request.contextPath }/student/add" method='POST'>
		<h1>Select Course</h1>
		<c:if test="${empty courses }">
			<p>No Class Now</p>
		</c:if>
		<c:if test="${not empty courses }">
			<c:forEach items="${courses}" var="course">
				<input type="checkbox" name="courseid" value="${course.id }" />
				${course.coursename } : ${course.description }
				<br>
			</c:forEach>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/><br>
			<button class="icon" type="submit">Join Class</button>
		</c:if>
	</form>
</div>
</body>
</html>