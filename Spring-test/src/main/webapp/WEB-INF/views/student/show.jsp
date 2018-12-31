<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Join courses result</title>
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/studentshow.css"/>">
</head>
<body>
<div class="main">
	<c:if test="${ not empty courses}">
	<h1>You Have These Courses</h1>
	<table>
			<tr>
				<th class="short">coursename</th>
				<th class="long">description</th>
			</tr>
			<c:forEach items="${courses}" var="course">
				<tr>
					<td class="short">${course.coursename }</td>
					<td class="long">${course.description }</td>
				</tr>
			</c:forEach>
		</table>
	<br><a class="icon" href="<c:url value="/student/home" />">Return to Student Page</a><br>
	</c:if>
</div>
</body>
</html>