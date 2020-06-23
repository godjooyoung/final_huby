<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div>
	<form action="/memberVideoInsert.do" method="post"
		enctype="multipart/form-data">
		<div>
			<video width="320" height="640" controls >
				<source src="">
			</video>
		</div>
		<div>
			<input type="file" name="files">
			<button type="submit">보내기</button>
		</div>
	<input type=text list=browsers>
	<datalist id=browsers>
		<option value="Firefox">
		<option value="InternetExplorer">
		<option value="Chrome">
		<option value="Opera">
		<option value="Safari">
	</datalist>
	</form>
</div>
