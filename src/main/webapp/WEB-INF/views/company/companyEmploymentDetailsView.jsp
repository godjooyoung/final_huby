<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="sub_vis_wrap" class="sub01 page01">
	<div class="hd_box"></div>
	<div class="visual-area ">
		<div class="visual-area-in">
			<div class="visual-area-txt inner sub01 ">
				<div class="tit" data-aos="fade-up" data-aos-delay="300"> 공고 상세내용</div>
				<p class="fs18" data-aos="fade-up" data-aos-delay="400">
					시간을 허비말고 DO HUBY!<br>
					공고의 상세 내용을 확인하세요.
				</p>
			</div>
		</div>
	</div>
	<div class="sub_menu_wrap s-inner sub_menu_pc ">
		<div class="sub_menu_tit"></div>
		<ul class="sub_menu_box sub01">
			<li class="m1"><a href="forcomemploymentsList.do">공고관리</a></li>
			<li class="m2"><a href="empInsertPageGo.do">공고등록</a></li>
			<li class="m3"><a href="companyEmploymentsList.do">지원내역</a></li>
		</ul>
	</div>
</div>
<div id="sub_content_wrap" class="sub0101">
	<div class="ov inner center" style="margin: 10% auto 2%;">    
    <!-- 실제소스 -->
    <!-- ---------------------------- -->
    <div class="w3-container w3-margin-bottom" style="background-color:#134a8e;">
    	<div style="vertical-align: middle;">
    		&nbsp;<h3 style="color:white; margin-bottom:20px;">공고타이틀 자리</h3>
    	</div>
	</div>
	<div class="w3-row-padding ">
		<div class="w3-twothird">
			  <h2>여기에 공ㄱ소내용 때려박는다</h2>
			  <p>Chardonnay is the world's most popular wine grape.</p>
			  <p>The taste of the Chardonnay grape is very neutral and easy to like.</p>
			  <p>Many of the Chardonnay flavors are derived from terroir and oak-aging.</p>
			  <p>The flavors varies from noticeable acidity (Cold Climates), to crisply and mineral (Chablis, France) 
			  with flavors of green plum, apple and pear, to heavy oak and tropical fruit flavors (the New World). </p>
			  <p>In cooler climates Chardonnay tends to be under-riped. </p>
			  <p>In warmer climates the flavors tend to vary from lemon to peach and melon.</p>
			  <p>In very warm climates Chardonnay tends to be over-riped.</p>
			  <p>Oaked Chardonnay tends to have softer acidity and more fruit flavors with 
			  added butter, cream and hazelnut notes.</p>
			  <h2>여기에 우대내용 때려박는다</h2>
			  <p>In warmer climates the flavors tend to vary from lemon to peach and melon.</p>
			  <p>In very warm climates Chardonnay tends to be over-riped.</p>
			  <p>Oaked Chardonnay tends to have softer acidity and more fruit flavors with 
			  added butter, cream and hazelnut notes.</p>
 		</div>
 		
		<div class="w3-third">
 			<table class="w3-table w3-bordered w3-border">
  				<thead class="w3" style="background-color:#1a56a1;">
  					<h3>지원자격</h3>
  				</thead>
  				<tr>
  					<th style="width:50%">경력</th>
  					<th style="width:50%">학력</th>
  				</tr>
  				<tr>
  					<td style="width:50%">희망커리어자리</td>
  					<td style="width:50%">희망학력</td>
  				</tr>
  			</table>
  			
  			
 			<table class="w3-table w3-bordered w3-border">
  				<thead class="w3-blue">
  					&nbsp;
  					<h3>근무조건</h3>
  				</thead>
  				<tr>
  					<th style="width:50%">희망샐러리</th>
  					<th style="width:50%">지역</th>
  				</tr>
  				<tr>
  					<td style="width:50%">돈</td>
  					<td style="width:50%">지역</td>
  				</tr>
  			</table>
  			
  			
 			<table class="w3-table w3-bordered w3-border">
  				<thead class="w3-teal">
  					&nbsp;
  					<h3>모집형태</h3>
  				</thead>
  				<tr>
  					<th style="width:33%">고용형태</th>
  					<th style="width:33%">모집직종</th>
  					<th style="width:33%">근무포지션</th>
  				</tr>
  				<tr>
  					<td style="width:33%">정규인턴등등</td>
  					<td style="width:33%">모집직종</td>
  					<td style="width:33%">근무포지션</td>
  				</tr>
  			</table>
	</div>
</div>
    
   
    <!-- ---------------------------- -->
    <h1>공고 상세 페이지</h1>
    <table>
    <tr>
    	<th>
    		공고 상세 내용
    	</th>
    </tr>
    <tr>
    	<td>
    		*${employmentsDetails.employment_title}
    	</td>
    </tr>
    <tr>
    	<td>*
    	<fmt:formatDate pattern ="yyyy년MM월dd일 까지" value="${employmentsDetails.employment_time}"/>
    	</td>
    	<td>
    		*${employmentsDetails.hope_salary}
    	</td>
    </tr>
    <tr>
    	<td>
    		*${employmentsDetails.employment_contents}
    	</td>
    </tr>
    <tr>
    	<td>
    		*${employmentsDetails.hope_career}
    	</td>
    	<td>
    		*${employmentsDetails.hope_graduate}
    	</td>
    </tr>
    <tr>
    	<td>
    		*${employmentsDetails.hope_job_position}
    	</td>
    	<td>
    		*${employmentsDetails.hope_job}
    	</td>
    </tr>
    <tr>
    	<td>
    		*${employmentsDetails.hope_location}
    	</td>
    	<td>
    		*${employmentsDetails.hope_work_type}
    	</td>
    </tr>
    <tr>
    	<td>
    		*${employmentsDetails.employment_prefer}
    	</td>
    </tr>
    </table>
    <br>
	
	<form id="formodify" name="formodify" action="">
	<input type="hidden" name ="emp_id" id="emp_id" value="${employmentsDetails.employment_id}">
	<input type="hidden" name ="title" id="title" value="${employmentsDetails.employment_title}">
	<input type="hidden" name ="contents" id="contents" value="${employmentsDetails.employment_contents}">
	<input type="hidden" name ="prefer" id="prefer" value="${employmentsDetails.employment_prefer}">
	<input type="hidden" name="salary" id="salary" value="${employmentsDetails.hope_salary}"> 
	<input type="hidden" name="job" id="job" value="${employmentsDetails.hope_job}"> 
	<input type="hidden" name="graduate" id="graduate" value="${employmentsDetails.hope_graduate}"> 
	<input type="hidden" name="position" id="position" value="${employmentsDetails.hope_job_position}"> 
	<input type="hidden" name="career" id="career" value="${employmentsDetails.hope_career}"> 
	<input type="hidden" name="worktype" id="worktype" value="${employmentsDetails.hope_work_type}"> 

	<input type="button"  class="btn btn-primary" value="수정"  id="btnUpdate" onclick="subm('modi')"> 
	<input type="button"  class="btn btn-primary" value="삭제"  id="btnDelete" onclick="subm('dele')">
	<input type="button"  class="btn btn-success" value="마감"  id="btnComplete" onclick="subm('complete')">
	</form>
<!-- END -->
</div>
</div>	
<script>
function subm(type){
	var employment_id =document.getElementById("emp_id").value ;
	if (type == "modi"){
	alert(employment_id +"번 공고를 수정합니다.");
	document.getElementById("formodify").action="empMpdifyPageGo.do";
	document.getElementById("formodify").method = "post";
	document.getElementById("formodify").submit();
	}else if(type =="dele") {
            if (confirm("정말 삭제하시겠습니까? 해당공고에 지원자가 있을 수 있습니다.") == true) {
                 // Yes click
                document.getElementById("formodify").action="delete_employment.do";
         		document.getElementById("formodify").method = "post";
         		document.getElementById("formodify").submit();
            } else {
            	alert("공고 삭제를 취소하셨습니다.");
			}
        }else {
        	if (document.getElementById("btnComplete").value == "마감") {
        	if (confirm("공고를 마감하시겠습니까?") == true) {
        		 var emp_id =document.getElementById("emp_id").value;
                // Yes click
                	$.ajax({
					type:"post",
					url:"complete.do",
					data : {'emp_id': emp_id },  
					//contentType: 'application/json', 
					success: function(){
			 		alert("공고마감했습니다.");
			 		document.getElementById("btnComplete").value="마감 취소"
					},
					error: function(){
			  		alert("에러 발생. 관리자에게 문의주세요.");
			}
		})//end ajax
           } else {
           	alert("공고 마감 취소.");
			}
        }else{
        	if (confirm("공고를 재개하십니까?") == true) {
                // Yes click
                	$.ajax({
					type:"post",
					url:"re_post.do",
					data : {'emp_id': emp_id },  
					//contentType: 'application/json', 
					success: function(){
			 		alert("공고재개했습니다.");
			 		document.getElementById("btnComplete").value="마감"
					},
					error: function(){
			  		alert("에러 발생. 관리자에게 문의주세요.");
			}
		})//end ajax
                 
           } else {
           	alert("공고 재개취소.");
			}
        }
        }
	}	
</script>