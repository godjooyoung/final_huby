<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<div align="center">
	<h1>면접리스트</h1>
	<form id="ivList" name="ivList" method="post">
		<table>
			<thead>
				<tr>
					<th>인터뷰시작</th>
					<th>회사이름</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${personChatList}">
					<tr
						onclick="location.href='person_chat.do?interview_id=${list.interview_id}'">
						<td>${list.interview_start}</td>
						<td>${list.company_name}</td>

						<br>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
</div>