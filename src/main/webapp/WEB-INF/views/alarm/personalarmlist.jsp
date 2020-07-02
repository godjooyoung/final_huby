<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<style>
.alarmlist {
	margin: 0;
	height: 500px;
}
</style>
<br>
<br>
<br>
<br>
<br>
<br>
<script type="text/javascript">

	//면접제의 상세보기
	function interviewOk(e,company_id,member_id,alarm_id) {
		var button = $(e.target).next()
		$.ajax({
			type:"get",
			url:"companyselect.do",
			data: {'company_id':company_id },
			dataType: 'json',
			success:
				function(data){
					console.log(data);
						button.append("<br>" +"업종: " + data[0].business_type + "<br>" 
													+ "주소: " + data[0].company_addr + "<br>" 
													+ "업태: " + data[0].business_category + "<br>" )
						          .append($('<input type="button" id="btn" class="btn btn-primary" value="면접수락">').data("companyid", company_id).data("memberid", member_id).data("alarmid", alarm_id))
						        
					
			}
		})
	}
	//면접제의 수락
	function chatOk(){
		$(document).on("click", ".btn", function(event){
			var companyid = $(this).data("companyid")
			var memberid = $(this).data("memberid")
			var alarmid = $(this).data("alarmid")
			$.ajax({
				type:"post",
				url:"currentY.do",
				data: { 'companyid': companyid , 'memberid': memberid, 'alarmid': alarmid },
				dataType: 'json',
				success:
					function(data){
					if(data == 1){
						alert("면접 수락이 완료되었습니다.")
						$('.btn').attr('disabled', true);
						return
					}
				}
			});
		});
	}
	chatOk();
	
	
	//입사지원요청 상세보기
	function applyOk(alarm_id,company_id,member_id,alarm_message,employment_id){
		location.href = "selectresumepage.do?employment_id="+employment_id;
	}
	
	//거절
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
<table class="table">
<thead class="thead-light">
	<tr>
		<th>기업명</th>
		<th>알림메세지</th>
		<th>알림일시</th>
		<th></th>
	</tr>
</thead>
<tbody>
	<c:forEach var="list" items="${personalarmlist }"> 
			<tr>
				<td>${list.company_name }</td>
				<td>${list.alarm_message }</td>
				<td>${list.alarm_time }</td>
				
			<c:if test="${list.alarm_message eq '면접제의' }">
				<td><input type="button" value="회사정보보기"
					onclick="interviewOk(window.event,'${list.company_id}','${list.member_id }','${list.alarm_id }')">
				<div id="btnsubmit"></div>
				<input type="button" value="거절" onclick="alarmRe('${list.alarm_id }','${list.company_id}','${list.member_id}')">
			</td></c:if>
			
			<c:if test="${list.alarm_message eq '입사지원요청' }">
				<td><input type="button" value="공고보기"
				onclick="applyOk('${list.alarm_id}','${list.company_id}','${list.member_id}','${list.alarm_message }','${list.employment_id }')">
				<input type="button" value="거절" onclick="alarmRe('${list.alarm_id }')">
			</td></c:if>
			</tr>
	</c:forEach>
	</tbody>
	</table>
	</div>

<form action="currentY.do" method='POST' name="frmok" id="frmok">
	<input type="hidden" name="alarmid"> <input type="hidden"
		name="companyid"> <input type="hidden" name="memberid">
</form>

<form action="alarmdelete.do" method='POST' name="frmre" id="frmre">
	<input type="hidden" name="alarmid">
</form>


