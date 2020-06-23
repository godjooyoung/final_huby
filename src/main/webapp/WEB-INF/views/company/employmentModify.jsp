<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<br><br><br><br><br><br>
<h2>
	공고 수정하기
</h2>
<form id ="modifyFrm" method="POST" action="employupdate.do">

  <!-- title -->
  <hr>
  <h4>공고 제목</h4>
  <input type='hidden' name="emp_id" id="emp_id" value='${before.employment_id }'>
  <input type="text" name="title" id="title" value="${before.employment_title }">
  <!-- 커리어 -->
  <hr>
  <h4>희망 커리어</h4>
  <label><input type="radio" name="career" value="신입"> 신입</label>
  <label><input type="radio" name="career" value="경력"> 경력</label>
  <label><input type="radio" name="career" value="신입/경력"> 신입/경력</label>
  
  <!-- 직급 -->
  <hr>
  <h4>직급</h4>
  <label><input type="radio" name="position" value="사원"> 사원급</label>
  <label><input type="radio" name="position" value="대리"> 대리급</label>
  <label><input type="radio" name="position" value="과장"> 과장급</label>
  <label><input type="radio" name="position" value="차장"> 차장급</label>
  <label><input type="radio" name="position" value="팀장"> 팀장급</label>
  
  <!-- GRADUATE -->
  <hr>
  <h4>학력</h4>
  <label><input type="radio" name="graduate" value="학력무관"> 학력무관</label>
  <label><input type="radio" name="graduate" value="고등학교졸업"> 고등학교졸업 이상</label>
  <label><input type="radio" name="graduate" value="대학졸업"> 대학졸업(2,3년) 이상</label>
  <label><input type="radio" name="graduate" value="대학교졸업"> 대학교졸업(4년) 이상</label>
  <label><input type="radio" name="graduate" value="석사졸업"> 석사졸업 이상</label>
  <label><input type="radio" name="graduate" value="박사졸업"> 박사졸업 이상</label>
  
  <!-- HOPE_LOCATION -->
  <hr>
  <h4>지역</h4>
  <label><input type="checkbox" name="location" value="전국"> 전국</label>
  <label><input type="checkbox" name="location" value="서울"> 서울</label>
  <label><input type="checkbox" name="location" value="경기"> 경기</label>
  <label><input type="checkbox" name="location" value="인천"> 인천</label>
  <label><input type="checkbox" name="location" value="강원"> 강원</label>
  <label><input type="checkbox" name="location" value="대전"> 대전</label>
  <label><input type="checkbox" name="location" value="세종"> 세종</label>
  <label><input type="checkbox" name="location" value="충남"> 충남</label>
  <label><input type="checkbox" name="location" value="충북"> 충북</label>
  <label><input type="checkbox" name="location" value="부산"> 부산</label>
  <label><input type="checkbox" name="location" value="운산"> 운산</label>
  <label><input type="checkbox" name="location" value="경남"> 경남</label>
  <label><input type="checkbox" name="location" value="경북"> 경북</label>
  <label><input type="checkbox" name="location" value="대구"> 대구</label>
  <label><input type="checkbox" name="location" value="광주"> 광주</label>
  <label><input type="checkbox" name="location" value="전남"> 전남</label>
  <label><input type="checkbox" name="location" value="전북"> 전북</label>
  <label><input type="checkbox" name="location" value="제주"> 제주</label>
  
  <!-- HOPE_JOB -->
  <hr>
  <h4>업직종</h4>
  <label><input type="radio" name="job" value="104178">예술기획 관련직</label>
  <label><input type="radio" name="job" value="104203">보건의료 관련 서비스직</label>
  <label><input type="radio" name="job" value="104204">자연친화 관련직</label>
  <label><input type="radio" name="job" value="104186">인문 및 사회과학전문직</label>
  <label><input type="radio" name="job" value="104174">악기 관련직</label>
  <label><input type="radio" name="job" value="104183">고급 운전 관련직</label>
  <br>
  <label><input type="radio" name="job" value="104197">조리 관련직</label>
  <label><input type="radio" name="job" value="104172">일반운전 및 정비 관련직</label>
  <label><input type="radio" name="job" value="104170">시각디자인 관련직</label>
  <label><input type="radio" name="job" value="104175">운동 및 안전 관련직</label>
  <label><input type="radio" name="job" value="104192">교육 관련 서비스직</label>
  <label><input type="radio" name="job" value="104168">농림어업 관련직</label>
  <br>
  <label><input type="radio" name="job" value="104181">영업 관련 서비스직</label>
  <label><input type="radio" name="job" value="104191">음악 관련직</label>
  <label><input type="radio" name="job" value="104188">연기 관련직</label>
  <label><input type="radio" name="job" value="104185">환경관련 전문직</label>
  <label><input type="radio" name="job" value="104177">기획 서비스직</label>
  <label><input type="radio" name="job" value="104169">IT관련 공학 전문직</label>
  <br>
  <label><input type="radio" name="job" value="104193">기능직</label>
  <label><input type="radio" name="job" value="104198">매니지먼트 관련직</label>
  <label><input type="radio" name="job" value="104199">언어 관련 전문직</label>
  <label><input type="radio" name="job" value="104200">인문계 교육 관련직</label>
  <label><input type="radio" name="job" value="104171">일반 서비스직</label>
  <label><input type="radio" name="job" value="104196">이공계 교육 관련직</label>
  <br>
  <label><input type="radio" name="job" value="104182">법률 및 사회활동 관련직</label>
  <label><input type="radio" name="job" value="104173">이학 및 공학 전문직</label>
  <label><input type="radio" name="job" value="104179">의복제조 관련직</label>
  <label><input type="radio" name="job" value="104194">회계 관련직</label>
  <label><input type="radio" name="job" value="104187">영상 관련직</label>
  <label><input type="radio" name="job" value="104184">특수(소프트) 스포츠 관련직</label>
  <br>
  <label><input type="radio" name="job" value="104201">의료 관련 전문직</label>
  <label><input type="radio" name="job" value="104180">기술직</label>
  <label><input type="radio" name="job" value="104176">이미용 관련 서비스직</label>
  <label><input type="radio" name="job" value="104189">무용 관련직</label>
  <label><input type="radio" name="job" value="104202">사회서비스직</label>
  <label><input type="radio" name="job" value="104190">금융 및 경영 관련 전문직</label>
  <br>
  <label><input type="radio" name="job" value="104195">작가 관련직</label>
  <label><input type="radio" name="job" value="100001">기타</label>
  
  <!-- HOPE_WORK_TYPE -->
  <hr>
  <h4>근무형태</h4>
  <label><input type="radio" name="worktype" value="정규직">정규직</label>
  <label><input type="radio" name="worktype" value="계약직">계약직</label>
  <label><input type="radio" name="worktype" value="무기계약직">무기계약직</label>
  <label><input type="radio" name="worktype" value="인턴직">인턴직</label>
  <label><input type="radio" name="worktype" value="아르바이트">아르바이트</label>
  <label><input type="radio" name="worktype" value="파견직">파견직</label>
  <label><input type="radio" name="worktype" value="해외취업">해외취업</label>
  <label><input type="radio" name="worktype" value="프리랜서">프리랜서</label>
   
  <!-- contents -->
  <hr>
  <h4>공고내용</h4>
  <textarea form ="modifyFrm" name="contents" id="contents" rows="4" cols="100">${before.employment_contents}</textarea>
  
  <!-- PREFER -->
  <hr>
  <h4>우대사항</h4>
  <textarea form ="modifyFrm" name="prefer" id="prefer" rows="4" cols="100">${before.employment_prefer }</textarea>

  <!-- PREFER -->
  <hr>
  <h4>희망 연봉</h4>
    <label><input type="radio" name="salary" value="회사내규">회사 내규에 따름</label>
	<label><input type="radio" name="salary" value="1,400만원">1,400만원 이하</label>
	<label><input type="radio" name="salary" value="1,400~1,600만원">1,400~1,600만 원</label>
	<label><input type="radio" name="salary" value="1,600~1,800만원">1,600~1,800만원</label>
	<label><input type="radio" name="salary" value="1,800~2,000만원">1,800~2,000만원</label>
	<label><input type="radio" name="salary" value="2,000~2,200만원">2,000~2,200만원</label>
	<label><input type="radio" name="salary" value="2,200~2,400만원">2,200~2,400만원</label>
	<label><input type="radio" name="salary" value="2,400~2,600만원">2,400~2,600만원</label>
	<label><input type="radio" name="salary" value="2,600~2,800만원">2,600~2,800만원</label>
	<label><input type="radio" name="salary" value="2,800~3,000만원">2,800~3,000만원</label>
	<label><input type="radio" name="salary" value="3,000~3,200만원">3,000~3,200만원</label>
	<label><input type="radio" name="salary" value="3,200~3,400만원">3,200~3,400만원</label>
	<label><input type="radio" name="salary" value="3,400~3,600만원">3,400~3,600만원</label>
	<label><input type="radio" name="salary" value="3,600~3,800만원">3,600~3,800만원</label>
	<label><input type="radio" name="salary" value="3,800~4,000만원">3,800~4,000만원</label>
	<label><input type="radio" name="salary" value="4,000~5,000만원">4,000~5,000만원</label>
	<label><input type="radio" name="salary" value="5,000~6,000만원">5,000~6,000만원</label>
	<label><input type="radio" name="salary" value="6,000~7,000만원">6,000~7,000만원</label>
	<label><input type="radio" name="salary" value="7,000~8,000만원">7,000~8,000만원</label>
	<label><input type="radio" name="salary" value="8,000~9,000만원">8,000~9,000만원</label>
	<label><input type="radio" name="salary" value="9,000~1억원">9,000~1억원</label>
	

  <!-- EMPLOYMENT_TIME -->
  <hr>
  <h4>공고 기간</h4>
	<label><input type="radio" name="time" value="2999-10-10">상시모집</label>
	<input type="date" name="time">
	<br>
	
	<button type="submit">수정완료</button>
</form>