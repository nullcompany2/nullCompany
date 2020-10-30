<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Lato:400,700)" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<link rel="stylesheet" href="<c:url value="/resources/css/myLeave.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/css/younsu-subNavi.css"/>">

    <!-- 캘린더 -->
    <c:url value=""/>
    <link href='<c:url value="/resources/css/fullcalendar.css"/>' rel='stylesheet' />
    <link href='<c:url value="/resources/css/fullcalendar.print.css"/>' rel='stylesheet' media='print' />
    <script src='<c:url value="/resources/js/jquery-1.10.2.js"/>' type="text/javascript"></script>
    <script src='<c:url value="/resources/js/jquery-ui.custom.min.js"/>' type="text/javascript"></script>
    <script src='<c:url value="/resources/js/fullcalendar.js"/>' type="text/javascript"></script>
    

</head>
<!-- 캘린더 & 헤더 스크립트 -->
<script>
//메뉴 아이콘용 토글 
	$(function () {
	  $("#menu").click(function () {
	    $("#menuToggle").toggle();
	  });
	});
	
	
	// 인포용 토글
	$(function () {
	  $("#infoToggle").hide();
	  $("#infobtn").click(function () {
	    $("#infoToggle").toggle();
	  });
	});
	
	$(document).ready(function() {
	    var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();

		/*  className colors

		className: default(transparent), important(red), chill(pink), success(green), info(blue)

		*/


		/* initialize the external events
		-----------------------------------------------------------------*/

		$('#external-events div.external-event').each(function() {

			// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
			// it doesn't need to have a start or end
			var eventObject = {
				title: $.trim($(this).text()) // use the element's text as the event title
			};

			// store the Event Object in the DOM element so we can get to it later
			$(this).data('eventObject', eventObject);

			// make the event draggable using jQuery UI
			$(this).draggable({
				zIndex: 999,
				revert: true,      // will cause the event to go back to its
				revertDuration: 0  //  original position after the drag
			});

		});


		/* initialize the calendar
		-----------------------------------------------------------------*/

		var calendar =  $('#calendar').fullCalendar({
			header: {
				left: 'title',
				center: 'agendaDay,agendaWeek,month',
				right: 'prev,next today'
			},
			editable: true,
			firstDay: 1, //  1(Monday) this can be changed to 0(Sunday) for the USA system
			selectable: true,
			defaultView: 'month',

			axisFormat: 'h:mm',
			columnFormat: {
                month: 'ddd',    // Mon
                week: 'ddd d', // Mon 7
                day: 'dddd M/d',  // Monday 9/7
                agendaDay: 'dddd d'
            },
            titleFormat: {
                month: 'MMMM yyyy', // September 2009
                week: "MMMM yyyy", // September 2009
                day: 'MMMM yyyy'                  // Tuesday, Sep 8, 2009
            },
			allDaySlot: false,
			selectHelper: true,
			select: function(start, end, allDay) {
				var title = prompt('Event Title:');
				if (title) {
					calendar.fullCalendar('renderEvent',
						{
							title: title,
							start: start,
							end: end,
							allDay: allDay
						},
						true // make the event "stick"
					);
				}
				calendar.fullCalendar('unselect');
			},
			droppable: true, // this allows things to be dropped onto the calendar !!!
			drop: function(date, allDay) { // this function is called when something is dropped

				// retrieve the dropped element's stored Event Object
				var originalEventObject = $(this).data('eventObject');

				// we need to copy it, so that multiple events don't have a reference to the same object
				var copiedEventObject = $.extend({}, originalEventObject);

				// assign it the date that was reported
				copiedEventObject.start = date;
				copiedEventObject.allDay = allDay;

				// render the event on the calendar
				// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
				$('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

				// is the "remove after drop" checkbox checked?
				if ($('#drop-remove').is(':checked')) {
					// if so, remove the element from the "Draggable Events" list
					$(this).remove();
				}

			},

			events: [
				{
					title: 'All Day Event',
					start: new Date(y, m, 1)
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: new Date(y, m, d-3, 16, 0),
					allDay: false,
					className: 'info'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: new Date(y, m, d+4, 16, 0),
					allDay: false,
					className: 'info'
				},
				{
					title: 'Meeting',
					start: new Date(y, m, d, 10, 30),
					allDay: false,
					className: 'important'
				},
				{
					title: 'Lunch',
					start: new Date(y, m, d, 12, 0),
					end: new Date(y, m, d, 14, 0),
					allDay: false,
					className: 'important'
				},
				{
					title: 'Birthday Party',
					start: new Date(y, m, d+1, 19, 0),
					end: new Date(y, m, d+1, 22, 30),
					allDay: false,
				},
				{
					title: 'Click for Google',
					start: new Date(y, m, 28),
					end: new Date(y, m, 29),
					url: 'http://google.com/',
					className: 'success'
				}
			],
		});


	});

</script>
<!-- 캘린더 * 헤더 스타일 -->
<style>

	#external-events {
		float: left;
		width: 150px;
		padding: 0 10px;
		text-align: left;
		}

	#external-events h4 {
		font-size: 16px;
		margin-top: 0;
		padding-top: 1em;
		}

	.external-event { /* try to mimick the look of a real event */
		margin: 10px 0;
		padding: 2px 4px;
		background: #3366CC;
		color: #fff;
		font-size: .85em;
		cursor: pointer;
		}

	#external-events p {
		margin: 1.5em 0;
		font-size: 11px;
		color: #666;
		}

	#external-events p input {
		margin: 0;
		vertical-align: middle;
		}

	#calendar {
/* 		float: right; */
        margin: 0 auto;
		width: 900px;
		background-color: #FFFFFF;
		  border-radius: 6px;
        box-shadow: 0 1px 2px #C3C3C3;
		}
		* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }
	
   *:focus {outline:none;} 
   
  ul,
  li {
    list-style: none
  }

  a,select,input[type="checkbox"] {
    text-decoration: none;
    cursor:pointer;
  }
 
  header {
    margin: 0 auto;
    width: 100%;
    height: 110px;
    position: relative;
    background-color: #3E4247;
    box-shadow: 0px 0px 20px #5C6369;
    
  }

  #menuToggle {
    width: 500px;
    height: 300px;
    position: absolute;
    left: 10px;
    top: 70px;
   	z-index: 500;
   	
  }

  #menu {
    font-size: 24px;
    color:#EFEFEF;
    width: 200px;
    height: 110px;
    float: left;
    padding: 32px;
    cursor: pointer;
  }

  .menu_icon {
    width: 100px;
    height: 110px;
    border: 0;
    margin-top: 30px;
    margin-left: 17px;
    background-color:white;
    cursor: pointer;
  }

  .menu_icon:focus {
    outline: none;
  }
  
  .hover1 img:last-child,
  .hover1:hover img:first-child {
    display: none;
  }

  .hover1:hover img:last-child {
    display: inline-block
  }

  #logo{
      width: 250px;
      height: 110px;
      background-color: #3E4247;
      float: left;
  }

  #username{
      font-size: 18px;
      color: #e9e9e9;
  }

  #userdept{
      font-size: 13px;
      color: #a7a7a7
  }
  #user_image{
    float: right;
    width: 90px;
    height: 90px;
    margin-right: 10px;
    margin-top: 10px;
}

  #info{
    width: 80px;
    height: 100%;
    float: right;
    margin-top: 15px;
    margin-right: 100px;
  }

  #infobtn{
    float: right;
    cursor: pointer;
   
  }
  
  #infoToggle{
    width: 320px;
    height: 130px;
    background-color: darkcyan;
    position: absolute;
    right: 0px;
    top: 110px;
    display: inline-block;
    z-index: 500;
    
  }

  
  #name_email{
    position: absolute;
    right: 80px;
    top: 20px;
    
  }

  #name_email p {
      color: #444444;
      font-size: 17px;
  }

  #info1{
    position: absolute;  
    right: 90px;
    top: 85px;
  }

  #info1 a{
    color: #444444;
    font-size: 16px;
    font-weight: bold;

  }

  #infoToggle div a:hover{
    color: #477A8F;
 }

 #workbtn button{
     font-size: 15px;
     color: #ffffff;
     border:none;
     background-color: #477A8F;
     width: 60px;
     height: 25px;
     border-radius: 3px;
     margin-left: 10px;
     cursor: pointer;
 }

 #workbtn{
  position: absolute;
  right: 113px;
  top: 70px;

 }
  
  #my_modal {
          display: none;
          width: 350px;
          height: 220px;
          padding: 20px 60px;
          background-color: #fefefe;
          border: 1px solid #888;
          border-radius: 3px;
          text-align: center;
          color:rgb(65, 65, 66);
          
          position: fixed;
		  
       }
 
       #my_modal .modal-close-btn {
          position: absolute;
          top: 10px;
          right: 10px;
          cursor: pointer;
          
       }
       
       
       .n-emp-i{
          width: 100%;
          height: 30%;
       }

       .n-emp-i>button {
           width: 180px;
           height: 40px;
           background: #477A8F;
           color:white;
           border: none;
           border-radius: 3px;
           font-size: 15px;
           cursor: pointer;
       }
       
       body {
		font-family: "Noto Sans KR", sans-serif;
		padding: 0px; margin: 0px;

	}


	a:active {
		font-weight: bolder;
	}
	
 	header #logo button {
		border:none;
		background:none;
		color : #477A8F;
		padding : 23px 0px 0px 50px;
		font-size : 23px;
		text-align: left;
		font-family: 'Lato', sans-serif;
		cursor :pointer;
	}
	
	header #logo span {
		color : white;
		font-size : 15px;
		font-family: 'Lato', sans-serif;
	}
	
	 ::-webkit-scrollbar { display: none; }

	

</style>

<body>
	
    <div id='wrap'>
		<!-- 헤더 -->
		<header>
	      <div id="logo">
	        <button onclick="location.href='home.do'"> <span> \ </span>  Null <br> Company <span> \ </span> </button>
	      </div>
	
	      <a id="menu">오피스 홈 &nbsp; <img src="resources/images/dropbtn.png"></a>
	      <div id="menuToggle" style="display: none; background-image: url(resources/images/menu.png);">
	        <button class="menu_icon hover1" onclick="location.href='recieveMail.do'">
	          <img src="resources/images/mail.png" /> <img src="resources/images/h_mail.png" />
	        </button>
	        <button class="menu_icon hover1" onclick="location.href='boardHome.do'">
	          <img src="resources/images/board.png" /> <img src="resources/images/board_h.png" />
	        </button>
	        <button class="menu_icon hover1" onclick="location.href='mail.html'">
	          <img src="resources/images//sche.png" /> <img src="resources/images/sche_h.png" />
	        </button>
	        <button class="menu_icon hover1" onclick="location.href='organization.do'">
	          <img src="resources/images/Personnel.png" /> <img src="resources/images/Personnel_h.png" />
	        </button>
	        <button class="menu_icon hover1" onclick="location.href='reservation.do'">
	          <img src="resources/images/reser.png" /> <img src="resources/images/reser_h.png" />
	        </button>
	        <button class="menu_icon hover1" onclick="location.href='mail.html'">
	          <img src="resources/images/elec.png" /> <img src="resources/images/elec_h.png" />
	        </button>
	        <button class="menu_icon hover1" onclick="location.href='officeMain.do'">
	          <img src="resources/images/office.png" /> <img src="resources/images/office_h.png" />
	        </button>
	
	      </div>
	
	      <div id="infobtn">
	        &nbsp; <img src="resources/images/infobtn.png" 
	        style="margin-top: 42px;
	        margin-right: 40px;
	        position: relative;
	        left: -16px;" >
	        
	      </div>
	      <div id="infoToggle" style="background: url(resources/images/info.png);">
	        <img src="${ loginUser.photo }" alt="" style="margin-left: 15px; margin-top: 4px;">
	        <div id="name_email">
	          <p style="margin-left:100px;" >${ loginUser.name }님</p>
	          <p style="font-size:10px; margin-left:100px;">${ loginUser.id} @nullcompany.com</p>
	        </div>
	        
	        <div id="info1">
	         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	          <a>설정</a> &nbsp;&nbsp;&nbsp;&nbsp;
	          <a href="logout.do">로그아웃</a>
	        </div>
	        
	      </div>
	      
			
	      <div id="info">
	        <p id="username">${ loginUser.name }님</p> 
	        <p id="userdept">${ loginUser.deptName }부 ${ loginUser.rankName } </p>
	      </div>
	     
	      <div id="user_image" style="background-image: url(${ loginUser.photo });">
	         
	      </div>
	      <div id="workbtn">
	        <button>출근</button>  
	        <button class="go">퇴근</button>
	      </div>

	  </header>
		
		<!-- container -->
		<div class="container">
			<!-- 전체높이지정용 -->
			<div id="drag-wrap">
                <div id="drag"></div>
			</div>
			<!--  -->
			<!-- 세부 네비 시작 -->
			<div id="sub-navigation" >
				<div id="sub-navi-topinfo" class="H-personnel-subNavi underline">		
					<h2 style="text-align: center;">인사관리</h2>
					<li>
						<div>
							<span class="title">남은 휴가</span>
							<span class="num"> 25</span> 일
						</div>
					</li>
					<li>					
						<div>
							<span class="title">지각(년/월)</span>
							<span class="num">0/0</span>
						</div>
					</li>
				</div>
				<div id="sub-navi-deinfo" class="drag-scrollbar">
					<div class="H-personnel-subNavi underline" >
						<div class="H-personnel-subNavi Depth01-1">
							<li class="subTitle">
								<a href="#">인사 정보</a>
							</li>
						</div>
						<ul id="Tab1" class="H-personnel-subNavi Depth02">
							<li><a href="organization.do" id="">조직 목록</a></li>
							<li><a href="modificationMyInfo.do" id="">내 정보 관리</a></li>
						</ul>
		
						<div class="H-personnel-subNavi Depth01-2">
							<li class="subTitle">
								<a href="#">휴가 / 근태</a>
							</li>
						</div>
						<ul id="Tab2" class="H-personnel-subNavi Depth02">
							<li><a href="myLeave.do" id="">휴가 현황</a></li>
							<li><a href="myDiligence.do" id="">근태 현황</a></li>
						</ul>
					</div>
		
					<div class="H-personnel-subNavi ">
						<div class="H-personnel-subNavi Depth01-3">
							<li class="subTitle"><a href="#">인사 관리</a></li>
						</div>
						<ul id="Tab3" class="H-personnel-subNavi Depth02">
							<li><a href="#" id="">조직 관리</a></li>
							<li><a href="#" id="">사용자 관리</a></li>
							<li><a href="#" id="">직위/직무 관리</a></li>
							<li><a href="#" id="">사용자 승인 관리</a></li>
							<li><a href="#" id="">관리자 지정</a></li>
						</ul>
						<div class="H-personnel-subNavi Depth01-4">
							<li class="subTitle"><a href="#">휴가 관리</a></li>
							
						</div>
						<ul id="Tab4" class="H-personnel-subNavi Depth02">
							<li><a href="setLeaveStandard.do" id="">기본 설정</a></li>
							<li><a href="emLeaveManagement.do" id="">직원 휴가 관리</a></li>
						</ul>
						<div class="H-personnel-subNavi Depth01-5">
							<li class="subTitle"><a href="#">근태 관리</a></li>
							
						</div>
						<ul id="Tab5" class="H-personnel-subNavi Depth02">
							<li><a href="setDiligenceStandard.do" id="">기본 설정</a></li>
							<li><a href="emAbsenceManagement.do" id="">휴직자 관리</a></li>
							<li><a href="emDiligenceManagement.do" id="">직원 근태 관리</a></li>
						</ul>
					</div>
				</div>
				<script>
					$(function(){
						$(".Depth01-1").click(function(){
							if($("#Tab1").css("display") == 'none'){
								$("#Tab1").css("display","block")
							}else{
								$("#Tab1").css("display","none")
							}
						})
						$(".Depth01-2").click(function(){
							if($("#Tab2").css("display") == 'none'){
								$("#Tab2").css("display","block")
							}else{
								$("#Tab2").css("display","none")
							}
						})
						$(".Depth01-3").click(function(){
							if($("#Tab3").css("display") == 'none'){
								$("#Tab3").css("display","block")
							}else{
								$("#Tab3").css("display","none")
							}
						})
						$(".Depth01-4").click(function(){
							if($("#Tab4").css("display") == 'none'){
								$("#Tab4").css("display","block")
							}else{
								$("#Tab4").css("display","none")
							}
						})
						$(".Depth01-5").click(function(){
							if($("#Tab5").css("display") == 'none'){
								$("#Tab5").css("display","block")
							}else{
								$("#Tab5").css("display","none")
							}
						})

					})
				</script>
			</div>
			<!-- 세부 네비끝 -->
			
			<!-- 컨텐츠 -->
			<div class="contents">
				<!-- 컨텐츠 타이틀명 -->
				<div class="contents-title">
					<span class="ct1">휴가 현황</span>
				</div>
				<!-- 컨텐츠 -->
				<div class="contents-wrap drag-scrollbar">
					<div class="ic-navi">
						<div onclick="location.href='myLeave.do'" class="cate cursor" id="myleave">내 휴가</div>
						<div onclick="location.href='leaveCalendar.do'" class="cate cursor" id="" style="color: #477A8F;">휴가 캘린더</div>
					</div>
							
					<div id="show-calendar" class="c-ic" style="padding: 30px">
                        
                        <div id="calendar"></div>
                    </div>
                    
					
                </div>
                
				
            </div>
            
			<!--  -->
		</div>
		
	</div>
	<!-- Modal -->

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
				.find('.md-btn-close')
				.on('click', function() {
					bg.remove();
					modal.hide();
				});
				
		}

		$('#detail-r-l').on('click', function() {
			// 모달창 띄우기
			modal('my_modal');
		});
		$('.go').on('click', function() {
		       // 모달창 띄우기
		       modal('off-work');
		    });
		
		$(document).ready(function(){
			$(".md-btn-cancel").click(function(){
				var result = confirm("휴가신청을 취소하시겠습니까?");
			})
		})
	</script>
<style>
#off-work{
		display: none;
        width: 350px;
        height: 220px;
        padding: 20px 60px;
        background-color: #fefefe;
        border: 1px solid #888;
        border-radius: 3px;
        text-align: center;
        color:rgb(65, 65, 66);
        position: fixed;
       	}
#my_modal {
	display: none;
	width: 700px;
	height: 550px;
	padding: 20px 60px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
}

#off-work .modal-close-btn,
.md-btn-close {
	position: absolute;
	top: 10px;
	right: 10px;
}
.md-tbl{
	width: 100%;
	border-top: solid 0.1px #477A8F;
	border-bottom: solid 0.1px #477A8F;
	border-collapse:collapse;
}
.modal-dragscroll{
	overflow: auto;
}
.modal-dragscroll::-webkit-scrollbar {
	width: 10px;

}
.modal-dragscroll::-webkit-scrollbar-thumb {
	background-color: #e8ecee;
	border-radius: 15px;
}
.modal-dragscroll::-webkit-scrollbar-track {
	background-color: white;
	border-radius: 15px;
	box-shadow: white;
}
.md-tbl{
	width: 100%;
	border-top: solid 0.1px #477A8F;
	border-bottom: solid 0.1px #477A8F;
	border-collapse:collapse;
}
.md-tbl-il,
.md-tbl-th,
.md-tbl.td{
	width: 100%;
	border-top: solid 0.1px #477A8F;
	border-bottom: solid 0.1px #477A8F;
	border-collapse:collapse;
}
.md-tbl-th{
	width: 100px;
	height: 50px;
	background: #e8ecee;
	text-align: center;
	font-weight: normal;
}
.md-tbl-td{
	padding: 5px;
	width: 200px;
	text-align: left;
}
.md-btn{
	font-size: 17px;
	border: none;
	background-color: white;
	border-bottom: solid 0.1px #477A8F;
	border-bottom-right-radius: 2px;
	border-bottom-left-radius: 2px;
}
</style>
	
	<!-- Header Modal div -->
	       <div id="off-work" class="modal-dragscroll">
	           <br>
	         <%= sf.format(nowTime) %><br> 
	        <span style="font-size:20px; color: black;"> ${ loginUser.name } </span>님 
	           <div class="n-emp-i">
	            <h4 style="color: #477A8F; margin-bottom: 5px; font-weight: bolder;">퇴근 하시겠습니까? </h4> <br>
	            <button class="" > 퇴근</button> 
	      
	   		</div>
	    
	
	   		 <a class="md-btn-close cursor md-btn-close">X</a>
	 		</div>
	
	<!-- Modal div -->
	<div id="my_modal" class="modal-dragscroll">
		<h4 style="color: #477A8F; margin-bottom: 30px;">휴가 신청 상세</h4>
		<table class="md-tbl">
			<tr class="md-tbl-il">
				<th class="md-tbl-th">신청일시</th>
				<td class="md-tbl-td">td</td>
				<th class="md-tbl-th">상태</th>
				<td class="md-tbl-td">td</td>
			</tr>
			<tr class="md-tbl-il">
				<th class="md-tbl-th">사용자 이름</th>
				<td class="md-tbl-td">td</td>
				<th class="md-tbl-th">사용자 사번</th>
				<td class="md-tbl-td">td</td>
			</tr>
			<tr class="md-tbl-il">
				<th class="md-tbl-th">소속</th>
				<td class="md-tbl-td" colspan="3">td</td>
			</tr>
			<tr class="md-tbl-il">
				<th class="md-tbl-th">종류</th>
				<td class="md-tbl-td">td</td>
				<th class="md-tbl-th">일수</th>
				<td class="md-tbl-td">td</td>
			</tr>
			<tr class="md-tbl-il">
				<th class="md-tbl-th">기간</th>
				<td class="md-tbl-td" colspan="3">td</td>
			</tr>
			<tr class="md-tbl-il">
				<th class="md-tbl-th">사유</th>
				<td class="md-tbl-td" colspan="3">td</td>
			</tr>
			<tr class="md-tbl-il">
				<th class="md-tbl-th">의견</th>
				<td class="md-tbl-td" colspan="3">td</td>
				
			</tr>
		</table>
		<div style="text-align: center; margin-top: 50px;">
			<span class="md-btn cursor md-btn-cancel">휴가 신청 취소</span>
			<span class="md-btn cursor md-btn-close" style="margin-left: 50px;">닫기</span>
		</div>

		<a class="modal-close-btn cursor md-btn-close">X</a>
	</div>
    
</body>
</html>