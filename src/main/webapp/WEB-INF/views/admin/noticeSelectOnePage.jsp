<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function back(){
		history.back();
	}
	
	function noticeUpdate(nid){
		$("#nid").val(nid);
		$("#frm").attr("action","noticeUpdate.do");
		document.frm.submit();
	}
</script>
</head>
<body>
<form id="frm" name="frm" method="post">
<div align="center">
<h1>공지글 상세히보기</h1>
<table>
<tr>
<th>제목</th>
<td><input type="text" id="notice_title" name="notice_title" style="width: 550px" required="required" value="${ nvo.notice_title }"></td>
</tr>
<tr>
<th>내용</th>
<td><textarea rows="30" cols="80" id="notice_contents" name="notice_contents">${ nvo.notice_contents }</textarea></td>
</tr>
</table>
<br>
<button type="button" class="btn-primary" onclick="noticeUpdate(${nvo.notice_id})">수정하기</button>
<button type="reset" class="btn-primary">취소</button>
<button type="button" class="btn-primary" onclick="back()">이전페이지</button>
<input type="hidden" id=nid name="notice_id">
<br>
</div>
</form>
</body>
</html>