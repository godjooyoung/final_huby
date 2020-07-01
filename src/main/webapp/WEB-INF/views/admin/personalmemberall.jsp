<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	table, tr, td{ 
	border: 1px solid lightgray; 
	border-collapse: collapse;
	}
</style>
</head>
<body>
<div align="center">
<h1> 개인회원 목록 </h1>
<table>
<tr style="background: light_gray">
<td>아이디</td>
<td>이름</td>
<td>생일</td>
<td>주소</td>
<td>전화번호</td>
<td>이메일</td>
<td>성별</td>
<td>가입일</td>
</tr>
<c:forEach items="${ mlist }" var="member">
<tr>
<td>${ member.member_id }</td>
<td>${ member.member_name }</td>
<td>${ member.member_birth }</td>
<td>${ member.member_addr }</td>
<td>${ member.member_tel }</td>
<td>${ member.member_email }</td>
<td>${ member.member_gender }</td>
<td>${ member.member_date }</td>
</tr>
</c:forEach>
</table>
</div>
</body>
</html>