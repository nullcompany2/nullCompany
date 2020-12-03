<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset='utf-8' />


<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">

<link rel="stylesheet"
	href="<c:url value="/resources/css/schemaincal.css"/>">


<link href="<c:url value="/resources/css/core.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/daygrid.css"/>"rel='stylesheet' />
<link href="<c:url value="/resources/css/timegrid.css"/>"rel='stylesheet' />
<link href="<c:url value="/resources/css/list.css"/>" rel='stylesheet' />
<script src='<c:url value="/resources/js/core.js"/>'></script>
<script src='<c:url value="/resources/js/interaction.js"/>'></script>
<script src='<c:url value="/resources/js/daygrid.js"/>'></script>
<script src='<c:url value="/resources/js/timegrid.js"/>'></script>
<script src='<c:url value="/resources/js/list.js"/>'></script>

<!-- 캘린더 -->
<c:url value="" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src='<c:url value="/resources/js/jquery-1.10.2.js"/>'type="text/javascript"></script>
<script src='<c:url value="/resources/js/jquery-ui.custom.min.js"/>'type="text/javascript"></script>
<script src='<c:url value="/resources/js/moment.min.js"/>'type="text/javascript"></script>
<link href='<c:url value="/resources/css/fullcalendar.css"/>'rel='stylesheet' />
<link href='<c:url value="/resources/css/fullcalendar.print.css"/>'rel='stylesheet' media='print' />
<script src='<c:url value="/resources/js/fullcalendar.js"/>'type="text/javascript"></script>



<script>
 


  document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');
		
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
	      header: {
	        left: 'prevYear,prev,next,nextYear today',
	        center: 'title',
	        right: 'dayGridMonth,listMonth'
	      },

	      locale : "ko",
	      navLinks: true, // can click day/week names to navigate views
	      businessHours: false, // display business hours
	      editable: true,
	      eventOverlap : true,
	      eventLimit: true,
	      selectable: true,
	      fixedWeekCount: false,
	   
	      events: [
	    	
	    	  <c:forEach items="${ScheduleList}" var="ScheduleList">
	             
	    	       
	             {
	            	
	                title: '${ScheduleList.sche_name}',
	                start: '${ScheduleList.startdate}T${ScheduleList.starttime}:00',
	                end: '${ScheduleList.enddate}T${ScheduleList.endtime}:00',
	                constraint: '${ScheduleList.sche_no}',
	                color: '${ScheduleList.color}',
	                
	            },
	         
	          </c:forEach>
	        
	      ],
	      dateClick: function(info) {
	    	  var dateday = info.dateStr;
	    
	          modal2('addsche_modal');
	          
	          $("#startdate").val(dateday);
	          $("#enddate").val(dateday);
	          
	        },
	      select: function(info) {
	          
	          var startdateday = info.startStr;
	          var enddateday = new Date(info.endStr);
	          
	          enddateday.setDate(enddateday.getDate()-1)
	          
	          enddateday = getFormatDate(enddateday);
	      console.log(enddateday);
	          modal2('addsche_modal');
	          console.log(enddateday);
	          $("#startdate").val(startdateday);
	          $("#enddate").val(enddateday);
	          
	        }
	    });
		
	    
	    calendar.render();
	  });
		
  function getFormatDate(date){
      var year = date.getFullYear();
      var month = (1 + date.getMonth());
      month = month >= 10 ? month : '0' + month;
      var day = date.getDate();
      day = day >= 10 ? day : '0' + day;
      return year + '-' + month + '-' + day;
  }

</script>


<style>
</style>

</head>
<body>
	<div id='wrap'>
		<c:import url="../common/header.jsp" />



		<!-- container -->
		<div class="container">
			<!-- 전체높이지정용 -->
			<div id="drag-wrap">
				<!-- 세부 네비 시작 -->
				<div class="container2" style="">
					<div class="H-personnel-subNavi underline" style="border: none;">
						<h2 id="mailTitle"
							style="text-align: center; padding-top: 20px; padding-bottom: 10px;">Schedule</h2>
						<div class="H-personnel-subNavi2 underline" style="border: none;">
							<div>

								<button id="sche_add"
									style="border: none;
								    border-radius: 3px;
								    background: #477A8F;
								    color: white;
								    font-size: 20px;
								    width: 100%;
								    height: 50px;
								    cursor: pointer;
								    margin-left: -2px;">
									일정 추가</button>
							</div>
						</div>
						<div class="drag-scrollbar2">
							<div class="H-personnel-subNavi2 underline" style="border: none">
								<div class="H-personnel-subNavi2 Depth01-1">

									<li class="subTitle"><label for="calendar_view"
										style="font-weight: bold;">내 캘린더</label>
										<button id="individual" class="calbtn" style="cursor: pointer;">만들기</button> <br>
										<div class="input-group">
											<!-- <select class="filter" id="type_filter" multiple="multiple"> -->
											<c:forEach var="IndividualCalList" items="${ IndividualCalList }">
												<div style="width: 14px;
												    height: 14px;
												    position: absolute;
												    right: 72px;
												    margin-top: 9px;
												    border-radius: 70px;
												    background: ${ IndividualCalList.color } "></div>
												<div>
										
												<label id="chela" for="${ IndividualCalList.calNo }">
												<span style="width: 110px;
											    white-space: nowrap;
											    text-overflow: ellipsis;
											    overflow: hidden;">${ IndividualCalList.calName }</span>
												</label>
												
											<a id="${IndividualCalList.calNo}" class="editindiCal">
											<input type="hidden" id="before_cal_name" value="${ IndividualCalList.calName}" />수정</a></div>  <br>
											</c:forEach>
											<!-- </select> -->
										</div></li>

									<hr>

									<li class="subTitle"><label for="calendar_view"
										style="font-weight: bold;">공유 캘린더</label>
										<button id="community" class="calbtn" style="cursor: pointer;">만들기</button> <br>
										<div class="input-group">
										
											<c:forEach var="publicCalList" items="${ publicCalList }">
													<div style="width: 14px;
												    height: 14px;
												    position: absolute;
												    right: 72px;
												    margin-top: 9px;
												    border-radius: 70px;
												    background: ${ publicCalList.color } "></div>
												<div>
												
												<label id="chela" for="${ publicCalList.calNo }">
												<span style="width: 110px;
											    white-space: nowrap;
											    text-overflow: ellipsis;
											    overflow: hidden;">${ publicCalList.calName }</span>
												</label></input>
											<a id="${publicCalList.calNo}" class="editpubCal">수정</a></div> <br>
											</c:forEach>
											
									
										</div></li>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				<!-- 세부 네비 끝 -->

				<!-- 컨텐츠 -->



				<div class="contents" style="width: 1000px;">
					<div class="contents-title">
						<span class="ct1">일정관리</span> 

						<form action=""
							style="float: right; position: absolute; right: -130px; top: 10px;">
							<select name="search" id="search_option"
								style="border-radius: 8px; border: #676767 solid 1px; margin-right: 3px;">
								<option id="Sche_name" value="Sche_name">일정 제목</option>
								<option id="Cal_name" value="Cal_name">캘린더 이름</option>
							</select> 
								<input type="text" name="" id="search_text" class="search-emp" placeholder="&nbsp; 일정검색"
								style="border-radius: 8px; border: #676767 solid 1px;">&nbsp;&nbsp;
								
							<a id="searchbtn"
								class="search-btn cursor"
								style="border: none; background: none;">검색</a>
						</form>
					</div>

					<div class="contents-wrap drag-scrollbar">
						<div id="show-myleave" class="c-ic" style="">
							<div id="cal_size"
								style="position: absolute; width: 100%; height: 500px; left: 100px;">
								<div id='calendar'></div>
							</div>
						</div>

						
					</div>
					<!-- 일정 추가 모달 -->
					<div id="addsche_modal" class="modal-dragscroll">
						<h4
							style="color: #477A8F; margin-bottom: 18px; margin-top: 18px; font-weight: bold;">일정
							추가</h4>
						<div class="n-emp-i" style="margin-top: 30px;">
							<dl>
								<dt style="float: left;">
									<label>캘린더</label>
								</dt>
								<dd style="margin-left: 150px;">
									<select name="cal" id="selectCal" style="width: 200px;">
										<c:forEach var="publicCalList" items="${ publicCalList }">
											<option class="selectpublicCal" value="${ publicCalList.calNo }">${ publicCalList.calName }</option>
									    </c:forEach>
									    <c:forEach var="IndividualCalList" items="${ IndividualCalList }">
											<option class="selectpublicCal" value="${ IndividualCalList.calNo }">${ IndividualCalList.calName }</option>
									    </c:forEach>
									 
									</select>
								</dd>
							</dl>
							<dl>
								<dt style="float: left;">
									<label >일정 제목</label>
								</dt>
								<dd style="margin-left: 150px;">
									<input type="text" id="sche_name" style="width: 200px;">
								</dd>
							</dl>
							<dl>
								<dt style="float: left;">
									<label>시작</label>
								</dt>
								<dd style="margin-left: 150px;">
									<input type="date" name="" id="startdate"> <select name="time" id="starttime">

										<option value="00:00">오전 12:00</option>
										<option value="00:30">오전 12:30</option>
										<option value="01:00">오전 01:00</option>
										<option value="01:30">오전 01:30</option>
										<option value="02:00">오전 02:00</option>
										<option value="02:30">오전 02:30</option>
										<option value="03:00">오전 03:00</option>
										<option value="03:30">오전 03:30</option>
										<option value="04:00">오전 04:00</option>
										<option value="04:30">오전 04:30</option>
										<option value="05:00">오전 05:00</option>
										<option value="05:30">오전 05:30</option>
										<option value="06:00">오전 06:00</option>
										<option value="06:30">오전 06:30</option>
										<option value="07:00">오전 07:00</option>
										<option value="07:30">오전 07:30</option>
										<option value="08:00">오전 08:00</option>
										<option value="08:30">오전 08:30</option>
										<option value="09:00">오전 09:00</option>
										<option value="09:30">오전 09:30</option>
										<option value="10:00">오전 10:00</option>
										<option value="10:30">오전 10:30</option>
										<option value="11:00">오전 11:00</option>
										<option value="11:30">오전 11:30</option>
										<option value="12:00">오후 12:00</option>
										<option value="12:30">오후 12:30</option>
										<option value="13:00">오후 01:00</option>
										<option value="13:30">오후 01:30</option>
										<option value="14:00">오후 02:00</option>
										<option value="14:30">오후 02:30</option>
										<option value="15:00">오후 03:00</option>
										<option value="15:30">오후 03:30</option>
										<option value="16:00">오후 04:00</option>
										<option value="16:30">오후 04:30</option>
										<option value="17:00">오후 05:00</option>
										<option value="17:30">오후 05:30</option>
										<option value="18:00">오후 06:00</option>
										<option value="18:30">오후 06:30</option>
										<option value="19:00">오후 07:00</option>
										<option value="19:30">오후 07:30</option>
										<option value="20:00">오후 08:00</option>
										<option value="20:30">오후 08:30</option>
										<option value="21:00">오후 09:00</option>
										<option value="21:30">오후 09:30</option>
										<option value="22:00">오후 10:00</option>
										<option value="22:30">오후 10:30</option>
										<option value="23:00">오후 11:00</option>
										<option value="23:30">오후 11:30</option>

									</select>
								</dd>
							</dl>
							<dl>
								<dt style="float: left;">
									<label>종료</label>
								</dt>
								<dd style="margin-left: 150px;">
									<input type="date" name="" id="enddate"> <select name="time" id="endtime">

										<option value="00:00">오전 12:00</option>
										<option value="00:30">오전 12:30</option>
										<option value="01:00">오전 01:00</option>
										<option value="01:30">오전 01:30</option>
										<option value="02:00">오전 02:00</option>
										<option value="02:30">오전 02:30</option>
										<option value="03:00">오전 03:00</option>
										<option value="03:30">오전 03:30</option>
										<option value="04:00">오전 04:00</option>
										<option value="04:30">오전 04:30</option>
										<option value="05:00">오전 05:00</option>
										<option value="05:30">오전 05:30</option>
										<option value="06:00">오전 06:00</option>
										<option value="06:30">오전 06:30</option>
										<option value="07:00">오전 07:00</option>
										<option value="07:30">오전 07:30</option>
										<option value="08:00">오전 08:00</option>
										<option value="08:30">오전 08:30</option>
										<option value="09:00">오전 09:00</option>
										<option value="09:30">오전 09:30</option>
										<option value="10:00">오전 10:00</option>
										<option value="10:30">오전 10:30</option>
										<option value="11:00">오전 11:00</option>
										<option value="11:30">오전 11:30</option>
										<option value="12:00">오후 12:00</option>
										<option value="12:30">오후 12:30</option>
										<option value="13:00">오후 01:00</option>
										<option value="13:30">오후 01:30</option>
										<option value="14:00">오후 02:00</option>
										<option value="14:30">오후 02:30</option>
										<option value="15:00">오후 03:00</option>
										<option value="15:30">오후 03:30</option>
										<option value="16:00">오후 04:00</option>
										<option value="16:30">오후 04:30</option>
										<option value="17:00">오후 05:00</option>
										<option value="17:30">오후 05:30</option>
										<option value="18:00">오후 06:00</option>
										<option value="18:30">오후 06:30</option>
										<option value="19:00">오후 07:00</option>
										<option value="19:30">오후 07:30</option>
										<option value="20:00">오후 08:00</option>
										<option value="20:30">오후 08:30</option>
										<option value="21:00">오후 09:00</option>
										<option value="21:30">오후 09:30</option>
										<option value="22:00">오후 10:00</option>
										<option value="22:30">오후 10:30</option>
										<option value="23:00">오후 11:00</option>
										<option value="23:30">오후 11:30</option>

									</select>
								</dd>
							</dl>

							<dl>
								<dt style="float: left;">
									<label>내용</label>
								</dt>
								<dd style="margin-left: 150px;">
									<textarea name="" id="sche_content" cols="30" rows="5"
										style="resize: none;"></textarea>
								</dd>
							</dl>
						</div>
						
						<div
							style="text-align: center; position: relative; top: 185px; left: -35px;">
							<button id="ajaxsche_add"
								style=" background: #fff;
									    color: #2c86dc;
									    cursor: pointer;
									    padding: 5px 27px 6px;
									    border: 1px solid #c8c8c8;
									    position: absolute;
									    left: 150px;">확인</button>
								<button class="modal-close-btn cursor"
								style="absolute;
							    left: 245PX;
							    cursor: pointer;
							    top: 0px;
							    padding: 5px 27px 6px;
							    color: #444;
							    letter-spacing: -1px;
							    border: 1px solid #dadada;
							    background: #dadada;
								 letter-spacing: -1px; border: 1px solid #dadada; background: #dadada;">취소</button>
						</div>
					
					</div>


					<!-- 공유 캘린더 모달 -->
					<!-- 멤버 리스트 모달임!!  -->
					<div id="communitymodal" class="modal-dragscroll">
						<h4 style="color: #477A8F; margin-bottom: 15px; margin-top: 12px;">공유
							캘린더</h4>

						<label for="" style="font-size: 14px;">캘린더 이름 </label>
						&nbsp;&nbsp; <input type="text" id="cal_name"> &nbsp;


						<div class="palletBox">

							<div id="box" class="box">
								<label style="font-size: 14px; position: absolute; top: 100px;">색상</label>
								<div id="colorselect"></div>
								<div id="palletBox" class="pallet"></div>
							</div>
						</div>
						<div style="position: absolute; top: 130px; font-size: 14px;">
							사원 이름 &nbsp; <input type="text" id="search_mem"
								style="margin-left: 19px;"/> &nbsp;
								
								<span id="searchAddress" style="font-size: 14px; color: #477A8F;">검색 </span>
							 	<div id="autoAddress"> 
							 	 <!--  자동 완성 검색 결과  -->
							 	</div>
							
						</div>



						<div style="text-align: center;">
							<div>
								<div id="dept_list">
									<ul class="tree">
										<c:forEach var="deptList" items="${ deptList }" begin="1">

											<li>
												<button>${ deptList.deptName }부</button>
												<ul>
													<c:forEach var="memList" items="${ memList }">
														<c:if test='${deptList.deptNo eq memList.deptNo}'>
															<li><label><input type="checkbox" id="name"
																	value="${ memList.name }(${ memList.memNo })" />${ memList.name }(${ memList.memNo })</label></li>
														</c:if>
													</c:forEach>
												</ul>
											</li>
										</c:forEach>
									</ul>
								</div>
								<div id="name_list">
									<div id='result'
										style="margin-left: 10px; margin-top: 10px; text-align: left; font-size: 12px;"></div>
								</div>
							</div>

							<div style="position: absolute; right: 191px; top: 190px;">
								<img src="resources/images/right.png" id="enrolladd" style="cursor: pointer;"><br>
								<img src="resources/images/left.png" id="enrollsub" style="cursor: pointer;">
							</div>


							<p
								style="font-size: 12px; color: #477A8F; position: absolute; position: absolute; right: 110px; top: 145px;">
								<등록권한>
							</p>
							<div id="enrollauthority">

								<p id="enrollname"
									style="width: 100px; font-size: 12px; position: absolute; text-align: left; top: 5px; margin-left: 5px;">



								</p>


							</div>

							<div style="position: absolute; right: 191px; top: 330px;">
								<img src="resources/images/right.png" id="lookadd" style="cursor: pointer;"><br>
								<img src="resources/images/left.png" id="looksub" style="cursor: pointer;">
							</div>
							<p
								style="font-size: 12px; color: #477A8F; position: absolute; right: 110px; top: 290px;">
								<조회권한>
							</p>
							<div id="lookauthority">

								<p id="lookname"
									style="width: 100px; font-size: 12px; position: absolute; text-align: left; top: 5px; margin-left: 5px;"></p>

							</div>


							<div style="position: absolute; bottom: 40px; left: 220px;">
								<button id="cal_sub"
									style="background: #fff; color: #2c86dc; cursor: pointer;
									 padding: 5px 27px 6px; border: 1px solid #c8c8c8">저장</button>
								<button class="modal-close-btn cursor"
								style="position: absolute; left: 90px; top: 0px; cursor: pointer;  padding: 5px 27px 6px; color: #444;
								 letter-spacing: -1px; border: 1px solid #dadada; background: #dadada;">취소</button>
							</div>

						</div>
		
					</div>
					
					<!-- 공유 캘린더 수정 모달 -->
						<div id="edit_communitymodal" class="modal-dragscroll">
						<h4 style="color: #477A8F; margin-bottom: 15px; margin-top: 12px;">공유
							캘린더 수정</h4>
					    <a class="modal-close-btn cursor" >x</a>
						<label for="" style="font-size: 14px;">캘린더 이름 </label>
						&nbsp;&nbsp; <input type="text" id="edit_publiccal_name"> &nbsp;
							<input type="hidden" id="edit_public_calno"/>

						  
						   <div class="palletBox3">
						
						      <div id="box3" class="box3">
						         <label style="font-size: 14px; position: absolute; top: 100px;">색상</label>
						         <div id="colorselect3"></div>
						         <div id="palletBox3" class="pallet3"></div>
						      </div>
						   </div>
						   
						<div style="position: absolute; top: 130px; font-size: 14px;">
							사원 이름 &nbsp; <input type="text" id="search_mem2"
								style="margin-left: 19px;"/> &nbsp;
								
								<span id="searchAddress2" style="font-size: 14px; color: #477A8F;">검색 </span>
							 	<div id="autoAddress2"> 
							 	 <!--  자동 완성 검색 결과  -->
							 	</div>
							
						</div>



						<div style="text-align: center;">
							<div>
								<div id="dept_list">
									<ul class="tree">
										<c:forEach var="deptList" items="${ deptList }" begin="1">

											<li>
												<button>${ deptList.deptName }부</button>
												<ul>
													<c:forEach var="memList" items="${ memList }">
														<c:if test='${deptList.deptNo eq memList.deptNo}'>
															<li><label><input type="checkbox" id="name2"
																	value="${ memList.name }(${ memList.memNo })" />${ memList.name }(${ memList.memNo })</label></li>
														</c:if>
													</c:forEach>
												</ul>
											</li>
										</c:forEach>
									</ul>
								</div>
								<div id="name_list">
									<div id='result2'
										style="margin-left: 10px; margin-top: 10px; text-align: left; font-size: 12px;"></div>
								</div>
							</div>

							<div style="position: absolute; right: 191px; top: 190px;">
								<img src="resources/images/right.png" id="enrolladd2" style="cursor: pointer;"><br>
								<img src="resources/images/left.png" id="enrollsub2" style="cursor: pointer;">
							</div>


							<p
								style="font-size: 12px; color: #477A8F; position: absolute; position: absolute; right: 110px; top: 145px;">
								<등록권한>
							</p>
							<div id="enrollauthority">

								<p id="enrollname2"
									style="width: 100px; font-size: 12px; position: absolute; text-align: left; top: 5px; margin-left: 5px;">



								</p>


							</div>

							<div style="position: absolute; right: 191px; top: 330px;">
								<img src="resources/images/right.png" id="lookadd2" style="cursor: pointer;"><br>
								<img src="resources/images/left.png" id="looksub2" style="cursor: pointer;">
							</div>
							<p
								style="font-size: 12px; color: #477A8F; position: absolute; right: 110px; top: 290px;">
								<조회권한>
							</p>
							<div id="lookauthority">

								<p id="lookname2"
									style="width: 100px; font-size: 12px; position: absolute; text-align: left; top: 5px; margin-left: 5px;"></p>

							</div>


							<div style="position: absolute; bottom: 40px; left: 220px;">
								<button id="edit_cal_sub"
									style="background: #fff; color: #2c86dc; cursor: pointer;
									 padding: 5px 27px 6px; border: 1px solid #c8c8c8">저장</button>
								<button id="Public_Cal_delete" onclick="Public_Cal_delete()"
								style="position: absolute; left: 90px; top: 0px; cursor: pointer;  padding: 5px 27px 6px; color: #444;
								 letter-spacing: -1px; border: 1px solid #dadada; background: #dadada;">삭제</button>
							</div>

						</div>
		
					</div>
					
					<!-- 개인 모달 -->
					<div id="individualmodal" class="modal-dragscroll">
						<h4 style="color: #477A8F; margin-bottom: 15px;margin-top: 10px;">내 캘린더</h4>
						<div>
						<label for="" style="font-size: 14px;">캘린더 이름 </label>
						&nbsp;&nbsp; <input type="text"  id="cal_name2"/> &nbsp;

						<div class="palletBox2">

							<div id="box2" class="box2">
								<label style="font-size: 14px; position: absolute;bottom: 83px;">색상</label>
								<div id="colorselect2"></div>
								<div id="palletBox2" class="pallet2"></div>
							</div>
						</div>
						<input type="hidden" id="edit_indi_calno"/>
						</div>


						<div style="text-align: center;position: relative;top: 20px;">
							<button id="indi_sub"
								style="background: #fff; color: #2c86dc; cursor: pointer;
								padding: 5px 27px 6px; border: 1px solid #c8c8c8">확인</button>
							<button class="modal-close-btn cursor"
								style="padding: 5px 27px 6px; color: #444; letter-spacing: -1px; cursor: pointer;
								border: 1px solid #dadada; background: #dadada;">취소</button>
						</div>
						
					</div>
					
						<!-- 개인 모달 수정-->
					<div id="editindividualmodal" class="modal-dragscroll">
					<button class="modal-close-btn cursor" >x</button>
						<h4 style="color: #477A8F; margin-bottom: 15px;margin-top: 10px;">내 캘린더 수정</h4>
						<div>
						
							<label for="" style="font-size: 14px;">캘린더 이름 </label>
							&nbsp;&nbsp; <input type="text" id="edit_cal_name" /> <input type="hidden" id="edit_before_name" />

							<div class="palletBox4">

								<div id="box4" class="box4">
									<label style="font-size: 14px; position: absolute;
    									bottom: 83px;">색상</label>
									<div id="colorselect4"></div>
									<div id="palletBox4" class="pallet4"></div>
								</div>
							</div>
						</div>


						<div style="text-align: center;position: relative;top: 20px;">
							<button id="indi_Cal_edit" onclick="btn_edit()"
								style="background: #fff; color: #2c86dc; cursor: pointer;
								 padding: 5px 27px 6px; border: 1px solid #c8c8c8">수정</button>
							<button id="indi_Cal_delete" onclick="delete_Calindifunc()"
								style="padding: 5px 27px 6px; color: #444; cursor: pointer;
								letter-spacing: -1px; border: 1px solid #dadada; background: #dadada;">삭제</button>
								
						</div>
						
					</div>
					
					<!-- 일정 디테일 모달 -->

					<div id="detail_modal" class="modal-dragscroll">
						<h4 style="color: #477A8F; margin-bottom: 15px;">일정 내용</h4>
						<button class="modal-close-btn cursor" >x</button>
						<table class="detailtb">
							<thead>
								<tr>
									<th class="tbcontent" style="width: 100px; padding-top: 5px;"><label
										for="" style="font-size: 14px;">캘린더</label></th>
									<th class="tbcontent"><p class="tbinput" id="de_cal_name"></p><div id="cal_color" style="width:20px; height:20px"></div></th>
									<th class="tbcontent" style="width: 120px;">
										<div id="perimg">
											<img src="resources/images/detail_count.png"
												style="width: 50px; height: 25px;position: absolute; top: 65px;">
												<span id="DeMemCount"></span>
										</div>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="tbcontent" style="width: 100px; padding-top: 5px;"><label
										for="" style="font-size: 14px;">일정제목</label></td>
									<td class="tbcontent" colspan="2"><p class="tbinput" id="de_sche_name" style="width: 130px;"></p>
										<input type="hidden" id="de_sche_no" /><input type="hidden" id="de_Cal_no" /></td>
									
								</tr>
								<tr>
									<td class="tbcontent" style="width: 100px; padding-top: 5px;">일정
										시간</td>
									<td class="tbcontent" colspan="2"><p class="tbinput" id="de_sche_day"></p></td>
								</tr>
								<tr>
									<td class="tbcontent" style="width: 100px; padding-top: 5px;">내용</td>
									<td class="tbcontent" colspan="2"><p class="tbinput" id="de_sche_content"
											style="width: 245px; height: 100px;"></p></td>
								</tr>
							</tbody>
						</table>

						<div style="text-align: center;">
							<button id="editSche"
								style="background: #fff; color: #2c86dc;
								 padding: 5px 27px 6px; border: 1px solid #c8c8c8">수정</button>
							
							<button id="scheDelete" onclick="func_confirm()"
								style="padding: 5px 27px 6px; color: #444; letter-spacing: -1px; 
								border: 1px solid #dadada; background: #dadada;">삭제</button>
						</div>
					</div>


					<!-- 일정 멤버 모달 -->
					<div id="com_detailmodal" class="modal-dragscroll">
						<h4 style="color: #477A8F; margin-bottom: 15px;">캘린더</h4>

						<label for="" style="font-size: 14px;">캘린더 이름 </label>
						&nbsp;&nbsp; <input type="text" id="detailmodalCalname" readonly> &nbsp; <br> 
						<div id ="detailmodalCalColor" style="    width: 20px;
						    height: 20px;
						    background-color: rgb(178, 204, 255);
						    position: relative;
						    left: 270px;
						    border-radius: 10px;
						    top: -22px;"></div>
						<br>
						<br>

						<div style="text-align: center;height: 200px;">

							<label
								style="font-size: 12px;
							    color: #477A8F;
							    top: -66px;
							    margin-left: 5px;
							    position: relative;
							    left: -150px;">
								<등록권한>
							</label>
							<div id="enrollauthority2">

								<p id="enrollnameDetail"
									style="width: 100px; font-size: 12px; position: absolute; top: 10px; ">
									
									</p>


							</div>


							<label
								style="font-size: 12px;
							    color: #477A8F;
							    top: -293px;
							    margin-left: 5px;
							    position: relative;
							    right: -45px;">
								<조회권한>
							</label>

							<div id="lookauthority2">

								<p id="looknameDetail"
									style="width: 100px; font-size: 12px; position: absolute; top: 10px;"></p>

							</div>


							<div style="position: absolute; bottom: 40px; left: 260px;">
								<button class="modal-close-btn cursor"
									style="background: #fff;
								    color: #2c86dc;
								    padding: 5px 27px 6px;
								    border: 1px solid #c8c8c8;
								    width: 100px;
								    position: relative;
    								right: 63px;">확인</button>
							</div>

						</div>
						
					</div>
					
					<!-- 일정 수정 모달 -->
						<div id="editsche_modal" class="modal-dragscroll">
						<h4
							style="color: #477A8F; margin-bottom: 18px; margin-top: 18px; font-weight: bold;">일정
							수정</h4>
						<div class="n-emp-i" style="margin-top: 30px;">
							<dl>
								<dt style="float: left;">
									<label>캘린더</label>
								</dt>
								<dd style="margin-left: 150px;">
									<p id="editCalName" style=" font-size:15px;width: 200px;"></p>
										<div id = "editColor" style="width: 20px;
									    height: 20px;
									    border: gray solid 1px;
									    position: absolute;
									    left: 385px;
									    top: 86px;" ></div>
									
								</dd>
							</dl>
							<dl>
								<dt style="float: left;">
									<label >일정 제목</label>
								</dt>
								<dd style="margin-left: 150px;">
									<input type="text" id="editsche_name" style="width: 200px;">
								</dd>
							</dl>
							<dl>
								<dt style="float: left;">
									<label>시작</label>
								</dt>
								<dd style="margin-left: 150px;">
									<input type="hidden" id="editsche_no"/>
									<input type="date" name="" id="editstartdate"> <select name="time" id="editstarttime">

										<option value="00:00">오전 12:00</option>
										<option value="00:30">오전 12:30</option>
										<option value="01:00">오전 01:00</option>
										<option value="01:30">오전 01:30</option>
										<option value="02:00">오전 02:00</option>
										<option value="02:30">오전 02:30</option>
										<option value="03:00">오전 03:00</option>
										<option value="03:30">오전 03:30</option>
										<option value="04:00">오전 04:00</option>
										<option value="04:30">오전 04:30</option>
										<option value="05:00">오전 05:00</option>
										<option value="05:30">오전 05:30</option>
										<option value="06:00">오전 06:00</option>
										<option value="06:30">오전 06:30</option>
										<option value="07:00">오전 07:00</option>
										<option value="07:30">오전 07:30</option>
										<option value="08:00">오전 08:00</option>
										<option value="08:30">오전 08:30</option>
										<option value="09:00">오전 09:00</option>
										<option value="09:30">오전 09:30</option>
										<option value="10:00">오전 10:00</option>
										<option value="10:30">오전 10:30</option>
										<option value="11:00">오전 11:00</option>
										<option value="11:30">오전 11:30</option>
										<option value="12:00">오후 12:00</option>
										<option value="12:30">오후 12:30</option>
										<option value="13:00">오후 01:00</option>
										<option value="13:30">오후 01:30</option>
										<option value="14:00">오후 02:00</option>
										<option value="14:30">오후 02:30</option>
										<option value="15:00">오후 03:00</option>
										<option value="15:30">오후 03:30</option>
										<option value="16:00">오후 04:00</option>
										<option value="16:30">오후 04:30</option>
										<option value="17:00">오후 05:00</option>
										<option value="17:30">오후 05:30</option>
										<option value="18:00">오후 06:00</option>
										<option value="18:30">오후 06:30</option>
										<option value="19:00">오후 07:00</option>
										<option value="19:30">오후 07:30</option>
										<option value="20:00">오후 08:00</option>
										<option value="20:30">오후 08:30</option>
										<option value="21:00">오후 09:00</option>
										<option value="21:30">오후 09:30</option>
										<option value="22:00">오후 10:00</option>
										<option value="22:30">오후 10:30</option>
										<option value="23:00">오후 11:00</option>
										<option value="23:30">오후 11:30</option>

									</select>
								</dd>
							</dl>
							<dl>
								<dt style="float: left;">
									<label>종료</label>
								</dt>
								<dd style="margin-left: 150px;">
									<input type="date" name="" id="editenddate"> <select name="time" id="editendtime">

										<option value="00:00">오전 12:00</option>
										<option value="00:30">오전 12:30</option>
										<option value="01:00">오전 01:00</option>
										<option value="01:30">오전 01:30</option>
										<option value="02:00">오전 02:00</option>
										<option value="02:30">오전 02:30</option>
										<option value="03:00">오전 03:00</option>
										<option value="03:30">오전 03:30</option>
										<option value="04:00">오전 04:00</option>
										<option value="04:30">오전 04:30</option>
										<option value="05:00">오전 05:00</option>
										<option value="05:30">오전 05:30</option>
										<option value="06:00">오전 06:00</option>
										<option value="06:30">오전 06:30</option>
										<option value="07:00">오전 07:00</option>
										<option value="07:30">오전 07:30</option>
										<option value="08:00">오전 08:00</option>
										<option value="08:30">오전 08:30</option>
										<option value="09:00">오전 09:00</option>
										<option value="09:30">오전 09:30</option>
										<option value="10:00">오전 10:00</option>
										<option value="10:30">오전 10:30</option>
										<option value="11:00">오전 11:00</option>
										<option value="11:30">오전 11:30</option>
										<option value="12:00">오후 12:00</option>
										<option value="12:30">오후 12:30</option>
										<option value="13:00">오후 01:00</option>
										<option value="13:30">오후 01:30</option>
										<option value="14:00">오후 02:00</option>
										<option value="14:30">오후 02:30</option>
										<option value="15:00">오후 03:00</option>
										<option value="15:30">오후 03:30</option>
										<option value="16:00">오후 04:00</option>
										<option value="16:30">오후 04:30</option>
										<option value="17:00">오후 05:00</option>
										<option value="17:30">오후 05:30</option>
										<option value="18:00">오후 06:00</option>
										<option value="18:30">오후 06:30</option>
										<option value="19:00">오후 07:00</option>
										<option value="19:30">오후 07:30</option>
										<option value="20:00">오후 08:00</option>
										<option value="20:30">오후 08:30</option>
										<option value="21:00">오후 09:00</option>
										<option value="21:30">오후 09:30</option>
										<option value="22:00">오후 10:00</option>
										<option value="22:30">오후 10:30</option>
										<option value="23:00">오후 11:00</option>
										<option value="23:30">오후 11:30</option>

									</select>
								</dd>
							</dl>

							<dl>
								<dt style="float: left;">
									<label>내용</label>
								</dt>
								<dd style="margin-left: 150px;">
									<textarea name="" id="editsche_content" cols="30" rows="5"
										style="resize: none;"></textarea>
								</dd>
							</dl>
						</div>
						
						<div
							style="text-align: center; position: relative; top: 185px; left: -35px;">
							<button id="ajaxsche_edit"
								style=" background: #fff;
									    color: #2c86dc;
									    padding: 5px 27px 6px;
									    border: 1px solid #c8c8c8;
									    position: absolute;
									    
									    left: 150px;">수정</button>
								<button class="modal-close-btn cursor"
								style="absolute;
							    left: 245PX;
							    top: 0px;
							    padding: 5px 27px 6px;
							    color: #444;
							    letter-spacing: -1px;
							    border: 1px solid #dadada;
							    background: #dadada;
							    margin-left: 100px;
								 letter-spacing: -1px; border: 1px solid #dadada; background: #dadada;">취소</button>
						</div>
					
					</div>


				</div>
				
	<script>

      // 일정 디테일
         $(document).on("click", ".fc-content", function(){
        	modal('detail_modal');
            console.log($(this).find('span:eq(1)').text());
            
            
            var Sche_name = $(this).find('span:eq(1)').text();
            var Sche_color = document.getElementById("cal_color");
            $.ajax({
				url : "detailSchedule.do",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				data : { Sche_name : Sche_name },
				dataType: "json",
				async: false,
				success : function(data){
					
				
					
					if(data.cal_type == 1){
						$("#de_cal_name").text(data.Cal_name);
	            		$("#de_sche_name").text(data.Sche_name);
	            		$("#de_sche_day").text(data.startdate + " " + data.starttime + " ~ " + data.enddate + " " + data.endtime);
	            		$("#de_sche_content").text(data.Sche_content);
	            		Sche_color.style.backgroundColor = data.color;
	            		console.log(data.color);
	            		$("#DeMemCount").text(data.memcount); 
	            		$("#de_sche_no").val(data.Sche_no);
	            		$("#de_Cal_no").val(data.cal_no);
					}else if(data.cal_type == 2){
						$("#de_cal_name").text(data.Cal_name);
	            		$("#de_sche_name").text(data.Sche_name);
	            		$("#de_sche_day").text(data.startdate + " " + data.starttime + " ~ " + data.enddate + " " + data.endtime);
	            		$("#de_sche_content").text(data.Sche_content);
	            		Sche_color.style.backgroundColor = data.color;
	            		console.log(data.color);
	            		$("#DeMemCount").text(1); 
	            		$("#de_sche_no").val(data.Sche_no);
	            		$("#de_Cal_no").val(data.cal_no);
					}
            	
            		
            	
            
            		
				},
				error: function(request,status,error){
					console.log(request);
					console.log(status);
					console.log(error);
				}
			})
			

		});
      
      
      
      
         

	</script>
<script>
	// 일정 수정 db
	 $("#ajaxsche_edit").on('click',function () {
		 var Cal_name = $("#editCalName").text();
		 var Sche_name = $("#editsche_name").val();
		 var startdate = $('#editstartdate').val();
		 var starttime = $("#editstarttime option:selected").val();
		 var enddate = $('#editenddate').val();
		 var endtime = $("#editendtime option:selected").val();
		 var sche_content = $('#editsche_content').val();
		 var sche_no = $("#editsche_no").val();
	     
		 $.ajax({
             url: "updateSchedule.do",
             type: "post",
          
             traditional: true,
             data: {
                 "Cal_name": Cal_name,
                 "Sche_name": Sche_name,
                 "startdate": startdate,
                 "starttime": starttime,
                 "Cal_name": Cal_name,
                 "enddate": enddate,
                 "endtime": endtime,
                 "sche_content": sche_content,
                 "sche_no":sche_no
             },
             success: function (data) {
                 console.log("수정 에작");
                 location.reload();
             },
             error: function (request,
                 status, error) {
                 console.log("수정 에작 오류임");
                 
                
                
             }

         })
		 
	 });
	
	// 일정 삭제
	function func_confirm () {
	        		if(confirm('일정을 삭제하시겠습니까?')){
	        			 var sche_no = $("#de_sche_no").val();
	        		     
	        			 $.ajax({
	        	             url: "DeleteSchedule.do",
	        	             type: "post",
	        	             data: {"sche_no" : sche_no},
	        	             success: function (data) {
	        	                 console.log("삭제 성공임");
	        	                 location.reload();
	        	             },
	        	             error: function (request,
	        	                 status, error) {
	        	            	 console.log("삭제 실패임");
	        	            	 location.reload();
	        	                 
	        	             }

	        	         })
	        			
	        			
	        		} else {
	        			return false;
	        		}
	        	}
	
	// 일정 추가 DB
	
	 $("#ajaxsche_add").on('click',function () {
		 
	
		 var Cal_name = $("#selectCal option:selected").text();
		 var cal_no = $("#selectCal option:selected").val();
		 var Sche_name = $("#sche_name").val();
		 var startdate = $('#startdate').val();
		 var starttime = $("#starttime option:selected").val();
		 var enddate = $('#enddate').val();
		 var endtime = $("#endtime option:selected").val();
		 var sche_content = $('#sche_content').val();
	     
		 if(Sche_name.length < 1){
			 alert("일정 제목을 입력해주세요.")
			 return false;
		 } 
		 if(startdate == ''){
			 alert("시작 날짜를 지정해주세요.")
			 return false;
		 } 
	     if (startdate > enddate) {
	         alert('끝나는 날짜가 앞설 수 없습니다.');
	         return false;
	     }
		 if(enddate == ''){
			 alert("종료 날짜를 지정해주세요.")
			 return false;
		 } 
		 if(sche_content == ''){
			 alert("일정 내용을 입력해주세요.")
			 return false;}
			 
		 $.ajax({
             url: "insertSchedule.do",
             type: "post",
             dataType: "json",
             traditional: true,
             data: {
                 "Cal_name": Cal_name,
                 "cal_no": cal_no,
                 "Sche_name": Sche_name,
                 "startdate": startdate,
                 "starttime": starttime,
                 "Cal_name": Cal_name,
                 "enddate": enddate,
                 "endtime": endtime,
                 "sche_content": sche_content
             },
             success: function (data) {
                 console.log("에작"+ data);
                 location.reload();
             },
             error: function (request,
                 status, error) {
                 console.log("일정추가임"+ request);
                 location.reload();
             }

         })
		 
	 });
	
	// 일정 멤버 
	
	
	 $("#perimg").on('click',function () {
		 
		 var calNo = $("#de_Cal_no").val();
	     
		 $.ajax({
             url: "detailCalMember.do",
             type: "post",
             dataType:"json",
             data: {"calNo" : calNo},
             success: function (data) {
                 console.log("멤버 리스트");
                 
                 $("#looknameDetail").empty();
                 $("#enrollnameDetail").empty();
                 
                 
                 for(var i=0 in data){
                	 if(data[i].cal_type_no == 1){
                		 
                		 $("#detailmodalCalname").val(data[i].calName);
                		 
                		 var Cal_color = document.getElementById("detailmodalCalColor");
                		  
                		 Cal_color.style.backgroundColor = data[i].color;
                		              		console.log(data[i].color);
                		 $("#enrollnameDetail").append("<span>" + data[i].mem_name + "(" + data[i].mem_no + ")" + "</span><br>");   
                		 
                	 }else if(data[i].cal_type_no == 2){
                		
                		 $("#looknameDetail").append("<span>" + data[i].mem_name + "(" + data[i].mem_no + ")" + "</span><br>");   
                	 }
                     
                       }     
                 
                 

             },
             error: function (request,
                 status, error) {
                 console.log("멤버"+ error);
                 
             }

         })
		 
	 });
	
	// 검색
	 $("#searchbtn").on('click',function () {
			var text = $("#search_text").val();
			
			 if(text == ''){
				 alert("일정 내용을 입력해주세요.")
				 return false;}
			 
			var select_option = $("#search_option option:selected").val();
			document.location.href='SchedulerSearch.do?text='+text+'&select_option='+select_option;	
			
		 
			 })
		
		 
	
	 
	</script>
	<script>
    // 내 캘린더 추가 
    $("#indi_sub").off("click").on('click',
            function () {
                var calName = $('#cal_name2').val();
                var color = document.querySelector('#colorselect2').style.background;
                var enrollMember = "${ loginUser.memNo }";
				var lookMember  = "${ loginUser.memNo }";
				
				 if(calName.length < 1){
					 alert("캘린더 제목을 입력해주세요.")
					 return false;
				}
				 if(color.length<1){
					 alert("캘린더 색상을 선택해주세요.")
					 return false;
				}
					 
                $
                    .ajax({
                        url: "insertIndividual.do",
                        type: "post",
                        dataType: "json",
                        traditional: true,
                        data: {
                            "calName": $('#cal_name2').val(),
                            "color": document.querySelector('#colorselect2').style.background,
                            "enrollMember": enrollMember,
                            "lookMember": lookMember
                        },
                        success: function (data) {
                            console.log("에작"+ data);
                            location.reload();
                        },
                        error: function (request,status, error) {
                        	 location.reload();
                        	 console.log("에작"+ data);
                        	 }
                    })

            })
	</script>
	<script>
    // 공유 캘린더 추가용 
    /*    $(document).on('click', "#cal_sub", function(){ */
    $("#cal_sub").off("click").on('click',
            function () {
    		   $("#search_mem").empty();
    	
    			
                var calName = $('#cal_name').val();
                var color = document.querySelector('#colorselect').style.background;
                var enroll = $('#enrollname').text();
                var enrollArray = enroll.split(',');
                var look = $('#lookname').text();
                var lookArray = look.split(',');
                
               
                if(calName.length < 1){
       			 alert("캘린더 제목을 입력해주세요.")
       			 return false;
	       		 } 
                if(color.length<1){
	       			 alert("캘린더 색상을 선택해주세요")
	       			 return false;
	       		 } 
	       		 if(enroll.length < 1){
	       			 alert("등록 권한을 지정해주세요.")
	       			 return false;
	       		 } 
	       		if(look.length < 1){
	       			alert("조회 권한을 지정해주세요.")
	       			 return false;}

                for (var i = 0; i < enrollArray.length; i++) {
                    enrollArray[i] = enrollArray[i].substring(enrollArray[i].length - 5,enrollArray[i].length - 1);
                }

                for (var i = 0; i < lookArray.length; i++) {
                    lookArray[i] = lookArray[i].substring(lookArray[i].length - 5,lookArray[i].length - 1);
                }

                $
                    .ajax({
                        url: "insertCommunityCal.do",
                        type: "post",
                        dataType: "json",
                        traditional: true,
                        data: {
                            "calName": $('#cal_name').val(),
                            "color": document.querySelector('#colorselect').style.background,
                            "enrollMember": enrollArray,
                            "lookMember": lookArray
                        },
                        success: function (data) {
                            console.log("에작"+ data);
                            location.reload();
                        },
                        error: function (request,
                            status, error) {
                            console.log("공유"+ request);
                            location.reload();
                        }

                    })

            })
            
            
            // 공유 캘린더 자동완성
           
              $("#search_mem").on("keyup",function(){
              var text = $(this).val();
             
              if(text.length > 1){
                  
 			$.ajax({
 				url:"SearchMem_public.do",
 				type:"post",
 				data:{text : text},
 				success:function(data){
 	 				console.log(text);
 				 	console.log(data);
 	                $(text).val(0); 
 				 
 				 	var auto = $("#autoAddress");
 	               	var str = "";
 				 	$("#autoAddress").empty();
 				 		
 				 		str += "<ul id='ulAuto'>"
 				   
 				 	$.each(data,function(ind,entry){
 				 	
 				 		str += "<li>" +entry['name'] + "(" ;
 				 		str += entry['memNo'] +")" + "</li>" ;
 				 		
 				 	});
 				 	
 				 		str += "</ul>"
 				 		auto.append(str);
 				 		$("#autoAddress").show();
 				 	
 	                  
 				},error : function() {
 					console.log("전송실패");
 				} 
 			});
 			
              }else {
            	  $("#autoAddress").hide();
              }
              
 		});
    $(document).on("click", "#ulAuto li", function(){
    	var a = $(this).text();
    	var tmp = '';
    	$('input:checkbox[id="name"]').each(function(){
    	     if(this.value ==  a){
    	        this.checked = true;

    	     }

    	});
    	
    	  tmp +='<label for="'+a+'2"><input type="checkbox"" name="checkname" id="' + a + '2" class="checklist" value="'+ a + '">' + a +'</input><label><br>';
	/*      	document.getElementById("result").innerHTML= tmp
	     	console.log("dd" + tmp); */
	     	$("#result").append(tmp);
    	
    	
    	$("#autoAddress").mouseenter(function() {
    	       $("#ulAuto").show();
    	});
    	$("#autoAddress").mouseleave(function() {
    	       $("#ulAuto").hide();
    	});

    	 
    	 
    });
    
    
    // 공유 캘린더 수정 자동완성
    
    $("#search_mem2").on("keyup",function(){
    var text = $(this).val();
   
    if(text.length > 1){
        
	$.ajax({
		url:"SearchMem_public.do",
		type:"post",
		data:{text : text},
		success:function(data){
			console.log(text);
		 	console.log(data);
           $(text).val(0); 
		 
		 	var auto = $("#autoAddress2");
          	var str = "";
		 	$("#autoAddress2").empty();
		 		
		 		str += "<ul id='ulAuto2'>"
		   
		 	$.each(data,function(ind,entry){
		 	
		 		str += "<li>" +entry['name'] + "(" ;
		 		str += entry['memNo'] +")" + "</li>" ;
		 		
		 	});
		 	
		 		str += "</ul>"
		 		auto.append(str);
		 		$("#autoAddress2").show();
		 	
             
		},error : function() {
			console.log("전송실패");
		} 
		});
		
	    }else {
	  	  $("#autoAddress2").hide();
	    }
    
			});
			$(document).on("click", "#ulAuto2 li", function(){
			var a = $(this).text();
			$('input:checkbox[id="name2"]').each(function(){
			   if(this.value ==  a){
			      this.checked = true;
			   }
			});
			
			$("#autoAddress2").mouseenter(function() {
			     $("#ulAuto2").show();
			});
			$("#autoAddress2").mouseleave(function() {
			     $("#ulAuto2").hide();
			});
			
			
			
			});
    
        
</script>
	

				<script>
  
  function modal(id) {
       var zIndex = 9999;
       var modal = $('#' + id);

       // 모달 div 뒤에 희끄무레한 레이어
       var bg = $('<div>')
          .css({
             position: 'fixed',
             zIndex: zIndex,
             left: '0px',
             top: '0px',
             width: '100%',
             height: '100%',
             overflow: 'auto',
             // 레이어 색갈은 여기서 바꾸면 됨
             backgroundColor: 'rgba(0,0,0,0.4)'
          })
          .appendTo('body');

       modal
          .css({
             position: 'fixed',
             boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

             // 시꺼먼 레이어 보다 한칸 위에 보이기
             zIndex: zIndex + 1,

             // div center 정렬
             top: '50%',
             left: '50%',
             transform: 'translate(-50%, -50%)',
             msTransform: 'translate(-50%, -50%)',
             webkitTransform: 'translate(-50%, -50%)'
          })
          .show()
          // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
          .find('.modal-close-btn')
          .on('click', function() {
             bg.remove();
             modal.hide();
          });
       
       modal.show().find('#perimg')
       .on('click', function() {
           bg.remove();
           modal.hide();
        });
       
       modal.show().find('#editSche')
       .on('click', function() {
           bg.remove();
           modal.hide();
        });
       
    }
  
  function modal2(id) {
      var zIndex = 9999;
      var modal = $('#' + id);

      // 모달 div 뒤에 희끄무레한 레이어
             var bg = $('<div>')
          .css({
             position: 'fixed',
             zIndex: zIndex,
             left: '0px',
             top: '0px',
             width: '100%',
             height: '100%',
             overflow: 'auto',
             // 레이어 색갈은 여기서 바꾸면 됨
             backgroundColor: 'rgba(0,0,0,0.4)'
          })
          .appendTo('body');
 

      modal
         .css({
            position: 'fixed',
            boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

            // 시꺼먼 레이어 보다 한칸 위에 보이기
            zIndex: zIndex + 1,

            // div center 정렬
            top: '50%',
            left: '50%',
            transform: 'translate(-50%, -50%)',
            msTransform: 'translate(-50%, -50%)',
            webkitTransform: 'translate(-50%, -50%)'
         })
         .show()
         // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
         .find('.modal-close-btn')
         .on('click', function() {
            modal.hide();
            bg.remove();
         });
   }
     $('#sche_add').on('click', function() {
       // 모달창 띄우기
       modal('addsche_modal');
       $("#startdate").val('');
       $("#enddate").val('');
       $("#starttime option:eq(0)").prop("selected", true);
       $("#endtime option:eq(0)").prop("selected", true);

    });
     
     $('#individual').on('click', function() {
         // 내 캘린더 모달창 띄우기
         modal('individualmodal');
      });
     
     $('.editindiCal').on('click', function() {
         // 내 캘린더 수정 모달
         var calNo = $(this).attr("id");
         var Sche_color = document.getElementById("colorselect4");
         
         modal('editindividualmodal');
         // 내 캘린더 수정 전 정보 가져오기
         $.ajax({
             url: "editDetailIndiCal.do",
             type: "post",
             data: {
                 "calNo": calNo
             },
             success: function (data) {
                 console.log("내 캘린더 수정"+ data);
                 $("#edit_cal_name").val(data.calName);
                 Sche_color.style.backgroundColor = data.color;
                 $("#edit_indi_calno").val(data.calNo);
                 $("#edit_before_name").val(data.calName);
             },
             error: function (request,
                 status, error) {
                 console.log("내 캘린더 정보 실패"+ error);
               
             }

         })
         
      });
     
     // 내 캘린더 수정
     
       function btn_edit() {
    	 
    	  var cal_no =  $("#edit_indi_calno").val();
       
     
         $.ajax({
             url: "editIndiCal_Sche.do",
             type: "post",
             data: {
                 "cal_no" : cal_no
             },
             success: function (data) {
                 console.log("일정도 같이 수정완료!");
                 location.reload();
             },
             error: function (request,status, error) {
             	 console.log("일정 수정 실패" + error);
             	 }
        	})
	       }    
     
     $("#indi_Cal_edit").off("click").on('click',
             function () {
                var calName = $('#edit_cal_name').val();
                var color = document.getElementById("colorselect4").style.backgroundColor;
                var calNo =  $("#edit_indi_calno").val();
                var calName2 = $("#edit_before_name").val();
         		
                
 				 if(calName.length < 1){
 					 alert("캘린더 제목을 입력해주세요.")
 					 return false;
 				}
 		
                 $.ajax({
                         url: "editIndiCal.do",
                         type: "post",
                         dataType: "json",
                         data: {
                             "calName" : calName,
                             "color" : color,
                             "calNo" : calNo
                         },
                         success: function (data) {
                             console.log("내 캘린더 수정완료!");
                         
                         },
                         error: function (request,status, error) {
                         	 console.log("내 캘린더 수정 실패" + error);
                         	 }
                     })
                     
                     

             })
             
             
      
     
       // 내 캘린더 삭제 
      function delete_Calindifunc () {
	        		if(confirm('캘린더를 삭제하시겠습니까?')){
	        			 var calNo =  $("#edit_indi_calno").val();
	        		     
	        			 $.ajax({
	        	             url: "DeleteIndiCal.do",
	        	             type: "post",
	        	             data: {"calNo" : calNo},
	        	             success: function (data) {
	        	                 console.log("삭제 성공임");
	        	                 location.reload();
	        	             },
	        	             error: function (request,
	        	                 status, error) {
	        	            	 console.log("삭제 실패임");
	       
	        	            	 }
						 });
	        			
	        		} else {
	        			return false;
	        		}
	        	}
     
     
     $('#community').on('click', function() {
         // 공유 캘린더 모달창 띄우기
         var Cal_color = document.getElementById("colorselect");
         $("#cal_name").val('');
         $("#search_mem").val('');
         Cal_color.style.backgroundColor = 'white';
         $("#result").empty();
         $("#lookname").empty();
         $("#enrollname").empty();
         $("input:checkbox[id='name']").prop("checked", false);

         modal('communitymodal');
      });

     $('.editpubCal').on('click', function() {
         // 공유 캘린더 수정 모달
          $("#enrollname2").empty();
          $("#lookname2").empty();
                 
         var calNo = $(this).attr("id");
         var Sche_color = document.getElementById("colorselect3");
         
         
         modal('edit_communitymodal');
         // 공유 캘린더 수정 전 정보 가져오기
         $.ajax({
             url: "editDetailPublicCal.do",
             type: "post",
             dataType: "json",
             data: {
                 "calNo": calNo
             },
             success: function (data) {
                 console.log("공유 캘린더 수정");
                
                 $("#enrollname2").empty();
                 $("#lookname2").empty();
                 
                 for(var i=0 in data){
                	 if(data[i].cal_type_no == 1){
                		 console.log(data[i].calName);
                		 $("#edit_publiccal_name").val(data[i].calName);
                		 Sche_color.style.backgroundColor = data[i].color;
                         $("#edit_public_calno").val(data[i].calNo);
                		
                		    console.log(data[i].calName);
                		 $("#enrollname2").append('<span>' + data[i].mem_name + '(' + data[i].memNo + ')</span><span style="color:white">,</span><br>');   
                		 
                		 
                	 }else if(data[i].cal_type_no == 2){
                		
                		 $("#lookname2").append('<span>' + data[i].mem_name + '(' + data[i].memNo + ')</span><span style="color:white">,</span><br>');      
                	 }
                     
                       }   
                 
                 
             },
             error: function (request,
                 status, error) {
                 console.log("내 캘린더 정보 실패"+ error);
               
             }

         })
     });
     
     // 공유 캘린더 수정 추가
     $("#edit_cal_sub").off("click").on('click',
             function () {
     		   $("#search_mem2").empty();
     	
     			
                 var calName = $('#edit_publiccal_name').val();
                 var color = document.querySelector('#colorselect3').style.background;
                 var enroll = $('#enrollname2').text();
                 var enrollArray = enroll.split(',');
                 var look = $('#lookname2').text();
                 var lookArray = look.split(',');
                 
                
                 if(calName.length < 1){
        			 alert("캘린더 제목을 입력해주세요.")
        			 return false;
 	       		 } 
              
 	       		 if(enroll.length < 1){
 	       			 alert("등록 권한을 지정해주세요.")
 	       			 return false;
 	       		 } 
 	       		if(look.length < 1){
 	       			alert("조회 권한을 지정해주세요.")
 	       			 return false;}

                 for (var i = 0; i < enrollArray.length; i++) {
                     enrollArray[i] = enrollArray[i].substring(enrollArray[i].length - 5,enrollArray[i].length - 1);
                 }

                 for (var i = 0; i < lookArray.length; i++) {
                     lookArray[i] = lookArray[i].substring(lookArray[i].length - 5,lookArray[i].length - 1);
                 }

                 $
                     .ajax({
                         url: "insertEditCommunityCal.do",
                         type: "post",
                         dataType: "json",
                         traditional: true,
                         data: {
                             "calName": calName,
                             "calNo": $('#edit_public_calno').val(),
                             "color": document.querySelector('#colorselect3').style.background,
                             "enrollMember": enrollArray,
                             "lookMember": lookArray
                         },
                         success: function (data) {
                             console.log("수정 성공"+ data);
                             location.reload();
                         },
                         error: function (request,
                             status, error) {
                             console.log("수정 실패"+ request);
                             location.reload();
                         }

                     })

             })
             
             
           // 공유 캘린더 삭제 
      function Public_Cal_delete () {
	        		if(confirm('캘린더를 삭제하시겠습니까?')){
	        			 var calNo =  $("#edit_public_calno").val();
	        		     
	        			 $.ajax({
	        	             url: "DeleteIndiCal.do",
	        	             type: "post",
	        	             data: {"calNo" : calNo},
	        	             success: function (data) {
	        	                 console.log("삭제 성공임");
	        	                 location.reload();
	        	             },
	        	             error: function (request,
	        	                 status, error) {
	        	            	 console.log("삭제 실패임");
	       
	        	            	 }
						 });
	        			
	        		} else {
	        			return false;
	        		}
	        	}
     
     $('#perimg').on('click', function() {
         // 캘린더 멤버 띄우기
         modal2('com_detailmodal');
         $("#detail_modal").hide();
  
        
      });
     

     $('#editSche').on('click', function() {
    	 
         // 일정 수정
         modal2('editsche_modal');
         
         var Sche_color = document.getElementById("editColor");
         var Sche_no = $("#de_sche_no").val();
         $.ajax({
				url : "editDetailSchedule.do",
				data : { Sche_no : Sche_no },
				dataType: "json",
				async: false,
				success : function(data){
					
						$("#editCalName").text(data.Cal_name);
	            		$("#editsche_name").val(data.Sche_name);
	            		$("#editstartdate").val(data.startdate);
	            		$("#editstarttime").val(data.starttime);
	            		$("#editenddate").val(data.enddate);
	            		$("#editendtime").val(data.endtime);
	            		$("#editsche_content").val(data.Sche_content);
	            		Sche_color.style.backgroundColor = data.color;
	            		$("#editsche_no").val(data.Sche_no);

         		
				},
				error: function(request,status,error){
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					console.log(status);
					console.log(error);
				}
			})
        
      });
		
 
     
     // 리스트 토글
     $('.tree').each(function(){
     var $this = $(this);
     $this.find('li').each(function(){   //li에
         if(!$(this).children('ul').length){ //자식 ul 없으면
             $(this).addClass('final');  //final 클래스 부여한다
         }
         if($(this).is(':last-child')){  //마지막 li이면
             $(this).addClass('last');   //last 클래스 부여한다
         }
         $(this).append('<span></span>');
     });
     $this.find('li>button').on('click',function(){ //span 클릭하면
         if($(this).parent('li').hasClass('unfold')){    //하위메뉴 열려 있을 경우
             $(this).parent('li').removeClass('unfold'); //닫고
         }
         else {  //하위메뉴 닫혀 있을 경우
             $(this).parent('li').addClass('unfold');    //연다
         }
     });
    });

    // 클릭시 이름 뜨게
    $(document).ready(function () {
             // input객체에 이벤트 발생시
             $('input').change(function () {
                 // input 중 checked인것들 다 모으기
                 var inputArray = $('input[id="name"]:checked');
                 var tmp = '';
               
                 $.each(inputArray, function (index, item) {
                     // tmp+=item.value+' ';
                     
                   //   tmp +='<option value="'+ inputArray.eq(index).val() + '">' + inputArray.eq(index).val() +'</option>';
                   tmp +='<label for="'+inputArray.eq(index).val()+'2"><input type="checkbox"" name="checkname" id="' +inputArray.eq(index).val()+ '2" class="checklist" value="'+ inputArray.eq(index).val() + '">' + inputArray.eq(index).val() +'</input><label><br>';
                 });
                //   $('#result').text(tmp)
                  document.getElementById("result").innerHTML= tmp
             
         
             })
         })
		// 공유 캘린더 수정용 
          $(document).ready(function () {
             // input객체에 이벤트 발생시
             $('input').change(function () {
                 // input 중 checked인것들 다 모으기
                 var inputArray = $('input[id="name2"]:checked');
                 var tmp = '';
               
                 $.each(inputArray, function (index, item) {
                     // tmp+=item.value+' ';
                     
                   //   tmp +='<option value="'+ inputArray.eq(index).val() + '">' + inputArray.eq(index).val() +'</option>';
                   tmp +='<label for="'+inputArray.eq(index).val()+'3"><input type="checkbox"" name="checkname2" id="' +inputArray.eq(index).val()+ '3" class="checklist" value="'+ inputArray.eq(index).val() + '">' + inputArray.eq(index).val() +'</input><label><br>';
                 });
                //   $('#result').text(tmp)
                  document.getElementById("result2").innerHTML= tmp
             
         
             })
         })

        // 등록 권한 추가 
        $('#enrolladd').click(function(){
        	 var arraybox = "";
        
        	$("#enrollname:last-child").empty();
          $('[name="checkname"]:checked').each(function(i){ //i는 체크수를 알수있음
           arraybox = $(this).val();
          
       	  $('#enrollname').append('<p><input type="checkbox" name="finalname" id="' + arraybox + '" class="finallist" value="'+ arraybox + '"/><label id="lb" for="'+ arraybox+'">' + arraybox +'</label><span style="color:white">,</span><br></p>');
           console.log("중복없을때" + arraybox); 
      });
       }); 

    // 공유 캘린더 수정용 등록 권한 수정
    $('#enrolladd2').click(function(){
   	 var arraybox = "";
   
   	$("#enrollname2:last-child").empty();
     $('[name="checkname2"]:checked').each(function(i){ //i는 체크수를 알수있음
      arraybox = $(this).val();
     
  	  $('#enrollname2').append('<p><input type="checkbox" name="finalname2" id="' + arraybox + '2" class="finallist2" value="'+ arraybox + '2"/><label id="lb" for="'+ arraybox+'2">' + arraybox +'</label><span style="color:white">,</span><br></p>');
      console.log("중복없을때" + arraybox); 
 		});
  }); 
    
       // 등록 권한 빼기 
     $('#enrollsub').on('click', function() {
 
       $('[name="finalname"]:checked').parent('p').remove(); 
     });
       
       
     // 공유 캘린더 수정용 등록 권한 빼기 
     $('#enrollsub2').on('click', function() {
 
       $('[name="finalname2"]:checked').parent('p').remove(); 
     });
       
       
     // 조회 권한 추가 
     var arraybox = "";

 	
     $('#lookadd').click(function(){
     	$("#lookname:last-child").empty();
       $('[name="checkname"]:checked').each(function(i){ //i는 체크수를 알수있음
        arraybox = $(this).val();
       
    	  $('#lookname').append('<p><input type="checkbox" name="finallookname" id="' + arraybox + '3" class="finallist" value="'+ arraybox + '"/><label id="lb" for="'+ arraybox+'3">' + arraybox +'</label><span style="color:white">,</span><br></p>');
        console.log("중복없을때" + arraybox); 
   });
    }); 
     
     
  // 공유 캘린더 수정용 조회 권한 수정

     $('#lookadd2').click(function(){
     	$("#lookname2:last-child").empty();
       $('[name="checkname2"]:checked').each(function(i){ //i는 체크수를 알수있음
        arraybox = $(this).val();
       
    	  $('#lookname2').append('<p><input type="checkbox" name="finallookname2" id="' + arraybox + '4" class="finallist" value="'+ arraybox + '4"/><label id="lb" for="'+ arraybox+'4">' + arraybox +'</label><span style="color:white">,</span><br></p>');
        console.log("중복없을때" + arraybox); 
   });
    }); 

 
    // 조회 권한 빼기 
  $('#looksub').on('click', function() {

    $('[name="finallookname"]:checked').parent('p').remove(); 
  });
  
  //  공유 캘린더 수정용 조회 권한 빼기 
  $('#looksub2').on('click', function() {

    $('[name="finallookname2"]:checked').parent('p').remove(); 
  });
  
      
      
     //색상 파레트
 var beforeColor; //이전에 선택된 컬러 저장 할 변수

 //HTML 로딩이 끝난 후
 window.onload = function(){
 init();
 init2();
 init3();
 init4();

 }

 
					function init() {
						//2차원 배열 파레트 데이터
						var pallet = [ [ "#FFA7A7", "#FFC19E", "#FFE08C",
								"#FAED7D", "#CEF279", "#B7F0B1", "#B2EBF4",
								"#B2CCFF", "#B5B2FF", "#D1B2FF", "#FFB2F5",
								"#FFB2D9", "#D5D5D5", "#BDBDBD" ] ];
						var tag = "";
						for (i = 0; i < pallet.length; i++) {
							for (j = 0; j < pallet[i].length; j++) {
								tag += "<div id="
										+ pallet[i][j]
										+ " class='colorBox' onclick='colorSet(this)'></div>";
							}
						}
						//파레트 파싱
						document.getElementById("palletBox").innerHTML = tag;

						//색상 입히기
						var colorBox = document
								.getElementsByClassName("colorBox");
						for (i = 0; i < colorBox.length; i++) {
							colorBox[i].style.background = colorBox[i].id;
						}
					}

					// onclick event
					function colorSet(target) {
						document.querySelector("#colorselect").style.background = target.id;

						if (beforeColor != undefined && beforeColor != null) {
							document.getElementById(beforeColor).className = document
									.getElementById(beforeColor).className
									.replace(" active", "");
						}
						document.getElementById(target.id).className += " active";
						beforeColor = target.id;
					}

					function init2() {
						//2차원 배열 파레트 데이터
						var pallet2 = [ [ "#F15F5F", "#F29661", "#F2CB61",
								"#E5D85C", "#BCE55C", "#86E57F", "#5CD1E5",
								"#6799FF", "#6B66FF", "#A566FF", "#F361DC",
								"#F361A6", "#A6A6A6", "#8C8C8C" ] ];
						var tag2 = "";
						for (i = 0; i < pallet2.length; i++) {
							for (j = 0; j < pallet2[i].length; j++) {
								tag2 += "<div id="
										+ pallet2[i][j]
										+ " class='colorBox2' onclick='colorSet2(this)'></div>";
							}
						}
						//파레트 파싱
						document.getElementById("palletBox2").innerHTML = tag2;

						//색상 입히기
						var colorBox2 = document
								.getElementsByClassName("colorBox2");
						for (i = 0; i < colorBox2.length; i++) {
							colorBox2[i].style.background = colorBox2[i].id;
						}
					}
					
					 function init3(){
						   //2차원 배열 파레트 데이터
						         var pallet3 =[ [ "#FFA7A7", "#FFC19E", "#FFE08C",
														"#FAED7D", "#CEF279", "#B7F0B1", "#B2EBF4",
														"#B2CCFF", "#B5B2FF", "#D1B2FF", "#FFB2F5",
														"#FFB2D9", "#D5D5D5", "#BDBDBD" ] ];
						         var tag3 = "";
						         for(i=0; i<pallet3.length; i++){
						            for(j=0; j<pallet3[i].length; j++){
						               tag3 += "<div id="+pallet3[i][j]+" class='colorBox3' onclick='colorSet3(this)'></div>";
						            }
						         }
						         //파레트 파싱
						         document.getElementById("palletBox3").innerHTML = tag3;

						         //색상 입히기
						         var colorBox3 = document.getElementsByClassName("colorBox3");
						         for(i=0; i<colorBox3.length; i++){
						            colorBox3[i].style.background = colorBox3[i].id;
						         }
						         }

						         // onclick event
						         function colorSet3(target3){
						         document.querySelector("#colorselect3").style.background = target3.id;

						         if(beforeColor != undefined && beforeColor != null){
						            document.getElementById(beforeColor).className = document.getElementById(beforeColor).className.replace(" active3", "");
						         }
						         document.getElementById(target3.id).className += " active3";
						         beforeColor = target3.id;
						         }

					// onclick event
					function colorSet2(target2) {
						document.querySelector("#colorselect2").style.background = target2.id;

						if (beforeColor != undefined && beforeColor != null) {
							document.getElementById(beforeColor).className = document
									.getElementById(beforeColor).className
									.replace(" active2", "");
						}
						document.getElementById(target2.id).className += " active2";
						beforeColor = target2.id;
					}
					
			         
					   function init4(){
					   //2차원 배열 파레트 데이터
					         var pallet4 = [["#F15F5F", "#F29661", "#F2CB61", "#E5D85C", "#BCE55C",
					          "#86E57F", "#5CD1E5", "#6799FF", "#6B66FF", "#A566FF", "#F361DC", "#F361A6", "#A6A6A6", "#8C8C8C"]];
					         var tag4 = "";
					         for(i=0; i<pallet4.length; i++){
					            for(j=0; j<pallet4[i].length; j++){
					               tag4 += "<div id="+pallet4[i][j]+" class='colorBox4' onclick='colorSet4(this)'></div>";
					            }
					         }
					         //파레트 파싱
					         document.getElementById("palletBox4").innerHTML = tag4;

					         //색상 입히기
					         var colorBox4 = document.getElementsByClassName("colorBox4");
					         for(i=0; i<colorBox4.length; i++){
					            colorBox4[i].style.background = colorBox4[i].id;
					         }
					         }

					         // onclick event
					         function colorSet4(target4){
					         document.querySelector("#colorselect4").style.background = target4.id;

					         if(beforeColor != undefined && beforeColor != null){
					            document.getElementById(beforeColor).className = document.getElementById(beforeColor).className.replace(" active4", "");
					         }
					         document.getElementById(target4.id).className += " active4";
					         beforeColor = target4.id;
					         }
					
					

				
				</script>
				
			

				

			</div>
		</div>
</body>
</html>
