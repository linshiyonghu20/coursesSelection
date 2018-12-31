<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Logout</title>
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/logout.css"/>">
</head>
<body>
<div class="main">
	<c:if test="${not empty logout }">
	<h1>${logout }</h1>
	</c:if>
	<br>
	<a class="loc" href="<c:url value="/" />">Return to home</a><br>
</div>
</body>
</html>