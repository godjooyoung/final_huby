<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
</head>
<style>
#loginform1 {
	display: block;
	margin: 0 auto;
	width: 600px;
	height: 50px;
	padding: 0px 300px;
}
</style>
<body>
	<form name="loginform">
		<br><br><br><br><br>
		<h1 align="center">HUBY</h1>
		<br><br><br>
		<div style="width: 50%; float: left;">
			<div id="loginform1">개인회원
				<div>
					<input type="text" name="id" maxlength="50" placeholder="ID"> <br><br>
					<input type="password" name="password" maxlength="50" placeholder="PW">
				</div>
			</div>
		</div>
		<div style="width: 50%; float: right;">
			<div id="loginform2">기업회원
				<div>
					<input type="text" name="id" maxlength="50" placeholder="ID"> <br><br>
					<input type="password" name="password" maxlength="50" placeholder="PW">
				</div>
			</div>
		</div>
		<div style="width: 50%; float: right;"></div>
		<br><br><br><br><br><br><br>
		<div align="center">
			<input type="submit" value="로그인" />
			<button type="button" onclick="location.href='main.do'">홈가기</button>

			<br>
			<br> <a href="memberinsert.do">회원이 아니신가요?</a>
		</div>
	</form>
</body>
</html>