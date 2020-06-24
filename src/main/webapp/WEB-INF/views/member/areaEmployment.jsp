<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="w3-container">
	<h2>지역별</h2>
	
	<div class="w3-row">
		<a href="employmentList.do" onclick="openCity(event, 'London');">
		<div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">전체보기
		</div></a> 
		<a href="areaEmployment.do"> <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">지역별
		</div></a> 
		<a href="javascript:void(0)" onclick="openCity(event, 'Tokyo');">
		<div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">직무별
		</div></a>
	</div>


	<div id="Paris" class="w3-container city" style="display: none">
		<h2>Paris</h2>
		<p>Paris is the capital of France.</p>
	</div>


	<div id="London" class="w3-container city" style="display: block">
		<h2>지역별</h2>
		<p>지역별 공고 다</p>
		<div class="w3-container">
			<h2>공고리스트</h2>
			<p>여기서 다보여줌</p>
			<div>
			<select class="form-control input-md" id="location" name="location" onchange="locationcheck(this.value)">
		  		<option value="">지역 선택</option>
		  		<option value="서울">서울</option>
		  		<option value="인천">인천</option>
		  		<option value="경기">경기</option>
		  		<option value="부산">부산</option>
		  		<option value="대구">대구</option>
		  		<option value="광주">광주</option>
		  		<option value="대전">대전</option>
		  		<option value="울산">울산</option>
		  		<option value="세종">세종</option>
		  		<option value="강원">강원</option>
		  		<option value="경남">경남</option>
		  		<option value="경북">경북</option>
		  		<option value="전남">전남</option>
		  		<option value="전북">전북</option>
		  		<option value="충남">충남</option>
		  		<option value="충북">충북</option>
		  		<option value="제주">제주</option>
		  		<option value="전국">전국</option>
		  	</select>
			</div><br>
			<c:forEach var="elist" items="${elist}" varStatus="sts">
				<ul class="w3-ul w3-card-4">
					<li id="locationemp${sts.index}" class="w3-bar">
					<span
						onclick="this.parentElement.style.display='none'"
						class="w3-bar-item w3-button w3-white w3-xlarge w3-right">×</span>
						<img src="img_avatar2.png"
						class="w3-bar-item w3-circle w3-hide-small" style="width: 85px">
						<div  class="w3-bar-item" onclick="locationEmploymentList('${elist.EMPLOYMENT_ID}', '${sts.index}')">
							<a onclick="empDetail(event,'${elist.EMPLOYMENT_ID}')"> <span
								class="w3-large">${elist.EMPLOYMENT_TITLE}</span></a><br> <span>${elist.HOPE_JOB_POSITION}</span>
						</div></li>						
				</ul>
						<div id="appendemp${sts.index}"></div>
				<ul class="nav nav-pills flex-column" id="emp${elist.EMPLOYMENT_ID}"></ul>
				<br>
			</c:forEach>

		</div>
	</div>
</div>

<script>
	function locationcheck(selected){
		var choice = $("#location option:selected").val();
		location.href='areaEmployment.do?hope_location='+choice;
		alert(choice);
	}

	function openCity(evt, cityName) {
		var i, x, tablinks;
		x = document.getElementsByClassName("city");
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none";
		}
		tablinks = document.getElementsByClassName("tablink");
		for (i = 0; i < x.length; i++) {
			tablinks[i].className = tablinks[i].className.replace(
					" w3-border-red", "");
		}
		document.getElementById(cityName).style.display = "block";
		evt.currentTarget.firstElementChild.className += " w3-border-red";
	}
</script>
<script>
	function selectApplyList(eid, index) {
		$.ajax({
		    url: "selectApplyList.do",
		    type: "POST",
		    dataType: "json",
		    data: {'employment_id':eid},
		    success: function(data){
		    	$("#appendemp"+index).empty();
		    	var closeBtn = '<span onclick="this.parentElement.style.display=\'none\'" class="w3-bar-item w3-button w3-white w3-xlarge w3-right">×</span>';
		    	$("#appendemp"+index).append(data.employment_title + "<br>");
		    	$("#appendemp"+index).append(data.employment_contents + "<br>");
		    	$("#appendemp"+index).append(data.hope_career + "<br>");
		    	$("#appendemp"+index).append(data.hope_graduate + "<br>");
		    	$("#appendemp"+index).append(data.hope_job_position + "<br>");
		    	$("#appendemp"+index).append(closeBtn);
		    	$("#appendemp"+index).append(data.hope_job + "<br>");
		    	$("#appendemp"+index).append(data.hope_location + "<br>");
		    	$("#appendemp"+index).append(data.hope_work_type + "<br>");
		    	$("#appendemp"+index).append(data.employment_prefer + "<br>");
		    	$("#appendemp"+index).append(data.hope_salary);
		    },

			error : function() {
				alert("에러 발생. 관리자에게 문의주세요.");
			}
		})

};
</script>