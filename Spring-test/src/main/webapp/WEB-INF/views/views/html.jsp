<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Data</title>
</head>
<body>
<div>
<h1>News</h1>
<c:if test="${not empty content }">
<c:forEach items="${content}" var="content">
<p><a href='${content.weburl }'>${content.snippet }</a></p>
</c:forEach>
</c:if>
</div>

<c:if test="${not empty result }">
<p>${result }</p>
</c:if>
</body>
</html>