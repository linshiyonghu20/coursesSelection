<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Course</title>
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/addcourse.css"/>">
</head>
<body>
<div class="main">
	<h1>Create Course Here</h1>
	<form:form id='course' modelAttribute="course" action='${pageContext.request.contextPath }/teacher/add' method='POST'>
			<p>
				<form:label for="coursename" path="coursename">Coursename:</form:label><br>
				<form:input path="coursename" id="coursename"/> <form:errors path="coursename"> </form:errors>
			</p>
			<p>
				<form:label for="description" path="description" >Description:</form:label><br>
				<form:textarea path="description"  rows="7" id="description"/> <form:errors path="description"> </form:errors>
			</p>
			<p>
				<button class="icon" type="submit">Create Course</button>
			</p>		
	</form:form>
</div>
</body>
</html>