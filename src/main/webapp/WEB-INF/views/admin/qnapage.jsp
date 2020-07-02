<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="/WEB-INF/views/adminlayout/head.jsp"></jsp:include>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<style>
#timeline {
	list-style: none;
	position: relative;
}

#timeline:before {
	top: 0;
	bottom: 0;
	position: absolute;
	content: " ";
	width: 2px;
	background-color: #4997cd;
	left: 50%;
	margin-left: -1.5px;
}

#timeline .clearFix {
	clear: both;
	height: 0;
}

#timeline .timeline-badge {
	color: #fff;
	width: 50px;
	height: 50px;
	font-size: 1.2em;
	text-align: center;
	position: absolute;
	top: 20px;
	left: 50%;
	margin-left: -25px;
	background-color: #4997cd;
	z-index: 100;
	border-top-right-radius: 50%;
	border-top-left-radius: 50%;
	border-bottom-right-radius: 50%;
	border-bottom-left-radius: 50%;
}

#timeline .timeline-badge span.timeline-balloon-date-day {
	font-size: 1.4em;
}

#timeline .timeline-badge span.timeline-balloon-date-month {
	font-size: .7em;
	position: relative;
	top: -10px;
}

#timeline .timeline-badge.timeline-filter-movement {
	background-color: #ffffff;
	font-size: 1.7em;
	height: 35px;
	margin-left: -18px;
	width: 35px;
	top: 40px;
}

#timeline .timeline-badge.timeline-filter-movement a span {
	color: #4997cd;
	font-size: 1.3em;
	top: -1px;
}

#timeline .timeline-badge.timeline-future-movement {
	background-color: #ffffff;
	height: 35px;
	width: 35px;
	font-size: 1.7em;
	top: -16px;
	margin-left: -18px;
}

#timeline .timeline-badge.timeline-future-movement a span {
	color: #4997cd;
	font-size: .9em;
	top: 2px;
	left: 1px;
}

#timeline .timeline-movement {
	border-bottom: solid 1px #000080;
	position: relative;
}

#timeline .timeline-movement.timeline-movement-top {
	height: 60px;
}

#timeline .timeline-movement .timeline-item {
	padding: 20px 0;
}

#timeline .timeline-movement .timeline-item .timeline-panel {
	border: 1px solid #d4d4d4;
	border-radius: 3px;
	background-color: #FFFFFF;
	color: #666;
	padding: 10px;
	position: relative;
	-webkit-box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
	box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
}

#timeline .timeline-movement .timeline-item .timeline-panel .timeline-panel-ul
	{
	list-style: none;
	padding: 0;
	margin: 0;
}

#timeline .timeline-movement .timeline-item .timeline-panel.credits .timeline-panel-ul
	{
	text-align: right;
}

#timeline .timeline-movement .timeline-item .timeline-panel.credits .timeline-panel-ul li
	{
	color: #666;
}

#timeline .timeline-movement .timeline-item .timeline-panel.credits .timeline-panel-ul li span.importo
	{
	color: #468c1f;
	font-size: 1.3em;
}

#timeline .timeline-movement .timeline-item .timeline-panel.debits .timeline-panel-ul
	{
	text-align: left;
}

#timeline .timeline-movement .timeline-item .timeline-panel.debits .timeline-panel-ul span.importo
	{
	color: #e2001a;
	font-size: 1.3em;
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
<div class="container">
	<div id="timeline">
		<div class="row timeline-movement timeline-movement-top"></div>
		<div class="row timeline-movement">
			<div class="col-sm-6  timeline-item">
				<div class="row">
					<h1 align="center">개인 문의 내역</h1>
				</div>
			</div>
			<div class="col-sm-6  timeline-item">
				<div class="row">
					<div class="row">
					<h1 align="center">기업 문의 내역</h1>
				</div>
				</div>
			</div>
			<div class="col-sm-6  timeline-item">
			<c:forEach items="${ qlist }" var="qlist">
			<c:if test="${ qlist.member_id != null }">
				<c:if test="${ qlist.q_answer == null }">
				<div class="row">
					<div class="col-sm-11">
						<div class="timeline-panel credits">
							<ul class="timeline-panel-ul">
								<li><span class="importo">${ qlist.q_title }</span></li>
								<fmt:formatDate value="${ qlist.q_date }" pattern="yyyy-MM-dd HH:mm:ss" var="q_date" />
								<li><p>
								<large class="text-muted">
								<i class="glyphicon glyphicon-time"></i>${ q_date }</large>
								</p></li>
							</ul>
								<div align="right">
								<input class="btn-success" type="button" onclick="answer('${ qlist.q_id }')" value="답변하기" />
								</div>
						</div>
					</div>
				</div>
				</c:if>
			</c:if>
			</c:forEach>
			</div>
			<div class="col-sm-6  timeline-item">
			<c:forEach items="${ qlist }" var="qlist">
			<c:if test="${ qlist.company_id != null }">
				<c:if test="${ qlist.q_answer == null }">
				<div class="row">
					<div class="col-sm-offset-1 col-sm-11">
						<div class="timeline-panel debits">
							<ul class="timeline-panel-ul">
								<li><span class="importo">${ qlist.q_title }</span></li>
								<fmt:formatDate value="${ qlist.q_date }" pattern="yyyy-MM-dd HH:mm:ss" var="q_date" />
								<li><p>
								<large class="text-muted">
								<i class="glyphicon glyphicon-time"></i>${ q_date }</large>
								</p></li>
							</ul>
								<div align="left">
								<input class="btn-danger" type="button" onclick="answer('${ qlist.q_id }')" value="답변하기" />
								</div>
						</div>

					</div>
				</div>
				</c:if>
			</c:if>
			</c:forEach>
			</div>
		</div>
	</div>
</div>
<input type="hidden" id="q_id" name="q_id">
</form>
<jsp:include page="/WEB-INF/views/adminlayout/footer.jsp"></jsp:include>
