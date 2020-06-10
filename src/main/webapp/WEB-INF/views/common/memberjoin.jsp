<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 기업 개인 구분</title>
</head>
<style>
	#logo{
	margin: 30px 100px 100px;
	}
</style>
<body>
	<div id="logo">
		<img src="${pageContext.request.contextPath}/img/common/logo.jpg">
 </div>
	<div align="center">
		<h1>회원가입 유형을 선택해주세요</h1>
		<br><br><br>
		<button type="button" onclick="location.href='personalmemberjoin.do'">개인회원</button>
		<button type="button">기업회원</button>
	</div>
</body>
</html>