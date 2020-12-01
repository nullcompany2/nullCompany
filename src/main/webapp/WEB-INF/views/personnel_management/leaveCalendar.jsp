<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

</head>
<!-- 캘린더 & 헤더 스크립트 -->
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
	    	
	    	  <c:forEach items="${RecordLeaveList}" var="list">
	    	  <fmt:formatDate var="applyDate" value="${list.applyDate }" pattern="yyyy-MM-dd"/>
	    	  
	    	  <c:set var="endDate" value="${appliDateD + list.useDays}"/>
	             {
	            	
	                title: '${list.name}'+'(${list.deptName} - ${list.rankName})',
	                start: '${applyDate}',
	                end :  '${list.endLeaveDate}',
	                color: 'lightBlue'
	        
	                
	            },
	         
	          </c:forEach>
	        
	      ],

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
    width: 1000px;
    background-color: #FFFFFF;
    border-radius: 6px;
    box-shadow: 0 1px 2px #C3C3C3;
    left: -10px;
  }
	
   *:focus {outline:none;} 
   

</style>

<body>
	
    <div id='wrap'>
		<!-- 헤더 -->
		<c:import url="../common/header.jsp"/>
		
		
		<!-- container -->
		<div class="container">
			<!-- 전체높이지정용 -->
			<div id="drag-wrap">
                <div id="drag"></div>
			</div>
			<!-- 세부 네비 시작 -->
			<c:import url="../common/personnelSubNavi.jsp"/>
			
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
				
                    
					<div class="contents-wrap drag-scrollbar">
						<div id="show-myleave" class="c-ic" style="">
							<div id="cal_size"
								style="position: absolute; width: 100%; height: 500px; left: 100px;">
								<div id='calendar'></div>
							</div>
						</div>

						
					</div>
					
                </div>
                
				
            </div>
            
			<!--  -->
		</div>
		
	</div>


	
    
</body>
</html>