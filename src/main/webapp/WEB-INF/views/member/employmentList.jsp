<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="w3-container">
	<h2>전체채용공고스</h2>
	<div class="w3-row">
		<a href="javascript:void(0)" onclick="openCity(event, 'London');">
			<div
				class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">전체보기</div>
		</a> <a href="javascript:void(0)" onclick="openCity(event, 'Paris');">
			<div
				class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">지역별</div>
		</a> <a href="javascript:void(0)" onclick="openCity(event, 'Tokyo');">
			<div
				class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">직무별</div>
		</a>
	</div>


	<div id="Paris" class="w3-container city" style="display: none">
		<h2>Paris</h2>
		<p>Paris is the capital of France.</p>
	</div>


	<div id="London" class="w3-container city" style="display: block">
		<h2>전체</h2>
		<p>채용공고전부다</p>
		${elist }
		<div class="w3-container">
			<h2>공고리스트</h2>
			<p>여기서 다보여줌</p>
			<c:forEach var="elist" items="${elist}">
				<ul class="w3-ul w3-card-4">
					<li class="w3-bar"><span
						onclick="this.parentElement.style.display='none'"
						class="w3-bar-item w3-button w3-white w3-xlarge w3-right">×</span>
						<img src="img_avatar2.png"
						class="w3-bar-item w3-circle w3-hide-small" style="width: 85px">
						<div class="w3-bar-item">
							<a onclick="empDetail(event,'${elist.EMPLOYMENT_ID}')"> <span
								class="w3-large">${elist.EMPLOYMENT_TITLE}</span></a><br> <span>${elist.HOPE_JOB_POSITION}</span>
						</div></li>
				</ul>
				<ul class="nav nav-pills flex-column" id="emp${elist.EMPLOYMENT_ID}"></ul>
				<br>
			</c:forEach>

		</div>
	</div>
</div>

<script>
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
	function empDetail(e, empid) {
		var place = document.getElementById("emp" + empid);
		var plusLi = document.createElement('li');
		$.ajax({
			type : "get",
			url : "empDetaleList.do",
			data : {
				'empno' : empid
			},
			dataType : 'json',
			success : function(data) {
				console.log(data[0]);

				$(place).empty();
				$.each(data, function(idx, item) {
					$('<li>').html(
							"공고제목:" + item.EMPLOYMENT_TITLE + "<br>" + "직급:"
									+ item.HOPE_JOB_POSITION + "<br>" + "지역:"
									+ item.HOPE_LOCATION + "<br>" + "내용:"
									+ item.EMPLOYMENT_CONTENTS + "<br>"
									+ item.HOPE_WORK_TYPE).appendTo(place)
							+ "<button type=\"button\">지원하기</button>";
				});//each

			},

			error : function() {
				alert("에러 발생. 관리자에게 문의주세요.");
			}
		})

	};
</script>