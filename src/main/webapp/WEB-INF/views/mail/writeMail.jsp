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

<title>메일 쓰기</title>

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

#auto #autoAddress {
		position:absolute;
		display:none;
		top:24%;
		left:11.6%;
		color :black;
		background :white;
		transition: all ease 0.7s 0s;
		z-index : 700;
	 	margin : 2px 50px 0px 20px;
		box-shadow: 0px 0px 5px lightgrey;
}

#auto #autoAddress li {
	font-size :14px;
}

#auto #autoAddress li:hover {
	background : #477A8F;
	color : white;
}

#auto #searchPop {
	cursor : pointer;
}

#auto #searchAddress {
	position : absolute;
	background: #477A8F; 
	color : white;
	right : 312px;
	top : 143px;
	font-size : 12px;
	padding : 3.5px 6px 3.5px 3.5px;
	display : none;
	border-radius : 0px 6px 6px 0px;

}



</style>

</head>
<body>
		<c:import url="../common/mailSubNav.jsp"/>

		<div class="contents">
			<div class="contents-title">
				<span class="ct1">메일 쓰기 </span>
			</div>

			<div>
				<div style="width: 90%; margin: auto;">
					<form method="post" enctype="multipart/form-data">
					<!-- 전송하기 미리보기 저장하기 이전으로 버튼   -->
						<input type="hidden" value="${loginUser.memNo}" name= memNo>
						<input type="submit" value="보내기" id="sendMail" />
						<input class="go2" type="button" value="미리보기"/> 
						<input type="submit" id="saveMail"  value="저장하기"/>
						 <a href="javascript:history.go(-1);"> 
						 <input type="button" value="이전으로" /></a> <br>
						 &nbsp;보내는사람&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="text" name="sender" style="width: 60%;" value= "${loginUser.name} < ${loginUser.id}@nullcompany.com >" readonly/> <br>
							
							<div id="auto"> 
						&nbsp;받는사람&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" name="recipient" id="address" style="width: 60%;"
							placeholder="이름 혹은 메일 주소를 입력해주세요." />
							
							 <span  id="searchPop"
							 style="font-size: 17px; 
							 background: #477A8F; 
							 color: white; 
							 padding: 0px 8px 0px 8px;">+</span>
							 	
							 <span id="searchAddress"> 주소 검색 </span>
							 	<div id="autoAddress"> 
							 	 <!--  자동 완성 검색 결과  -->
							 	</div>
							</div>
							
						
						&nbsp;&nbsp;제목
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;
						<input type="text" name="mTitle" style="width: 60%;" placeholder="제목을 입력해주세요." /> <br>
						&nbsp;파일첨부
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="file" name="uploadPhoto" id="ex_file"/>
						<br> <br> 
						
						<!--  썸머노트  -->
						<textarea id="summernote" name="mContent"></textarea>
					</form>
				</div>
			</div>
		</div>
	
	
	<!-- 미리보기 모달  -->
	<div id="my_modal2" class="modal-dragscroll">

		<span style="font-size: 20px; color: #477A8F;"> 미리보기 </span> 
		<div class="n-emp-i2">
		<hr>
			<p>메일 제목 : <span id="modalTitle"> 제목없음 </span></p>
			<p>
				보낸사람 : ${ loginUser.name } < ${loginUser.id}@nullcompany.com >
				
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
	
		
	
	
	<script type="text/javaScript">
	
	$(document).ready(function() {
		
	
	/*   $('#community').on('click', function() {
	         // 공유 캘린더 모달창 띄우기
	         modal('communitymodal');
	      }); */
		
	  $('#summernote').summernote({
 	    	placeholder: '내용을 작성해주세요.',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	        
	  });
	
	  $("button[aria-label=Picture]").css('display','none');	  
	  $("button[aria-label=Video]").css('display','none');	  
	   
	  });
	
	
	$(document).on("click","#ulAuto li",function(){
		 
	            $("input[name=recipient]").val($(this).text());
	            $("#autoAddress").hide();
	            
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
    }

    
   // 미리보기 모달 
    $('.go2').on('click', function() {
    	
    	// 메일 제목 input val 옮기기 
       	$("#modalTitle").text($("input:text[name='mTitle']").val());
    	// 메일 받는 사람 input val 옮기기 
       	$("#modalRecipient").text($("input:text[name='recipient']").val());
    	
    	var modalContent2 = $("#summernote").val();
    	
    	// 메일 summernote textarea val 옮기기 
    	var modalContent = document.getElementById('modalContent');
       	modalContent.innerHTML = modalContent2;
       	
       // 모달창 띄우기
       modal('my_modal2');
       	
    });
    
    // 메일 전송 버튼 
    $("#sendMail").click(function () {

      	if ($("input[name=recipient]").val().length < 1 ){
      	  alert('보내는 사람을 지정하지 않으셨습니다.');
    	}if ($('#summernote').summernote('isEmpty')) {
     		  alert('메일 내용을 입력하지 않으셨습니다.');
    	}else{
        $("form").attr("action","sendMail.do");
   		}
        
	 });
    
  
    // 메일 임시 저장 버튼 
 	 $("#saveMail").click(function () {
 		if ($('#summernote').summernote('isEmpty')) {
 			$('#summernote').summernote('insertText', '작성 내용 없음');
 	   		alert('메일 내용을 입력하지 않으셔서 내용 없음으로 저장됩니다.');
 		}if($("input[name=recipient]").val().length < 1){
 	    	  alert('보내는 사람을 지정하지 않아 없음으로 저장됩니다.');
 	    	 $("input[name=recipient]").val('없음');
 		}
        $("form").attr("action","gosaveMail.do");
 	}); 
 	 
 	 // 자동 완성 에이작스 
 	
          $("#address").on("keyup",function(){
              var text = $(this).val();
             
              if(text.length > 1){
                  
 			$.ajax({
 				url:"autoComplete.do",
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
 				 	
 				 		str += "<li>" + entry['name'] + " < " 
 				 		str += entry['emailAddress'] +" > </li>" 
 				 		
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
          searchPop
          $('#searchPop')
          .mouseover(function(){
          $('#searchAddress').css('display','block');
          })
          
           searchPop
          $('#searchPop')
          .mouseout(function(){
          $('#searchAddress').css('display','none');
          })
          
          
 </script>
 
</body>
</html>