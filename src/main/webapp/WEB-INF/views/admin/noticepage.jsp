<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/adminlayout/head.jsp"></jsp:include>
<style>
#table {display: table; width: 100%;}
.row {display: table-row;}
.cell {display: table-cell; padding: 3px; border-bottom: 1px solid #DDD;}
.col1 { width: 20%;}
.col2 {width: 60%;}
.col3 {width: 20%;}
/* .col4 {width: 20%;} */
</style>
<script>
	function noticeSelectOne(nid){
		$("#nid").val(nid);
		$("#frm").attr("action","noticeSelectOnePage.do")
		document.frm.submit();
	}
</script>
<h1 align="center" style="color: #2B333E">공 지 사 항</h1><br>
<div align="center">
<button type="button" class="btn-primary" onclick="location.href='noticeInsertPage.do'"> 글 작성하기 </button>
</div><br><br>
<!-- <div id="notice_table">
	<div class="notice_row" style="background-color: #2B333E">
		<span class="notice_cell notice_col1" style="color: white">번호</span> 
		<span class="notice_cell notice_col2" style="color: white">제목</span>
		<span class="notice_cell notice_col3" style="color: white">작성자</span> 
		<span class="notice_cell notice_col4" style="color: white">등록일자</span>
	</div>
	<div class="notice_row" onclick="location.href='noticeselectpage.do'">
		<span class="notice_cell notice_col1">1</span> 
		<span class="notice_cell notice_col2">게시판 어렵습니다.살려주세요.</span> 
		<span class="notice_cell notice_col3">김밥임</span> 
		<span class="notice_cell notice_col4">2020-07-09</span>
	</div>
</div> -->
<form id="frm" name="frm" method="post">
<div id="table">
<div class="row" style="background: lightgray; font-size: larger; font-weight: bolder; color: black;">
<span class="cell col1">작성자</span>
<span class="cell col2">제목</span>
<span class="cell col3">작성일</span>
</div>
<c:forEach items="${ nlist }" var="notice">
<div class="row" onclick="noticeSelectOne(${notice.notice_id})" style="color: black">
<span class="cell col1">${ notice.admin_id }</span>
<span class="cell col2">${ notice.notice_title }</span>
<fmt:formatDate value="${ notice.notice_date }" pattern="yyyy-MM-dd" var="notice_date" />
<span class="cell col3">${ notice_date }</span>
</div>
</c:forEach>
</div>
<input type="hidden" id="nid" name="notice_id">
</form>
<jsp:include page="/WEB-INF/views/adminlayout/footer.jsp"></jsp:include>
