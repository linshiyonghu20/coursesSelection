<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/createuser.css"/>">
<title>Sign up result</title>
</head>
<body>

<div class="main">
	<c:if test="${not empty status }">
		<c:if test="${status=='successful' }">
			<h1>You are ${status } in add a new user.</h1>
			<c:if test="${not empty user }">
				<p>Username: ${user.username }</p>
			</c:if><br>
			<p class="words">Please<a href="<c:url value="/resources/login.jsp"/>">login here.</a></p>
		</c:if>
		<c:if test="${status!='successful' }">
			<h1>You are updating a user.</h1>
			<c:if test="${not empty user }">
				<p>Username: ${user.username }</p>
			</c:if><br>
			<p class="words">Please<a href="<c:url value="/resources/login.jsp"/>">login here.</a></p>
		</c:if>
	</c:if>
	<a class="words" href="<c:url value="/" />">Return to home</a>
</div>

</body>
</html>