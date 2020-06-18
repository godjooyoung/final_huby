<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function applyinfoall(cid, eid){
		$("#company_id").val(cid);
		$("#employment_id").val(eid);
		$("#frm").attr("action","applyinfoall.do");
		document.frm.submit();
	}
</script>
</head>
<body>
<form id="frm" name="frm" method="post">
<br><br><br><br><br><br><br><br><br>
<div align="center">
<hr style="border: solid 10px red;">
${ empMatch }
<hr style="border: solid 10px red;">
<br>
<button class="btn-primary" type="button" style="height: 50px; size: 50px;" onclick="applyinfoall('${company_id}','${ employment_id }')">지원하기</button>
</div>
<input type="hidden" id="company_id" name="company_id">
<input type="hidden" id="employment_id" name="employment_id">
</form>
</body>
</html>