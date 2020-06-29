<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<article>
	<div class="container" role="main">
		<h2>질문하기</h2>
		<form name="form" id="form" role="form" method="post" action="qInsertM.do">
			<div class="mb-3">
				<label for="title">제목</label> <input type="text"
					class="form-control" name="q_title" id="q_title" placeholder="제목을 입력해 주세요">
			</div>
			<div class="mb-3">
				<label for="content">내용</label>
				<textarea class="form-control" rows="5" name="q_contents"
					id="q_contents" value="q_contents" placeholder="내용을 입력해 주세요"></textarea>
			</div>
			<div>
				<button type="submit" class="btn btn-sm btn-primary" id="btnSave">저장</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="location.href='qListMember.do'">목록</button>
				<br> <br> <br>
			</div>
		</form>
	</div>
</article>


