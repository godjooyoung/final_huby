<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://malsup.github.com/jquery.form.js"></script>
<script>
	$(function() {
		var bar = $('.bar');
		var percent = $('.percent');
		var status = $('#status');
		$('form').ajaxForm({
			beforeSend : function() {
				status.empty();
				var percentVal = '0%';
				bar.width(percentVal);
				percent.html(percentVal);
			},
			uploadProgress : function(event, position, total, percentComplete) {
				var percentVal = percentComplete + '%';
				bar.width(percentVal);
				percent.html(percentVal);
			},
			complete : function(xhr) {
				alert('성공');
			},
			error : function(e) {
				alert('실패');
			}

		});
	});
</script>

<style>
.progress {
	position: relative;
	width: 400px;
	height:30px;
	border: 1px solid #ddd;
	padding: 1px;
	border-radius: 3px;
}

.bar {
	background-color: #B4F5B4;
	width: 0%;
	height: 20px;
	border-radius: 3px;
}

.percent {
	position: absolute;
	display: inline-block;
	top: 15px;
	left: 48%;
}
.div1 {
	padding: 10px;
}
</style>
<div class="div1">
<div class="progress">
	<div class="bar"></div>
	<div class="percent">0%</div>
</div>
<div id="status"></div>
</div>

<div class="container h-100">
	<div class="row h-100 justify-content-center align-items-center">
		<form class="col-12" action="memberVideoInsert.do" method="post"
			enctype="multipart/form-data">
			<div class="form-group">
				<div style="padding-top: 10px">
					<input type=text list=browsers>
					<datalist id=browsers>
						<c:forEach var="RegionName" items="${RegionName }">
							<option value="${RegionName.code_name }">
						</c:forEach>
					</datalist>
				</div>
				<div style="padding-top: 20px">
					<input type="file" name="uploadFile" accept="video/*">
					<button type="submit">보내기</button>
				</div>
			</div>
		</form>
	</div>
</div>
