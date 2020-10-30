<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>


</head>

<body>
<!-- Modal -->
	<div id="accept_modal${vs.index}" class="modal-dragscroll">
		<h4 style="color: #477A8F;
		margin-bottom: 20px;
		font-size: 20px;">사원 정보</h4>
		<div class="n-emp-i">
			<div style="float: left;">
				<img src="" alt="" style="width: 110px; height: 120px;">
			</div>
			<div style=" margin-left:140px">
				<li style="margin-bottom: 6px;">사원명<span class="emp-info" 
				style="position: absolute; left: 265px;">${list.id}</span></li> 
				<li style="margin-bottom: 6px;">부서
					<select name="dept" style="border: none; float: right;width: 100px; position: absolute;
					right: 78px; margin-top: 4px; margin-right: 10px;">
						<option value="">부서 선택</option>
						<option value="기획부">기획부</option>
						<option value="ㅇㅇ부">ㅇㅇ부</option>
						<option value="ㅁㅁ부">ㅁㅁ부</option>
					</select>
			     </li> 
			
				<li style="margin-bottom: 6px;">직급
					<select name="rank" style="border: none; float: right;width: 100px; position: absolute;
					right: 78px; margin-top: 4px; margin-right: 10px;  ">
						<option value="">직급 선택</option>
						<option value="사장">사장</option>
						<option value="팀장">팀장</option>
						<option value="사원">사원</option>
						<option value="인턴">인턴</option>
					</select>
				</li> 
				<li style="margin-bottom: 6px;">사번<span class="emp-info" 
					style="position: absolute; left: 265px; font-size: 14px; margin-top:3px">${list.memNo}</span></li> 
			</div>
		</div>
		<div style="word-break:break-all; margin-top:20px">
			<dl style="margin-top: -20px;">
				<dt style="float: left;">휴대전화</dt>
				<dd style="margin-left: 150px;">010-0000-0000</dd>
				<dt style="float: left;">이메일</dt>
				<dd style="margin-left: 150px;">00000000</dd>
				<dt style="float: left;">입사일</dt>
				<dd style="margin-left: 150px;">00000000</dd>
				<dt style="float: left;">개인이메일</dt>
				<dd style="margin-left: 150px;">00000000</dd>
				<dt style="float: left;">생년월일</dt>
				<dd style="margin-left: 150px;">00000000</dd>
				<dt style="float: left;">주소</dt>
				<dd style="margin-left: 150px;">00000000</dd>
				
			</dl>
			
		</div>

		
		<div style="text-align: center; margin-top: 30px;">
			<button id="accept"
				style="background: #fff; color: #2c86dc; padding: 5px 27px 6px; border: 1px solid #c8c8c8">승인</button>
			<button
				style="padding: 5px 27px 6px; color: #444; letter-spacing: -1px; border: 1px solid #dadada; background: #dadada;">취소</button>
		</div>

		<a class="modal-close-btn cursor">X</a>
	</div>

	<script>
		function modal(id) {
			var zIndex = 9999;
			var modal = $('#' + id);
			var btncolor = document.getElementById("accepttype");

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
					.find('.modal-close-btn').on('click', function() {
						bg.remove();
						modal.hide();
					});

			modal
					.css(
							{
								position : 'fixed',
								boxShadow : '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

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
					.find('#accept').on('click', function() {
						bg.remove();
						modal.hide();
						btncolor.style.backgroundColor = "#477A8F"
						$("#accepttype").text("승인 완료");

					});

		}

		function modal2(id) {
			var zIndex = 9999;
			var modal = $('#' + id);

			modal
					.css(
							{
								position : 'fixed',
								boxShadow : '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

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
					.find('.modal-close-btn').on('click', function() {

						modal.hide();
					});
		}

		$('#list_table_tr_input td:last-child').on('click', function() {
			// 모달창 띄우기
			modal('accept_modal');
		});
	</script>
	<style>
#accept_modal {
	display: none;
	width: 450px;
	height: 500px;
	padding: 20px 60px;
	background-color: #fefefe;
	border-radius: 3px;
}

#accept_modal .modal-close-btn {
	position: absolute;
	top: 10px;
	right: 10px;
}

.n-emp-i {
	width: 100%;
	height: 30%;
}

.modal-dragscroll>div>dl>dd {
	margin-bottom: 13px;
	font-size: 14px;
	margin-left: 130px;
	color: #676767;
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
</style>
	<!-- Modal div -->

    

</body>
</html>