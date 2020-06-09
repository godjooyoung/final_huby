<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
</head>
<style>
 .member {
 	padding: 50px; 
 }
</style>
<body>
	<form name="loginform">
		<br><br><br><br><br>
		<h1 align="center">HUBY</h1>
		<br><br><br>
		<div align="center">
				<div class="member" style="display: inline-block">개인회원</br>
					<input type="text" name="id" maxlength="50" placeholder="ID"> <br><br>
					<input type="password" name="password" maxlength="50" placeholder="PW">
				</div>
				<div class="member" style="display: inline-block">기업회원</br>
					<input type="text" name="id" maxlength="50" placeholder="ID"> <br><br>
					<input type="password" name="password" maxlength="50" placeholder="PW">
				</div>
			</div>
				<br><br><br>
		<div align="center">
			<input type="submit" value="로그인" />
			<button type="button" onclick="location.href='main.do' ">홈으로</button>
			<br>
			<br> 
			<a href="memberjoin.do">회원이 아니신가요?</a>
		</div>
	</form>
	<!-- test -->
	<button type="button" onclick="location.href='companyAfterLogin.do'">기업페이지타일즈 테스트</button>
</body>
</html>