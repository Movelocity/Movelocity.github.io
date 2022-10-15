<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JSP Implicit Objects</title>
</head>
<body>
	<table>
	<tr><td><b style="color:darkCyan;">Http header</b></td>
		<td><b style="color:orange;">getHeader(header)</b></td></tr>
	<%
		for(Enumeration<String> e = request.getHeaderNames(); e.hasMoreElements();){
			String header = e.nextElement();
			out.println("<tr><td><b>"+header+"</b></td>"
				+"<td>"+request.getHeader(header)+"</td></tr>");
		}
	%>
	</table>
	<hr/>
	<%
		out.println("Buffer size: "+response.getBufferSize()+"<br/>"
				+"Session id: "+session.getId()+"<br/>"
				+"Servlet name: "+config.getServletName()+"<br/>"
				+"Server info: "+application.getServerInfo());
	%>
</body>
</html>