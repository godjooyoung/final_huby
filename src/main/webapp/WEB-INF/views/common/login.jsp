<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrapper" align="center">
		<div>
			<h1>HUBY</h1><br/>
		</div>	
		<div>
			<form action="logincheck.do" id="frm" name="frm" method="post">
				아이디 : <input type="text" id="id" name="id"/><br/>
				패스워드 : <input type="password" id="pw" name="pw" /><br/>
			</form>
			<form action="logincheck.do" id="frm" name="frm" method="post">
				아이디 : <input type="text" id="id" name="id"/><br/>
				패스워드 : <input type="password" id="pw" name="pw" /><br/>
			</form>
			<input type="submit" value="로그인">
		</div>
	</div>
</body>
</html>