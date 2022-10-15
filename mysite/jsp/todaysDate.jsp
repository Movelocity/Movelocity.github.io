<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@page import="java.util.Date" %>
<%@page import="java.text.DateFormat" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Today's Date</title>
	<meta name="viewport" content="width=device-width"/>
	<style>.xxlargebold{font-size:xx-large;font-weight:bold;}</style>
</head>
<body>
<div class="xxlargebold">
<%
	DateFormat dateFormat = DateFormat.getDateInstance(DateFormat.LONG);
	String s = dateFormat.format(new Date());
	out.println("Script Date:[ "+s+" ]");
%>
<%--This is a comment--%>
<!-- this is /learnjsp/todaysDate.jsp -->
</div><br/>

jsp:useBean  
<div style="color:#f0e;">
	<jsp:useBean id="today" class="java.util.Date"/><%=today %>
</div><br/>

fmt:timeZone
<fmt:timeZone value="GMT+8:00">
	<fmt:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full"/>
</fmt:timeZone>
<hr/>
<%
	java.text.SimpleDateFormat bartFmt = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String userIp = "";
	if(request.getHeader("x-forwarded-for")==null) userIp=request.getRemoteAddr();
	else userIp = request.getHeader("x-forwarded-for");
	System.out.println("[ "+userIp+" ] 在 "+bartFmt.format(today)+" 访问.");
%>

<fmt:parseNumber var="fotmattedNum" type="number">123</fmt:parseNumber>
<jsp:useBean id="person" class="notebook.Person"/>
<jsp:setProperty name="person" property="firstName" value="Abigail"/>
First Name: <jsp:getProperty name="person" property="firstName"/>
</body>
</html>