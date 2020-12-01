<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ page session="false" %> --%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	Date nowTime = new Date();
%>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<html>
<head>


	<title>Main</title>
	
	
</head>
<style>
body {
	padding: 0px;
	margin: 0px;
	box-sizing: board-box;
	background: #EFEFEF;
}

hr {
	margin-right: 15px;
	border-top: 3px double #477A8F;
}

.pt {
	display: flex;
	margin: auto;
}

.pt2 {
	display: flex;
	flex-direction: column
}

.ch {
	flex: 1;
	border-right: 1px solid #EFEFEF;
}

.ch>:first-child {
	font-size: 25px;
	font-style: bold;
	margin-left: 7px;
}

.ch>:nth-child(2) {
	color: #9E9D9B;
	margin-left: 130px;
}

.pt2>.ch>span, .pt2>.ch>a {
	font-size: 15px;
	margin-left: 75%;
	transition: all 1s;
}

.pt2>.ch>span:hover, .pt2>.ch>a:hover {
	cursor: pointer;
	margin-left: 70%;
	font-size: 20px;
	transition: all 1s;
}

.jb-box {
	width: 100%;
	height: 260px;
	overflow: hidden;
	margin: 0px auto;
	position: relative;
	border-radius: 10px;
}

video {
	width: 100%;
}

.jb-text {
	position: absolute;
	top: 50%;
	width: 100%;
	font-family: 'Lato', sans-serif;
}

.jb-text p {
	margin-top: -24px;
	text-align: center;
	font-size: 30px;
	color: black;
	opacity: 0.7;
}

.jb-text span {
	font-size: 45px;
	color: #477A8F;
	opacity: 2;
}

#clock {
	position: absolute;
	right: 10%;
	color: #3E4247;
	font-family: 'Lato', sans-serif;
	font-size: 20px;
}

.jb-box, #tothetop {
	box-shadow: 0px 0px 20px #B1BBC5;
}

#tothetop {
	position: fixed;
	bottom: 1rem;
	right: 1rem;
	cursor: pointer;
	background: #5C6369;
	color: white;
	padding: 3 4 3 4px;
	border-radius: 4px;
	font-family: 'Lato', sans-serif;
	text-align: center;
}

.pt2 .ch a, .pt2 .ch {
	color: white;
}

#mail1, #mail2, #mail3, #approval1, #approval2, #approval3 {
	border: 1px solid #C8CACC;
	border-radius: 4px;
	margin: 15 15 15 5px;
	padding: 20px;
}

#tb {
	border-right: 1px;
}

table {
	table-layout: fixed;
}

td {
	vertical-align: middle;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

#top {
	height: 1035px;
	margin: auto;
}

#ttr {
	text-align: left;
}

tr {
	text-align: left;
}

th {
	
}

ul {
	list-style: none;
}

li {
    border-radius: 7px;
    width: 350px;
    margin-bottom: 5px;
    font-size: 16px;
    height: 26px;
    padding-top: 3px;
    margin-left: 20px;
}
</style>
</head> 

<body  onload="printClock()">
	  <c:import url="common/header.jsp"/>

    <div class="form" id="top">
		<br>
       <div class="jb-box" style="width: 1300px;">
      <video muted autoplay loop>
        <source src="resources/images/main.mp4" type="video/mp4">
      </video>
      <div class="jb-text">
        <p> <span>Null Company</span>에 오신 것을 환영합니다:)</p>
      </div>
    </div>
         <br>
           <h1 id="clock" ></h1> <br> <br> <br>
        <div class="pt" style="width: 1200px; height:310px;" >

                <div class="ch">
                    <span> Notice</span> 
                    <a  style="margin-left:255px;" href="notice.do">more</a>
                    <hr>
					<table  cellspacing="13" width="100%" id="ntb">
                   <colgroup>
                  <col width="42%" />
                  <col width="10%" />
                  <col width="25%" />
               </colgroup>
		<thead>
			<tr id="ntr">
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			
			
		</thead>
		
		<tbody>
		
		
		</tbody>
	</table> 
                </div>
                
                <div class="ch">
                    <span> Schedule</span> 
                    <a  style="margin-left:223px;" href="Schedulermain.do">more</a>
                    <hr>
				
					<div style="margin-bottom: 15px;"><img src="resources/images/cal_main.png" style="margin-top: 15px;
				    margin-left: 15px;
				    margin-right: 10px;">
                   <span style="position: relative; top: -5px;">오늘의 일정  </span> </div>
                   
				<div>
					<ul id="add_li">
					
					</ul>
				</div>
                </div>
                
                <!-- 리룡히 전용 스크립트임 -->
                <script>
        	
                 
                 $(function(){
                		$.ajax({
             				url:"ScheduleListForMain.do",
             				dataType:"json",
             				success:function(data){
             					
             				console.log(data);
             					  if(data.length != 0 ){
             						 for(var i=0 in data){
                  						console.log(data[i]);
                  					   var date = data[i].startdate+" "+data[i].starttime;
                                        var date2 = (moment(date).format('LT'));
                                        console.log(date);
                                        $("#add_li").append('<li style = "background:' + data[i].color + '";>&nbsp;' + date2 + '&nbsp;&nbsp;&nbsp;&nbsp;' + data[i].Sche_name +'</li>');   
                  					  }
             					  }else{
             						  
             						 $("#add_li").append("<li style='font-size: 15px;'>등록된 일정이 없습니다.</li>");   
             					  }



             					},
             					error : function() {
             	        			console.log("전송실패");
             	        				} 
             			
             				
             			})
           
         		});
         		
                </script>
                
                
                
 				<div class="ch" >  
                    <div class="pt2"style="width: 400px; height:310px;">
                        <div class="ch" style="background: #477A8F;"> 
                             &nbsp; Reservation <br> <br><br>
                         <a href="myReservation.do?rMember=${loginUser.id}"> <span> →  바로가기 </span> </a> 
                       
                        </div>
                        <div class="ch" style="background: #5e9eba;">
                              &nbsp; Write Mail <br> <br><br>
                            <a href="mailWrite.do"> <span> →  바로가기 </span></a>
                        </div>
                    </div>


			</div>         
			           
        </div> <br>
        <div class="pt" style="width: 1200px; height:310px;" >
            <div class="ch">
                <span> Team Notice</span> 
                <a style="margin-left:190px;" href="tnotice.do">more</a>
                    <hr>
                    
            <table  cellspacing="13" width="100%" id="tb">
                  <colgroup>
                  <col width="42%" />
                  <col width="10%" />
                  <col width="25%" />
               </colgroup>
		<thead>
			<tr id="ttr">
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			
			
		</thead>
		
		<tbody>
		
		
		</tbody>
	</table> 
	
            </div>
                <div class="ch">
                    <span> Mail Box</span> 
                    <a style="margin-left:235px;" href="recieveMail.do">more</a>
                    <hr>
                    
                   <div id="mail1"> 
                    <span> 받은 편지함 : </span> <br>
                   </div>
                    <div id="mail2" style="background:#C8CACC;"> 
                    <span> 안 읽은 메일 : </span> <br>
                   </div>
                    <div id="mail3"> 
                     <span> 임시 보관함 :  </span>
                   </div>
                    
                </div>
                <div class="ch">
                    <span> Approval Document</span>
                    <a style="margin-left:100px;" href="approvalProgressAllListView.do">more</a>
                    <hr>
                    <div id="approval1" style="background:#C8CACC;"> 
                   결재 문서 : 2 건 <br>
                   </div>
                   <div id="approval2"> 
                    확인 문서 : 2 건 <br>
                   </div>
                    
                    <div id="approval3" style="background:#C8CACC;"> 
                    수신 문서 : 0 건
                   </div>
            
        </div>
        </div>
        </div>
        
  	<a href="#logo" id="tothetop">  ▲ <br>TOP</a>
    
    <c:import url="common/footer.jsp"/>
    	<script>

    // 오늘의 날짜 프린트 
	function printClock() {
    
    var clock = document.getElementById("clock");            
    var currentDate = new Date();                                     
    var calendar = currentDate.getFullYear() + "/ " + (currentDate.getMonth()+1) + "/ " + currentDate.getDate()
    var amPm = 'AM'; 
    var currentHours = addZeros(currentDate.getHours(),2); 
    var currentMinute = addZeros(currentDate.getMinutes() ,2);
    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
    
    if(currentHours >= 12){ 
    	amPm = 'PM';
    	currentHours = addZeros(currentHours - 12,2);
    }

    if(currentSeconds >= 50){
       currentSeconds = '<span style="color:#de1951;">'+currentSeconds+'</span>'
    }
    clock.innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Today's " + calendar + "<br> Now Time's"
    +" <span style='font-size:21px; color:#477A8F;'>"
    + amPm + "</span> " + currentHours+": "+currentMinute+": "+currentSeconds; 
  
    
    setTimeout("printClock()",1000);         
}

	function addZeros(num, digit) { 
	  var zero = '';
	  num = num.toString();
	  if (num.length < digit) {
	    for (i = 0; i < digit - num.length; i++) {
	      zero += '0';
	    }
	  }
	  return zero + num;
}
	
	// 메일 에이작스 - 신아라 
	
	  $(function(){
         mailBox();
      
      // 5분에 한번씩 계속 업데이트 하기 
       setInterval(function(){
            mailBox();
         },50000); 
      });
      
      function  mailBox(){
         $.ajax({
            url:"mailBox.do",
            dataType:"json",
            success:function(data){
               console.log(data);
               
               // 각 div 선언 
               var mail1 = $("#mail1");
               var mail2 = $("#mail2");
               var mail3 = $("#mail3");
              
               // 각 div 비워주고 
               mail1.empty();
               mail2.empty();
               mail3.empty();
               
               // 넣어주고 
               var allCount = "<span> 받은 편지함 : " + data.reCount + " 개 </span> <br>";
               var unreadCount = "<span> 안 읽은 편지 : " + data.unreadCount + " 개 </span> <br>";
               var saveCount = "<span> 임시 보관함 : " + data.saveCount + " 개 </span>";
               
               // 더해주고 
               mail1.append(allCount);
               mail2.append(unreadCount);
               mail3.append(saveCount);
              
            },
            error:function(request,status,error){
			console.log("main mailBox 오류");
            }
         });
      }
      
      // 팀 공지 리스트
      $(function(){
			tnoticeList();
			
		});
		
		function tnoticeList(){
			$.ajax({
				url:"tnoticeList.do",
				dataType:"json",
				success:function(data){
					console.log(data);
					
					$tableBody = $("#tb tbody");
					$tableBody.html("");
					
					for(var i in data){
						var $tr = $("<tr>");
						var $tTitle= $("<td>").text(data[i].tTitle);
						var $tWriter = $("<td>").text(data[i].tWriter);
						var $tCreateDate=$("<td>").text(data[i].tCreateDate);
						
						
						$tr.append($tTitle);
						$tr.append($tWriter);
						$tr.append($tCreateDate);
						
						$tableBody.append($tr);
					}
				},
				error:function(request,status,error){
					console.log("tnotice 오류");
				}
			});
		}
		
	// 전사 공지 리스트
	$(function(){
			noticeList();
			
		});
		
		function noticeList(){
			$.ajax({
				url:"noticeList.do",
				dataType:"json",
				success:function(data){
					console.log(data);
					
					$tableBody = $("#ntb tbody");
					$tableBody.html("");
					
					for(var i in data){
						var $tr = $("<tr>");
						var $nTitle= $("<td>").text(data[i].nTitle);
						var $nWriter = $("<td>").text(data[i].nWriter);
						var $nCreateDate=$("<td>").text(data[i].nCreateDate);
						
						
						$tr.append($nTitle);
						$tr.append($nWriter);
						$tr.append($nCreateDate);
						
						$tableBody.append($tr);
					}
				},
				error:function(request,status,error){
					console.log("nnotice 오류");
				}
			});
		}
	
</script>
    </body>
    
    </html>