<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
${personChatList}
<c:forEach var="list" items="${personChatList}">
${list.interview_id }
</c:forEach>



	<div align="center">
		<h1>면접리스트</h1>
		<form id="ivList" name="ivList" method="post">
			<table>
				<thead>
					<tr>
						<th>인터뷰시작</th>
						<th></th>
						<th>표지</th>
						<th>출판일자</th>
						<th>금액</th>
						<th>출판사</th>
						<th>도서소개</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="book" items="${bookList}">
						<tr
							onclick="location.href='selectBook.do?book_no=${book.book_no}'">
							<td>${book.book_no}</td>
							<td>${book.book_name}</td>
							<td>${book.book_coverimg}</td>
							<td>${book.book_date}</td>
							<td>${book.book_price}</td>
							<td>${book.book_publisher}</td>
							<td>${book.book_info}</td>
							<br>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>