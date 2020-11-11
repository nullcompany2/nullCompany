<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>예약하기 창</title>
<c:import url="../common/header.jsp" />
<c:import url="../common/reservationSubNav.jsp" />
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">
</head>

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


<style>
#reservation_modal {
	display: none;
	padding: 10px 60px;
	width: 500px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
}

#reservation_modal .modal-close-btn {
	position: absolute;
	top: 10px;
	right: 10px;
}

.n-emp-i {
	width: 100%;
	height: 30%;
}

.modal-dragscroll>div>dl>dd {
	margin-bottom: 15px;
}

.modal-dragscroll {
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

.close_btn {
	cursor: pointer;
}
    table {
    width: 100%;
    border: 1px solid#e1e1e1;
    border-spacing: 0;
    border-collapse: collapse;
    padding: 0;
    margin: 0;
    }
    th, td {
      border: 1px solid #ddd;
    }
    .td_color{
      background: #e1e1e1;
      text-align: center;
      border-spacing: 0px;

    }
    .content_td{
    border-top: 1px solid #ddd;
    border-bottom: 1px dotted #ddd;
    }

    .left_table{
      padding: 0;
      height: 100%;
    }
    .left_table th{
      border: 1px solid #4444;
      height: 44px;
    }
  /* IE */
  div {
    -ms-overflow-style: none; 
  }

  /* chrome etc */
  div::-webkit-scrollbar { 
      display: none !important; 
  }
  .fc-unthemed td.fc-today {
  background: white;
}
  dl {
  margin-bottom: 10px;
  }
</style>
<body>

	<div class="contents">
      <div class="contents-title">
        <span class="ct1">${ c.rcTitle }</span> &nbsp;
         <select name="resource" style="width:100px;height:30px; border:none;
		font-size:16px;color:#477A8F;">
			<c:forEach var ="rs" items="${ r }">
				<option value="${rs.rsNo }">${ rs.rsTitle }</option>
			</c:forEach> 
		</select>
      </div>
      
      <br>

      <br>
      <div style="text-align: center; margin-bottom: 50px;" >
				<input type="Image" style="width: 200px; height: 150px" value="">
      </div>
 			<div id="cal_size"
                        style="position: absolute;  width: 70%; height: 500px; left: 15%; ">
                        <div id='calendar'></div>
            </div>

    </div>

	<!-- Modal div -->
	<div id="reservation_modal" class="modal-dragscroll">
		<h4 style="color: #477A8F; margin-bottom: 25px;">상세 보기</h4>
		<div class="n-emp-i">
			<form action="">
			<dl>
				<dt style="float: left;">
					<label>자원 이름</label>
				</dt>
				<dd style="margin-left: 150px;"><input type="text" id="rsTitle" value="회의실" readonly="readonly"></dd>
			</dl>
			<dl>
				<dt style="float: left;">
					<label>날짜</label>
				</dt>
				<dd style="margin-left: 150px; font-family: monospace;">
					<input type="date" name="" id="date">
				</dd>
			</dl>
			<dl>
				<dt style="float: left;">
					<label>예약 시간</label>
				</dt>
				<dd style="margin-left: 150px;">
					<input type="time" name="" id="startTime"> ~ <input type="time" id='endTime'>
				</dd>
			</dl>
			<dl>
				<dt style="float: left;">
					<label>사용 용도</label>
				</dt>
				<dd style="margin-left: 150px;">
					<textarea name="" id="rsContent" cols="30" rows="10" style="resize: none;"></textarea>
				</dd>
			</dl>
		<div style="text-align: center; margin-top: 50px; margin-bottom: 30px;">
			<button class="close_btn"
				style="background: #fff; color: #2c86dc; padding: 5px 27px 6px; border: 1px solid #c8c8c8">확인</button>
			<button class="close_btn" type="button"
				style="padding: 5px 27px 6px; color: #444; letter-spacing: -1px; border: 1px solid #dadada; background: #dadada;">취소</button>
		</div>
		</form>
		</div>
	</div>

	<script>
		function modal(id) {
			var zIndex = 9999;
			var modal = $('#' + id);

			// 모달 div 뒤에 희끄무레한 레이어
			var bg = $('<div>').css({
				position : 'fixed',
				zIndex : zIndex,
				left : '0px',
				top : '0px',
				width : '100%',
				height : '100%',
				overflow : 'auto',
				// 레이어 색갈은 여기서 바꾸면 됨
				backgroundColor : 'rgba(0,0,0,0.4)'
			}).appendTo('body');

			modal
					.css(
							{
								position : 'fixed',
								boxShadow : '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',
							    width: '600px',
							    hieght : '',
								// 시꺼먼 레이어 보다 한칸 위에 보이기
								zIndex : zIndex + 1,

								// div center 정렬
								top : '50%',
								left : '50%',
								transform : 'translate(-50%, -50%)',
								msTransform : 'translate(-50%, -50%)',
								webkitTransform : 'translate(-50%, -50%)'
							}).show()
					// 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
					.find('.close_btn').on('click', function() {
						bg.remove();
						modal.hide();
					});
		}

		document.addEventListener('DOMContentLoaded', function() {
		    var calendarEl = document.getElementById('calendar');
		    var rsNo =  $("select[name=resource]").val();
		    var rcNo = ${c.rcNo};
		    var calendar = new FullCalendar.Calendar(calendarEl, {
		      selectable: true,
		      plugins: [ 'interaction', 'timeGrid', 'list' ],
		      header: {
		        left: 'prev',
		        center: 'title',
		        right: 'today next'
		      },
			  defaultView : 'timeGridDay',
		      locale : "ko",
		      editable: true,
		      eventOverlap : true,
		      
		      events :function(start, end , callback){
		    	  $.ajax({ 
		    		  type: "get",
		    		  url: 'reservation2.do', 
		    		  data: {rcNo : rcNo ,
		    				rsNo : rsNo  },
		    		  success: function(data) { 
		    			  var events=[];
		    			 for(var i in data) {
		    				
		    				var r = {
    					       title: data[i].rMemberName,
   			                   start: data[i].rDate+'T'+data[i].start_time+':00',
   			                   end: data[i].rDate+'T'+data[i].end_time+':00',
   			                   constraint: data[i].rContent,
   			                   color: 'red'
		    				};
		    				console.log(events);
		    				console.log(r)
		    				 events.push(r);
		    			 };
		    			 callback(events);
		    		  }
		    	  });
		      },
		      dateClick: function(info) {
		    	 var startTime = info.dateStr;
		    	 var str = startTime.substr(0,10);
		    	 var str2 = startTime.substr(11,5);
		    	 $("#date").val(str);
		    	 $("#startTime").val(str2);
		    	 console.log(str2);
		     	   modal('reservation_modal');	
		    	  },
    	    select: function(info) {
    	        var startTime =info.startStr;
    	        var endTime = info.endStr;
    	        var str = startTime.substr(0,10);
		    	var str2 = startTime.substr(11,5);
		    	var str3 = endTime.substr(11,5);
		    	$("#date").val(str);
		    	$("#startTime").val(str2);
		    	$("#endTime").val(str3);
		    	console.log(str2);
		     	modal('reservation_modal');	
    	      }
		      
		    });

		    calendar.render();
		  });
		
		$(function() {
			 
			var rs =$("select[name=resource] option").size();
			if(rs<1){
				alert("예약할수있는 자원이 없습니다.");
				document.location.href="myReservation.do";
			}
			
		});

	</script>

</body>
</html>