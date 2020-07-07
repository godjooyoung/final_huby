<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
ul {
	width: 500px;
	margin-left: auto;
	margin-right: auto;
}
</style>
<script>
	function checkAlarmDelete() {
		if (confirm("삭제하시겠습니까?") == true) {
			//$("#frm").attr("action", "checkAlarmDelete.do");
			$("#alarm_id").closest("#alarmlist").remove();

			//document.frm.submit();
			//} else {
			//	return;
		}
	}
</script>
<div id="sub_content_wrap" class="sub0101">
	<div class="ov inner center" style="margin: 10% auto 5%;">
		<h1 align="center">
			<box-icon name='bell-ring' type='solid' animation='tada'
				color='#134a8e' size='45px'></box-icon>
			알림내역
		</h1>
		<br> <br> <br>
		<div class="alarmlist" align="center">
			<br />
			<form id="frm" name="frm" method="post">
				<!-- <button class="btn btn-outline-primary btn-sm" type="button"
			onclick="checkAlarmDelete()">선택한 알림 삭제</button><br><br> -->
				<br>
				<c:forEach var="list" items="${companyalarmlist }">
					<ul class="list-group">

						<li class="list-group-item">${list.member_name }님이
							${list.alarm_message }를 수락하셨습니다. <!-- <input type="checkbox" id="alarm_id" name="alarm_id"
				value="${list.alarm_id }"> -->
						</li>
						<br>
					</ul>
				</c:forEach>
			</form>
		</div>
	</div>
</div>
		<c:set var="list" value="${companyalarmlist}" />
		<c:if test="${empty companyalarmlist}">
			<div align="center">
				<h2>
					받은 알림이 없습니다.
				</h2>
			</div>
		</c:if>
<br>
<br>
<br>
<br>
<br>
<br>
