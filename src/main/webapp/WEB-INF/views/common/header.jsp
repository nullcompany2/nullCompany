<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
%>
  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nullcompany</title>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Lato:400,700)" rel="stylesheet">

 
  
    <style>
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
   	z-index: 9000;
   	
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
    z-index: 9000;
    
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
  
  #off-work {
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
 
       #off-work .modal-close-btn {
          position: absolute;
          top: 10px;
          right: 10px;
          cursor: pointer;
          
       }
       
	#off-work button{
     font-size: 18px;
     color: #ffffff;
     border:none;
     background-color: #477A8F;
     width: 100px;
     height: 30px;
     border-radius: 3px;
     margin-left: 10px;
     cursor: pointer;
 }
        
       body {
		font-family: "Noto Sans KR", sans-serif;
		padding: 0px; margin: 0px;

	}

	
	a {
	text-decoration: none;
	}
	
 	header #logo button img {
		padding : 17px 0px 0px 50px;
		cursor :pointer;
		background : #3E4247;
		 width: 200px;
   		height: 92px;
	}
	
	header #logo button {
	border : none;
	background:none;
	}
	
	
	 ::-webkit-scrollbar { display: none; }

	
  </style>

</head>

  <script>
    // 메뉴 아이콘용 토글 
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
	
    function recordTA(or){
    	$.ajax({
    		url:"recordTA.do",
    		data : {or : or},
    		dataType : "JSON",
    		success: function(data){
    			console.log(data);
    			alert(data);
    			location.reload();
    		},
    		error: function(request,status,error){
				console.log(request);
				console.log(status);
				console.log(error);
			}
    	})
    }
    $(document).ready(function(){
    	$.ajax({
    		url:"recordToday.do",
    		dataType : "JSON",
    		success: function(data){
    			if(data != null){
					if(data.statusDiligence == '결근'){
						$("#Attendance ").attr("style","display:none");
						$("#Offwork ").attr("style","display:none");
						$("#status_diligence").attr("style","width: 135px; display:block").text("결근");
					}else if(data.statusDiligence =='휴가'){
						$("#Attendance ").attr("style","display:none");
						$("#Offwork ").attr("style","display:none");
						$("#status_diligence").attr("style","width: 135px; display:block").text("휴가");
					}else{
	    				$("#Attendance label").replaceWith(data.timeEnter);
	    				if(data.timeExit != null){
	    					$("#Offwork label").replaceWith(data.timeExit);
						
						}
    				}
    				
    			}
    		},
    		error: function(request,status,error){
				console.log(request);
				console.log(status);
				console.log(error);
			}
    	});
    })
    
  
  </script>



<body>
  <header>
      <div id="logo">
      	
        <button onclick="location.href='home.do'"> <img src= "${ logo.renameLogo }" alt="로고임" id="logoImg"/></button>
        <!-- <button onclick="location.href='home.do'"> <img src="resources/images/LOGO_EX.png"/></button> -->
        
      </div>

      <a id="menu">오피스 홈 &nbsp; <img src="resources/images/dropbtn.png"></a>
      <div id="menuToggle" style="display: none; background-image: url(resources/images/menu.png);">
        <button class="menu_icon hover1" onclick="location.href='recieveMail.do'">
          <img src="resources/images/mail.png" /> <img src="resources/images/h_mail.png" />
        </button>
        <button class="menu_icon hover1" onclick="location.href='notice.do'">
          <img src="resources/images/board.png" /> <img src="resources/images/board_h.png" />
        </button>
        <button class="menu_icon hover1" onclick="location.href='Schedulermain.do'">
          <img src="resources/images/sche.png" /> <img src="resources/images/sche_h.png" />
        </button>
        <button class="menu_icon hover1" onclick="location.href='organization.do'">
          <img src="resources/images/Personnel.png" /> <img src="resources/images/Personnel_h.png" />
        </button>
        <button class="menu_icon hover1" onclick="location.href='myReservation.do?rMember=${loginUser.id}'">
          <img src="resources/images/reser.png" /> <img src="resources/images/reser_h.png" />
        </button>
        <button class="menu_icon hover1" onclick="location.href='approvalProgressAllListView.do'">
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
        <img src="${ loginUser.photo }" alt="" style="width: 80px; height: 80px; margin-left:15px; margin-top: 4px;border-radius:50px;">
        <div id="name_email">
          <p style="margin-left:100px;" >${ loginUser.name }님</p>
          <p style="font-size:10px; margin-left:100px;">${ loginUser.id}@nullcompany.com</p>
        </div>
        
        <div id="info1">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a href="minfo.do">내 정보</a> &nbsp;&nbsp;&nbsp;&nbsp;
          <a href="logout.do">로그아웃</a>
        </div>
        
      </div>
      
		
      <div id="info">
        <p id="username">${ loginUser.name }님</p> 
        <p id="userdept">${ loginUser.deptName }부 ${ loginUser.rankName } </p>
      </div>
     
      <div id="user_image">
        <img src="${ loginUser.photo }" alt="" style="width: 90px; height: 90px;border-radius:50px;">
      </div>
      <div id="workbtn">
        <button onclick="recordTA(1)" id="Attendance"><label>출근</label></button>  
        <button class="go" id="Offwork"><label>퇴근</label></button>
        <button style="display:none;     width: 135px;" id="status_diligence"></button>     
      </div>
      
        <!-- Modal div -->
       <div id="off-work" class="modal-dragscroll">
           <br>
         <%= sf.format(nowTime) %><br> 
        <span style="font-size:20px; color: black;"> ${ loginUser.name } </span>님 
           <div class="n-emp-i">
            <h4 style="color: #477A8F; margin-bottom: 5px; font-weight: bolder;">퇴근 하시겠습니까? </h4> <br>
            <button onclick="recordTA(2)" id="Offwork"> 퇴근</button> 
      
   		</div>
    

   		 <a class="modal-close-btn cursor md-btn-close">X</a>
 		</div>
 		
 		
      
  </header>

 	<!--  모달용 스크립트  -->
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

    $('.go').on('click', function() {
       // 모달창 띄우기
       modal('off-work');
    });
    

	</script>
</body>

</html>