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
<link rel="stylesheet"
	href="<c:url value="/resources/css/set-leave-standard.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/younsu-subNavi.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/p_rankmanage.css"/>">

</head>

<body>

	<div id='wrap'>
		<c:import url="../common/header.jsp" />

		<div class="container">
			<!-- 전체높이지정용 -->
			<div id="drag-wrap">
				<div id="drag"></div>
			</div>
			<!--  -->
			<!-- 세부 네비 시작 -->
			<c:import url="../common/personnelSubNavi.jsp" />
			<!-- 세부 네비끝 -->

				<!-- 내부 컨텐츠 -->
			<div class="contents">
				<div class="contents-title">
					<span class="ct1">직위 관리</span>
				</div>
		
				
			
				
				<div id="rank_list_table">
					<div>
						<div style="top: -20px;
						position: relative;">
						<button id="rank_add"> 직위 추가</button>
						
						</div>

					</div>
				
					<table class="tg">
						<thead>
						  <tr>
							<th id="firstth" class="tg-0pky rank">1등급</th>
							<th id="secondth" class="tg-0pky rankname">사장</th>
						  </tr>
						</thead>
						<tbody id="rank_table">
						  <tr>
							<td class="tg-0pky rank">2등급</td>
							<td class="tg-0pky rankname">이사</td>
						  </tr>
						  <tr>
							<td class="tg-0pky rank">3등급</td>
							<td class="tg-0pky rankname">부장</td>
						  </tr>
						  <tr>
							<td class="tg-0pky rank">4등급</td>
							<td class="tg-0pky rankname">차장</td>
						  </tr>
						  <tr>
							<td class="tg-0pky rank">5등급</td>
							<td class="tg-0pky rankname">과장</td>
						  </tr>
						  <tr>
							<td class="tg-0pky rank">6등급</td>
							<td class="tg-0pky rankname">대리</td>
						  </tr>
						  <tr>
							<td class="tg-0pky rank">7등급</td>
							<td class="tg-0pky rankname">인턴</td>
						  </tr>
						  <tr>
							<td class="tg-0pky rank">8등급</td>
							<td class="tg-0pky rankname">사원</td>
						  </tr>
						  
						</tbody>
						</table>

					
				</div>
			</div>
	  </div>
				
			</div>
		
		
	</div>
	<!-- Modal -->

	<!-- add modal-->
	<div id="add_rank_modal" class="modal-dragscroll">
		<h4 style="color: #477A8F; margin-bottom: 5px;">직위 추가</h4>
		 <p style="color: #707070; font-size: 14px;">직위명</p>
			<input type="text" style="width: 200px;" placeholder=""/>
		
		<div style="text-align: center;margin-top: 15px;" >
			<button onclick="insertTr()" style=" background: #fff; color: #2c86dc; padding: 5px 27px 6px; border: 1px solid #c8c8c8">추가</button>
			<button style="    padding: 5px 27px 6px;
			color: #444;
			letter-spacing: -1px;
			border: 1px solid #dadada;
			background: #dadada;">취소</button>

			
<a class="modal-close-btn cursor">X</a>
		</div>
		</div>
		
	<!-- Modal div -->
	<div id="edit_rank_modal" class="modal-dragscroll">
		<h4 style="color: #477A8F; margin-bottom: 5px;">직위 수정</h4>
		 <p style="color: #707070; font-size: 14px;">직위명</p>
			<input type="text" style="width: 200px;" placeholder="부장"/>
		
		<div style="text-align: center;margin-top: 15px;" >
			<button id="" style=" background: #fff; color: #2c86dc; padding: 5px 27px 6px; border: 1px solid #c8c8c8">수정</button>
			<button id="delete_rank" style="    padding: 5px 27px 6px;
			color: #444;
			letter-spacing: -1px;
			border: 1px solid #dadada;
			background: #dadada;">삭제</button>

			
<a class="modal-close-btn cursor">X</a>
		</div>
		</div>
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

		function modal2(id) {
			var zIndex = 9999;
			var modal = $('#' + id);

	

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
					
					modal.hide();
				});
		}

		$('.rankname').on('click', function() {
			// 모달창 띄우기
			modal('edit_rank_modal');
		});

		

		$('#rank_add').on('click', function() {
			// 모달창 띄우기
			modal('add_rank_modal');
		});

		function insertTr(){
		var trCnt = $('#rank_table tr').length;

		if(trCnt < 9){
			var insertTr = "";
		
		
			insertTr += "<tr>";
			insertTr += "<td>10등급</td>";
			insertTr += "<td>ㅇㅇ</td>";
			insertTr += "</tr>";
			
			$("#rank_table").append(insertTr);
		
		}else{
			alert("직위는 최대 10개 까지만 가능합니다.")
			return false;
		}
		}
		
		$('#delete_rank').on('click', function() {
			// 모달창 띄우기
			confirm("정말 삭제하시겠습니까?");
		});

	</script>
		
	
	



    
</body>
</html>