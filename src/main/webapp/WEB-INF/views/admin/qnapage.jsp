<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="/WEB-INF/views/adminlayout/head.jsp"></jsp:include>
<style>
	div#middlegood1{
	display: flex;
	height: 100vh;
	justify-content: center;
	align-items: center;
	border: solid 1px gray;
	color: black;
	font-weight: bolder;
	font-size: larger;
}
</style>
<script>
	function answer(qid){
		$("#q_id").val(qid);
		$("#frm").attr("action","qnaAnswerPage.do");
		document.frm.submit();
	}
</script>
<form id="frm" name="frm" method="post">
<h1 align="center" style="color: #2B333E">QnA</h1><br>
<div align="center">
<div id="qna_table" align="center">
	<div class="qna_row" style="background-color: #2B333E" align="center">
		<span class="qna_cell qna_col1" style="color: white">문의내용</span>
	</div>
	<div class="qna_row">
		<span class="qna_cell qna_col2" onclick="location.href='qnaselectpage.do'">제목</span>		
	</div>
</div>
</div>
<div class="row">
<div id="middlegood1">	

<span>
<h1>개인문의내역</h1>
<c:forEach items="${ qlist }" var="qlist">
<c:if test="${ qlist.member_id != null }">
${ qlist.q_id }<br>
${ qlist.q_title }<br>
${ qlist.q_contents }<br>
<fmt:formatDate value="${ qlist.q_date }" pattern="yyyy-MM-dd" var="q_date" />
${ q_date }<br>
<input type="button" onclick="answer('${ qlist.q_id }')" value="답변하기">
<br><br>
</c:if>
</c:forEach>
</span>
<span>
<h1>기업문의내역</h1>
<c:forEach items="${ qlist }" var="qlist">
<c:if test="${ qlist.company_id != null }">
${ qlist.q_id }<br>
${ qlist.q_title }<br>
${ qlist.q_contents }<br>
<fmt:formatDate value="${ qlist.q_date }" pattern="yyyy-MM-dd" var="q_date" />
${ q_date }<br>
<input type="button" onclick="answer('${ qlist.q_id }')" value="답변하기">
<br><br>
</c:if>
</c:forEach>
</span>
</div>
</div>


<input type="hidden" id="q_id" name="q_id">
</form>
<jsp:include page="/WEB-INF/views/adminlayout/footer.jsp"></jsp:include>
