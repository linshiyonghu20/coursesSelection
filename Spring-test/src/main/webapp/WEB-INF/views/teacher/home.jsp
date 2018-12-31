<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Teacher Home</title>
	<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/teacherhome.css"/>">
</head>
<div class="main">
	<c:if test="${ not empty userinfo}">
		<h1>Welcome Teacher: ${userinfo.username }!</h1>
		<a href="<c:url value="/teacher/addcourses" />">Create Course</a><br><br>
		<table>
			<tr>
				<th class="short">coursename</th>
				<th class="long">description</th>
			</tr>
			<c:forEach items="${userinfo.course}" var="course">
				<tr>
					<td class="short">${course.coursename }</td>
					<td class="long">${course.description }</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</div>

<div class="logout">
<br>
<sec:authorize access="isAuthenticated()">
	<a href="<c:url value="/views/logout" />">Log out</a>
</sec:authorize>
</div>

</body>
</html>
