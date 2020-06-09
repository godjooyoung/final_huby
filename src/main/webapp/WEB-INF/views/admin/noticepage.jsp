<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="/WEB-INF/views/adminlayout/head.jsp"></jsp:include>
<h1 align="center" style="color: #2B333E">공 지 사 항</h1><br>
<div id="notice_table">
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
</div>
<jsp:include page="/WEB-INF/views/adminlayout/footer.jsp"></jsp:include>
