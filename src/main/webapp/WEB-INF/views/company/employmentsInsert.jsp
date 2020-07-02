<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	.t {text-align: center;}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<div id="sub_vis_wrap" class="sub01 page01">
	<div class="hd_box"></div>
	<div class="visual-area ">
		<div class="visual-area-in">
			<div class="visual-area-txt inner sub01 ">
				<div class="tit" data-aos="fade-up" data-aos-delay="300"> 공고 등록</div>
				<p class="fs18" data-aos="fade-up" data-aos-delay="400">
					시간을 허비말고 DO HUBY<br>
					허비를 통해 공고를 쉽게 등록해보세요.
				</p>
			</div>
		</div>
	</div>
	<div class="sub_menu_wrap s-inner sub_menu_pc ">
		<div class="sub_menu_tit">
			
		</div>

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
<form method="POST" action="comEmpInsert.do" class="w3-container w3-card w3-text-blue w3-margin">
	<br>
	<h2>공고 작성하기</h2>
	<div class="w3-row w3-section">
 		<div class="w3-col" style="width:150px">
 			공고제목
 		</div>
   		<div class="w3-rest">
      		<input class="w3-input w3-border" name="title" type="text" placeholder="공고제목을 입력하세요" required="required">
    	</div>
	</div>
	<div class="w3-row w3-section">
  		<div class="w3-col" style="width:150px">
  			희망 커리어
  		</div>
    	<div class="w3-rest">
      		<select class="w3-select w3-border" name="career" required="required">
  				<option value="" disabled selected>선택</option>
  				<option value="신입">신입</option>
  				<option value="경력">경력</option>
  				<option value="신입/경력">신입/경력</option>
			</select>
    	</div>
	</div>
	<div class="w3-row w3-section">
  		<div class="w3-col" style="width:150px">
  			희망 직급
  		</div>
    	<div class="w3-rest">
      		<select class="w3-select w3-border" name="position" required="required">
  				<option value="" disabled selected>선택</option>
  				<option value="사원">사원급</option>
  				<option value="대리">대리급</option>
  				<option value="과장">과장급</option>
  				<option value="차장">차장급</option>
  				<option value="팀장">팀장급</option>
			</select>
    	</div>
	</div>
	<div class="w3-row w3-section">
  		<div class="w3-col" style="width:150px">
  			희망 학력
  		</div>
    	<div class="w3-rest">
      		<select class="w3-select w3-border" name="graduate" required="required">
  				<option value="" disabled selected>선택</option>
  				<option value="학력무관"> 학력무관</option>
  				<option value="고등학교졸업"> 고등학교졸업 이상</option>
  				<option value="대학졸업"> 대학졸업(2,3년) 이상</option>
  				<option value="대학교졸업"> 대학교졸업(4년) 이상</option>
  				<option value="석사졸업"> 석사졸업 이상</option>
  				<option value="박사졸업"> 박사졸업 이상</option>
			</select>
    	</div>
	</div>
	<div class="w3-row w3-section">
  		<div class="w3-col" style="width:150px">
  			희망 지역
  		</div>
    	<div class="w3-rest">
      		<select class="w3-select w3-border" name="location" required="required">
		  				<option value="" disabled selected>선택</option>
		  				<option value="전국"> 전국</option>
						<option value="서울"> 서울</option>
						<option value="경기"> 경기</option>
						<option value="인천"> 인천</option>
						<option value="강원"> 강원</option>
						<option value="대전"> 대전</option>
						<option value="세종"> 세종</option>
						<option value="충남"> 충남</option>
						<option value="충북"> 충북</option>
						<option value="부산"> 부산</option>
						<option value="울산"> 울산</option>
						<option value="경남"> 경남</option>
						<option value="경북"> 경북</option>
						<option value="대구"> 대구</option>
						<option value="광주"> 광주</option>
						<option value="전남"> 전남</option>
						<option value="전북"> 전북</option>
						<option value="제주"> 제주</option>
			</select>
    	</div>
	</div>
	<div class="w3-row w3-section">
  		<div class="w3-col" style="width:150px">
  			업직종
  		</div>
    	<div class="w3-rest">
      		<select class="w3-select w3-border" name="job" required="required">
			  			  <option value="" disabled selected>선택</option>
			  			  <option value="104178">예술기획 관련직</option>
						  <option value="104203">보건의료 관련 서비스직</option>
						  <option value="104204">자연친화 관련직</option>
						  <option value="104186">인문 및 사회과학전문직</option>
						  <option value="104174">악기 관련직</option>
						  <option value="104183">고급 운전 관련직</option>
						  <option value="104197">조리 관련직</option>
						  <option value="104172">일반운전 및 정비 관련직</option>
						  <option value="104170">시각디자인 관련직</option>
						  <option value="104175">운동 및 안전 관련직</option>
						  <option value="104192">교육 관련 서비스직</option>
						  <option value="104168">농림어업 관련직</option>
						  <option value="104181">영업 관련 서비스직</option>
						  <option value="104191">음악 관련직</option>
						  <option value="104188">연기 관련직</option>
						  <option value="104185">환경관련 전문직</option>
						  <option value="104177">기획 서비스직</option>
						  <option value="104169">IT관련 공학 전문직</option>
						  <option value="104193">기능직</option>
						  <option value="104198">매니지먼트 관련직</option>
						  <option value="104199">언어 관련 전문직</option>
						  <option value="104200">인문계 교육 관련직</option>
						  <option value="104171">일반 서비스직</option>
						  <option value="104196">이공계 교육 관련직</option>
						  <option value="104182">법률 및 사회활동 관련직</option>
						  <option value="104173">이학 및 공학 전문직</option>
						  <option value="104179">의복제조 관련직</option>
						  <option value="104194">회계 관련직</option>
						  <option value="104187">영상 관련직</option>
						  <option value="104184">특수(소프트) 스포츠 관련직</option>
						  <option value="104201">의료 관련 전문직</option>
						  <option value="104180">기술직</option>
						  <option value="104176">이미용 관련 서비스직</option>
						  <option value="104189">무용 관련직</option>
						  <option value="104202">사회서비스직</option>
						  <option value="104190">금융 및 경영 관련 전문직</option>
						  <option value="104195">작가 관련직</option>
						  <option value="100001">기타</option>
			</select>
    	</div>
	</div>
	<div class="w3-row w3-section">
  		<div class="w3-col" style="width:150px">
  			근무형태
  		</div>
    	<div class="w3-rest">
      		<select class="w3-select w3-border" name="worktype" required="required">
      			<option value="" disabled selected>선택</option>
				<option value="정규직">정규직</option>
				<option value="계약직">계약직</option>
				<option value="무기계약직">무기계약직</option>
				<option value="인턴직">인턴직</option>
				<option value="아르바이트">아르바이트</option>
				<option value="파견직">파견직</option>
				<option value="해외취업">해외취업</option>
				<option value="프리랜서">프리랜서</option>
			</select>
    	</div>
	</div>
	<div class="w3-row w3-section">
  		<div class="w3-col" style="width:150px">
  			공고내용
  		</div>
    	<div class="w3-rest">
      		<textarea class="w3-input w3-border" name="contents" required="required">
			</textarea>
    	</div>
	</div>
	<div class="w3-row w3-section">
  		<div class="w3-col" style="width:150px">
  			우대사항
  		</div>
    	<div class="w3-rest">
      		<textarea class="w3-input w3-border" name="prefer" required="required">
			</textarea>
    	</div>
	</div>
	<div class="w3-row w3-section">
  		<div class="w3-col" style="width:150px">
  			희망 연봉
  		</div>
    	<div class="w3-rest">
      		<select class="w3-select w3-border" name="salary" required="required">
      			<option value="" disabled selected>선택</option>
				<option value="회사내규">회사 내규에 따름</option>
				<option value="1,400만원">1,400만원 이하</option>
				<option value="1,400~1,600만원">1,400~1,600만 원</option>
				<option value="1,600~1,800만원">1,600~1,800만원</option>
				<option value="1,800~2,000만원">1,800~2,000만원</option>
				<option value="2,000~2,200만원">2,000~2,200만원</option>
				<option value="2,200~2,400만원">2,200~2,400만원</option>
				<option value="2,400~2,600만원">2,400~2,600만원</option>
				<option value="2,600~2,800만원">2,600~2,800만원</option>
				<option value="2,800~3,000만원">2,800~3,000만원</option>
				<option value="3,000~3,200만원">3,000~3,200만원</option>
				<option value="3,200~3,400만원">3,200~3,400만원</option>
				<option value="3,400~3,600만원">3,400~3,600만원</option>
				<option value="3,600~3,800만원">3,600~3,800만원</option>
				<option value="3,800~4,000만원">3,800~4,000만원</option>
				<option value="4,000~5,000만원">4,000~5,000만원</option>
				<option value="5,000~6,000만원">5,000~6,000만원</option>
				<option value="6,000~7,000만원">6,000~7,000만원</option>
				<option value="7,000~8,000만원">7,000~8,000만원</option>
				<option value="8,000~9,000만원">8,000~9,000만원</option>
				<option value="9,000~1억원">9,000~1억원</option>
			</select>
    	</div>
	</div>
	<div class="w3-row w3-section">
  		<div class="w3-col" style="width:150px">
  			공고기간
  		</div>
    	<div class="w3-rest">
    		<input class="w3-input w3-border" type="date" name="time" required="required">
    	</div>
	</div>
	
	<p class="w3-center">
	<button class="w3-button w3-section w3-blue w3-ripple" type="submit"> 공고하기 </button>
	</p>
	
</form>
<!-- 실제소스 끝 -->
	</div>
</div>

	
	
	
	
	
	
	<!-- 이전코드
  <h4>공고내용</h4>
  <textarea name="contents" id="contents" rows="4" cols="100" required="required"></textarea>

  <hr>
  <h4>우대사항</h4>
  <textarea form ="modifyFrm" name="prefer" id="prefer" rows="4" cols="100" required="required"></textarea>

  <br>
  
  <h4>희망 연봉</h4>
  <select name="salary" required="required">
    <option value="회사내규">회사 내규에 따름</option>
	<option value="1,400만원">1,400만원 이하</option>
	<option value="1,400~1,600만원">1,400~1,600만 원</option>
	<option value="1,600~1,800만원">1,600~1,800만원</option>
	<option value="1,800~2,000만원">1,800~2,000만원</option>
	<option value="2,000~2,200만원">2,000~2,200만원</option>
	<option value="2,200~2,400만원">2,200~2,400만원</option>
	<option value="2,400~2,600만원">2,400~2,600만원</option>
	<option value="2,600~2,800만원">2,600~2,800만원</option>
	<option value="2,800~3,000만원">2,800~3,000만원</option>
	<option value="3,000~3,200만원">3,000~3,200만원</option>
	<option value="3,200~3,400만원">3,200~3,400만원</option>
	<option value="3,400~3,600만원">3,400~3,600만원</option>
	<option value="3,600~3,800만원">3,600~3,800만원</option>
	<option value="3,800~4,000만원">3,800~4,000만원</option>
	<option value="4,000~5,000만원">4,000~5,000만원</option>
	<option value="5,000~6,000만원">5,000~6,000만원</option>
	<option value="6,000~7,000만원">6,000~7,000만원</option>
	<option value="7,000~8,000만원">7,000~8,000만원</option>
	<option value="8,000~9,000만원">8,000~9,000만원</option>
	<option value="9,000~1억원">9,000~1억원</option>
 </select>	
	




<h2 class="t">
	공고 작성하기
</h2>

<form method="POST" action="comEmpInsert.do">
  <div class="t">

  <hr>
  <h4>공고 제목</h4>
  <input type="text" name="title" id="title">
  

  <h4>희망 커리어</h4>
  <select name="career" required="required">
  <option value="신입">신입</option>
  <option value="경력">경력</option>
  <option value="신입/경력" selected="selected">신입/경력</option>
  </select>
  

  <h4>직급</h4>
  <select name="position" required="required">
  <option value="사원">사원급</option>
  <option value="대리">대리급</option>
  <option value="과장">과장급</option>
  <option value="차장">차장급</option>
  <option value="팀장">팀장급</option>
  </select>
  

  <h4>학력</h4>
  <select name="graduate" required="required">
  <option value="학력무관"> 학력무관</option>
  <option value="고등학교졸업"> 고등학교졸업 이상</option>
  <option value="대학졸업"> 대학졸업(2,3년) 이상</option>
  <option value="대학교졸업"> 대학교졸업(4년) 이상</option>
  <option value="석사졸업"> 석사졸업 이상</option>
  <option value="박사졸업"> 박사졸업 이상</option>
  </select>
  
  <h4>지역</h4>
  <select name="location" multiple="multiple" required="required">
  <option value="전국"> 전국</option>
  <option value="서울"> 서울</option>
  <option value="경기"> 경기</option>
  <option value="인천"> 인천</option>
  <option value="강원"> 강원</option>
  <option value="대전"> 대전</option>
  <option value="세종"> 세종</option>
  <option value="충남"> 충남</option>
  <option value="충북"> 충북</option>
  <option value="부산"> 부산</option>
  <option value="울산"> 울산</option>
  <option value="경남"> 경남</option>
  <option value="경북"> 경북</option>
  <option value="대구"> 대구</option>
  <option value="광주"> 광주</option>
  <option value="전남"> 전남</option>
  <option value="전북"> 전북</option>
  <option value="제주"> 제주</option>
  </select>

  <h4>업직종</h4>
  <select name="job" required="required">
  <option value="104178">예술기획 관련직</option>
  <option value="104203">보건의료 관련 서비스직</option>
  <option value="104204">자연친화 관련직</option>
  <option value="104186">인문 및 사회과학전문직</option>
  <option value="104174">악기 관련직</option>
  <option value="104183">고급 운전 관련직</option>
  <option value="104197">조리 관련직</option>
  <option value="104172">일반운전 및 정비 관련직</option>
  <option value="104170">시각디자인 관련직</option>
  <option value="104175">운동 및 안전 관련직</option>
  <option value="104192">교육 관련 서비스직</option>
  <option value="104168">농림어업 관련직</option>
  <option value="104181">영업 관련 서비스직</option>
  <option value="104191">음악 관련직</option>
  <option value="104188">연기 관련직</option>
  <option value="104185">환경관련 전문직</option>
  <option value="104177">기획 서비스직</option>
  <option value="104169">IT관련 공학 전문직</option>
  <option value="104193">기능직</option>
  <option value="104198">매니지먼트 관련직</option>
  <option value="104199">언어 관련 전문직</option>
  <option value="104200">인문계 교육 관련직</option>
  <option value="104171">일반 서비스직</option>
  <option value="104196">이공계 교육 관련직</option>
  <option value="104182">법률 및 사회활동 관련직</option>
  <option value="104173">이학 및 공학 전문직</option>
  <option value="104179">의복제조 관련직</option>
  <option value="104194">회계 관련직</option>
  <option value="104187">영상 관련직</option>
  <option value="104184">특수(소프트) 스포츠 관련직</option>
  <option value="104201">의료 관련 전문직</option>
  <option value="104180">기술직</option>
  <option value="104176">이미용 관련 서비스직</option>
  <option value="104189">무용 관련직</option>
  <option value="104202">사회서비스직</option>
  <option value="104190">금융 및 경영 관련 전문직</option>
  <option value="104195">작가 관련직</option>
  <option value="100001">기타</option>
  </select>

  <h4>근무형태</h4>
  <select name="worktype" required="required">
  <option value="정규직">정규직</option>
  <option value="계약직">계약직</option>
  <option value="무기계약직">무기계약직</option>
  <option value="인턴직">인턴직</option>
  <option value="아르바이트">아르바이트</option>
  <option value="파견직">파견직</option>
  <option value="해외취업">해외취업</option>
  <option value="프리랜서">프리랜서</option>
  </select>
 
  <hr>
  <h4>공고내용</h4>
  <textarea name="contents" id="contents" rows="4" cols="100" required="required"></textarea>
  

  <hr>
  <h4>우대사항</h4>
  <textarea form ="modifyFrm" name="prefer" id="prefer" rows="4" cols="100" required="required"></textarea>
 <br>
  
  <h4>희망 연봉</h4>
  <select name="salary" required="required">
    <option value="회사내규">회사 내규에 따름</option>
	<option value="1,400만원">1,400만원 이하</option>
	<option value="1,400~1,600만원">1,400~1,600만 원</option>
	<option value="1,600~1,800만원">1,600~1,800만원</option>
	<option value="1,800~2,000만원">1,800~2,000만원</option>
	<option value="2,000~2,200만원">2,000~2,200만원</option>
	<option value="2,200~2,400만원">2,200~2,400만원</option>
	<option value="2,400~2,600만원">2,400~2,600만원</option>
	<option value="2,600~2,800만원">2,600~2,800만원</option>
	<option value="2,800~3,000만원">2,800~3,000만원</option>
	<option value="3,000~3,200만원">3,000~3,200만원</option>
	<option value="3,200~3,400만원">3,200~3,400만원</option>
	<option value="3,400~3,600만원">3,400~3,600만원</option>
	<option value="3,600~3,800만원">3,600~3,800만원</option>
	<option value="3,800~4,000만원">3,800~4,000만원</option>
	<option value="4,000~5,000만원">4,000~5,000만원</option>
	<option value="5,000~6,000만원">5,000~6,000만원</option>
	<option value="6,000~7,000만원">6,000~7,000만원</option>
	<option value="7,000~8,000만원">7,000~8,000만원</option>
	<option value="8,000~9,000만원">8,000~9,000만원</option>
	<option value="9,000~1억원">9,000~1억원</option>
 </select>

  <hr>
  <h4>공고 기간</h4>
	<label><input type="radio" name="time" value="2999-10-10">상시모집</label>
	<input type="date" name="time">
	<br>
	</div>
	<button type="submit">공고하기</button>
</form>
 -->