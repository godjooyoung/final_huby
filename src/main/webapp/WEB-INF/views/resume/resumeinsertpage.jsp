<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.Button {
	height: 50px;
	position: relative;
	background: #ccc;
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 0px;
	left: 0px;
	right: 0px;
	width: 100%;
	overflow: hidden;
}

.nav-side-menu {
  overflow: auto;
  font-family: verdana;
  font-size: 12px;
  font-weight: 200;
  background-color: rgb(23, 162, 184);
  position: fixed;
  top: 0px;
  padding-left: 0px;
  height: 100%;
  width: 17%;
  color: #e1ffff;
}

.nav-side-menu .brand {
  background-color: rgb(23, 162, 184);
  line-height: 50px;
  display: block;
  text-align: center;
  font-size: 14px;
}
.nav-side-menu .toggle-btn {
  display: none;
}
.nav-side-menu ul,
.nav-side-menu li {
  list-style: none;
  padding: 0px;
  margin: 0px;
  line-height: 35px;
  cursor: pointer;
}
.nav-side-menu ul :not(collapsed) .arrow:before,
.nav-side-menu li :not(collapsed) .arrow:before {
  font-family: 'Font Awesome 5 Free';
  content: "\f13a";
  display: inline-block;
  padding-left: 10px;
  padding-right: 10px;
  vertical-align: middle;
  float: right;
  font-weight: 900;
}
.nav-side-menu ul .active,
.nav-side-menu li .active {
  border-left: 3px solid #d19b3d;
  background-color: rgb(23, 162, 184);
}
.nav-side-menu ul .sub-menu li.active,
.nav-side-menu li .sub-menu li.active {
  color: #d19b3d;
}
.nav-side-menu ul .sub-menu li.active a,
.nav-side-menu li .sub-menu li.active a {
  color: #d19b3d;
}
.nav-side-menu ul .sub-menu li,
.nav-side-menu li .sub-menu li {
  background-color: rgb(23, 162, 184);
  border: none;
  line-height: 28px;
  border-bottom: 1px solid #23282e;
  margin-left: 0px;
}
.nav-side-menu ul .sub-menu li:hover,
.nav-side-menu li .sub-menu li:hover {
  background-color: #020203;
}
.nav-side-menu ul .sub-menu li:before,
.nav-side-menu li .sub-menu li:before {
  font-family: 'Font Awesome 5 Free';
  content: "\f105";
  display: inline-block;
  padding-left: 10px;
  padding-right: 10px;
  vertical-align: middle;
  font-weight: 900;
}
.nav-side-menu li {
  padding-left: 0px;
  border-left: 3px solid #84a3c6;
  border-bottom: 1px solid #23282e;
}
.nav-side-menu li a {
  text-decoration: none;
  color: #e1ffff;
}
.nav-side-menu li a i {
  padding-left: 10px;
  width: 20px;
  padding-right: 20px;
}
.nav-side-menu li:hover {
  border-left: 3px solid #d19b3d;
  background-color: rgb(23, 162, 184);
  -webkit-transition: all 1s ease;
  -moz-transition: all 1s ease;
  -o-transition: all 1s ease;
  -ms-transition: all 1s ease;
  transition: all 1s ease;
}
@media (max-width: 767px) {
  .nav-side-menu {
    position: relative;
    width: 100%;
    margin-bottom: 10px;
  }
  .nav-side-menu .toggle-btn {
    display: block;
    cursor: pointer;
    position: absolute;
    right: 10px;
    top: 10px;
    z-index: 10 !important;
    padding: 3px;
    background-color: #000000;
    color: #000;
    width: 40px;
    text-align: center;
  }
  .brand {
    text-align: left !important;
    font-size: 22px;
    padding-left: 20px;
    line-height: 50px !important;
  }
}
@media (min-width: 767px) {
  .nav-side-menu .menu-list .menu-content {
    display: block;
  }
}

</style>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="https://use.fontawesome.com/releases/v5.0.11/css/all.css" rel="stylesheet">
<script>
	if(n==0){
		alert("이력서 등록을 실패했습니다.");
	}
	
	<button class="btn-primary" onclick="toggle()" style="size: 30px">toggle</button>
	<p id="test">sample text</p>
	
	var toggled = false;
	function toggle(){
		if(!toggled){
			toggled = true;
			document.getElementById("test").style.display="none";
			return;
		}
		if(toggled){
			toggled = false;
			document.getElementById("test").style.display="block";
			return;
		}
	}
</script>
</head>
<body>
<br><br><br>
<div align="center">
<h1>이력서 등록</h1>
<div class="container">
    <h2 class="">&nbsp</h2>
	<div class="row">
		<div class="col-12 col-md-8 col-lg-6 pb-5">
                    <!--Form with header-->
                    <form id="frm" name="frm" method="post" action="resumeinsert.do">
                        <div class="card border-primary rounded-0">
                            <div class="card-header p-0">
                                <div class="bg-info text-white text-center py-2">
                                    <h3><i class="fa fa-envelope"></i> Register</h3>
                                    <p class="m-0">Get into the safe conduct app</p>
                                </div>
                            </div>
                            <div class="card-body p-3">

                                <!--Body-->
                                <div class="form-group">
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">이력서 제목</div>
                                        </div>
                                        <input type="text" class="form-control" id="resume_title" name="resume_title" placeholder="First resume_title" required="required"></input>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">희망직업</div>
                                        </div>
                                        <!-- <input type="text" class="form-control" id="hope_job" name="hope_job" placeholder="Second hope_job" required="required"></input> -->
                                        <select class="form-control input-md" id="hope_job" name="hope_job" required="required" onchange="typecheckc(this.value)">
										  		<option value="">종목 선택</option>
										  		<c:forEach items="${ codeList }" var="type">
										  		<option value=${ type.code_id }>${ type.code_name }</option>
										  		</c:forEach>
										  </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">희망연봉</div>
                                        </div>
                                        <input type="text" class="form-control" id="hope_salary" name="hope_salary" placeholder="hope_salary" required="required"></input>
                                    </div>
                                </div>
                                                                
                                <div class="form-group">
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">희망근무지역</div>
                                        </div>
                                        <input type="text" class="form-control" id="hope_location" name="hope_location" placeholder="hope_location"></input>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">최종학력</div>
                                        </div>
                                        <input type="text" class="form-control" id="final_education" name="final_education" placeholder="final_education"></input>
                                    </div>
                                </div>
                               
                                <div class="form-group">
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">대표 설정 여부</div>
                                        </div>                                        
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id="select_resume" name="select_resume" value="Y">Y
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id="select_resume" name="select_resume" value="N">N
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">공개 설정 여부</div>
                                        </div>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id="select_public" name="select_public" value="Y">Y
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id="select_public" name="select_public" value="N">N
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">짧은 각오 한마디</div>
                                        </div>
                                        <input type="text" class="form-control" id="resume_coment" name="resume_coment" placeholder="resume_coment"></input>
                                    </div>
                                </div>
                                
                                <div class="text-center">
                                    <input type="submit" value="등록하기" class="btn btn-info btn-block rounded-0 py-2"></input>
                                    <input type="reset" value="취소하기" class="btn btn-info btn-block rounded-0 py-2"></input>
                                    <input type="button" value="이전 페이지로" class="btn btn-info btn-block rounded-0 py-2" onclick="back()"></input>
                                </div>
                            </div>
                        </div>
                    </form>
                    <!--Form with header-->


                </div>
	</div>
</div>
</div>

</body>
</html>