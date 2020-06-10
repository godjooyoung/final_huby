<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function MemberInsertJoin(){
		$("#frm").attr("action","MemberInsertJoin.do");
		$("#frm").submit();
	}
</script>
</head>
<body>
<form id="frm" name="frm" method="post" enctype="multipart/form-data">
개인 회원가입<br>
아이디:<input type="text" id="member_id" name="member_id" width="200px" ><br>
비번:<input type="password" id="member_pw" name="member_pw" width="200px"><br>
이름:<input type="text" id="member_name" name="member_name" width="200px"><br>
생일:<input type="date" id="member_birth" name="member_birth" width="200px"><br>
주소:<input type="text" id="member_addr" name="member_addr" width="200px"><br>
번호:<input type="text" id="member_tel" name="member_tel" width="200px"><br>
이메일:<input type="text" id="member_email" name="member_email" width="200px"><br>
성별:<input type="radio" id="member_gender" name="member_gender" width="200px" value="M">남
	<input type="radio" id="member_gender" name="member_gender" width="200px" value="W">여
<br>
프로필사진:<input type="file" id="member_photo" name="uploadFile" width="200px"><br>

<button type="button" onclick="MemberInsertJoin()">전송</button>
</form>
</body>
</html>