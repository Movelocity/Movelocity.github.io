<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page errorPage="errorHandler.jsp" %>
Deliberately throw an exception
<%Integer.parseInt("Throw me");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>buggy</title>
</head>
<body>
You can't see this.
</body>
</html>