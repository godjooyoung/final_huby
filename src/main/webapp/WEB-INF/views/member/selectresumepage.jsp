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
		$("#COMPANY_ID").val(cid);
		$("#EMPLOYMENT_ID").val(eid);
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
<button class="btn-primary" type="button" style="height: 50px; size: 50px;" onclick="applyinfoall('${empMatch.COMPANY_ID}','${empMatch.EMPLOYMENT_ID}')">지원하기</button>
</div>
<input type="hidden" id="COMPANY_ID" name="COMPANY_ID">
<input type="hidden" id="EMPLOYMENT_ID" name="EMPLOYMENT_ID">
</form>
</body>
</html>