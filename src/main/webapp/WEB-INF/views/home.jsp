<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ page session="false" %> --%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	Date nowTime = new Date();
%>

<html>
<head>
	<title>Main</title>
</head>
<style>
	
	body {
            padding: 0px; margin: 0px;
            box-sizing:board-box;
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

        .ch>:nth-child(2){
            color: #9E9D9B;
            margin-left: 130px;
        }
        
       .pt2>.ch>span,.pt2>.ch>a {
      		font-size : 15px;
      		margin-left : 75%;
      		transition:  all 1s;
      
       }
       
       .pt2>.ch>span:hover,.pt2>.ch>a:hover{
       		cursor : pointer;
       		margin-left : 70%;
       		font-size:20px;
       		transition:  all 1s;
       }
       
	  .jb-box { width: 100%; height: 260px; overflow:hidden;margin: 0px auto; position: relative; border-radius: 10px; }
       video { width: 100%; }
      .jb-text { position: absolute; top: 50%; width: 100%; font-family: 'Lato', sans-serif;}
      .jb-text p { margin-top: -24px; text-align: center; font-size: 30px; color: black; opacity: 0.7;}
	  .jb-text span { font-size:45px; color:#477A8F; opacity: 2;}

		#clock {
			color : #3E4247;
			font-family: 'Lato', sans-serif;
			font-size:20px; 
		}

		 .jb-box, #tothetop {
		 box-shadow: 0px 0px 20px #B1BBC5; }
		 
		#tothetop { position: fixed; bottom: 1rem; right: 1rem; cursor: pointer;
					background:#5C6369; color:white;padding:3 4 3 4px; border-radius:4px;
					font-family: 'Lato', sans-serif; text-align:center; }
		
		
		.pt2 .ch a, .pt2 .ch {
		color : white;
		}
		
    </style>
</head> 

<body  onload="printClock()">
	  <c:import url="common/header.jsp"/>

    <div class="form" id="top" style="width: 1300px; height: 1100px; margin:auto;">
		<br>
       <div class="jb-box">
      <video muted autoplay loop>
        <source src="resources/images/main.mp4" type="video/mp4">
        <strong>Your browser does not support the video tag.</strong>
      </video>
      <div class="jb-text">
        <p> <span>Null Company</span>에 오신 것을 환영합니다:)</p>
      </div>
    </div>
         <br>
           <h1 id="clock" style="margin-left:81%;" ></h1> <br>
        <div class="pt" style="width: 1200px; height:310px;" >

                <div class="ch">
                    <span> Notice</span> 
                    <a  style="margin-left:255px;" href="boardAll.do">more</a>
                    <hr>
					동우오빠 <br>
                    공지공지 
                </div>
                <div class="ch">
                    <span> Schedule</span> 
                    <a  style="margin-left:223px;" href="">more</a>
                    <hr>
					리용이 <br>
                    오늘의 일정 : 
                </div>
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
                <a style="margin-left:190px;" href="boardTeam.do">more</a>
                    <hr>
                   	동우오빠 <br>
                   	팀 공지 ! 
            </div>
                <div class="ch">
                    <span> Mail Box</span> 
                    <a style="margin-left:235px;" href="recieveMail.do">more</a>
                    <hr>
                    
                   <div style="border:1px solid #C8CACC; border-radius:4px;
                   margin : 15 15 15 5px; padding:20px; "> 
                    받은 편지함 : 23 개 <br>
                   </div>
                    <div style="background:#C8CACC; border-radius:4px;
                   margin : 15 15 15 5px; padding:20px; "> 
                    안 읽은 메일 : 7 개 <br>
                   </div>
                    
                    <div style="border:1px solid #C8CACC; border-radius:4px;
                   margin : 15 15 15 5px; padding:20px; "> 
                    임시 보관함 : 10 개 
                   </div>
                    
                </div>
                <div class="ch">
                    <span> Approval Document</span>
                    <a style="margin-left:100px;" href="approvalProgressListView.do">more</a>
                    <hr>
                    
                    <div style="border:1px solid #C8CACC; border-radius:4px;
                   margin : 15 15 15 5px; padding:20px; "> 
                   결재 문서 : 2 건 <br>
                   </div>
                    <div style="background:#C8CACC; border-radius:4px;
                   margin : 15 15 15 5px; padding:20px; "> 
                    확인 문서 : 2 건 <br>
                   </div>
                    
                    <div style="border:1px solid #C8CACC; border-radius:4px;
                   margin : 15 15 15 5px; padding:20px; "> 
                    수신 문서 : 0 건
                   </div>
            
        </div>
        </div>
        
  		<a href="#logo" id="tothetop">  ▲ <br>TOP</a>
    
    <c:import url="common/footer.jsp"/>
    	<script>

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
	
</script>
    </body>
    
    </html>