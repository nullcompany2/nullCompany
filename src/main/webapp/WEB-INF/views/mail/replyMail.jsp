<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<c:import url="../common/header.jsp" />


<!-- include libraries(jQuery, bootstrap) -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<title>답장하기  </title>

<style>

/* contents */
.contents {
	position: relative;
	margin-left: 250px;
}

.contents-title {
	padding-top: 10px;
	height: 50px;
	border-bottom: solid 0.1px #cacaca;
}

.ct1 {
	margin-left: 50px;
	font-size: 20px;
	font-weight: bolder;
}

form input[type=submit],form input[type=button] 
	{
	font-size: 18px;
	margin: 20px 5px 7px 5px;
	background: none;
	border: none;
	color: #477A8F;
	cursor:pointer;
} 

form input[type=text] {
	margin: 5px 0px 5px 0px;
	border: none;
	background: #F3F3F3;
	height: 30px;
	padding:0px 13px;
	
}

form input[type=button]:focus,
 form>input[type=text]:focus, 
 li:focus, a:focus {
	outline: none;
}

a:active {
	font-weight: bolder;
}

#my_modal2 {
	display: none;
	width: 600px;
	height: 650px;
	padding: 40px 35px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
	text-align: left;
	color: rgb(65, 65, 66);
	
} 

.n-emp-i2 {
	margin-top : 30px;

}

 #mailTitle {
	padding-top:0px; padding-bottom:10px;
	margin-top:0px;

}  

#my_modal2 #modalContent {
 border-bottom: 1px solid #F4F4F4; 
 height: 350px;
 margin-bottom: 25px;
 overflow-y: scroll;
}

button[aria-label=Picture],
button[aria-label=Video]{
display:none;
}

</style>

</head>
<body>
		<c:import url="../common/mailSubNav.jsp"/>

		<div class="contents">
			<div class="contents-title">
				<span class="ct1">답장 하기 </span>
			</div>

			<div>
				<div style="width: 90%; margin: auto;">
					<form method="post" enctype="multipart/form-data">
						<input type="hidden" value="${loginUser.memNo}" name= memNo>
						<input type="submit" value="보내기" id="sendMail" />
						<input class="go2" type="button" value="미리보기"/> 
						<input type="submit" id="saveMail"  value="저장하기"/>
						<input type="button" value="이전으로" onClick="location.href='javascript:history.go(-1);'" /> <br>
						&nbsp;보내는사람&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="text" name="sender" style="width: 60%;" value= "${loginUser.name} < ${loginUser.id}@nullcompany.com > "readonly/> <br>
						&nbsp;받는사람&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" name="recipient" style="width: 60%;" value= "${ma.name} < ${ma.email} >" readonly/>
							  <span style="font-size: 17px; background: #477A8F; color: white; padding: 0px 8px 0px 8px;">+</span>
						<br> &nbsp;&nbsp;제목
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;<input type="text" name="mTitle" style="width: 60%;"
							placeholder="제목 없음" value="RE: ${ma.mTitle}"/> <br>
						&nbsp;파일첨부&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="file" name="uploadPhoto" />
						<br> <br> 
						<textarea id="summernote" name="mContent">
						----------- 원본 메일 ----------- <br>
						<b> 보낸 사람 : </b> ${ma.name}<${ma.sender}>  <br>
						<b> 받는 사람 : </b> ${loginUser.name} <${loginUser.id}>  <br>
						<b> 날짜 : </b> ${ma.sendDate}  <br>
						<b> 제목 : </b> ${ma.mTitle}  <br>
						${ma.mContent}
						
						 </textarea>
					</form>
				</div>
			</div>
		</div>
	
	<!-- Modal div -->
	<div id="my_modal2" class="modal-dragscroll">

		<span style="font-size: 20px; color: #477A8F;"> 미리보기 </span> 
		<div class="n-emp-i2">
		<hr>
			<p>메일 제목 : <span id="modalTitle"> 제목없음 </span></p>
			<p>
				보낸 사람 : ${ loginUser.name }< ${ loginUser.id } >
				
			</p>
			<p>받는 사람 : <span id="modalRecipient"> </span></p>
			<hr>
			<br>
			<div id="modalContent">  </div>
		</div>

		<input class="modal-close-btn cursor" value="닫기"
			style="background: #477A8F; color: white; text-align: center; border: none; padding: 12px 4px 12px 4px; 
			border-radius: 3px; margin-left: 180px; cursor: pointer; font-size:15px;" />
	</div>
	<!-- Modal div -->

	<script type="text/javaScript">
	$(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: '내용을 작성해주세요.',
	        minHeight: 370,
	        maxHeight: 370,
	        focus: true, 
	        lang : 'ko-KR'
	  });
	});

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
    	
    $('.go2').on('click', function() {
    	
    	// 메일 제목 input val 옮기기 
       	$("#modalTitle").text($("input:text[name='title']").val());
    	// 메일 받는 사람 input val 옮기기 
       	$("#modalRecipient").text($("input:text[name='writer']").val());
    	
    	var modalContent2 = $("#summernote").val();
    	/* .replace(/<\/?[^>]+(>|$)/g, ""); */
    	/* modalContent = modalContent.substring(3); */
    	
    	// 메일 summernote textarea val 옮기기 
    	var modalContent = document.getElementById('modalContent');
       	modalContent.innerHTML = modalContent2;
       	
       // 모달창 띄우기
       modal('my_modal2');
       	
    });
    
    $("#sendMail").click(function () {
        $("form").attr("action","sendMail.do");
        
	 });
  
 	 $("#saveMail").click(function () {
        $("form").attr("action","gosaveMail.do");
 	}); 

 </script>
 
</body>

</html>