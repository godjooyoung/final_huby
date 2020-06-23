<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<style>
.alarmlist {
	margin: 0;
	height: 700px;
}
</style>
<br>
<br>
<br>
<br>
<br>
<br>
<script type="text/javascript">
	function alarmOk(alarm_id,company_id,member_id) {


			document.frmok.alarmid.value = alarm_id
			document.frmok.companyid.value = company_id
			document.frmok.memberid.value = member_id
			document.frmok.submit();
		}
	

	function alarmRe(alarm_id) {
		if (confirm("거절하시겠습니까?\n거절 시 내역에서 삭제됩니다.") == true) {
			document.frmre.alarmid.value = alarm_id
			document.frmre.submit();
		} else {
			return;
		}

	}
</script>

<div class="alarmlist">
	<c:forEach var="list" items="${personalarmlist }">
		<br>[${list.company_name }]
				${list.alarm_message }
				${list.alarm_time }<br>
		<input type="button" value="수락"
			onclick="alarmOk('${list.alarm_id}','${list.company_id}','${list.member_id}')">
		<input type="button" value="거절" onclick="alarmRe('${list.alarm_id }')">

	</c:forEach>
</div>

<form action="currentY.do" method='POST' name="frmok" id="frmok">
	<input type="hidden" name="alarmid"> <input type="hidden"
		name="companyid"> <input type="hidden" name="memberid">
</form>

<form action="alarmdelete.do" method='POST' name="frmre" id="frmre">
	<input type="hidden" name="alarmid">
</form>


