<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE>
<jsp:include page="/WEB-INF/views/adminlayout/head.jsp"></jsp:include>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function back(){
		history.back();
	}
	
	function qnaAnswer(qid){
		$("#q_id").val(qid);
		$("#frm").attr("action", "qnaAnswerInsert.do");
		document.frm.submit();
	}
</script>
<form id="frm" name="frm" method="post">
	<fmt:formatDate value="${ qvo.q_date }" pattern="yyyy-MM-dd"
		var="q_date" />
	<c:choose>
		<c:when test="${ qvo.company_id != null }">
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
	<div>
		<h1 align="center">문의내역</h1>
		<input type="hidden" name="q_id" value="${ qvo.q_id }">
		<div class="container">
			<div class="col-md-12">
				<div class="form-area">
					<br style="clear: both">
					<div class="form-group">
							<font style="font-weight: bolder;font-size: larger;">아이디:</font>&nbsp;&nbsp;<font style="font-size: large;">${ qvo.company_id }${ qvo.member_id }</font> 
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<font style="font-weight: bolder;font-size: larger;">Date:</font>&nbsp;&nbsp;<font style="font-size: large;">${ q_date }<br></font>
							<font style="font-weight: bolder;font-size: larger;">제목:</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-size: large;">${ qvo.q_title }<br></font>
							<font style="font-weight: bolder;font-size: larger;">내용:</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-size: large;">${ qvo.q_contents }</font>
					</div>
				</div>
			</div>
		</div>

	</div>
	<div align="center">
		<div class="container">
			<div class="col-md-12">
				<div class="form-area">
					<br style="clear: both">
					<div class="form-group">
						<textarea class="form-control" type="textarea"
							id="notice_contents" name="q_answer" maxlength="1000" rows="10"
							required="required"></textarea>
						<span class="help-block"><p id="characterLeft"
								class="help-block ">HUBY</p></span>
					</div>
				</div>
				<div align="center">
					<button type="button" class="btn btn-primary pull-right"
						onclick="back()">이전페이지</button>
					<input type="button" class="btn btn-primary pull-right"
						value="답변하기" class="btn-primary"
						onclick="qnaAnswer(${ qvo.q_id })">
				</div>
			</div>
		</div>
	</div>
</form>
<jsp:include page="/WEB-INF/views/adminlayout/footer.jsp"></jsp:include>