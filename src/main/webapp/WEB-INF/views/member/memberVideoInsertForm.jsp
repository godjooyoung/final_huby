<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container h-100">
	<div class="row h-100 justify-content-center align-items-center">
		<form class="col-12" action="memberVideoInsert.do" method="post"
			enctype="multipart/form-data">
			<div class="form-group">
				<div>
					<video width="320" height="640" controls>
						<source src="">
					</video>
				</div>
				<div style="padding-top:10px">
					<input type=text list=browsers>
					<datalist id=browsers>
					<c:forEach var="RegionName" items="${RegionName }">
							<option value="${RegionName.code_name }">
					</c:forEach>
						</datalist>
				</div>
				<div style="padding-top:20px">
					<input type="file" name="files" accept="video/*">
					<button type="submit">보내기</button>
				</div>
			</div>
		</form>
	</div>
</div>
