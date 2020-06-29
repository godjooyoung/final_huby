<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/views/adminlayout/head.jsp"></jsp:include>
<script>
	function qnaAnswer(qid){
		$("#q_id").val(qid);
		$("#frm").attr("action", "qnaAnswerInsert.do");
		document.frm.submit();
	}
</script>
<form id="frm" name="frm" method="post">
<div align="center">
<h1>문의내역</h1>
${ qvo.q_id }<br>
${ qvo.q_title }<br>
${ qvo.q_contents }<br>
${ qvo.q_date }<br>
<c:choose>
	<c:when test="${ qvo.company_id != null }">
		${ qvo.company_id }
	</c:when>
	<c:otherwise>
		${ qvo.member_id }<br>	
	</c:otherwise>
</c:choose>
<input type="button" value="답변하기" class="btn-primary" onclick="qnaAnswer(${ qvo.q_id })">
<br>
<textarea rows="30" cols="50" required="required" name="q_answer"></textarea>
</div>
<input type="hidden" id="q_id" name="q_id">
</form>
<jsp:include page="/WEB-INF/views/adminlayout/footer.jsp"></jsp:include>
