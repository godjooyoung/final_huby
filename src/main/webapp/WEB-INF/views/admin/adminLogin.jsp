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
        background: #833ab4; 
        background: -webkit-linear-gradient(to bottom, #fcb045, #fd1d1d, #833ab4); 
        background: linear-gradient(to bottom, #fcb045, #fd1d1d, #833ab4);
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
	function adminLoginCheck() {

		var id = document.getElementById("admin_id");
		var pw = document.getElementById("admin_pw");

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
</head>
<body>
<br><br><br><br><br><br><br><br>
	<div class="container">
		<div class="d-flex justify-content-center h-100">
			<div class="image_outer_container">
				<div class="image_inner_container">
					<img src="${pageContext.request.contextPath}/resources/FileUpload/HUBY.png">
				</div>
			</div>
		</div>
	</div>
	
<div align="center">
<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">관리자 로그인</button>
</div>





<div id="id01" class="modal">
  
  <form class="modal-content animate" id="frm" name="frm" method="post" action="adminLoginCheck.do" onsubmit="return adminLoginCheck()">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="${pageContext.request.contextPath}/resources/FileUpload/HUBY4.png" alt="Avatar" class="avatar" style="width: 300px; height: 300px;">
    </div>
    <div class="container">       
      <label for="uname"><b>아이디</b></label>
      <input type="text" placeholder="Enter User ID" name="admin_id" id="admin_id" maxlength="50" required="required">

      <label for="psw"><b>패스워드</b></label>
      <input type="password" placeholder="Enter User Password" name="admin_pw" id="admin_pw" maxlength="50" required="required">
        
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
</body>
</html>