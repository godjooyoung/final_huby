<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>HUBY 홈페이지</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="resources/css/boardall.css">
<!-- VENDOR CSS -->
<link rel="stylesheet"
	href="resources/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="resources/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/vendor/linearicons/style.css">
<link rel="stylesheet"
	href="resources/vendor/chartist/css/chartist-custom.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="resources/css/adminmain.css">
<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
<link rel="stylesheet" href="resources/css/demo.css">
<!-- GOOGLE FONTS -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700"
	rel="stylesheet">
<!-- ICONS -->
<link rel="apple-touch-icon" sizes="76x76"
	href="resources/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="resources/img/favicon.png">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<!-- 허비 로고 명 들어갈 곳 -->
			<!-- <a href="index.html"><img src="resources/img/logo-dark.png" alt="Klorofil Logo" class="img-responsive logo"></a> -->

			<div class="navbar-btn navbar-btn-left col-sm-3">
				<span><button type="button" class="btn-toggle-fullwidth"
						style="color: #2B333E">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						HUBY &nbsp;&nbsp;&nbsp;<i class="lnr lnr-arrow-left-circle"></i>
					</button></span>
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
							<button type="button" onclick="location.href='index.do'"
								style="color: #2B333E">홈</button>
							<button type="button" onclick="location.href='noticePage.do'"
								style="color: #2B333E">공지사항</button>
							<button type="button" onclick="location.href='qnaPage.do'"
								style="color: #2B333E">QnA</button>
							<button type="button"
								onclick="location.href='personalmemberall.do'"
								style="color: #2B333E">개인회원</button>
							<button type="button"
								onclick="location.href='companymemberall.do'"
								style="color: #2B333E">기업회원</button>
							<!-- <button type="button" onclick="location.href='vManagement.do'" style="color: #2B333E">영상관리</button> -->
							<span style="float: right;"><button type="button"
									onclick="location.href='adminLogout.do'" style="color: #2B333E">로그아웃</button></span>
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
						<li><a href="noticePage.do" class="active"><i
								class="lnr lnr-home"></i> <span>공지사항</span></a></li>
						<li><a href="qnaPage.do" class=""><i class="lnr lnr-code"></i>
								<span>QnA</span></a></li>
						<li><a href="personalmemberall.do" class=""><i
								class="lnr lnr-chart-bars"></i> <span>개인회원</span></a></li>
						<li><a href="companymemberall.do" class=""><i
								class="lnr lnr-cog"></i> <span>기업회원</span></a></li>
						<!-- <li><a href="vManagement.do" class=""><i
								class="lnr lnr-alarm"></i> <span>영상관리</span></a></li> --> -->
					</ul>
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
						<li><a href="icons.html" class=""><i class="lnr lnr-linearicons"></i> <span>Icons</span></a></li>
					</ul> -->
				</nav>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->

		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<!-- OVERVIEW -->
					<div class="panel panel-headline">
						<div class="panel-heading">
							<h1 class="panel-title" align="center">Today Review</h1>
							<p class="panel-subtitle" align="center">현재시간: ${serverTime}</p>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-3">
									<div class="metric">
										<div align="center"><a href="personalmemberall.do" style="border-bottom: solid black 1px;">전체 개인회원</a></div>
										<span class="icon"><i class="fa fa-clone"></i></span>
										<p>
											<span class="number">${ result1 }</span> <span class="title">명</span>
										</p>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<div align="center"><a href="companymemberall.do" style="border-bottom: solid black 1px;">전체 기업회원</a></div>
										<span class="icon"><i class="fa fa-clone"></i></span>
										<p>
											<span class="number">${ result2 }</span> <span class="title">명</span>
										</p>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<div align="center"><a href="qnaPage.do" style="border-bottom: solid black 1px;">대기중인 Qna</a></div>
										<span class="icon"><i class="fa fa-android"></i></span>
										<p>
											<span class="number">${ result3 }</span> <span class="title">건</span>
										</p>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<div align="center">전체 개인영상</div>
										<span class="icon"><i class="fa fa-bar-chart"></i></span>
										<p>
											<span class="number">${ result4 }</span> <span class="title">개</span>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-3">
									<div class="metric">
										<div align="center">전체 회사 공고</div>
										<span class="icon"><i class="fa fa-clone"></i></span>
										<p>
											<span class="number">${ result5 }</span> <span class="title">개</span>
										</p>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<div align="center">전체 개인 영상</div>
										<span class="icon"><i class="fa fa-clone"></i></span>
										<p>
											<span class="number">${ result6 }</span> <span class="title">개</span>
										</p>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<div align="center">진행중인 면접</div>
										<span class="icon"><i class="fa fa-clone"></i></span>
										<p>
											<span class="number">${ result7 }</span> <span class="title">건</span>
										</p>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<div align="center">진행중인 입사 지원</div>
										<span class="icon"><i class="fa fa-android"></i></span>
										<p>
											<span class="number">${ result8 }</span> <span class="title">건</span>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="panel-body">
							<div class="row">
								<div align="center">
								<h1>개인이 희망하는 직종 순위!</h1>
									<table border="1px">
										<tr>
											<th style="width: 50px; text-align: center; background: lightgray">순위</th>
											<th style="width: 300px; background: lightgray">직업명</th>
										</tr>
										<c:forEach items="${ result9 }" var="rank">
											<tr>
												<th style="width: 50px; text-align: center;">${ rank.RANK }</th>
												<th>${ rank.JOB_NAME }</th>
											</tr>
										</c:forEach>
									</table>
									<h1>기업이 가장 많이 채용중인 직종 순위!</h1>
									<table border="1px">
										<tr>
											<th style="width: 50px; text-align: center; background: lightgray">순위</th>
											<th style="width: 300px; background: lightgray">직업명</th>
										</tr>
										<c:forEach items="${ result10 }" var="rank">
											<tr>
												<th style="width: 50px; text-align: center;">${ rank.RANK }</th>
												<th>${ rank.JOB_NAME }</th>
											</tr>
										</c:forEach>
									</table>
								</div>
								<div align="center">
								<h1>월별 개인회원 가입 수</h1>
									<table border="1px">
										<tr>
											<th style="width: 50px; text-align: center; background: lightgray">1월</th>
											<th style="width: 50px; text-align: center; background: lightgray">2월</th>
											<th style="width: 50px; text-align: center; background: lightgray">3월</th>
											<th style="width: 50px; text-align: center; background: lightgray">4월</th>
											<th style="width: 50px; text-align: center; background: lightgray">5월</th>
											<th style="width: 50px; text-align: center; background: lightgray">6월</th>
											<th style="width: 50px; text-align: center; background: lightgray">7월</th>
											<th style="width: 50px; text-align: center; background: lightgray">8월</th>
											<th style="width: 50px; text-align: center; background: lightgray">9월</th>
											<th style="width: 50px; text-align: center; background: lightgray">10월</th>
											<th style="width: 50px; text-align: center; background: lightgray">11월</th>
											<th style="width: 50px; text-align: center; background: lightgray">12월</th>
										</tr>
										<c:forEach items="${ result11 }" var="Mcnt">
											<tr>
												<th style="width: 50px; text-align: center;">${ Mcnt.ONE }</th>
												<th style="width: 50px; text-align: center;">${ Mcnt.TWO }</th>
												<th style="width: 50px; text-align: center;">${ Mcnt.THREE }</th>
												<th style="width: 50px; text-align: center;">${ Mcnt.FOUR }</th>
												<th style="width: 50px; text-align: center;">${ Mcnt.FIVE }</th>
												<th style="width: 50px; text-align: center;">${ Mcnt.SIX }</th>
												<th style="width: 50px; text-align: center;">${ Mcnt.SEVEN }</th>
												<th style="width: 50px; text-align: center;">${ Mcnt.EIGHT }</th>
												<th style="width: 50px; text-align: center;">${ Mcnt.NINE }</th>
												<th style="width: 50px; text-align: center;">${ Mcnt.TEN }</th>
												<th style="width: 50px; text-align: center;">${ Mcnt.ELEVEN }</th>
												<th style="width: 50px; text-align: center;">${ Mcnt.TWELVE }</th>
											</tr>
										</c:forEach>
									</table>
								</div>
								<div align="center">
								<h1>월별 기업회원 가입 수</h1>
									<table border="1px">
										<tr>
											<th style="width: 50px; text-align: center; background: lightgray">1월</th>
											<th style="width: 50px; text-align: center; background: lightgray">2월</th>
											<th style="width: 50px; text-align: center; background: lightgray">3월</th>
											<th style="width: 50px; text-align: center; background: lightgray">4월</th>
											<th style="width: 50px; text-align: center; background: lightgray">5월</th>
											<th style="width: 50px; text-align: center; background: lightgray">6월</th>
											<th style="width: 50px; text-align: center; background: lightgray">7월</th>
											<th style="width: 50px; text-align: center; background: lightgray">8월</th>
											<th style="width: 50px; text-align: center; background: lightgray">9월</th>
											<th style="width: 50px; text-align: center; background: lightgray">10월</th>
											<th style="width: 50px; text-align: center; background: lightgray">11월</th>
											<th style="width: 50px; text-align: center; background: lightgray">12월</th>
										</tr>
										<c:forEach items="${ result12 }" var="Ccnt">
											<tr>
												<th style="width: 50px; text-align: center;">${ Ccnt.ONE }</th>
												<th style="width: 50px; text-align: center;">${ Ccnt.TWO }</th>
												<th style="width: 50px; text-align: center;">${ Ccnt.THREE }</th>
												<th style="width: 50px; text-align: center;">${ Ccnt.FOUR }</th>
												<th style="width: 50px; text-align: center;">${ Ccnt.FIVE }</th>
												<th style="width: 50px; text-align: center;">${ Ccnt.SIX }</th>
												<th style="width: 50px; text-align: center;">${ Ccnt.SEVEN }</th>
												<th style="width: 50px; text-align: center;">${ Ccnt.EIGHT }</th>
												<th style="width: 50px; text-align: center;">${ Ccnt.NINE }</th>
												<th style="width: 50px; text-align: center;">${ Ccnt.TEN }</th>
												<th style="width: 50px; text-align: center;">${ Ccnt.ELEVEN }</th>
												<th style="width: 50px; text-align: center;">${ Ccnt.TWELVE }</th>
											</tr>
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
						<!-- <div class="row">
								<div class="col-md-9">
									<div id="headline-chart" class="ct-chart"></div>
								</div>
							</div> -->
					</div>
				</div>
				<!-- END OVERVIEW -->
				<!-- <div class="row">
						<div class="col-md-6">
							RECENT PURCHASES
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">Recent Purchases</h3>
									<div class="right">
										<button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
										<button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
									</div>
								</div>
								<div class="panel-body no-padding">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>Order No.</th>
												<th>Name</th>
												<th>Amount</th>
												<th>Date &amp; Time</th>
												<th>Status</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><a href="#">763648</a></td>
												<td>Steve</td>
												<td>$122</td>
												<td>Oct 21, 2016</td>
												<td><span class="label label-success">COMPLETED</span></td>
											</tr>
											<tr>
												<td><a href="#">763649</a></td>
												<td>Amber</td>
												<td>$62</td>
												<td>Oct 21, 2016</td>
												<td><span class="label label-warning">PENDING</span></td>
											</tr>
											<tr>
												<td><a href="#">763650</a></td>
												<td>Michael</td>
												<td>$34</td>
												<td>Oct 18, 2016</td>
												<td><span class="label label-danger">FAILED</span></td>
											</tr>
											<tr>
												<td><a href="#">763651</a></td>
												<td>Roger</td>
												<td>$186</td>
												<td>Oct 17, 2016</td>
												<td><span class="label label-success">SUCCESS</span></td>
											</tr>
											<tr>
												<td><a href="#">763652</a></td>
												<td>Smith</td>
												<td>$362</td>
												<td>Oct 16, 2016</td>
												<td><span class="label label-success">SUCCESS</span></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="panel-footer">
									<div class="row">
										<div class="col-md-6"><span class="panel-note"><i class="fa fa-clock-o"></i> Last 24 hours</span></div>
										<div class="col-md-6 text-right"><a href="#" class="btn btn-primary">View All Purchases</a></div>
									</div>
								</div>
							</div>
							END RECENT PURCHASES
						</div>
						<div class="col-md-6">
							MULTI CHARTS
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">Projection vs. Realization</h3>
									<div class="right">
										<button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
										<button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
									</div>
								</div>
								<div class="panel-body">
									<div id="visits-trends-chart" class="ct-chart"></div>
								</div>
							</div>
							END MULTI CHARTS
						</div>
					</div> -->
				<!-- <div class="row">
						<div class="col-md-7">
							TODO LIST
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">To-Do List</h3>
									<div class="right">
										<button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
										<button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
									</div>
								</div>
								<div class="panel-body">
									<ul class="list-unstyled todo-list">
										<li>
											<label class="control-inline fancy-checkbox">
												<input type="checkbox"><span></span>
											</label>
											<p>
												<span class="title">Restart Server</span>
												<span class="short-description">Dynamically integrate client-centric technologies without cooperative resources.</span>
												<span class="date">Oct 9, 2016</span>
											</p>
											<div class="controls">
												<a href="#"><i class="icon-software icon-software-pencil"></i></a> <a href="#"><i class="icon-arrows icon-arrows-circle-remove"></i></a>
											</div>
										</li>
										<li>
											<label class="control-inline fancy-checkbox">
												<input type="checkbox"><span></span>
											</label>
											<p>
												<span class="title">Retest Upload Scenario</span>
												<span class="short-description">Compellingly implement clicks-and-mortar relationships without highly efficient metrics.</span>
												<span class="date">Oct 23, 2016</span>
											</p>
											<div class="controls">
												<a href="#"><i class="icon-software icon-software-pencil"></i></a> <a href="#"><i class="icon-arrows icon-arrows-circle-remove"></i></a>
											</div>
										</li>
										<li>
											<label class="control-inline fancy-checkbox">
												<input type="checkbox"><span></span>
											</label>
											<p>
												<strong>Functional Spec Meeting</strong>
												<span class="short-description">Monotonectally formulate client-focused core competencies after parallel web-readiness.</span>
												<span class="date">Oct 11, 2016</span>
											</p>
											<div class="controls">
												<a href="#"><i class="icon-software icon-software-pencil"></i></a> <a href="#"><i class="icon-arrows icon-arrows-circle-remove"></i></a>
											</div>
										</li>
									</ul>
								</div>
							</div>
							END TODO LIST
						</div>
						<div class="col-md-5">
							TIMELINE
							<div class="panel panel-scrolling">
								<div class="panel-heading">
									<h3 class="panel-title">Recent User Activity</h3>
									<div class="right">
										<button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
										<button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
									</div>
								</div>
								<div class="panel-body">
									<ul class="list-unstyled activity-list">
										<li>
											<img src="resources/img/user1.png" alt="Avatar" class="img-circle pull-left avatar">
											<p><a href="#">Michael</a> has achieved 80% of his completed tasks <span class="timestamp">20 minutes ago</span></p>
										</li>
										<li>
											<img src="resources/img/user2.png" alt="Avatar" class="img-circle pull-left avatar">
											<p><a href="#">Daniel</a> has been added as a team member to project <a href="#">System Update</a> <span class="timestamp">Yesterday</span></p>
										</li>
										<li>
											<img src="resources/img/user3.png" alt="Avatar" class="img-circle pull-left avatar">
											<p><a href="#">Martha</a> created a new heatmap view <a href="#">Landing Page</a> <span class="timestamp">2 days ago</span></p>
										</li>
										<li>
											<img src="resources/img/user4.png" alt="Avatar" class="img-circle pull-left avatar">
											<p><a href="#">Jane</a> has completed all of the tasks <span class="timestamp">2 days ago</span></p>
										</li>
										<li>
											<img src="resources/img/user5.png" alt="Avatar" class="img-circle pull-left avatar">
											<p><a href="#">Jason</a> started a discussion about <a href="#">Weekly Meeting</a> <span class="timestamp">3 days ago</span></p>
										</li>
									</ul>
									<button type="button" class="btn btn-primary btn-bottom center-block">Load More</button>
								</div>
							</div>
							END TIMELINE
						</div>
					</div> -->
				<!-- <div class="row">
						<div class="col-md-4">
							TASKS
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">My Tasks</h3>
									<div class="right">
										<button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
										<button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
									</div>
								</div>
								<div class="panel-body">
									<ul class="list-unstyled task-list">
										<li>
											<p>Updating Users Settings <span class="label-percent">23%</span></p>
											<div class="progress progress-xs">
												<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="23" aria-valuemin="0" aria-valuemax="100" style="width:23%">
													<span class="sr-only">23% Complete</span>
												</div>
											</div>
										</li>
										<li>
											<p>Load &amp; Stress Test <span class="label-percent">80%</span></p>
											<div class="progress progress-xs">
												<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
													<span class="sr-only">80% Complete</span>
												</div>
											</div>
										</li>
										<li>
											<p>Data Duplication Check <span class="label-percent">100%</span></p>
											<div class="progress progress-xs">
												<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
													<span class="sr-only">Success</span>
												</div>
											</div>
										</li>
										<li>
											<p>Server Check <span class="label-percent">45%</span></p>
											<div class="progress progress-xs">
												<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 45%">
													<span class="sr-only">45% Complete</span>
												</div>
											</div>
										</li>
										<li>
											<p>Mobile App Development <span class="label-percent">10%</span></p>
											<div class="progress progress-xs">
												<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100" style="width: 10%">
													<span class="sr-only">10% Complete</span>
												</div>
											</div>
										</li>
									</ul>
								</div>
							</div>
							END TASKS
						</div>
						<div class="col-md-4">
							VISIT CHART
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">Website Visits</h3>
									<div class="right">
										<button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
										<button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
									</div>
								</div>
								<div class="panel-body">
									<div id="visits-chart" class="ct-chart"></div>
								</div>
							</div>
							END VISIT CHART
						</div>
						<div class="col-md-4">
							REALTIME CHART
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">System Load</h3>
									<div class="right">
										<button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
										<button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
									</div>
								</div>
								<div class="panel-body">
									<div id="system-load" class="easy-pie-chart" data-percent="70">
										<span class="percent">70</span>
									</div>
									<h4>CPU Load</h4>
									<ul class="list-unstyled list-justify">
										<li>High: <span>95%</span></li>
										<li>Average: <span>87%</span></li>
										<li>Low: <span>20%</span></li>
										<li>Threads: <span>996</span></li>
										<li>Processes: <span>259</span></li>
									</ul>
								</div>
							</div>
							END REALTIME CHART
						</div>
					</div> -->
			</div>
		</div>
		<!-- END MAIN CONTENT -->
	</div>
	<!-- END MAIN -->
	<div class="clearfix"></div>
	<footer>
		<div class="container-fluid">
			<p class="copyright">
				&copy; 2020 <a href="https://www.themeineed.com" target="_blank">Theme
					I Need</a>. All Rights Reserved.
			</p>
		</div>
	</footer>
	<!-- END WRAPPER -->
	<!-- Javascript -->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/chartist/js/chartist.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/scripts/klorofil-common.js"></script>
	<script>
	$(function() {
		var data, options;
		
		// headline charts
		data = {
			labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
			series: [
				[23, 29, 24, 40, 25, 24, 35],
				[14, 25, 18, 34, 29, 38, 44],
			]
		};

		options = {
			height: 300,
			showArea: true,
			showLine: false,
			showPoint: false,
			fullWidth: true,
			axisX: {
				showGrid: false
			},
			lineSmooth: false,
		};

		new Chartist.Line('#headline-chart', data, options);


		// visits trend charts
		data = {
			labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
			series: [{
				name: 'series-real',
				data: [200, 380, 350, 320, 410, 450, 570, 400, 555, 620, 750, 900],
			}, {
				name: 'series-projection',
				data: [240, 350, 360, 380, 400, 450, 480, 523, 555, 600, 700, 800],
			}]
		};

		options = {
			fullWidth: true,
			lineSmooth: false,
			height: "270px",
			low: 0,
			high: 'auto',
			series: {
				'series-projection': {
					showArea: true,
					showPoint: false,
					showLine: false
				},
			},
			axisX: {
				showGrid: false,

			},
			axisY: {
				showGrid: false,
				onlyInteger: true,
				offset: 0,
			},
			chartPadding: {
				left: 20,
				right: 20
			}
		};

		new Chartist.Line('#visits-trends-chart', data, options);


		// visits chart
		data = {
			labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
			series: [
				[6384, 6342, 5437, 2764, 3958, 5068, 7654]
			]
		};

		options = {
			height: 300,
			axisX: {
				showGrid: false
			},
		};

		new Chartist.Bar('#visits-chart', data, options);


		// real-time pie chart
		var sysLoad = $('#system-load').easyPieChart({
			size: 130,
			barColor: function(percent) {
				return "rgb(" + Math.round(200 * percent / 100) + ", " + Math.round(200 * (1.1 - percent / 100)) + ", 0)";
			},
			trackColor: 'rgba(245, 245, 245, 0.8)',
			scaleColor: false,
			lineWidth: 5,
			lineCap: "square",
			animate: 800
		});

		var updateInterval = 3000; // in milliseconds

		setInterval(function() {
			var randomVal;
			randomVal = getRandomInt(0, 100);

			sysLoad.data('easyPieChart').update(randomVal);
			sysLoad.find('.percent').text(randomVal);
		}, updateInterval);

		function getRandomInt(min, max) {
			return Math.floor(Math.random() * (max - min + 1)) + min;
		}

	});
	</script>
</body>

</html>
