<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width">
<title>Function List</title>
<style>table{border:1px solid #AFEEEE; cellspacing:0; cellpadding:0;}
		table tr td{padding:1em;background:#F0F8FF;}</style>
</head>
<body>
<c:set var="myString" value="Hello World"/>
<c:set var="myArray" value="${fn:split('Hello, World', ',')}"/>
<table>
	<tr><td style="font-weight:bold">function</td><td style="font-weight:bold">result</td></tr>

	<tr><td>fn:contains("Hello World", "Hello")</td>
		<td>${fn:contains(myString,'Hello')}</td></tr>
	<tr><td>fn:containsIgnoreCase("Stella Cadente","CADENTE")</td>
		<td>${fn:containsIgnoreCase("Stella Cadente","CADENTE")}</td></tr>
	<tr><td>fn:endsWith("Hello World","World")</td>
		<td>${fn:endsWith("Hello World","World")}</td></tr>
	<tr><td>fn:escapeXml("Use &lt;br/&gt; to change lines")</td>
		<td>${fn:escapeXml("Use <br/> to change lines")}</td></tr>
	<tr><td>fn:indexOf("Stella Cadente", "Cadente")</td>
		<td>${fn:indexOf("Stella Cadente","Cadente")}</td></tr>
	<tr><td>fn:join(myArray, ",")</td>
		<td>(this function does't work)</td></tr>
	<tr><td>fn:length("Stella Cadente")</td>
		<td>${fn:length("Stella Cadente")}</td></tr>
	<tr><td>fn:replace("Stella Cadente", "e", "E")</td>
		<td>${fn:replace("Stella Cadente", "e", "E")}</td></tr>
	<tr><td>fn:split("my,world", ",")</td>
		<td>${fn:split("my,world", ",")}</td></tr>
	<tr><td>fn:startsWith("Stella Cadente", "St")</td>
		<td>${fn:startsWith("Stella Cadente", "St")}</td></tr>
	<tr><td>fn:substring("Stella Cadente", 0, 4)</td>
		<td>${fn:substring("Stella Cadente", 0, 4)}</td></tr>
	<tr><td>fn:substringAfter("Stella Cadente", "e")</td>
		<td>${fn:substringAfter("Stella Cadente", "e")}</td></tr>
	<tr><td>fn:substringBefore("Stella Cadante", "e")</td>
		<td>${fn:substringBefore("Stella Cadante", "e")}</td></tr>
	<tr><td>fn:toLowerCase("Stella Cadente")</td>
		<td>${fn:toLowerCase("Stella Cadente")}</td></tr>
	<tr><td>fn:toUpperCase("Stella Cadente")</td>
		<td>${fn:toUpperCase("Stella Cadente")}</td></tr>
	<tr><td>fn:trim("     Stella Ca   den t  e   ")</td>
		<td>${fn:trim("     Stella Ca   den t  e   ")}</td></tr>
	<tr><td><a href="welcome.jsp">return</a></td><td></td></tr>
</table>
</body>
</html>