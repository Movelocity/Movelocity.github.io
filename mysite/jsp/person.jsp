<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=devide-width">
<title>Person</title>
<style>.button{color:orange;background: linear-gradient(top, #34696f, #2f5f63);}</style>
</head>
<body>
<div style="background:#f0ffff;">
	<table>
<tr><td>accept-language:</td><td>${header['accept-language']}</td></tr>
<tr><td>session-id:</td><td>${pageContext.session.id}</td></tr>
<tr><td>person:</td><td>${requestScope.person.name}, ${person.address.city}</td></tr>
<tr><td>capital:</td><td>${capitals["China"]}</td></tr>
	</table>
</div>
<a href="welcome.jsp" class="button">Return</a>
</body>
</html>