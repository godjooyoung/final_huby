<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<br><br><br><br>
<div class="w3-sidebar w3-bar-block w3-light-grey w3-card"
	style="width: 130px">
	<h5 class="w3-bar-item">Menu</h5>
	<button class="w3-bar-item w3-button tablink"
		onclick="openCity(event, 'London')">London</button>
	<button class="w3-bar-item w3-button tablink"
		onclick="openCity(event, 'Paris')">Paris</button>
	<button class="w3-bar-item w3-button tablink"
		onclick="openCity(event, 'Tokyo')">Tokyo</button>
</div>
<br><br><br><br><br><br><br><br>
<div style="margin-left: 130px">
	<div class="w3-padding">Vertical Tab Example (sidebar)</div>

	<div id="London" class="w3-container city" style="display: none">
		<h2>London</h2>
		<p>London is the capital city of England.</p>
		<p>It is the most populous city in the United Kingdom, with a
			metropolitan area of over 13 million inhabitants.</p>
	</div>

	<div id="Paris" class="w3-container city" style="display: none">
		<h2>Paris</h2>
		<p>Paris is the capital of France.</p>
		<p>The Paris area is one of the largest population centers in
			Europe, with more than 12 million inhabitants.</p>
	</div>

	<div id="Tokyo" class="w3-container city" style="display: none">
		<h2>Tokyo</h2>
		<p>Tokyo is the capital of Japan.</p>
		<p>It is the center of the Greater Tokyo Area, and the most
			populous metropolitan area in the world.</p>
	</div>

</div>
<br><br><br><br><br><br><br><br><br><br><br><br>
<script>
	function openCity(evt, cityName) {
		var i, x, tablinks;
		x = document.getElementsByClassName("city");
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none";
		}
		tablinks = document.getElementsByClassName("tablink");
		for (i = 0; i < x.length; i++) {
			tablinks[i].className = tablinks[i].className
					.replace(" w3-red", "");
		}
		document.getElementById(cityName).style.display = "block";
		evt.currentTarget.className += " w3-red";
	}
</script>

</body>
</html>
