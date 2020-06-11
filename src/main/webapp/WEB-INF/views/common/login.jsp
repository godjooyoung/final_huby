<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>login</title>
</head>
<style>
 .member {
 	padding: 50px; 
 }
</style>
<script>
	function logingo(){
		$("#frm").attr("action","PersonalLoginCheck.do");
		$("#frm").submit();
	}
</script>
<script>
	function companylogingo(){
		$("#frm2").attr("action","CompanyLoginCheck.do")
		$("#frm2").submit();
	}
</script>
<body>
	<form id="frm" name="frm" method="post">
		<h1 align="center">HUBY</h1>
		<div align="center">
				<div class="member" style="display: inline-block">개인회원</br>
					<input type="text" name="member_id" maxlength="50" placeholder="ID"> <br><br>
					<input type="password" name="member_pw" maxlength="50" placeholder="PW"><br><br>
					<button type="button" onclick="logingo()">로그인</button>
				</div>
		</div>
	</form>	
	<form id="frm2" name="frm2" method="post">
		<div align="center">
				<div class="member" style="display: inline-block">기업회원</br>
					<input type="text" name="company_id" maxlength="50" placeholder="ID"> <br><br>
					<input type="password" name="company_pw" maxlength="50" placeholder="PW"><br><br>
					<button type="button" onclick="companylogingo()">로그인</button>
				</div>
		</div>
	</form>	
				<br><br><br>
		<div align="center">
			<button type="button" onclick="location.href='main.do' ">홈으로</button>
			<br>
			<br> 
			<a href="memberjoin.do">회원이 아니신가요?</a>
		</div>

	<!-- test -->
	<button type="button" onclick="location.href='companyAfterLogin.do'">기업페이지타일즈 테스트</button>
</body>
</html>