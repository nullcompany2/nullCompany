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

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">

<link rel="stylesheet"
	href="<c:url value="/resources/css/schemaincal.css"/>">


<link href="<c:url value="/resources/css/core.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/daygrid.css"/>"
	rel='stylesheet' />
<link href="<c:url value="/resources/css/timegrid.css"/>"
	rel='stylesheet' />
<link href="<c:url value="/resources/css/list.css"/>" rel='stylesheet' />
<script src='<c:url value="/resources/js/core.js"/>'></script>
<script src='<c:url value="/resources/js/interaction.js"/>'></script>
<script src='<c:url value="/resources/js/daygrid.js"/>'></script>
<script src='<c:url value="/resources/js/timegrid.js"/>'></script>
<script src='<c:url value="/resources/js/list.js"/>'></script>

<!-- 캘린더 -->
<c:url value="" />
<link href='<c:url value="/resources/css/fullcalendar.css"/>'
	rel='stylesheet' />
<link href='<c:url value="/resources/css/fullcalendar.print.css"/>'
	rel='stylesheet' media='print' />
<script src='<c:url value="/resources/js/jquery-1.10.2.js"/>'
	type="text/javascript"></script>
<script src='<c:url value="/resources/js/jquery-ui.custom.min.js"/>'
	type="text/javascript"></script>
<script src='<c:url value="/resources/js/fullcalendar.js"/>'
	type="text/javascript"></script>

<!-- 자동완성 -->


<script>
  // 메뉴 아이콘용 토글 
/*   $(function () {
    $("#menu").click(function () {
      $("#menuToggle").toggle();
    });
  }); */


  // 인포용 토글
/*   $(function () {
    $("#infoToggle").hide();
    $("#infobtn").click(function () {
      $("#infoToggle").toggle();
    });
  }); */

  


  document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');

	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
	      header: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
	      },

	      locale : "ko",
	      navLinks: true, // can click day/week names to navigate views
	      businessHours: true, // display business hours
	      editable: true,
	      events: [
	        {
	          title: '정택환 다이아감!',
	          start: '2020-10-23T13:00:00',
	          constraint: '정택환 다이아감!',
	          color: 'rgb(255, 167, 167)'
	        },
	        {
		          title: '신아라 서울옴!!',
		          start: '2020-11-04T13:00:00',
		          constraint: '신아라 서울옴!',
		          color: 'rgb(250, 237, 125)'
		      },
	      ]
	    });

	    calendar.render();
	  });


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
									style="border: none; border-radius: 3px; background: #477A8F; color: white; font-size: 20px; width: 90%; height: 50px; margin-left: 12px;">
									일정 추가</button>
							</div>
						</div>
						<div class="drag-scrollbar2">
							<div class="H-personnel-subNavi2 underline" style="border: none">
								<div class="H-personnel-subNavi2 Depth01-1">

									<li class="subTitle"><label for="calendar_view"
										style="font-weight: bold;">내 캘린더</label>
										<button id="individual" class="calbtn">만들기</button> <br>
										<div class="input-group">
											<!-- <select class="filter" id="type_filter" multiple="multiple"> -->
											<c:forEach var="IndividualCalList" items="${ IndividualCalList }">
												<input type="checkbox" name="sche_cate" value="${ IndividualCalList.calNo }">
												${ IndividualCalList.calName }</input>
											<a>수정</a><br> 
											</c:forEach>
											<!-- </select> -->
										</div></li>

									<hr>

									<li class="subTitle"><label for="calendar_view"
										style="font-weight: bold;">공유 캘린더</label>
										<button id="community" class="calbtn">만들기</button> <br>
										<div class="input-group">
										
											<c:forEach var="publicCalList" items="${ publicCalList }">
												<input type="checkbox" name="sche_cate" value="${ publicCalList.calNo }">
												${ publicCalList.calName }</input>
											<a>수정</a><br> 
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
							<select name="search"
								style="border-radius: 8px; border: #676767 solid 1px; margin-right: 3px;">
								<option value="일정 제목">일정 제목</option>
								<option value="캘린더 이름">캘린더 이름</option>
							</select> <input type="text" name="" id="" class="search-emp"
								placeholder="&nbsp; 일정검색"
								style="border-radius: 8px; border: #676767 solid 1px;">&nbsp;&nbsp;
							<a href="SchedulerResearch.do" id="searchbtn"
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

						<!-- 일정 추가 모달 -->
					</div>

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
									<select name="cal" style="width: 200px;">
										<c:forEach var="publicCalList" items="${ publicCalList }">
											<option class="selectpublicCal" value="${ publicCalList.calNo }">${ publicCalList.calName }</option>
									    </c:forEach>
									    <c:forEach var="IndividualCalList" items="${ IndividualCalList }">
											<option class="selectindiCal" value="${ IndividualCalList.calNo }">${ IndividualCalList.calName }</option>
									    </c:forEach>
									</select>
								</dd>
							</dl>
							<dl>
								<dt style="float: left;">
									<label>일정 제목</label>
								</dt>
								<dd style="margin-left: 150px;">
									<input type="text" style="width: 200px;">
								</dd>
							</dl>
							<dl>
								<dt style="float: left;">
									<label>시작</label>
								</dt>
								<dd style="margin-left: 150px;">
									<input type="date" name="" id=""> <select name="time">

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
									<input type="date" name="" id=""> <select name="time">

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
									<textarea name="" id="" cols="30" rows="5"
										style="resize: none;"></textarea>
								</dd>
							</dl>
						</div>
						<div
							style="text-align: center; position: relative; top: 185px; left: -35px;">
							<button
								style=" background: #fff;
									    color: #2c86dc;
									    padding: 5px 27px 6px;
									    border: 1px solid #c8c8c8;
									    position: absolute;
									    left: 150px;">확인</button>
								<button class="modal-close-btn cursor"
								style="absolute;
							    left: 245PX;
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
							사원 이름 &nbsp; <input type="text" id="testText"
								style="margin-left: 19px;"> &nbsp;
							<btn style="font-size: 14px; color: #477A8F;">검색</btn>
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
								<img src="resources/images/right.png" id="enrolladd"><br>
								<img src="resources/images/left.png" id="enrollsub">
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
								<img src="resources/images/right.png" id="lookadd"><br>
								<img src="resources/images/left.png" id="looksub">
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
									style="background: #fff; color: #2c86dc; padding: 5px 27px 6px; border: 1px solid #c8c8c8">저장</button>
								<button class="modal-close-btn cursor"
								style="position: absolute; left: 90px; top: 0px; padding: 5px 27px 6px; color: #444;
								 letter-spacing: -1px; border: 1px solid #dadada; background: #dadada;">취소</button>
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
						</div></div>


						<div style="text-align: center;position: relative;top: 20px;">
							<button id="indi_sub"
								style="background: #fff; color: #2c86dc; padding: 5px 27px 6px; border: 1px solid #c8c8c8">확인</button>
							<button class="modal-close-btn cursor"
								style="padding: 5px 27px 6px; color: #444; letter-spacing: -1px; border: 1px solid #dadada; background: #dadada;">취소</button>
						</div>
						
					</div>



				</div>

	<script>
    // 내 캘린더 추가 
    $("#indi_sub").off("click").on('click',
            function () {
                var calName = $('#cal_name2').val();
                var color = document.querySelector('#colorselect2').style.background;
                var enrollMember = "${ loginUser.memNo }";
				var lookMember  = "${ loginUser.memNo }";
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
                        error: function (request,
                            status, error) {
                            console.log("개인"+ request);
                            location.reload();
                        }

                    })

            })
	</script>
	<script>
    // 공유 캘린더 추가용 
    /*    $(document).on('click', "#cal_sub", function(){ */
    $("#cal_sub").off("click").on('click',
            function () {
                var calName = $('#cal_name').val();
                var color = document.querySelector('#colorselect').style.background;
                var enroll = $('#enrollname').text();
                var enrollArray = enroll.split(',');

                for (var i = 0; i < enrollArray.length; i++) {
                    enrollArray[i] = enrollArray[i].substring(enrollArray[i].length - 5,enrollArray[i].length - 1);
                }

                var look = $('#lookname').text();
                var lookArray = look.split(',');

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
    }
     $('#sche_add').on('click', function() {
       // 모달창 띄우기
       modal('addsche_modal');
    });
     
     $('#individual').on('click', function() {
         // 내 캘린더 모달창 띄우기
         modal('individualmodal');
      });
     $('#community').on('click', function() {
         // 공유 캘린더 모달창 띄우기
         modal('communitymodal');
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

        // 조회 버튼

        // 등록 권한 추가 
        var arraybox = "";
 
    	
        $('#enrolladd').click(function(){
        	$("#enrollname:last-child").empty();
          $('[name="checkname"]:checked').each(function(i){ //i는 체크수를 알수있음
           arraybox = $(this).val();
          
       	  $('#enrollname').append('<p><input type="checkbox" name="finalname" id="' + arraybox + '" class="finallist" value="'+ arraybox + '"/><label id="lb" for="'+ arraybox+'">' + arraybox +'</label><span style="color:white">,</span><br></p>');
           console.log("중복없을때" + arraybox); 
      });
       }); 

    
       // 등록 권한 빼기 
     $('#enrollsub').on('click', function() {
 
       $('[name="finalname"]:checked').parent('p').remove(); 
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

 
    // 조회 권한 빼기 
  $('#looksub').on('click', function() {

    $('[name="finallookname"]:checked').parent('p').remove(); 
  });
  
      
      
     //색상 파레트
 var beforeColor; //이전에 선택된 컬러 저장 할 변수

 //HTML 로딩이 끝난 후
 window.onload = function(){
 init();
 init2();
 
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
				</script>



			</div>
		</div>
</body>
</html>
