<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="sub_vis_wrap" class="sub01 page01">
	<div class="hd_box"></div>
	<div class="visual-area ">
		<div class="visual-area-in">
			<div class="visual-area-txt inner sub01 ">
				<div class="tit" data-aos="fade-up" data-aos-delay="300">공고 수정</div>
				<p class="fs18" data-aos="fade-up" data-aos-delay="400">
					시간을 허비말고 DO HUBY<br> 공고를 수정합니다.
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
		<!-- 수정실제소스 -->
		<h2>공고 수정하기</h2>
		<form id="modifyFrm" method="POST" action="employupdate.do"
			class="w3-container w3-text-blue w3-margin">
			<!-- 공고제목 -->
			<br> <input type='hidden' name="employment_id"
				id="employment_id" value='${before.employment_id }'>
			<div class="w3-row w3-section">
				<div class="w3-col" style="width: 150px">공고제목</div>
				<div class="w3-rest">
					<input class="w3-input w3-border" name="title" type="text"
						value="${before.employment_title}" required="required">
				</div>
			</div>
			<!-- 공고제목 끝 -->
			<!-- 커리어 -->
			<div class="w3-row w3-section">
				<div class="w3-col" style="width: 150px">희망 경력</div>
				<div class="w3-rest">
					<c:set var="career" value="${before.hope_career}" />
					<select class="w3-select w3-border" name="career"
						required="required">
						<c:choose>
							<c:when test="${career eq '신입'}">
								<option value="신입" selected="selected">신입</option>
							</c:when>
							<c:when test="${career ne '신입'}">
								<option value="신입">신입</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${career eq '경력'}">
								<option value="경력" selected="selected">경력</option>
							</c:when>
							<c:when test="${career ne '경력'}">
								<option value="경력">경력</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${career eq '신입/경력'}">
								<option value="신입/경력" selected="selected">신입/경력</option>
							</c:when>
							<c:when test="${career ne '경력'}">
								<option value="신입/경력">신입/경력</option>
							</c:when>
						</c:choose>
					</select>
				</div>
			</div>
			<!-- 커리어 끝 -->

			<!-- 직급 -->
			<div class="w3-row w3-section">
				<div class="w3-col" style="width: 150px">희망 직급</div>
				<div class="w3-rest">
					<c:set var="position" value="${before.hope_job_position}" />
					<select class="w3-select w3-border" name="position"
						required="required">
						<c:choose>
							<c:when test="${position eq '사원'}">
								<option value="사원" selected="selected">사원급</option>
							</c:when>
							<c:when test="${position ne '사원'}">
								<option value="사원">사원급</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${position eq '대리'}">
								<option value="대리" selected="selected">대리급</option>
							</c:when>
							<c:when test="${position ne '대리'}">
								<option value="대리">대리급</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${position eq '과장'}">
								<option value="과장" selected="selected">과장급</option>
							</c:when>
							<c:when test="${position ne '과장'}">
								<option value="과장">과장급</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${position eq '차장'}">
								<option value="차장" selected="selected">차장급</option>
							</c:when>
							<c:when test="${position ne '차장'}">
								<option value="차장">차장급</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${position eq '팀장'}">
								<option value="팀장" selected="selected">팀장급</option>
							</c:when>
							<c:when test="${position ne '팀장'}">
								<option value="팀장">팀장급</option>
							</c:when>
						</c:choose>
					</select>
				</div>
			</div>
			<!-- GRADUATE -->
			<div class="w3-row w3-section">
				<div class="w3-col" style="width: 150px">희망 학력</div>
				<div class="w3-rest">
					<c:set var="graduate" value="${before.hope_graduate}" />
					<select class="w3-select w3-border" name="graduate"
						required="required">
						<c:choose>
							<c:when test="${graduate eq '학력무관'}">
								<option value="학력무관" selected="selected">학력무관</option>
							</c:when>
							<c:when test="${graduate ne '학력무관'}">
								<option value="학력무관">학력무관</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${graduate eq '고등학교졸업'}">
								<option value="고등학교졸업" selected="selected">고등학교졸업 이상</option>
							</c:when>
							<c:when test="${graduate ne '고등학교졸업'}">
								<option value="고등학교졸업">고등학교졸업 이상</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${graduate eq '대학졸업'}">
								<option value="대학졸업" selected="selected">대학졸업(2,3년) 이상</option>
							</c:when>
							<c:when test="${graduate ne '대학졸업'}">
								<option value="대학졸업">대학졸업(2,3년) 이상</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${graduate eq '대학교졸업'}">
								<option value="대학졸업" selected="selected">대학교졸업(4년) 이상</option>
							</c:when>
							<c:when test="${graduate ne '대학교졸업'}">
								<option value="대학졸업">대학교졸업(4년) 이상</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${graduate eq '석사졸업'}">
								<option value="석사졸업" selected="selected">석사졸업 이상</option>
							</c:when>
							<c:when test="${graduate ne '석사졸업'}">
								<option value="석사졸업">석사졸업 이상</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${graduate eq '박사졸업'}">
								<option value="박사졸업" selected="selected">박사졸업 이상</option>
							</c:when>
							<c:when test="${graduate ne '박사졸업'}">
								<option value="박사졸업">박사졸업 이상</option>
							</c:when>
						</c:choose>
					</select>
				</div>
			</div>


			<!-- 로케 -->
			<div class="w3-row w3-section">
				<div class="w3-col" style="width: 150px">희망 지역</div>
				<div class="w3-rest">
					<c:set var="loca" value="${before.hope_location}" />
					<select class="w3-select w3-border" name="location"
						required="required">
						<c:choose>
							<c:when test="${loca eq '전국'}">
								<option value="전국" selected="selected">전국</option>
							</c:when>
							<c:when test="${loca ne '전국'}">
								<option value="전국">전국</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${loca eq '서울'}">
								<option value="서울" selected="selected">서울</option>
							</c:when>
							<c:when test="${loca ne '서울'}">
								<option value="서울">서울</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${loca eq '경기'}">
								<option value="경기" selected="selected">경기</option>
							</c:when>
							<c:when test="${loca ne '경기'}">
								<option value="경기">경기</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${loca eq '인천'}">
								<option value="인천" selected="selected">인천</option>
							</c:when>
							<c:when test="${loca ne '인천'}">
								<option value="인천">인천</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${loca eq '강원'}">
								<option value="강원" selected="selected">강원</option>
							</c:when>
							<c:when test="${loca ne '강원'}">
								<option value="강원">강원</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${loca eq '대전'}">
								<option value="대전" selected="selected">대전</option>
							</c:when>
							<c:when test="${loca ne '대전'}">
								<option value="대전">대전</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${loca eq '세종'}">
								<option value="세종" selected="selected">세종</option>
							</c:when>
							<c:when test="${loca ne '세종'}">
								<option value="세종">세종</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${loca eq '충남'}">
								<option value="충남" selected="selected">충남</option>
							</c:when>
							<c:when test="${loca ne '충남'}">
								<option value="충남">충남</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${loca eq '충북'}">
								<option value="충북" selected="selected">충북</option>
							</c:when>
							<c:when test="${loca ne '충북'}">
								<option value="충북">충북</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${loca eq '부산'}">
								<option value="부산" selected="selected">부산</option>
							</c:when>
							<c:when test="${loca ne '부산'}">
								<option value="부산">부산</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${loca eq '울산'}">
								<option value="울산" selected="selected">울산</option>
							</c:when>
							<c:when test="${loca ne '울산'}">
								<option value="울산">울산</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${loca eq '경남'}">
								<option value="경남" selected="selected">경남</option>
							</c:when>
							<c:when test="${loca ne '경남'}">
								<option value="경남">경남</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${loca eq '경북'}">
								<option value="경북" selected="selected">경북</option>
							</c:when>
							<c:when test="${loca ne '경북'}">
								<option value="경북">경북</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${loca eq '대구'}">
								<option value="대구" selected="selected">대구</option>
							</c:when>
							<c:when test="${loca ne '대구'}">
								<option value="대구">대구</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${loca eq '광주'}">
								<option value="광주" selected="selected">광주</option>
							</c:when>
							<c:when test="${loca ne '광주'}">
								<option value="광주">광주</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${loca eq '전남'}">
								<option value="전남" selected="selected">전남</option>
							</c:when>
							<c:when test="${loca ne '전남'}">
								<option value="전남">전남</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${loca eq '전북'}">
								<option value="전북" selected="selected">전북</option>
							</c:when>
							<c:when test="${loca ne '전북'}">
								<option value="전북">전북</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${loca eq '제주'}">
								<option value="제주" selected="selected">제주</option>
							</c:when>
							<c:when test="${loca ne '제주'}">
								<option value="제주">제주</option>
							</c:when>
						</c:choose>
					</select>
				</div>
			</div>


			<!-- HOPE_JOB -->
			<div class="w3-row w3-section">
				<div class="w3-col" style="width: 150px">업직종</div>
				<div class="w3-rest">
					<c:set var="job" value="${before.hope_job}" />
					<select class="w3-select w3-border" name="job" required="required">
						<c:choose>
							<c:when test="${job eq '104178'}">
								<option value="104178" selected="selected">예술기획 관련직</option>
							</c:when>
							<c:when test="${job ne '104178'}">
								<option value="104178">예술기획 관련직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '104203'}">
								<option value="104203" selected="selected">보건의료 관련 서비스직</option>
							</c:when>
							<c:when test="${job ne '104203'}">
								<option value="104203">보건의료 관련 서비스직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '104204'}">
								<option value="104204" selected="selected">자연친화 관련직</option>
							</c:when>
							<c:when test="${job ne '104204'}">
								<option value="104204">자연친화 관련직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '104186'}">
								<option value="104204" selected="selected">인문 및 사회과학전문직</option>
							</c:when>
							<c:when test="${job ne '104186'}">
								<option value="104204">인문 및 사회과학전문직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '104174'}">
								<option value="104174" selected="selected">악기 관련직</option>
							</c:when>
							<c:when test="${job ne '104174'}">
								<option value="104174">악기 관련직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '104183'}">
								<option value="104183" selected="selected">고급 운전 관련직</option>
							</c:when>
							<c:when test="${job ne '104183'}">
								<option value="104183">고급 운전 관련직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '104197'}">
								<option value="104197" selected="selected">조리 관련직</option>
							</c:when>
							<c:when test="${job ne '104197'}">
								<option value="104197">조리 관련직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '104172'}">
								<option value="104172" selected="selected">일반운전 및 정비
									관련직</option>
							</c:when>
							<c:when test="${job ne '104172'}">
								<option value="104172">일반운전 및 정비 관련직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '104170'}">
								<option value="104170" selected="selected">시각디자인 관련직</option>
							</c:when>
							<c:when test="${job ne '104170'}">
								<option value="104170">시각디자인 관련직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '104175'}">
								<option value="104175" selected="selected">운동 및 안전 관련직</option>
							</c:when>
							<c:when test="${job ne '104175'}">
								<option value="104175">운동 및 안전 관련직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '104192'}">
								<option value="104192" selected="selected">교육 관련 서비스직</option>
							</c:when>
							<c:when test="${job ne '104192'}">
								<option value="104192">교육 관련 서비스직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '104168'}">
								<option value="104168" selected="selected">농림어업 관련직</option>
							</c:when>
							<c:when test="${job ne '104168'}">
								<option value="104168">농림어업 관련직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '104181'}">
								<option value="104181" selected="selected">영업 관련 서비스직</option>
							</c:when>
							<c:when test="${job ne '104181'}">
								<option value="104181">영업 관련 서비스직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '104191'}">
								<option value="104191" selected="selected">음악 관련직</option>
							</c:when>
							<c:when test="${job ne '104191'}">
								<option value="104191">음악 관련직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '104188'}">
								<option value="104188" selected="selected">연기 관련직</option>
							</c:when>
							<c:when test="${job ne '104188'}">
								<option value="104188">연기 관련직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '104185'}">
								<option value="104185" selected="selected">환경관련 전문직</option>
							</c:when>
							<c:when test="${job ne '104185'}">
								<option value="104185">환경관련 전문직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '104177'}">
								<option value="104177" selected="selected">기획 서비스직</option>
							</c:when>
							<c:when test="${job ne '104177'}">
								<option value="104177">기획 서비스직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '104169'}">
								<option value="104169" selected="selected">IT관련 공학 전문직</option>
							</c:when>
							<c:when test="${job ne '104169'}">
								<option value="104169">IT관련 공학 전문직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '104193'}">
								<option value="104193" selected="selected">기능직</option>
							</c:when>
							<c:when test="${job ne '104193'}">
								<option value="104193">기능직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '104198'}">
								<option value="104198" selected="selected">매니지먼트 관련직</option>
							</c:when>
							<c:when test="${job ne '104198'}">
								<option value="104198">매니지먼트 관련직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '104199'}">
								<option value="104199" selected="selected">언어 관련 전문직</option>
							</c:when>
							<c:when test="${job ne '104199'}">
								<option value="104199">언어 관련 전문직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '104200'}">
								<option value="104200" selected="selected">인문계 교육 관련직</option>
							</c:when>
							<c:when test="${job ne '104200'}">
								<option value="104200">인문계 교육 관련직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '104171'}">
								<option value="104171" selected="selected">일반 서비스직</option>
							</c:when>
							<c:when test="${job ne '104171'}">
								<option value="104171">일반 서비스직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '104196'}">
								<option value="104196" selected="selected">이공계 교육 관련직</option>
							</c:when>
							<c:when test="${job ne '104196'}">
								<option value="104196">이공계 교육 관련직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '104182'}">
								<option value="104182" selected="selected">법률 및 사회활동
									관련직</option>
							</c:when>
							<c:when test="${job ne '104182'}">
								<option value="104182">법률 및 사회활동 관련직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '104173'}">
								<option value="104173" selected="selected">이학 및 공학 전문직</option>
							</c:when>
							<c:when test="${job ne '104173'}">
								<option value="104173">이학 및 공학 전문직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '104179'}">
								<option value="104179" selected="selected">의복제조 관련직</option>
							</c:when>
							<c:when test="${job ne '104179'}">
								<option value="104179">의복제조 관련직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '104194'}">
								<option value="104194" selected="selected">회계 관련직</option>
							</c:when>
							<c:when test="${job ne '104194'}">
								<option value="104194">회계 관련직</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${job eq '104187'}">
								<option value="104187" selected="selected">영상 관련직</option>
							</c:when>
							<c:when test="${job ne '104187'}">
								<option value="104187">영상 관련직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '104184'}">
								<option value="104184" selected="selected">특수(소프트) 스포츠
									관련직</option>
							</c:when>
							<c:when test="${job ne '104184'}">
								<option value="104184">특수(소프트) 스포츠 관련직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '104201'}">
								<option value="104201" selected="selected">의료 관련 전문직</option>
							</c:when>
							<c:when test="${job ne '104201'}">
								<option value="104201">의료 관련 전문직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '104180'}">
								<option value="104180" selected="selected">기술직</option>
							</c:when>
							<c:when test="${job ne '104180'}">
								<option value="104180">기술직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '104176'}">
								<option value="104176" selected="selected">이미용 관련 서비스직</option>
							</c:when>
							<c:when test="${job ne '104176'}">
								<option value="104176">이미용 관련 서비스직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '104189'}">
								<option value="104189" selected="selected">무용 관련직</option>
							</c:when>
							<c:when test="${job ne '104189'}">
								<option value="104189">무용 관련직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '104202'}">
								<option value="104202" selected="selected">사회서비스직</option>
							</c:when>
							<c:when test="${job ne '104202'}">
								<option value="104202">사회서비스직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '104190'}">
								<option value="104190" selected="selected">금융 및 경영 관련
									전문직</option>
							</c:when>
							<c:when test="${job ne '104190'}">
								<option value="104190">금융 및 경영 관련 전문직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '104195'}">
								<option value="104195" selected="selected">작가 관련직</option>
							</c:when>
							<c:when test="${job ne '104195'}">
								<option value="104195">작가 관련직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${job eq '100001'}">
								<option value="100001" selected="selected">기타</option>
							</c:when>
							<c:when test="${job ne '100001'}">
								<option value="100001">기타</option>
							</c:when>
						</c:choose>
					</select>
				</div>
			</div>
			<!-- HOPE_WORK_TYPE -->
			<div class="w3-row w3-section">
				<div class="w3-col" style="width: 150px">근무형태</div>
				<div class="w3-rest">
					<c:set var="worktype" value="${before.hope_work_type}" />

					<select class="w3-select w3-border" name="worktype"
						required="required">
						<c:choose>
							<c:when test="${worktype eq '정규직'}">
								<option value="정규직" selected="selected">정규직</option>
							</c:when>
							<c:when test="${worktype ne '정규직'}">
								<option value="정규직">정규직</option>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${worktype eq '계약직'}">
								<option value="계약직" selected="selected">계약직</option>
							</c:when>
							<c:when test="${worktype ne '계약직'}">
								<option value="계약직">계약직</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${worktype eq '무기계약직'}">
								<option value="무기계약직" selected="selected">무기계약직</option>
							</c:when>
							<c:when test="${worktype ne '무기계약직'}">
								<option value="무기계약직">무기계약직</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${worktype eq '인턴직'}">
								<option value="인턴직" selected="selected">인턴직</option>
							</c:when>
							<c:when test="${worktype ne '인턴직'}">
								<option value="인턴직">인턴직</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${worktype eq '아르바이트'}">
								<option value="아르바이트" selected="selected">아르바이트</option>
							</c:when>
							<c:when test="${worktype ne '아르바이트'}">
								<option value="아르바이트">아르바이트</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${worktype eq '파견직'}">
								<option value="파견직" selected="selected">파견직</option>
							</c:when>
							<c:when test="${worktype ne '파견직'}">
								<option value="파견직">파견직</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${worktype eq '해외취업'}">
								<option value="해외취업" selected="selected">해외취업</option>
							</c:when>
							<c:when test="${worktype ne '해외취업'}">
								<option value="해외취업">해외취업</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${worktype eq '프리랜서'}">
								<option value="프리랜서" selected="selected">프리랜서</option>
							</c:when>
							<c:when test="${worktype ne '프리랜서'}">
								<option value="프리랜서">프리랜서</option>
							</c:when>
						</c:choose>
					</select>
				</div>
			</div>

			<!-- contents -->
			<div class="w3-row w3-section">
				<div class="w3-col" style="width: 150px">공고내용</div>
				<div class="w3-rest">
					<textarea form="modifyFrm" id="contents" rows="4" cols="100"
						class="w3-input w3-border" name="contents" required="required">${before.employment_contents}</textarea>
				</div>
			</div>


			<!-- PREFER -->
			<div class="w3-row w3-section">
				<div class="w3-col" style="width: 150px">우대사항</div>
				<div class="w3-rest">
					<textarea form="modifyFrm" class="w3-input w3-border" name="prefer"
						id="prefer" rows="4" cols="100" required="required">${before.employment_prefer }</textarea>
				</div>
			</div>
			<!-- PREFER -->
			<div class="w3-row w3-section">
				<div class="w3-col" style="width: 150px">희망 연봉</div>
				<div class="w3-rest">
					<c:set var="salary" value="${before.hope_salary}" />
					<select class="w3-select w3-border" name="salary"
						required="required">
						<c:choose>
							<c:when test="${salary eq '회사내규'}">
								<option value="회사내규" selected="selected">회사 내규에 따름</option>
							</c:when>
							<c:when test="${salary ne '회사내규'}">
								<option value="회사내규">회사 내규에 따름</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${salary eq '1,400만원'}">
								<option value="1,400만원" selected="selected">1,400만원 이하</option>
							</c:when>
							<c:when test="${salary ne '1,400만원'}">
								<option value="1,400만원">1,400만원 이하</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${salary eq '1,400~1,600만원'}">
								<option value="1,400~1,600만원" selected="selected">1,400~1,600만원</option>
							</c:when>
							<c:when test="${salary ne '1,400~1,600만원'}">
								<option value="1,400~1,600만원">1,400~1,600만 원</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${salary eq '1,600~1,800만원'}">
								<option value="1,600~1,800만원" selected="selected">1,600~1,800만원</option>
							</c:when>
							<c:when test="${salary ne '1,600~1,800만원'}">
								<option value="1,600~1,800만원">1,600~1,800만 원</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${salary eq '1,800~2,000만원'}">
								<option value="1,800~2,000만원" selected="selected">1,800~2,000만원</option>
							</c:when>
							<c:when test="${salary ne '1,800~2,000만원'}">
								<option value="1,800~2,000만원">1,800~2,000만원</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${salary eq '2,000~2,200만원'}">
								<option value="2,000~2,200만원" selected="selected">2,000~2,200만원</option>
							</c:when>
							<c:when test="${salary ne '2,000~2,200만원'}">
								<option value="2,000~2,200만원">2,000~2,200만원</option>
							</c:when>
						</c:choose>


						<c:choose>
							<c:when test="${salary eq '2,200~2,400만원'}">
								<option value="2,200~2,400만원" selected="selected">2,200~2,400만원</option>
							</c:when>
							<c:when test="${salary ne '2,200~2,400만원'}">
								<option value="2,200~2,400만원">2,200~2,400만원</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${salary eq '2,600~2,800만원'}">
								<option value="2,600~2,800만원" selected="selected">2,600~2,800만원</option>
							</c:when>
							<c:when test="${salary ne '2,600~2,800만원'}">
								<option value="2,600~2,800만원">2,600~2,800만원</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${salary eq '2,800~3,000만원'}">
								<option value="2,800~3,000만원" selected="selected">2,800~3,000만원</option>
							</c:when>
							<c:when test="${salary ne '2,800~3,000만원'}">
								<option value="2,800~3,000만원">2,800~3,000만원</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${salary eq '3,000~3,200만원'}">
								<option value="3,000~3,200만원" selected="selected">3,000~3,200만원</option>
							</c:when>
							<c:when test="${salary ne '3,000~3,200만원'}">
								<option value="3,000~3,200만원">3,000~3,200만원</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${salary eq '3,200~3,400만원'}">
								<option value="3,200~3,400만원" selected="selected">3,200~3,400만원</option>
							</c:when>
							<c:when test="${salary ne '3,200~3,400만원'}">
								<option value="3,200~3,400만원">3,200~3,400만원</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${salary eq '3,400~3,600만원'}">
								<option value="3,400~3,600만원" selected="selected">3,400~3,600만원</option>
							</c:when>
							<c:when test="${salary ne '3,400~3,600만원'}">
								<option value="3,400~3,600만원">3,400~3,600만원</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${salary eq '3,800~4,000만원'}">
								<option value="3,800~4,000만원" selected="selected">3,800~4,000만원</option>
							</c:when>
							<c:when test="${salary ne '3,800~4,000만원'}">
								<option value="3,800~4,000만원">3,800~4,000만원</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${salary eq '4,000~5,000만원'}">
								<option value="4,000~5,000만원" selected="selected">4,000~5,000만원</option>
							</c:when>
							<c:when test="${salary ne '4,000~5,000만원'}">
								<option value="4,000~5,000만원">4,000~5,000만원</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${salary eq '5,000~6,000만원'}">
								<option value="5,000~6,000만원" selected="selected">5,000~6,000만원</option>
							</c:when>
							<c:when test="${salary ne '5,000~6,000만원'}">
								<option value="5,000~6,000만원">5,000~6,000만원</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${salary eq '6,000~7,000만원'}">
								<option value="6,000~7,000만원" selected="selected">6,000~7,000만원</option>
							</c:when>
							<c:when test="${salary ne '6,000~7,000만원'}">
								<option value="6,000~7,000만원">6,000~7,000만원</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${salary eq '7,000~8,000만원'}">
								<option value="7,000~8,000만원" selected="selected">7,000~8,000만원</option>
							</c:when>
							<c:when test="${salary ne '7,000~8,000만원'}">
								<option value="7,000~8,000만원">7,000~8,000만원</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${salary eq '8,000~9,000만원'}">
								<option value="8,000~9,000만원" selected="selected">8,000~9,000만원</option>
							</c:when>
							<c:when test="${salary ne '8,000~9,000만원'}">
								<option value="8,000~9,000만원">8,000~9,000만원</option>
							</c:when>
						</c:choose>

						<c:choose>
							<c:when test="${salary eq '9,000~1억원'}">
								<option value="9,000~1억원" selected="selected">9,000~1억원</option>
							</c:when>
							<c:when test="${salary ne '회사'}">
								<option value="9,000~1억원">9,000~1억원</option>
							</c:when>
						</c:choose>
					</select>
				</div>
			</div>

			<!-- EMPLOYMENT_TIME -->
			<div class="w3-row w3-section">
				<div class="w3-col" style="width: 150px">공고 기간</div>
				<div class="w3-rest">
					<input class="w3-input w3-border" type="date" name="time"
						required="required">
				</div>
			</div>
			<p class="w3-center">
				<button class="w3-button w3-section w3-blue w3-ripple" type="submit">
					수정완료</button>
			</p>
		</form>
		<!-- 수정실제소스 끝 -->
	</div>
</div>