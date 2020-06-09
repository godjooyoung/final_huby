<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="/WEB-INF/views/adminlayout/head.jsp"></jsp:include>
<h1 align="center" style="color: #2B333E">QnA</h1><br>
<div align="center">
<div id="qna_table" align="center">
	<div class="qna_row" style="background-color: #2B333E"; align="center">
		<span class="qna_cell qna_col1" style="color: white">문의내용</span>
	</div>
	<div class="qna_row">
		<span class="qna_cell qna_col2" onclick="location.href='qnaselectpage.do'">제목</span>
		<!-- <span class="qna_cell qna_col3"><button type="button" class="btn btn-primary">답변하기</button></span> -->		
	</div>
</div>	
</div>
<jsp:include page="/WEB-INF/views/adminlayout/footer.jsp"></jsp:include>
