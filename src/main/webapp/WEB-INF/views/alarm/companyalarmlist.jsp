<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<br>
<br>
<br>
<br>
<br>
<br>

<style>
.alarmlist {
	margin: 0;
	height: 500px;
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


	<div class="alarmlist">
		<br />
<form id="frm" name="frm" method="post">
		<button class="btn btn-outline-primary btn-sm" type="button"
			onclick="checkAlarmDelete()">선택한 알림 삭제</button>
		<br>
		<c:forEach var="list" items="${companyalarmlist }">
				<div id="alarmlist">
				${list.member_name }님이
				${list.alarm_message }를 수락하셨습니다.
				<input type="checkbox" id="alarm_id" name="alarm_id"
				value="${list.alarm_id }">
				</div>
			<br>
		</c:forEach>
</form>
	</div>