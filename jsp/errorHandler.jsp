<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<style>.button{
			display: block; height:100px; width:300px; background:#34696f;
			border: 2px solid rgba(33, 68, 72, 0.59);color:rgba(0,0,0,0.59);
			text-align: center;
			font: bold 3.2em/100px "Helvetica Neue", Arial, Helvetica, Geneva, sans-serif;
			
			background: linear-gradient(top, #34696f, #2f5f63);
			border-radius: 50px;
			box-shadow: 0 8px 0 #1b383b;
			text-shadow: 0 2px 2px rgba(255, 255, 255, 0.2);
			
			}
		a.button2{
			text-decocation:none;
		}
		a.button:hover {
 			background: #3d7a80;
 			background: -webkit-linear-gradient(top, #3d7a80, #2f5f63);
 			background: -moz-linear-gradient(top, #3d7a80, #2f5f63);
 			background: -o-linear-gradient(top, #3d7a80, #2f5f63);
 			background: -ms-linear-gradient(top, #3d7a80, #2f5f63);
 			background: linear-gradient(top, #3d7a80, #2f5f63);
}
</style>
<title>Error</title>
</head>
<body>
<div style="font-size:xx-large;color:blue;font-weight:bold;">
An error has occurred.<br/>
Error message:</div>
<div style="font-size:xx-large;color:red">
<%=exception.toString()%>
</div>
<br/>
<a href="welcome.jsp" class="button">Go Back</a>
</body>
</html>