<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Karma", sans-serif}
.w3-bar-block .w3-bar-item {padding:20px}
</style>
<title>HUBY</title>
</head>


<body id="page-top">
	<div id="wrapper">
		<tiles:insertAttribute name="top" />
		<div id="contents">
			<tiles:insertAttribute name="header" />
			<tiles:insertAttribute name="body" />
			<tiles:insertAttribute name="footer" />
		</div>
	</div>

	<!--JavaScript-->
	<script>
	// Script to open and close sidebar
	function w3_open() {
  	document.getElementById("mySidebar").style.display = "block";
	}
 
	function w3_close() {
  	document.getElementById("mySidebar").style.display = "none";
	}
	</script>
	
	
</body>
</html>