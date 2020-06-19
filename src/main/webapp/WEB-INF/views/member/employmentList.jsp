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
				class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">Paris</div>
		</a> <a href="javascript:void(0)" onclick="openCity(event, 'Tokyo');">
			<div
				class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">Tokyo</div>
		</a>
	</div>

	<div id="London" class="w3-container city" style="display: block">
		<h2>전체</h2>
		<p>채용공고전부다</p>
${elist }
		<div class="w3-container">
			<h2>공고리스트</h2>
			<p>여기서 다보여줌</p>
			<ul class="w3-ul w3-card-4">
				<li class="w3-bar"><span
					onclick="this.parentElement.style.display='none'"
					class="w3-bar-item w3-button w3-white w3-xlarge w3-right">×</span>
					<img src="img_avatar2.png"
					class="w3-bar-item w3-circle w3-hide-small" style="width: 85px">
					<div class="w3-bar-item">
						<span class="w3-large">Mike</span><br> <span>Web
							Designer</span>
					</div></li>

				<li class="w3-bar"><span
					onclick="this.parentElement.style.display='none'"
					class="w3-bar-item w3-button w3-white w3-xlarge w3-right">×</span>
					<img src="img_avatar5.png"
					class="w3-bar-item w3-circle w3-hide-small" style="width: 85px">
					<div class="w3-bar-item">
						<span class="w3-large">Jill</span><br> <span>Support</span>
					</div></li>

				<li class="w3-bar"><span
					onclick="this.parentElement.style.display='none'"
					class="w3-bar-item w3-button w3-white w3-xlarge w3-right">×</span>
					<img src="img_avatar6.png"
					class="w3-bar-item w3-circle w3-hide-small" style="width: 85px">
					<div class="w3-bar-item">
						<span class="w3-large">Jane</span><br> <span>Accountant</span>
					</div></li>
			</ul>
		</div>

	</div>

	<div id="Paris" class="w3-container city" style="display: none">
		<h2>Paris</h2>
		<p>Paris is the capital of France.</p>
	</div>

	<div id="Tokyo" class="w3-container city" style="display: none">
		<h2>Tokyo</h2>
		<p>Tokyo is the capital of Japan.</p>
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
