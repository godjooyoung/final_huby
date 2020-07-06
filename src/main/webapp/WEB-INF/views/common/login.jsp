<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.css">
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
  background-color: #134a8e;
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
  margin: 5% auto 6% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 60%; /* Could be more or less, depending on screen size */
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
<!-- 모달 버튼 끝 -->
<!-- 이미지 관련 시작 -->
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
<!-- 이미지 관련 끝 -->

<!-- 버튼관련 시작 -->
<style>
body {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background: white;
}

.button {
  position: relative;
  -webkit-appearance: none;
     -moz-appearance: none;
          appearance: none;
  background: #134a8e;
  padding: 1em 2em;
  border: none;
  color: white;
  font-size: 1.2em;
  cursor: pointer;
  outline: none;
  overflow: hidden;
  border-radius: 100px;
}
.button span {
  position: relative;
  pointer-events: none;
}
.button::before {
  --size: 0;
  content: '';
  position: absolute;
  left: var(--x);
  top: var(--y);
  width: var(--size);
  height: var(--size);
  background: radial-gradient(circle closest-side, #4405f7, transparent);
  -webkit-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
  transition: width .2s ease, height .2s ease;
}
.button:hover::before {
  --size: 400px;
}

</style>
<!-- 버튼관련 끝 -->

<!-- 이미지 꾸미기 -->
<style>
body
{
	margin: 0;
	padding: 0;
	background: #white;
	font-family: sans-serif;
}
.title h2 {
    text-align: center;
    color: #white;
    text-transform: capitalize;
    margin-top: 20px;
}
.box
{
	position: absolute;
	top: 35%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 300px;
	height: 300px;
	background: #white;
	box-sizing: border-box;
	box-shadow: 0 20px 50px rgba(0,0,0,.5);
	border:2px solid rgba(0,0,0,.5);
}
.box .content{
	position: absolute;
	top: 15px;
	left: 15px;
	right: 15px;
	bottom: 15px;
	border: 3px solid #134a8e;
	padding: 30px;
	box-shadow: 0 5px 10px rgba(0,0,0,.5);
	text-align: center;
}
.box .content h1{
	color: #fff;
	font-size: 30px;
	margin: 0 0 10px;
	padding: 0;

}
.box .content p{
 color: #fff;
}
.box svg,
.box svg rect{
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	fill: transparent;
}
.box svg rect{
	stroke: #134a8e;
	stroke-width:10px;
	stroke-dasharray: 400;
	animation: animate 3s linear infinite;

}
.box img{
    width :100%;
}
@keyframes animate
{
	0%{
		stroke-dashoffset:800;
	}
	100%{
		stroke-dashoffset:0;
	}

}
</style>
<!-- 이미지 꾸미기 끝 -->

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
<br>
<!-- 
<h1 class="title" align="center">WELCOME TO HUBY</h1>
 -->
 <br><br><br><br><br><br><br><br>
<div class="container">
    <div class="row">
    	<div class="box">
    		<svg><rect></rect></svg>
    		<div class="content">
    			<img src="${pageContext.request.contextPath}/resources/FileUpload/HUBY5.png">
    		</div>
    	</div>
    </div>
</div>

<br><br><br><br><br><br><br><br><br><br>
	<%-- <div class="container">
		<div class="d-flex justify-content-center h-100">
			<div class="image_outer_container">
				<!-- <div class="green_icon"></div> -->
				<div class="image_inner_container">
					<img src="${pageContext.request.contextPath}/resources/FileUpload/HUBY5.png">
				</div>
			</div>
		</div>
	</div> --%>

<div align="center">
<button class="button" onclick="document.getElementById('id01').style.display='block'" style="width:auto;">
	<span>개인회원 로그인</span>
</button>
<button class="button" onclick="document.getElementById('id02').style.display='block'" style="width:auto;">
	<span>기업회원 로그인</span>
</button>
</div>

<br><br>
<div align="center">
	<a href="unionJoinForm.do" style="color: red; font-weight: bold; font-size: larger;">회원이 아니신가요?</a><br><br>
</div>

<div id="id01" class="modal">
  
  <form class="modal-content animate" id="frm" name="frm" method="post" action="PersonalLoginCheck.do" onsubmit="return PersonalLoginCheck();">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="${pageContext.request.contextPath}/resources/FileUpload/hubytext.png" alt="Avatar" class="avatar" style="width: 200px; height: 200px;">
    </div>
    <div class="container">       
      <label for="uname"><b>개인 아이디</b></label>
      <input type="text" placeholder="Enter User ID" name="member_id" id="member_id" maxlength="50" required="required">

      <label for="psw"><b>개인 패스워드</b></label>
      <input type="password" placeholder="Enter User Password" name="member_pw" id="member_pw" maxlength="50" required="required">
        
      <button type="submit" style="font-weight: bold;">로그인</button>
    </div>

    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">닫기</button>
  <!--    <span class="psw" style="font-weight: bolder; font-size: larger; color: red;">Human Union Business Yedam</span>  -->
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
      <img src="${pageContext.request.contextPath}/resources/FileUpload/hubytext.png" alt="Avatar" class="avatar" style="width: 200px; height: 200px;">
    </div>

    <div class="container">
      <label for="uname"><b>기업 아이디</b></label>
      <input type="text" placeholder="Enter Company Id" name="company_id" id="company_id" maxlength="50" required="required">

      <label for="psw"><b>기업 패스워드</b></label>
      <input type="password" placeholder="Enter Company Password" name="company_pw" id="company_pw" maxlength="50" required="required">  
      <button type="submit" style="font-weight: bold;">로그인</button>
    </div>
	
    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id02').style.display='none'" class="cancelbtn">닫기</button> 
       <!--    <span class="psw" style="font-weight: bolder; font-size: larger; color: red;">Human Union Business Yedam</span>  -->
    </div>
  </form>
</div><br><br><br><br>
<div align="center">
<span style="background-color: white;">
<button type="button" onclick="location.href='adminLogin.do'">관리자 로그인</button>
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