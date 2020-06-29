<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://uicdn.toast.com/tui.chart/latest/tui-chart.min.css">
<script src="https://uicdn.toast.com/tui.chart/latest/tui-chart.min.js"></script>
<title>Insert title here</title>
<style>
	#div1{color: red}
</style>
<script>
	function habitcheck(hid){
		/* let today = new Date();
		var date = new Date();
		var hours = date.getHours(); // 시
		var minutes = date.getMinutes(); // 분
		var seconds = date.getSeconds(); // 초
		var month = date.getMonth(); // 월
		var clockDate = date.getDate(); // 일
	    
		
		var yymmdd = document.write(today.toLocaleDateString() + '<br>');
		var hhmmss = document.write(today.toLocaleTimeString() + '<br>');
		var ymdhms = today.toLocaleString();
		alert(ymdhms);
		$("habit_log_date").val(ymdhms);
		alert(month+"월 "+ clockDate+"일 "+hours+"시 "+minutes+"분 "+seconds+"초");
		
		var count = 0;
		count++;
		$("cnt").val(count); */
		
		$("#habit_id").val(hid);
		
		$("#frm").attr("action","habitUpdate.do");
		document.frm.submit();
	}
	
	function habitInsertPage(){
		$("#frm").attr("action","habitInsertPage.do");
		document.frm.submit();
	}
	
	function habitDelete(hid){
		$("#habit_id").val(hid);
		alert(hid);
		$("#frm").attr("action","habitDelete.do");
		document.frm.submit();
	}
</script>
<script>
var container = document.getElementById('chart-area');
var data = {
    categories: ['June', 'July', 'Aug', 'Sep', 'Oct', 'Nov'],
    series: [
        {
            name: 'Budget',
            data: [5000, 3000, 5000, 7000, 6000, 4000]
        },
        {
            name: 'Income',
            data: [8000, 1000, 7000, 2000, 5000, 3000]
        }
    ]
};
var options = {
    chart: {
        width: 1160,
        height: 650,
        title: 'Monthly Revenue',
        format: '1,000'
    },
    yAxis: {
        title: 'Month'
    },
    xAxis: {
        title: 'Amount',
        min: 0,
        max: 9000,
        suffix: '$'
    },
     series: {
         showLabel: true
     }
};
var theme = {
    series: {
        colors: [
            '#83b14e', '#458a3f', '#295ba0', '#2a4175', '#289399',
            '#289399', '#617178', '#8a9a9a', '#516f7d', '#dddddd'
        ]
    }
};

// For apply theme

// tui.chart.registerTheme('myTheme', theme);
// options.theme = 'myTheme';

tui.chart.barChart(container, data, options);
</script>
</head>
<body>
<div id="chart-area"></div>
<form id="frm" name="frm" method="post">
<div align="center">
<button class="btn-primary" onclick="habitInsertPage()"> 습관 등록하기 </button>
<h1>습관 관리</h1>
<div id="chart-area">
인증 버튼은 하루에 한번만 클릭 가능
</div>
<br>
<c:forEach items="${ hlist }" var="habit">
습관명:${ habit.habit_name }<br>
<fmt:formatDate value="${ habit.habit_start_date }" pattern="yyyy-MM-dd" var="habit_start_date" />
시작시간:${ habit_start_date }<br>
<fmt:formatDate value="${ habit.habit_log_date }" pattern="yyyy-MM-dd HH:mm:ss" var="habit_log_date" />
최근체크시간:${ habit_log_date }<br>
체크:${ habit.cnt }&nbsp;&nbsp;&nbsp;
<button type="button" class="btn-primary" onclick="habitcheck(${habit.habit_id})"
<c:if test="${ habit.checked == 1 }">disabled
</c:if>
>인증</button><br>
<button type="button" class="btn-primary" onclick="habitDelete(${habit.habit_id})">습관 삭제</button>
<br><br><br>
</c:forEach>
</div>
<input type="hidden" id="habit_id" name="habit_id">
</form>

</body>
</html>