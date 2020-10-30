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
	href="<c:url value="/resources/css/p_assignmanager.css"/>">

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
					<span class="ct1">관리자 지정</span>
					
	
					
				</div>

				
				<div id="mem_list_table">
					<div>
						<div style="top: -20px;
						position: relative;">
						<button id="manager_add" onclick="insertTr()">관리자 추가</button>
						<button id="" style=" background: #fff; color: #2c86dc;   left: 8%;
						position: relative; cursor:pointer; padding: 5px 27px 6px; border: 1px solid #c8c8c8">저장</button>
						</div>

					</div>

					<table class="tg">
						<thead>
						  <tr id="list_table_tr" style="height: 40px; background:#dfdfdf; color: #3b3b3b;
						   border-top:#a7a7a7 solid 2px;">
							<th class="tg-0pky">이름</th>
							<th class="tg-0lax">ID</th>
							<th class="tg-0lax">소속</th>
							<th class="tg-0lax">등록일</th>
							<th class="tg-0lax"></th>
						
							
						  </tr>
						</thead>
						<tbody id="manager_list">
						  <tr id="list_table_tr_input">
							<td class="tg-0lax"><p>한윤수</p></td>
							<td class="tg-0lax"><p>ys211</p></td>
							<td class="tg-0lax"><p>뫄뫄부</p></td>
							<td class="tg-0lax"><p>2020-10-24</p></td>
							<td class="tg-0lax">
								<p>전자 결재 관리자</p></td>
						  </tr>
						  <tr id="list_table_tr_input">
							<td class="tg-0lax"><p>신아라</p></td>
							<td class="tg-0lax"><p>ys211</p></td>
							<td class="tg-0lax"><p>뫄뫄부</p></td>
							<td class="tg-0lax"><p>2020-10-24</p></td>
							<td class="tg-0lax">
								<p>인사 관리자</p></td>
						  </tr>
				
						
						</tbody>
					
							
						</table>

						<span style="font-size: 14px;
						position: absolute;
						left: 10%;
						top: 600px;">총 인원 : 2명</span>
						<span style="font-size: 14px;
						position: absolute;
						left: 40%;
						top: 600px;"> [이전] 1 2 3 4 5 [다음]</span>
				</div>
	  </div>
				
			</div>
		</div>
		
	</div>
	<!-- Modal -->

	<script>
			
		function modal(id) {
			var zIndex = 9999;
			var modal = $('#' + id);
			var btncolor =document.getElementById("accepttype"); 

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
				.
				find('#accept').on('click', function() {
					bg.remove();
					modal.hide();
					btncolor.style.backgroundColor="#477A8F"
					$("#accepttype").text("승인 완료");
			

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

	
	

	 function insertTr(){
		var trCnt = $('#manager_list tr').length;

		if(trCnt < 10){
			var html = '';

		html += '<tr>';
		html += '<td>'+'<input type="text" style="width: 100px;"/>'+'</td>';
		html += '<td><p></p></td>';
		html += '<td><p></p></td>';
		html += '<td><p></p></td>';
		html += '<td>'+'<select name="manager">';
		html += '<option value="">관리자 선택</option><option value="인사관리자">인사 관리자</option><option value="전자 결재 관리자">전자 결재 관리자</option>';
		html += '</select></td>';
		html += '</tr>';

			
			$("#manager_list").append(html);
		
		}else{
			alert("관리자는 최대 10명 까지만 지정 가능합니다.")
			return false;
		}
		}

	
		
	</script>
		<style>
			#accept_modal {
				display: none;
				width: 450px;
				height: 600px;
				padding: 20px 60px;
				background-color: #fefefe;
				border-radius: 3px;
			}
	
			#accept_modal .modal-close-btn {
				position: absolute;
				top: 10px;
				right: 10px;
			}
			.n-emp-i{
				width: 100%;
				height: 30%;
			}

			.modal-dragscroll>div>dl>dd{
				margin-bottom: 15px;
			}
			.modal-dragscroll{
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
	<div id="accept_modal" class="modal-dragscroll">
		<h4 style="color: #477A8F; margin-bottom: 5px;">사원 정보</h4>
		<div class="n-emp-i">
			<div style="float: left;">
				<img src="" alt="" style="width: 120px; height: 120px;">
			</div>
			<div style=" margin-left:150px">
				<li>사원명<span class="emp-info" 
				style="position: absolute; left: 278px;">이름</span></li> <br>
				<li>부서
					<select name="dept" style="border: none; float: right;width: 100px;">
						<option value="">부서 선택</option>
						<option value="기획부">기획부</option>
						<option value="ㅇㅇ부">ㅇㅇ부</option>
						<option value="ㅁㅁ부">ㅁㅁ부</option>
					</select>
			     </li> 
			  <br>
				<li>직급
					<select name="rank" style="border: none; float: right;width: 100px;">
						<option value="">직급 선택</option>
						<option value="사장">사장</option>
						<option value="팀장">팀장</option>
						<option value="사원">사원</option>
						<option value="인턴">인턴</option>
					</select>
				</li> 
			</div>
		</div>
		<div style="word-break:break-all;">
			<dl style="margin-top: -20px;">
				<dt style="float: left;">휴대전화</dt>
				<dd style="margin-left: 150px;">010-0000-0000</dd>
				<dt style="float: left;">이메일</dt>
				<dd style="margin-left: 150px;">00000000</dd>
				<dt style="float: left;">입사일</dt>
				<dd style="margin-left: 150px;">00000000</dd>
				<dt style="float: left;">사번</dt>
				<dd style="margin-left: 150px;">00000000</dd>
				<dt style="float: left;">개인이메일</dt>
				<dd style="margin-left: 150px;">00000000</dd>
				<dt style="float: left;">생년월일</dt>
				<dd style="margin-left: 150px;">00000000</dd>
				<dt style="float: left;">주소</dt>
				<dd style="margin-left: 150px;">00000000</dd>
				<dt style="float: left;">기타 정보</dt>
				<dd style="margin-left: 150px;">00000000</dd>
			</dl>
			
		</div>

		<div style="text-align: center;margin-top: 30px;" >
			<button id="accept" style=" background: #fff; color: #2c86dc; padding: 5px 27px 6px; border: 1px solid #c8c8c8">승인</button>
			<button style="    padding: 5px 27px 6px;
			color: #444;
			letter-spacing: -1px;
			border: 1px solid #dadada;
			background: #dadada;">취소</button>
		</div>
	
		<a class="modal-close-btn cursor">X</a>
	</div>
    
</body>
</html>