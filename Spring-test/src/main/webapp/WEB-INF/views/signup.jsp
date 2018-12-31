<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/signup.css"/>">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign up here</title>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>">
</script>
</head>
<body onload='document.f.username.focus();' class="text-center">

<div class="main">
	<form:form name='f' modelAttribute="users" action='${pageContext.request.contextPath }/views/users'
		class="form-signin" method='POST'>
	<h1>Create your account</h1>
		<p>
			<form:label for="username" path="username" >Username:</form:label>
			<form:input name="username" path="username"  placeholder="Username"/> <form:errors path="username"> </form:errors>
		</p>
		<p>
			<form:label for="password" path="password" >Password:</form:label>
			<form:password path="password"  placeholder="Password"/> <form:errors path="password"> </form:errors>
		</p>
		<p>
			<form:label for="firstName" path="firstName" >FirstName:</form:label>
			<form:input name="firstName" path="firstName"  placeholder="FirstName"/> <form:errors path="firstName"> </form:errors>
		</p>
		<p>
			<form:label for="lastName" path="lastName" >LastName:</form:label>
			<form:input path="lastName" class="form-control" placeholder="LastName"/> <form:errors path="lastName"> </form:errors>
		</p>
		<p>
			<form:label for="birthDate" path="birthDate" >BirthDate:</form:label>
			<input type="date" id="bir"/>
			<form:hidden path="birthDate" id="birthDate"/>
			<form:errors path="birthDate"> </form:errors>
			<c:if test="${not empty userinfo.birthDate }">
			<span class="text-muted">${userinfo.birthDate}</span>
			</c:if>
		</p>
		<p>
			<form:label for="email" path="email" >Email:</form:label>
			<form:input path="email"  placeholder="*@*"/> <form:errors path="email"> </form:errors>
		</p>
		<p>
			<form:label for="address" path="address">Address:</form:label>
			<form:input path="address"  placeholder="Address"/> <form:errors path="address"> </form:errors>
		</p>
		<p>
			<form:label for="phone" path="phone" >Phone:</form:label>
			<form:input path="phone"  placeholder="(xxx)xxx-xxxx"/> <form:errors path="phone"> </form:errors>
		</p>
		<p>
			<label >Role:</label>
			<form:select path="role">
				<form:option value="ROLE_TEACHER">Teacher</form:option>
				<form:option value="ROLE_STUDENT">Student</form:option>
			</form:select>
		</p>		
		<p>
			<button class="icon" type="submit">Submit</button>
		</p>
	</form:form>
	
</div>

<script type="text/javascript">
$(function(){
	$("#bir").change(function(){
	  $("#birthDate").attr("value",$("#bir").val());
	});
	$("#username").attr("value",$("#user").text());
});
</script>

</body>
</html>