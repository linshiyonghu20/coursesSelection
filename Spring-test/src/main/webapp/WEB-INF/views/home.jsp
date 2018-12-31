<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
	<title>Home</title>
	<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/home.css"/>">
</head>
<body>

<div class="home">
	<h1>
		Welcome to Class Choice System!  
	</h1>
	<br>
	<br>
	
	<c:if test="${username=='anonymousUser' }">
	<a class="loc" href="<c:url value="/resources/login.jsp"/>" >Log in</a><br>
	</c:if>
	<sec:authorize access="hasRole('TEACHER')">
	<a class="loc" href="<c:url value="/teacher/home" />">Go to Teacher Page</a><br>
	</sec:authorize>
	<sec:authorize access="hasRole('STUDENT')">
	<a class="loc" href="<c:url value="/student/home" />">GO to Student Page</a><br>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
	<a class="loc" href="<c:url value="/views/logout" />">Log out</a>
	</sec:authorize>
</div>

</body>
</html>
