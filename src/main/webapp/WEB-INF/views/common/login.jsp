<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<!-- 모달 조절 -->
<style>
body {font-family: Arial, Helvetica, sans-serif;}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Set a style for all buttons */
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
  position: relative;
}

img.avatar {
  width: 40%;
  border-radius: 50%;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
  position: absolute;
  right: 25px;
  top: 0;
  color: #000;
  font-size: 35px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: red;
  cursor: pointer;
}

/* Add Zoom Animation */
.animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
</style>
<!-- 이미지 조절 -->
<style>
	html,body{
			height: 100%;
		}
       .container{
       	height: 100%;
       	align-content: center;
       }

       .image_outer_container{
       	margin-top: auto;
       	margin-bottom: auto;
       	border-radius: 50%;
       	position: relative;
       }

       .image_inner_container{
       	border-radius: 50%;
       	padding: 5px;
        /* background: #833ab4; 
        background: -webkit-linear-gradient(to bottom, #fcb045, #fd1d1d, #833ab4); 
        background: linear-gradient(to bottom, #fcb045, #fd1d1d, #833ab4); */
       }
       .image_inner_container img{
       	height: 300px;
       	width: 300px;
       	border-radius: 50%;
       	border: 5px solid white;
       }

       .image_outer_container .green_icon{
         background-color: #4cd137;
         position: absolute;
         right: 30px;
         bottom: 10px;
         height: 30px;
         width: 30px;
         border:5px solid white;
         border-radius: 50%;
       }
</style>
<script>
	if ('${num}' == 1) {
		alert("로그인 실패, ID/PW를 정확히 입력해주세요.");
	}
</script>
<script>
	function CompanyLoginCheck() {

		var id = document.getElementById("company_id");
		var pw = document.getElementById("company_pw");

		if (id.value == "" && pw.value == "") {
			alert("아이디, 패스워드를 입력하세요.")
			id.focus()
			return false;
		}

		if (id.value == "") {
			alert("아이디를 입력하세요.")
			id.focus();
			return false;
		}

		if (pw.value == "") {
			alert("패스워드를 입력하세요.")
			pw.focus();
			return false;
		}

		else {
			return true;
		}
	}
</script>
<script>
	function PersonalLoginCheck() {

		var id = document.getElementById("member_id");
		var pw = document.getElementById("member_pw");

		if (id.value == "" && pw.value == "") {
			alert("아이디, 패스워드를 입력하세요.")
			id.focus()
			return false;
		}

		if (id.value == "") {
			alert("아이디를 입력하세요.")
			id.focus();
			return false;
		}

		if (pw.value == "") {
			alert("패스워드를 입력하세요.")
			pw.focus();
			return false;
		}

		else {
			Android.login("안녕");
			return true;
		}
	}
</script>
</head>
<body>
<br><br><br><br><br><br><br><br>
	<div class="container">
		<div class="d-flex justify-content-center h-100">
			<div class="image_outer_container">
				<!-- <div class="green_icon"></div> -->
				<div class="image_inner_container">
					<img src="${pageContext.request.contextPath}/resources/FileUpload/HUBY5.png">
				</div>
			</div>
		</div>
	</div>
	
<div align="center">
<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">개인회원 로그인</button>
<button onclick="document.getElementById('id02').style.display='block'" style="width:auto;">기업회원 로그인</button>
</div>

<br><br>
<div align="center">
	<a href="unionJoinForm.do" style="color: red; font-weight: bold;">회원이 아니신가요?</a><br><br>
</div>
<div>
	<button type="button" class="btn-primary" onclick="location.href='main.do' ">홈으로</button>
	<!-- test -->
	<button type="button" class="btn-primary" onclick="location.href='gotest.do'">뷰확인용
		테스트</button>
	<button type="button" class="btn-primary" onclick="location.href='index.do'">관리자페이지
		로그인 없음</button>
	<button type="button" class="btn-primary" onclick="location.href='coemdeview.do'">디테일뷰
		로그인 없음</button>
</div>



<div id="id01" class="modal">
  
  <form class="modal-content animate" id="frm" name="frm" method="post" action="PersonalLoginCheck.do" onsubmit="return PersonalLoginCheck();">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="${pageContext.request.contextPath}/resources/FileUpload/HUBY4.png" alt="Avatar" class="avatar" style="width: 300px; height: 300px;">
    </div>
    <div class="container">       
      <label for="uname"><b>개인 아이디</b></label>
      <input type="text" placeholder="Enter User ID" name="member_id" id="member_id" maxlength="50" required="required">

      <label for="psw"><b>개인 패스워드</b></label>
      <input type="password" placeholder="Enter User Password" name="member_pw" id="member_pw" maxlength="50" required="required">
        
      <button type="submit" style="font-weight: bold;">로그인</button>
    </div>

    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
      <span class="psw">Human Union Business Yedam</span>
    </div>
  </form>
</div>

<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>


<div id="id02" class="modal">
	<form class="modal-content animate" id="frm2" name="frm2" method="post" action="CompanyLoginCheck.do">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="${pageContext.request.contextPath}/resources/FileUpload/HUBY4.png" alt="Avatar" class="avatar" style="width: 300px; height: 300px;">
    </div>

    <div class="container">
      <label for="uname"><b>기업 아이디</b></label>
      <input type="text" placeholder="Enter Company Id" name="company_id" id="company_id" maxlength="50" required="required">

      <label for="psw"><b>기업 패스워드</b></label>
      <input type="password" placeholder="Enter Company Password" name="company_pw" id="company_pw" maxlength="50" required="required">  
      <button type="submit" style="font-weight: bold;">로그인</button>
    </div>
	
    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id02').style.display='none'" class="cancelbtn">Cancel</button>
      <span class="psw">Human Union Business Yedam</span>
    </div>
  </form>
</div><br><br><br><br><br><br><br><br><br><br><br>
<div align="center">
<span style="background-color: white;">
<button type="button" onclick="location.href='adminLogin.do'" style="background: white;">관리자 로그인</button>
</span>
</div>
<script>
// Get the modal
var modal = document.getElementById('id02');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
</body>
</html>