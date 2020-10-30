<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<c:import url="../common/header.jsp" />

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>


<title>게시물 쓰기</title>
<style>
form input[type=button] {
	font-size: 18px;
	margin: 20px 5px 7px 5px;
	background: none;
	border: none;
	color: #477A8F;
	cursor: pointer;
}

select {
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none; /* 화살표 모양의 이미지 */
	width: 100px; /* 원하는 너비설정 */
	padding: .3em .5em; /* 여백으로 높이 설정 */
	font-family: inherit; /* 폰트 상속 */
	background:
		url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg)
		no-repeat 95% 50%; /* 네이티브 화살표 대체 */
	-moz-appearance: none;
	border-radius: 0px;
}

body {
	font-family: "Noto Sans KR", sans-serif;
	padding: 0px;
	margin: 0px;
}

.container {
	position: relative;
	border-radius: 10px;
	background: #e8ecee;
	color: #676767;
	width: 250px;
	height: 100%;
	font-size: 1.15em;
	float: left;
	border-bottom: none;
	padding-top: 2px;
}

.drag-scrollbar {
	overflow: auto;
	height: 600px;
}

.drag-scrollbar::-webkit-scrollbar {
	width: 10px;
}

.drag-scrollbar::-webkit-scrollbar-thumb {
	background-color: #676767;
	border-radius: 15px;
}

.drag-scrollbar::-webkit-scrollbar-track {
	background-color: #e8ecee;
	border-radius: 15px;
	box-shadow: #e8ecee;
}

.H-personnel-subNavi {
	margin-left: 15px;
	margin-right: 15px;
}

li {
	list-style: none;
	margin-bottom: 10px;
	font-size: 18px;
}

a {
	text-decoration: none;
	color: #676767;
}

.title {
	font-size: 16px;
	font-weight: bold;
	margin-right: 50px;
}

.subTitle {
	list-style: none;
}

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

.del {
	opacity: 0%;
}

.del:hover {
	opacity: 100%;
}

form input[type=button] {
	font-size: 18px;
	margin: 7px 5px 7px 5px;
	background: none;
	border: none;
	color: #477A8F;
}

form>input[type=text] {
	margin: 5px 0px 5px 0px;
	border: none;
	background: #F3F3F3;
	height: 30px;
}

form input[type=button]:focus, form>input[type=text]:focus, li:focus, a:focus
	{
	outline: none;
}

a:active {
	font-weight: bolder;
}

#my_modal2 {
	display: none;
	width: 600px;
	height: 650px;
	padding: 20px 30px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
	text-align: left;
	color: rgb(65, 65, 66);
}

#my_modal2 #modalContent {
	border-bottom: 1px solid #F4F4F4;
	height: 350px;
	margin-bottom: 25px;
	overflow-y: scroll;
}

.n-emp-i2 :last-child {
	height: 350px;
	border-bottom: 1px solid #F4F4F4;
	margin-bottom: 25px;
	overflow: scroll;
}
</style>
</head>


<body>
<body>


	<script type="text/javaScript">
$(document).ready(function() {
	  $('#summernote').summernote({
		  	
 	    	placeholder: '내용을 작성해주세요.',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR',
	        toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['fullscreen', 'help']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	  });
	});


</script>
	<div id='wrap'>
		<c:import url="../common/boardSubNav.jsp" />
		<div class="contents">
			<div class="contents-title">
				<span class="ct1">게시물 쓰기</span>
			</div>

			<div>
				<div style="width: 90%; margin: auto;">
					<form method="post" action="">

						<input id="subBtn" type="button" value="확인" style="" "goWrite(this.form)"/>
						<input class="go2" type="button" value="미리보기" /> <a
							href="saveBoard.do"><input id="" type="button" value="임시저장" />
						</a> <a href="javascript:history.go(-1);"> <input id=""
							type="button" value="이전으로" /></a> <br>
						<br> &nbsp;게시판 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <select
							id="writerBoard" name="writerBoard">
							<option value="boardAll">사내공지</option>
							<option value="boardTeam">팀내공지</option>
							<option disabled>--------------</option>
							<option value="boardFree">자유게시판</option>
						</select><br> <br> &nbsp;&nbsp;제목&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<input type="text"
							name="title" style="width: 60%;" placeholder="제목 없음" /> <br>
						<br>&nbsp;<label id="uploadFile">
							파일첨부&nbsp;&nbsp;&nbsp;</label> <input type="file" name="uploadFile"><br>
						<br>
						<textarea id="summernote" name="content"></textarea>

					</form>

				</div>
			</div>
		</div>

	</div>




	<!-- Modal div -->
	<div id="my_modal2" class="modal-dragscroll">

		<span style="font-size: 20px; color: #477A8F;"> 미리보기 </span>
		<div class="n-emp-i2">
			<hr>
			<p>
				게시판 : <span id="modalType"> </span>
			</p>
			<p>
				제목 : <span id="modalTitle"> 제목없음 </span>
			</p>
			<p>작성자 : ${ loginUser.name }< ${ loginUser.id } ></p>
			<p>작성일 : 시스데이트쓸거임</p>
			<p>파일첨부 :</p>
			<hr>
			<div id="modalContent">내용</div>
		</div>


		<input class="modal-close-btn cursor" value="닫기"
			style="background: #477A8F; color: white; text-align: center; border: none; padding: 12px 4px 12px 4px; border-radius: 3px; margin-left: 180px; cursor: pointer; font-size: 15px;" />
	</div>
	<!-- Modal div -->

</body>

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

    
    	
    $('.go2').on('click', function() {
    	
    	// 게시판 타입 val
    	$("#modalType").text($("#writerBoard option:selected").text());
    	// 게시판 제목 input val 옮기기 
       	$("#modalTitle").text($("input:text[name='title']").val());
    	
    	var modalContent2 = $("#summernote").val();
    	
    	
    	// 게시판 summernote textarea val 옮기기 
       var modalContent = document.getElementById('modalContent');
       	modalContent.innerHTML = modalContent2;
       // 모달창 띄우기
       modal('my_modal2');
       	
    });
 </script>
</html>