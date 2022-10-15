<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shapes</title>
<link rel="stylesheet" href="../styles/shapes.css?version=<?php echo date('YmdHi'); ?>" 
		media="screen" type="text/css"/>
</head>
<body>
	<div class="round1">R1:<script type="text/php"><?php echo date('YmdHi'); ?></script></div>
	<div class="ellipse">Ellipse:</div>
	<div class="ellipse-adjustable">Ellipse2:</div>
	<div class="ellipse-half1">1:</div>
	<div class="ellipse-half2">2:</div>
	<div class="quarter-ellipse">1/4:</div>
	<div class="parallelograms1"><div>Click me</div></div>
	<div class="button">Button</div>
	<div class="picture"><img src="../img/bread-girl.jpg" alt="..."></div>
	<div><img class="diamond" src="../img/bread-girl.jpg" alt="..."></div>
	<div class="corner">Cut the bottom-right corner using linear gradient</div>
	<div class="corner2">Cut two corners, the bottom-left, the bottom right.
						And use different color to distinguish.</div>
	<div class="bevel-corners-gradients">Card with four corners.</div>
	<div class="scoop-corner">Make four parts using radial-gradient<br/><br/></div>
	<div class="svg-border">svg-border</div>
	<div class="dd">3D style</div>
	<div class="tab"><a href="nav-example.html" style="color:white;">TAB THIS</a></div>
	
</body>
</html>