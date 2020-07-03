<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.1 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
	div#middlegood1{
	display: flex;
	height: 100px;
	justify-content: center;
	align-items: center;
	border: solid 1px gray;
	color: black;
	font-weight: bolder;
	font-size: larger;
}
</style>
<jsp:include page="/WEB-INF/views/adminlayout/head.jsp"></jsp:include>
<h1 align="center" style="color: #2B333E">회 원 관 리</h1><br>
<!-- <div id="usermanagement_table">
	<div class="usermanagement_row" style="background-color: #2B333E">
		<span class="usermanagement_cell usermanagement_col1" style="color: white">회원ID</span> 
		<span class="usermanagement_cell usermanagement_col2" style="color: white">회원명</span>
		<span class="usermanagement_cell usermanagement_col3" style="color: white">구분</span> 
		<span class="usermanagement_cell usermanagement_col4" style="color: white">가입일</span>
		<span class="usermanagement_cell usermanagement_col5" style="color: white">삭제</span>
	</div>
	<div class="usermanagement_row" onclick="location.href='userSelectPage.do'">
		<span class="usermanagement_cell usermanagement_col1">kikiki</span> 
		<span class="usermanagement_cell usermanagement_col2">yedam</span> 
		<span class="usermanagement_cell usermanagement_col3">관리자</span> 
		<span class="usermanagement_cell usermanagement_col4">2020-07-09</span>
		<span class="usermanagement_cell usermanagement_col5"><button type="button" style="border: white;"><img src="resources/img/recyclebin.png" style="height: 25px"></button></span>
	</div>
</div> -->
<div class="row" >
      <div id="middlegood1" onclick="location.href='personalmemberall.do'" class="col-sm-6" style="background-color:lightyellow; height: 300px">개  인  회  원</div>
      <div id="middlegood1" onclick="location.href='companymemberall.do'" class="col-sm-6" style="background-color:lightblue; height: 300px">기  업  회  원</div>
</div>
    <br>
<jsp:include page="/WEB-INF/views/adminlayout/footer.jsp"></jsp:include>
