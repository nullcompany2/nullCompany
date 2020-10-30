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
<title>게시판디테일</title>

</head>
<style>
.icon.impt {
	top: 0;
	left: 0;
	width: 16px;
	height: 16px;
	background: url(resources/images/sp_menu.png) 0 0 no-repeat;
	background-position: -148px -311px;
}

select {
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none; /* 화살표 모양의 이미지 */
	width: 100px; /* 원하는 너비설정 */
	padding: .5em .5em; /* 여백으로 높이 설정 */
	font-family: inherit; /* 폰트 상속 */
	background:
		url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg)
		no-repeat 95% 50%; /* 네이티브 화살표 대체 */
	-moz-appearance: none;
	border-radius: 0px;
}

form input[type=button] {
	font-size: 18px;
	margin: 7px 5px 7px 5px;
	background: none;
	border: none;
	color: #477A8F;
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

a:active {
	font-weight: bolder;
}

#search {
	position: relatived;
	margin-left: 37%;
}

table tr:last-of-type {
	padding-bottom: 50px;
}

#mrv_table {
	margin: 10px 0px 0px 0px;
	width: 100%;
	border-top: 1px solid #cdcdcd;
	border-bottom: 1px solid #cdcdcd;
	border-collapse: collapse
}

input[type="submit"] {
	-webkit-appearance: button; // 2
	cursor: pointer;
	//
	3
}

#mrv_table>thead {
	width: 8px;
	border-radius: 8px;
	background: #e1e1e1;
}

thead tr {
	background: #e1e1e1;
}

tr>th {
	padding: 14px 10px 14px 15px;
	text-align: left;
}

tr>td {
	padding: 14px 10px 14px 15px;
	text-align: left;
}

.rv_but {
	border: 0 none;
	background-color: transparent;
	cursor: pointer;
	color: #779ec0 !important;
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

#delete_modal {
	display: none;
	padding: 10px 60px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
}

#delete_modal .modal-close-btn {
	position: absolute;
	top: 10px;
	right: 10px;
}

input:hover {
	color: black;
	cursor: pointer;
}

#mrv_table {
	margin: 10px 0px 0px 0px;
	width: 100%;
	border-top: 1px solid #cdcdcd;
	border-bottom: 1px solid #cdcdcd;
	border-collapse: collapse
}

#mrv_table>thead {
	width: 8px;
	border-radius: 8px;
	background: #e1e1e1;
}

thead tr {
	background: #e1e1e1;
}

tr>th {
	padding: 14px 10px 14px 15px;
	text-align: left;
}

tr>td {
	padding: 14px 10px 14px 15px;
	text-align: left;
}

.rv_but {
	border: 0 none;
	background-color: transparent;
	cursor: pointer;
	color: #779ec0 !important;
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

#delete_modal {
	display: none;
	padding: 10px 60px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
}

#delete_modal .modal-close-btn {
	position: absolute;
	top: 10px;
	right: 10px;
}
</style>


<body>

	<div id='wrap'>

		<c:import url="../common/boardSubNav.jsp" />
		<!-- 게시판 -->
		<div class="boardDeatil">
			<div class="board_head">
				<div style="width: 90%; margin: auto;">
					<form method="post" action="">

						<input id="subBtn" type="button" value="수정"
							style="margin-left: 15px" onclick="" /> <input id="subBtn"
							class="go" type="button" value="삭제" /> <input type="text"
							id="ShareUrl" OnClick="javascript:CopyUrlToClipboard()"
							style="position: absolute; top: 0; left: 0; width: 1px; height: 1px; margin: 0; padding: 0; border: 0;">
						<button
							style="font-size: 18px; margin: 7px 5px 7px 5px; background: none; border: none; color: #477A8F; cursor: pointer;"
							OnClick="javascript:CopyUrlToClipboard()">주소 복사</button>
						<a href="javascript:history.go(-1);"> <input id=""
							type="button" value="이전으로" /></a>
						<div id="delete_modal" class="modal-dragscroll">
							<h4 style="color: #477A8F; margin-bottom: 25px;">게시글 삭제</h4>
							<div class="n-emp-i">
								선택한 글을 삭제하시겠습니까?<br> <br>

							</div>
							<div style="text-align: center;">
								<button
									style="background: #fff; color: #2c86dc; padding: 5px 27px 6px; border: 1px solid #c8c8c8">확인</button>
								<button
									style="padding: 5px 27px 6px; color: #444; letter-spacing: -1px; border: 1px solid #dadada; background: #dadada;">취소</button>
							</div>
					</form>
				</div>



			</div>
			<div class="board_body">
				<br>&nbsp;&nbsp;&nbsp;<a href="#" class="icon impt "
					ng-click='setImportant()'><span class="blind">별</span></a>

				<table class="deatil" align="center" width="800px">
					<tr>
						<td width=140px;><img class="myphoto"
							src="resources/images/person.png"></td>
						<td colspan="5"
							style="font-size: 22px; font-weight: 40; line-height: 18px;"><span>${b.bTitle }</span></td>
					</tr>
					<tr>

						<td><span style="color: #7f7f7f;">${b.bWriter }</span></td>
						<td style="width:200px;"><span style="color: #7f7f7f;">&nbsp;&nbsp;&nbsp;&nbsp;${b.bType }</span></td>
						<td style="color: #7f7f7f;">읽은 사람&nbsp;&nbsp;&nbsp;
							&nbsp;${b.bCount }</td>

						<td><span style="color: #7f7f7f;">${b.bCreateDate }</span></td>

					</tr>
					<tr>
						<td>첨부파일</td>
						<td colspan="5"><c:if test="${ !empty b.originalFileName }">
								<a
									href="${contextPath }/resources/buploadFiles/${b.renameFileName}"
									download="${ b.originalFileName }">${ b.originalFileName }</a>
							</c:if>
						</td>

					</tr>
					<tr>

						<td>내용</td>
						
						<td colspan="4" style="font-size: 20px;">${ b.bContent }</td>
						</tr>
					<tr>
						
					</tr>

				</table>

			</div>


			<div class="comment">

				<form action="/myWeb/insertComment.bo" method="post">
					<input type="hidden" name="writer" value="" /> <input
						type="hidden" name="bno" " /> <input type="hidden" name="refcno"
						value="0" /> <input type="hidden" name="clevel" value="1" />

					<table align="center">
						<tr>
							<td>댓글 작성</td>
							<td><textArea rows="3" cols="80" id="replyContent"
									name="replyContent" style="resize: none;"></textArea></td>
							<td><button type="submit" id="addReply">댓글 등록</button></td>
						</tr>
					</table>
				</form>


			</div>


		</div>

		<script>
		function CopyUrlToClipboard()
		{
			var obShareUrl = document.getElementById("ShareUrl");
			obShareUrl.value = window.document.location.href;  // 현재 URL 을 세팅해 줍니다.


			obShareUrl.select();  // 해당 값이 선택되도록 select() 합니다
			document.execCommand("copy"); // 클립보드에 복사합니다.


			obShareUrl.blur(); // 선택된 것을 다시 선택안된것으로 바꿈니다.
				

			alert("URL이 클립보드에 복사되었습니다"); 

		}
		
		
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
		       modal('delete_modal');
		    });
  
    
 </script>
</body>
</html>