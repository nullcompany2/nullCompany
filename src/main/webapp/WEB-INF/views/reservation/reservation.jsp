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
  
.fc-view-container *,
.fc-view-container *:before,
.fc-view-container *:after {
  -webkit-box-sizing: content-box;
  -moz-box-sizing: content-box;
  box-sizing: content-box;
  width : 100%;
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
      <input type="hidden" name="rsTitle" id="rsTitle">
      </div>
      
      <br>

      <br>
      <div style="text-align: center; margin-bottom: 50px;" >
             <input type="Image" id="Img" style="width: 200px; height: 150px" value="">
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
         <form action="insertReservation.do">
         <input type="hidden" name ="rcNo" id ="rcNo" value="">
         <input type="hidden" name ="rsNo" id ="rsNo" value="">
         <input type="hidden" name ="rMember" id ="rMember" value="">
         <dl>
            <dt style="float: left;">
               <label>자원 이름</label>
            </dt>
            <dd style="margin-left: 150px;">
            <input type="text" id="rsTitle2" value="" readonly="readonly"></dd>
         </dl>
         <dl>
            <dt style="float: left;">
               <label>날짜</label>
            </dt>
            <dd style="margin-left: 150px; font-family: monospace;">
               <input type="date" name="rDate" id="date">
            </dd>
         </dl>
         <dl>
            <dt style="float: left;">
               <label>예약 시간</label>
            </dt>
            <dd style="margin-left: 150px;">
               <input type="time" name="start_time" id="startTime"> ~ <input type="time" name ="end_time" id='endTime'>
            </dd>
         </dl>
         <dl>
            <dt style="float: left;">
               <label>사용 용도</label>
            </dt>
            <dd style="margin-left: 150px;">
               <textarea name="rContent" id="rContent" cols="30" rows="10" style="resize: none;"></textarea>
            </dd>
         </dl>
      <div style="text-align: center; margin-top: 50px; margin-bottom: 30px;">
         <button class="close_btn insert_btn" id="insert_btn"
            style="background: #fff; color: #2c86dc; padding: 5px 27px 6px; border: 1px solid #c8c8c8">확인</button>
         <button class="close_btn" type="button"
            style="padding: 5px 27px 6px; color: #444; letter-spacing: -1px; border: 1px solid #dadada; background: #dadada;">취소</button>
      </div>
      </form>
      </div>
   </div>

   <script>
   	var end = [];
   	var start=[];
   	var date = [];
   	var rsTitle;
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
       
      function getEvent(rsNo,rcNo){
         var evt;
            $.ajax({ 
               type: "get",
               url: 'reservation2.do', 
               dataType:"json",
               data: {rcNo : rcNo ,
                   rsNo : rsNo  },
               async:false, // <- 원래 ajax에서 async가 기본값이 true인데
                             // 이걸 안주게되면 무슨현상이 일어나냐면 리턴되는 값이 받아는지는 
                             // 결과 리턴이 undefined 이걸로 뜨거든요
                             // 그래서 데이터 다 받아오고 밑에있는 코드까지해서 동기로 처리하겠다고하는 
                             // 조건을 걸어줘야지 정상적으로 코드를 받아와요
                             	
               success: function(data) { 
                   var sum = [];

                 for(var i in data) {
                   var str =  data[i].end_time;
                   var str2 = data[i].start_time;
              	   var str3 = data[i].rDate;
                   var r = {
                       title: data[i].rMemberName,
                            start: data[i].rDate+'T'+data[i].start_time+':00',
                            end: data[i].rDate+'T'+data[i].end_time+':00',
                            constraint: data[i].rContent,
                            color: '#89BBCF'
                   };
                   console.log(r)
                   sum.push(r);
                   end.push(str);
                   start.push(str2);
                   date.push(str3);
                   console.log("sum : " + sum);
                 }
                 evt = sum;
                 
                  console.log("event1 : " +evt);
                  console.log("str : " +end);
               }
            });
            console.log("event2 : " +evt);
          return evt;
      }
      
      function chImg(rsNo){
    	  $.ajax({
    		 url : "reservation3.do",
    		 data : {rsNo : rsNo},
    		 success: function(data) { 
    		  var rsImg = data.rsImg;
    		  rsTitle = data.rsTitle;
    		  console.log(rsImg);
    		  $("#Img").val(rsImg);
    		  $("#rsTitle").val(rsTitle);
    		 }
    	 });
      }
      
      document.addEventListener('DOMContentLoaded', function() {
    	  var rsNo =  $("select[name=resource]").val();
          var rcNo = ${c.rcNo};
          console.log(rsNo);	
          chImg(rsNo);
          var calendarEl = document.getElementById('calendar');
          var events = getEvent(rsNo,rcNo);
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
            editable: false,
            eventOverlap : false,
            
            events :events,
            dateClick: function(info) {
              var startTime = info.dateStr;
              var str = startTime.substr(0,10);
              var str2 = startTime.substr(11,5);
              $("#rsTitle2").val(rsTitle);
              $("#date").val(str);
              $("#startTime").val(str2);
              $("#rcNo").val( rcNo );
              $("#rsNo").val( rsNo );
              $("#rMember").val("${loginUser.id}");
              console.log(str2);
              modal('reservation_modal');   
               },
           select: function(info) {
               var startTime =info.startStr;	
               var endTime = info.endStr;
               var str = startTime.substr(0,10);
             var str2 = startTime.substr(11,5);
             var str3 = endTime.substr(11,5);
             $("#rsTitle2").val(rsTitle);
             $("#date").val(str);
             $("#startTime").val(str2);
             $("#endTime").val(str3);
             $("#rcNo").val( rcNo );
             $("#rsNo").val( rsNo );
             $("#rMember").val("${loginUser.id}");
             console.log(str2);
              modal('reservation_modal');   
             }
            
          });

          calendar.render();
        });
      
      
      $("select[name=resource]").change(function(){
    	  $("#calendar").empty();
         var calendarEl = document.getElementById('calendar');
          var rsNo =  $("select[name=resource]").val();
          var rcNo = ${c.rcNo};
    	  chImg(rsNo);
          var events = getEvent(rsNo,rcNo);
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
            eventOverlap : false,
            events :events,
            
            dateClick: function(info) {
              var startTime = info.dateStr;
              var str = startTime.substr(0,10);
              var str2 = startTime.substr(11,5);
              $("#rsTitle2").val(rsTitle);
              $("#date").val(str);
              $("#startTime").val(str2);
              $("#rcNo").val( rcNo );
              $("#rsNo").val( rsNo );
              $("#rMember").val("${loginUser.id}");
              console.log(str2);
                 modal('reservation_modal');   
               },
           select: function(info) {
               var startTime =info.startStr;
               var endTime = info.endStr;
               var str = startTime.substr(0,10);
             var str2 = startTime.substr(11,5);
             var str3 = endTime.substr(11,5);
             $("#rsTitle2").val(rsTitle);
             $("#date").val(str);
             $("#startTime").val(str2);
             $("#endTime").val(str3);
             $("#rcNo").val( rcNo );
             $("#rsNo").val( rsNo );
             $("#rMember").val("${loginUser.id}");
             console.log(str2);
              modal('reservation_modal');   
             }
            
          });
          calendar.render();
      });
      
      $('.insert_btn').on('click', function(event) {
          var sd = $("#date").val();
          var sd2 = sd.split("-");
          var sdt = $("#startTime").val();
          var sdt2 = sdt.split(':'); 
          var sd3 = new Date(sd2[0],sd2[1]-1,sd2[2],sdt2[0],sdt2[1]);
          var sdt3 = $("#endTime").val();
          var sdt4 = sdt3.split(":");
          var sdt5 = new Date(sd2[0],sd2[1]-1,sd2[2],sdt4[0],sdt4[1]); //endtime
          var sd4 = new Date(sd2[0],sd2[1]-1,sd2[2]);
         var result=1;

         for(var i=0; i<end.length;i++){
         var date2 = date[i].split('-');
         var end2 = end[i].split(':');
         var start2 = start[i].split(":");
         var end3 = new Date(date2[0],date2[1]-1,date2[2],end2[0],end2[1]); // 끝 시간
         var start3 = new Date(date2[0],date2[1]-1,date2[2],start2[0],start2[1]); //시작시간
         var date3 = new Date(date2[0],date2[1]-1,date2[2]);
          /* if((sd4.getTime()-date3.getTime()) == 0 ){ // 날짜 비교 --> 같은날이면 비교
             if(start3 < sd3){ //시작시간
                alert("이미 예약되어 있습니다.");
                return false;
             if(sdt5 < start3){ //끝시간
                return false;
                alert("이미 예약되어 있습니다.");
             }
           }
         } */
         
         if((start3 >= sd3 || sdt5 <= start3)){
             alert("이미 예약되어 있습니다.");
            return false;
           }
          }     
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