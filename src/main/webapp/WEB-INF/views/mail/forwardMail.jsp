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

#communitymodal {
	display: none;
	width: 880px;
	height: 450px;
	padding: 10px 40px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
}

#communitymodal .modal-close-btn {
	position: absolute;
	top: 10px;
	right: 10px;
}

#my_modal .modal-close-btn {
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

.box {
	width: 295px;
	height: 30px;
}


.active {
	outline: 1px solid black;
}

#dept_list {
	width: 190px;
	height: 250px;
	border: #888 solid 1px;
	overflow-y: auto;
	position: absolute;
	top: 100px;
}

#name_list {
	width: 270px;
	height: 250px;
	border: #888 solid 1px;
	float: left;
	position: absolute;
	top: 100px;
	left: 240px;
	overflow-y: auto;
}

#enrollauthority {
	height: 215px;
	width: 280px;
	border: #888 solid 1px;
	position: absolute;
	top: 135px;
	right: 40px;
	overflow-y: auto;
}

.tree {
	display: block;
	list-style-type: disc;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 20px;
}

.tree button {
	margin-left: -30px;
	background: transparent;
	border: 0;
	font-size: 14px;
	cursor: pointer;
}

.tree ul {
	display: none;
	padding-left: 17px;
	list-style: none;
}

.tree li.unfold>ul {
	display: block;
}

.tree li {
	position: relative;
	padding-left: 10px;
	border-left: 1px solid #ccc;
	min-height: 23px;
	line-height: 23px;
	list-style: none;
}

.tree li::before, .tree li::after {
	content: '';
	position: absolute;
}

.tree li::before {
	top: 10px;
	left: 0;
	width: 17px;
	height: 0;
	border-bottom: 1px solid #ccc;
}

.tree>li:first-child::after {
	top: 0;
	left: -1px;
	width: 1px;
	height: 10px;
	background: #fff;
}

.tree li.last::after {
	top: 11px;
	left: -1px;
	width: 1px;
	height: 100%;
	background: #fff;
}

.tree li span {
	position: absolute;
	top: 4px;
	left: 17px;
	width: 17px;
	height: 17px;
	font-size: 14px;
}

.tree li.final span {
	cursor: default;
}

.tree li span::before {
	content: '+';
	font-size: 20px;
	font-weight: bold;
	position: absolute;
	top: -3px;
}

.tree li.unfold>span::before {
	content: '-';
	font-size: 20px;
	font-weight: bold;
	position: absolute;
	top: -3px;
}

.tree li.final span::before {
	content: ' ';
	font-size: 20px;
	font-weight: bold;
	position: absolute;
	top: -3px;
}

.tree li ul li {
	font-size: 12px;
	text-align: left;
	padding-left: 23px;
}

#enrollname input[type="checkbox"] {
	display: none;
}

#enrollname input[type="checkbox"]+label {
	display: inline-block;
	position: relative;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

#enrollname input[type="checkbox"] ~ #lb:before {
	content: ' ';
	display: inline-block;
	width: 18px;
	height: 18px;
	line-height: 18px;
	margin: -2px 8px 0 0;
	text-align: center;
	vertical-align: middle;
	background: #fafafa;
	border: 1px solid #cacece;
	border-radius: 3px;
}

#enrollname input[type="checkbox"]:checked ~ #lb:before {
	content: '\2713';
	color: #314ca2;
	border-color: #adb8c0;
}

#cc {
	color: white
}

#lookname input[type="checkbox"] {
	display: none;
}

#lookname input[type="checkbox"] ~ #lb:before {
	content: ' ';
	display: inline-block;
	width: 18px;
	height: 18px;
	line-height: 18px;
	margin: -2px 8px 0 0;
	text-align: center;
	vertical-align: middle;
	background: #fafafa;
	border: 1px solid #cacece;
	border-radius: 3px;
	cursor: pointer;
}

#lookname input[type="checkbox"]:checked ~ #lb:before {
	content: '\2713';
	color: #314ca2;
	border-color: #adb8c0;
}

span#fileUp{
	font-size : 13px;
	color:grey;
	background:#F3F3F3;
	padding:5px;
	border-radius:3px;
	cursor:pointer;
}

span#fileUp:hover{
	color:#5C6369;
	cursor:pointer;
}

span#fileName{
	font-size:15px;
	color:grey;
}



</style>

</head>
<body>
		<c:import url="../common/mailSubNav.jsp"/>

		<div class="contents">
			<div class="contents-title">
				<span class="ct1">전달 하기 </span>
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

						<div id="auto"> 
						&nbsp;받는사람&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;
						
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
						<input type="text" name="mTitle" style="width: 60%;" placeholder="제목을 입력해주세요." value="${ma.mTitle }" /> <br>
						&nbsp;파일첨부
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="file" name="uploadPhoto" id="ex_file" style="display:none;" onchange="changeFile(event)"/>
						<span id="fileUp">파일 선택하기</span> <span id="fileName"></span>
						<br> <br>
						
						<textarea id="summernote" name="mContent">
						
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

<!-- 멤버 리스트 모달임!!  -->
					<div id="communitymodal" class="modal-dragscroll">
						<h3 style="color: #477A8F; margin-bottom: 15px; margin-top: 12px;">
							 메일 주소록 </h3>

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
																	value="${ memList.name } < ${ memList.emailAddress } >" /> &nbsp; ${ memList.name }(${ memList.id })</label>
																	<input type="hidden" value="${memList.name } < ${ memList.emailAddress } >">
																	</li>
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

							<div style="position: absolute; right: 330px; top: 160px;">
								<img src="resources/images/right.png" id="enrolladd"><br>
								<img src="resources/images/left.png" id="enrollsub">
							</div>

							<p
							style="font-size:13px;
							position: absolute;
							right: 240px; top: 115px;">
								<받는 사람>
							</p>
							<div id="enrollauthority">

								<p id="enrollname"
									style="width: 250px; font-size: 12px; position: absolute; text-align: left; top: 5px; margin-left: 5px;">
								</p>


							</div>

							<div style="position: absolute; bottom: 30px; left: 350px;">
								<button id="email_sub"
									style="background:#477A8F; color:white; padding: 5px 27px 6px; 
									border: 1px solid #477A8F;">저장</button>
								<button class="modal-close-btn cursor"
								style="position: absolute; left: 90px; top: 0px; padding: 5px 27px 6px; color: #444;
								 letter-spacing: -1px; border: 1px solid #dadada; background: #dadada;">취소</button>
							</div>

						</div>
		
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

      /*  // 모달 div 뒤에 희끄무레한 레이어
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
 */
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
            /*  bg.remove(); */
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
   
    // 조직도 모달 띄우기 
    $('#searchPop').on('click', function() {
 	$("#result").empty();
     $("#enrollname").empty();
     $("input:checkbox[id='name']").prop("checked", false);
 	modal('communitymodal');
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
                           
                         tmp +='<label for="'+inputArray.eq(index).val()+'2"><input type="checkbox"" name="checkname" id="' +inputArray.eq(index).val()+ '2" class="checklist" value="'+ inputArray.eq(index).val() + '">&nbsp;' + inputArray.eq(index).val() +'</input><label><br>';
                       });
                        document.getElementById("result").innerHTML= tmp
               
                   })
               })
               
        // 받는 사람 추가 
        $('#enrolladd').click(function(){
        	 var arraybox = "";
        
        	$("#enrollname:last-child").empty();
          $('[name="checkname"]:checked').each(function(i){ //i는 체크수 가져오기 
           arraybox = $(this).val();
          
       	  $('#enrollname').append('<p><input type="checkbox" name="finalname" id="' + arraybox + '" class="finallist" value="'+ arraybox + '"/><label id="lb" for="'+ arraybox+'">' + arraybox +'</label><span style="color:white">,</span><br></p>');
      });
       }); 

       // 보내는 사람 빼기 
     $('#enrollsub').on('click', function() {
 
       $('[name="finalname"]:checked').parent('p').remove(); 
     });
       
  
       // 모달에서 저장 버튼 누르기 
     $("#email_sub").click(function(){
    	 
    	        var inputArray = $('input[name="finalname"]:checked');
                 var enroll = $('#enrollname').text();

                 $("input[name=recipient]").val(enroll.slice(0,-1));
                 $("#communitymodal").hide();
             })
      
       
      $('#fileUp').click(()=>{
      	$('#ex_file').click();
      	
      });
      
       // 파일 첨부시 파일명을 구해서 span에 더해주기 
     function changeFile(event) { 
     	/* var reader = new FileReader(); 
    
     	reader.onload = function(event) { 
     	// 해당 td 의 이미지 지우고 
     	$('#imgTd').empty();

     	// Img 를 만들어주고 
     	var img = document.createElement("img"); 
     	// 아이디를 부여해준다. css 먹어야하니까 
     	img.id  = 'logoImg';
     	
     	// 만든 태그에 src 를 변경 
     	img.setAttribute("src", event.target.result); 
     	document.querySelector("#imgTd").appendChild(img); 
     	};
     	// 로고를 새로 선택하면, 미리보기 썸네일 및 해당 td 의 텍스트 변경 
     	reader.readAsDataURL(event.target.files[0]); 
     	$("#fileStatus").text("업로드할 로고"); */
     	
     	var fileValue = $("#ex_file").val().split("\\");
     	var fileNa = fileValue[fileValue.length-1]; // 파일명
     	
     	$("#fileName").text(fileNa);
     	
     	};
     	
     	
          
 </script>
</body>

</html>