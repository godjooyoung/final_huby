<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	if( '${num}' == 1){
		alert("로그인 실패, ID/PW를 정확히 입력해주세요.");
	}
</script>
<script>
	function CompanyLoginCheck(){
			
		
			var id = document.getElementById("company_id");
			var pw = document.getElementById("company_pw");
			
			if(id.value == "" && pw.value == ""){
				alert("아이디, 패스워드를 입력하세요.")
				id.focus()
				return false;
			}
			
			if(id.value == ""){
				alert("아이디를 입력하세요.")
				id.focus();
				return false;
			}
			
			if(pw.value == ""){
				alert("패스워드를 입력하세요.")
				pw.focus();
				return false;
			}
			
			else {
				return true;
			}
	}
</script>
<script>
	function PersonalLoginCheck(){
			
			var id = document.getElementById("member_id");
			var pw = document.getElementById("member_pw");
			
			if(id.value == "" && pw.value == ""){
				alert("아이디, 패스워드를 입력하세요.")
				id.focus()
				return false;
			}
			
			if(id.value == ""){
				alert("아이디를 입력하세요.")
				id.focus();
				return false;
			}
			
			if(pw.value == ""){
				alert("패스워드를 입력하세요.")
				pw.focus();
				return false;
			}
			
			else {
				Android.login("안녕");
				return true;
			}
	}
	
	
</script>

<!-- <script>
	function companylogingo(){
		$("#frm2").attr("action","CompanyLoginCheck.do")
		$("#frm2").submit();
	}
</script>
<script>
	function logingo(){
		$("#frm").attr("action","PersonalLoginCheck.do");
		$("#frm").submit();
	}
</script> -->
<body>
	<form id="frm" name="frm" method="post" action="PersonalLoginCheck.do" onsubmit="return PersonalLoginCheck();">
		<h1 align="center">HUBY</h1>
		<div align="center">
				<div class="member" style="display: inline-block">개인회원</br>
					<input type="text" name="member_id" id="member_id" maxlength="50" placeholder="ID"> <br><br>
					<input type="password" name="member_pw" id="member_pw" maxlength="50" placeholder="PW"><br><br>
					<input type="submit" value="로그인">
					<!-- <button type="button" onclick="logingo()">로그인</button> -->
				</div>
		</div>
	</form>	
	<form id="frm2" name="frm2" method="post" action="CompanyLoginCheck.do" onsubmit="return CompanyLoginCheck()">
		<div align="center">
				<div class="member" style="display: inline-block">기업회원</br>
					<input type="text" name="company_id" id="company_id" maxlength="50" placeholder="ID"> <br><br>
					<input type="password" name="company_pw" id="company_pw" maxlength="50" placeholder="PW"><br><br>
					<input type="submit" value="로그인">
					<!-- <button type="button" onclick="companylogingo()">로그인</button> -->
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