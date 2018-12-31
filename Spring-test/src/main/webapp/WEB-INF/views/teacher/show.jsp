<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/teachershow.css"/>">
<title>Add course result</title>
</head>
<body>
<div class="main">
	<c:if test="${ not empty course}">
	<h1>Your add course:${course.coursename } successfully!</h1>
	<br><a class="words" href="<c:url value="/teacher/home" />">Return to Teacher Page</a><br>
	</c:if>
</div>
</body>
</html>