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
	<link rel="stylesheet" href="<c:url value="/resources/css/info_organization.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/p_organization.css"/>">

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
				<!-- 컨텐츠 타이틀명 -->
				<div class="contents-title">
					<span class="ct1">조직 관리</span>
					
						<form action=""
						style="float: right; position: absolute; right: 100px; top: 10px;">
						<select name="search"
							style="border-radius: 8px; border: #676767 solid 1px; margin-right: 3px;">
							<option value="이름">이름</option>
							<option value="부서">부서</option>
						</select> <input type="text" name="" id="" class="search-emp"
							placeholder="&nbsp; 이름, 부서 검색"
							style="border-radius: 8px; border: #676767 solid 1px;">&nbsp;&nbsp;
						<button class="search-btn cursor"
							style="border: none; background: none;">검색</button>
					</form>
					
				</div>
				<!-- ---- -->
				<div class="contents-wrap drag-scrollbar">
					<div id="dept_list1">
						<ul class="tree">
						   <li>
							   <button class="edit_dept">기획부 (2)</button>
							   <ul>
								   <li class="emp-info"><label>신아라</label></li>
								   <li class="emp-info"><label>이용희</label></li>
							   </ul>
						   </li>
						   <li>
							  <button class="edit_dept">뫄뫄부 (2)</button>
							  <ul>
								 <li class="emp-info"><label>한윤수</label></li>
								 <li class="emp-info"><label>정택환</label></li>
							  </ul>
						  </li>
						  <li>
							  <button class="edit_dept">뫄뫄부 (2)</button>
							  <ul>
								 <li class="emp-info"><label>구승현</label></li>
								 <li class="emp-info"><label>강동우</label></li>
							  </ul>
						  </li>
					   </ul>
					
					  
					   <div id="edit_dept_modal" class="modal-dragscroll">
						<h4 style="color: #477A8F; margin-bottom: 5px;">부서 수정</h4>
					 	<p style="color: #707070; margin-bottom: 5px; font-size: 14px;">부서명</p>
							<input type="text" placeholder="영업부"/>
						
						<div style="text-align: center;margin-top: 30px;" >
							<button style=" background: #fff; color: #2c86dc; padding: 5px 27px 6px; border: 1px solid #c8c8c8">수정</button>
							<button id="delete_dept" style="padding: 5px 27px 6px;
							color: #444;
							letter-spacing: -1px;
							border: 1px solid #dadada;
							background: #dadada;">삭제</button>
						</div>
					
						<a class="modal-close-btn cursor">X</a>
					   </div>

					   <div id="add_dept_modal" class="modal-dragscroll">
						<h4 style="color: #477A8F; margin-bottom: 5px;">부서 추가</h4>
					 	<p style="color: #707070; margin-bottom: 5px; font-size: 14px;">부서명</p>
							<input type="text" placeholder="영업부"/>
						
						<div style="text-align: center;margin-top: 30px;" >
							<button id="add" style=" background: #fff; color: #2c86dc; padding: 5px 27px 6px; border: 1px solid #c8c8c8">추가</button>
							<button style="    padding: 5px 27px 6px;
							color: #444;
							letter-spacing: -1px;
							border: 1px solid #dadada;
							background: #dadada;">취소</button>
						</div>
					
						<a class="modal-close-btn cursor">X</a>
					   </div>
			
					   <script>
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
						$this.find('li>span').on('click',function(){ //span 클릭하면
							if($(this).parent('li').hasClass('unfold')){    //하위메뉴 열려 있을 경우
								$(this).parent('li').removeClass('unfold'); //닫고
							}
							else {  //하위메뉴 닫혀 있을 경우
								$(this).parent('li').addClass('unfold');    //연다
							}
						});
					   });

					</script>
			
					 </div>
		
					<div class="ic">
			
						<div>
						<button id="dept_add"> 부서 추가</button>
					
						</div>
						<table style="position: absolute; left: 15%;">
							<th>
								<div class=" dept-title ic-title">
									<span class="deptname" style="font-size: 25px; margin-top:50px" >부서명</span>
								</div>
								<tr>
									<td>
										<div class=" ic-emp-info cursor" >
											<img src="" alt="" class="emp-img ">
											<li><span class="emp-info" id="emp-name">이름</span></li> <br>
											<li><span class="emp-info" id="emp-dept">부서</span></li> <br>
											<li><span class="emp-info" id="emp-rank">직급</span></li>
										</div>
									</td>
									<td>
										<div class=" ic-emp-info cursor">
											<img src="" alt="" class="emp-img">
											<li><span class="emp-info" id="emp-name">이름</span></li> <br>
											<li><span class="emp-info" id="emp-dept">부서</span></li> <br>
											<li><span class="emp-info" id="emp-rank">직급</span></li>
										</div>
									</td>
									<td>
										<div class=" ic-emp-info cursor">
											<img src="" alt="" class="emp-img ">
											<li><span class="emp-info" id="emp-name">이름</span></li> <br>
											<li><span class="emp-info" id="emp-dept">부서</span></li> <br>
											<li><span class="emp-info" id="emp-rank">직급</span></li>
										</div>
									</td>
									<td>
										<div class=" ic-emp-info cursor">
											<img src="" alt="" class="emp-img">
											<li><span class="emp-info" id="emp-name">이름</span></li> <br>
											<li><span class="emp-info" id="emp-dept">부서</span></li> <br>
											<li><span class="emp-info" id="emp-rank">직급</span></li>
										</div>
									</td>
									
								</tr>							
							</th>
						
							
						</table>
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

		$('#dept_add').on('click', function() {
			modal2('add_dept_modal');
		});
		
		$('.emp-info').on('click', function() {
			// 모달창 띄우기
			modal('info_modal');
		});

		$('#delete_dept').on('click', function() {
			// 모달창 띄우기
			confirm("정말 삭제하시겠습니까?");
		});

		 $('#add').on('click', function() {
		 	var html = '<li><button class="edit_dept">부서</button><span></span></li>';
		 $('.tree').append(html);
		 $('#add_dept_modal').hide();
		 });

		$('.edit_dept').on('click', function() {
			// 모달창 띄우기
			modal2('edit_dept_modal');
		});

	
		
	</script>

	<!-- Modal div -->
	<div id="info_modal" class="modal-dragscroll">
		<h4 style="color: #477A8F;
		margin-bottom: 20px;
		font-size: 20px;">사원 정보</h4>
		<div class="n-emp-i">
			<div style="float: left;">
				<img src="" alt="" style="width: 110px; height: 120px;">
			</div>
			<div style=" margin-left:140px">
				<li style="margin-bottom: 6px;">사원명<span class="emp-info" 
				style="position: absolute; left: 265px;">이름</span></li> 
				<li style="margin-bottom: 6px;">부서
					<select name="rank" style="border: none; float: right;width: 100px; position: absolute;
					right: 78px; margin-top: 3px;   ">
						<option value="">부서 선택</option>
						<option value="기획부">기획부</option>
						<option value="ㅇㅇ부">ㅇㅇ부</option>
						<option value="ㅁㅁ부">ㅁㅁ부</option>
					</select>
			     </li> 
			
				<li style="margin-bottom: 6px;">직급
					<select name="rank" style="border: none; float: right;width: 100px; position: absolute;
					right: 78px; margin-top: 3px; ">
						<option value="">직급 선택</option>
						<option value="사장">사장</option>
						<option value="팀장">팀장</option>
						<option value="사원">사원</option>
						<option value="인턴">인턴</option>
					</select>
				</li> 
				<li style="margin-bottom: 6px;">사번<span class="emp-info" 
					style="position: absolute; left: 265px; font-size: 14px; margin-top:3px">1234</span></li> 
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
				style="background: #fff; color: #2c86dc; padding: 5px 27px 6px; border: 1px solid #c8c8c8">저장</button>
			<button
				style="padding: 5px 27px 6px; color: #444; letter-spacing: -1px; border: 1px solid #dadada; background: #dadada;">취소</button>
		</div>

		<a class="modal-close-btn cursor">X</a>
	</div>
    
</body>
</html>