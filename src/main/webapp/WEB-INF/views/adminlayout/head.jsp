<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<title>HUBY 홈페이지</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<link rel="stylesheet" href="resources/css/boardall.css">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="resources/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="resources/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="resources/vendor/linearicons/style.css">
	<link rel="stylesheet" href="resources/vendor/chartist/css/chartist-custom.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="resources/css/adminmain.css">
	<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
	<link rel="stylesheet" href="resources/css/demo.css">
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="resources/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="resources/img/favicon.png">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- Modal 스크립트 시작 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<!-- Modal 스크립트 끝 -->
</head>

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">		
				<!-- 허비 로고 명 들어갈 곳 -->
				<!-- <a href="index.html"><img src="resources/img/logo-dark.png" alt="Klorofil Logo" class="img-responsive logo"></a> -->				
				
			<div class="navbar-btn navbar-btn-left col-sm-3">
				<span><button type="button" class="btn-toggle-fullwidth" align="center" style="color: #2B333E">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HUBY &nbsp;&nbsp;&nbsp;<i class="lnr lnr-arrow-left-circle"></i></button></span>
			</div>
			<div class="container-fluid setup-bg d-flex flex-column">
				<div class="container my-auto">
				<!-- 검색창 -->
				<!-- <form class="navbar-form navbar-left">
					<div class="input-group">
						<input type="text" value="" class="form-control" placeholder="Search dashboard...">
						<span class="input-group-btn"><button type="button" class="btn btn-primary">Go</button></span>
					</div>
				</form> -->
				<!-- <div class="navbar-btn navbar-btn-right">
					<a class="btn btn-success update-pro" href="https://www.themeineed.com/downloads/klorofil-pro-bootstrap-admin-dashboard-template/?utm_source=klorofil&utm_medium=template&utm_campaign=KlorofilPro" title="Upgrade to Pro" target="_blank"><i class="fa fa-rocket"></i> <span>UPGRADE TO PRO</span></a>
				</div> -->
				<div class="row col-sm-9" id="navbar-menu">
						<div class="navbar-btn navbar-btn-right">
							<button type="button" onclick="location.href='index.do'" style="color: #2B333E">홈</button>
							<button type="button" onclick="location.href='noticePage.do'" style="color: #2B333E">공지사항</button>
							<button type="button" onclick="location.href='qnaPage.do'" style="color: #2B333E">QnA</button>
							<button type="button" onclick="location.href='userManagement.do'" style="color: #2B333E">회원관리</button>
							<button type="button" onclick="location.href='noticeManagement.do'" style="color: #2B333E">공고관리</button>
							<button type="button" onclick="location.href='vManagement.do'" style="color: #2B333E">영상관리</button>
						</div>
				</div>
				<!-- <div id="navbar-menu">
					<ul class="nav navbar-nav navbar-center">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle icon-menu" data-toggle="dropdown">
								<i class="lnr lnr-alarm"></i>
								<span class="badge bg-danger">5</span>
							</a>
							<ul class="dropdown-menu notifications">
								<li><a href="#" class="notification-item"><span class="dot bg-warning"></span>System space is almost full</a></li>
								<li><a href="#" class="notification-item"><span class="dot bg-danger"></span>You have 9 unfinished tasks</a></li>
								<li><a href="#" class="notification-item"><span class="dot bg-success"></span>Monthly report is available</a></li>
								<li><a href="#" class="notification-item"><span class="dot bg-warning"></span>Weekly meeting in 1 hour</a></li>
								<li><a href="#" class="notification-item"><span class="dot bg-success"></span>Your request has been approved</a></li>
								<li><a href="#" class="more">See all notifications</a></li>
							</ul>
						</li>
						<li class="dropdown">						
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="lnr lnr-question-circle"></i> <span>Help</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<li><a href="#">Basic Use</a></li>
								<li><a href="#">Working With Data</a></li>
								<li><a href="#">Security</a></li>
								<li><a href="#">Troubleshooting</a></li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="resources/img/user.png" class="img-circle" alt="Avatar"> <span>Samuel</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<li><a href="#"><i class="lnr lnr-user"></i> <span>My Profile</span></a></li>
								<li><a href="#"><i class="lnr lnr-envelope"></i> <span>Message</span></a></li>
								<li><a href="#"><i class="lnr lnr-cog"></i> <span>Settings</span></a></li>
								<li><a href="#"><i class="lnr lnr-exit"></i> <span>Logout</span></a></li>
							</ul>
						</li>
						<li>
							<a class="update-pro" href="https://www.themeineed.com/downloads/klorofil-pro-bootstrap-admin-dashboard-template/?utm_source=klorofil&utm_medium=template&utm_campaign=KlorofilPro" title="Upgrade to Pro" target="_blank"><i class="fa fa-rocket"></i> <span>UPGRADE TO PRO</span></a>
						</li>
					</ul>
				</div> -->
				</div>
			</div>
		</nav>	
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav>
					<ul class="nav">
						<li><a href="noticePage.do" class="active"><i class="lnr lnr-home"></i> <span>공지사항</span></a></li>
						<li><a href="qnaPage.do" class=""><i class="lnr lnr-code"></i> <span>QnA</span></a></li>
						<li><a href="userManagement.do" class=""><i class="lnr lnr-chart-bars"></i> <span>회원관리</span></a></li>
						<li><a href="noticeManagement.do" class=""><i class="lnr lnr-cog"></i> <span>공고관리</span></a></li>
						<li><a href="vManagement.do" class=""><i class="lnr lnr-alarm"></i> <span>영상관리</span></a></li>
						
						<!-- 사이드바 메뉴 현재 사용 안함 -->
						<!-- <li>
							<a href="#subPages" data-toggle="collapse" class="collapsed"><i class="lnr lnr-file-empty"></i> <span>Pages</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages" class="collapse ">
								<ul class="nav">
									<li><a href="page-profile.html" class="">Profile</a></li>
									<li><a href="page-login.html" class="">Login</a></li>
									<li><a href="page-lockscreen.html" class="">Lockscreen</a></li>
								</ul>
							</div>
						</li>
						<li><a href="tables.html" class=""><i class="lnr lnr-dice"></i> <span>Tables</span></a></li>
						<li><a href="typography.html" class=""><i class="lnr lnr-text-format"></i> <span>Typography</span></a></li>
						<li><a href="icons.html" class=""><i class="lnr lnr-linearicons"></i> <span>Icons</span></a></li> -->
					</ul>
				</nav>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">