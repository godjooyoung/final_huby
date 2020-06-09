<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
#loginform{
      display : block;
      margin : 0 auto;
      width:600px;
      height:50px;
      padding: 0px 70px;
      }
</style>
<body>
<form name="loginform" method="post" action="../pro/LoginPro.jsp" 
                onsubmit="return checkValue()">

<br><br><br><br><br>
<h1 align="center">HUBY</h1>
<br><br><br>
 <div style="width:50%; float:left;">
   <table id="loginform">
      <tr>
         <td>아이디</td>
         <td><input type="text" name="id" maxlength="50"></td>
      </tr>
      <tr>
         <td>비밀번호</td>
         <td><input type="password" name="password" maxlength="50"></td>
      </tr>
      </table>
      </div>
      <div style="width:50%; float:right;">
      <table id="loginform">
      <tr>
         <td>아이디</td>
         <td><input type="text" name="id" maxlength="50"></td>
      </tr>
      <tr>
         <td>비밀번호</td>
         <td><input type="password" name="password" maxlength="50"></td>
      </tr>
   </table>
   </div>
   <br><br><br><br><br><br>
   <div align="center">
   <input type="submit" value="로그인" />
   
<br><br>
      <a href="memberinsert.do">회원이 아니신가요?</a>
   </div>
   </form>
</body>
</html>