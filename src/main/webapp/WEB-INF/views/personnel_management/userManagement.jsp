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
	href="<c:url value="/resources/css/p_usermanage.css"/>">

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
					<span class="ct1">사용자 관리</span>

					<form action=""
						style="float: right; position: absolute; right: 100px; top: 10px;">
						<select name="search"
							style="border-radius: 8px; border: #676767 solid 1px; margin-right: 3px;">
							<option value="이름">이름</option>
							<option value="ID">ID</option>
						</select> <input type="text" name="" id="" class="search-emp"
							placeholder="&nbsp; 이름, ID 검색"
							style="border-radius: 8px; border: #676767 solid 1px;">&nbsp;&nbsp;
						<button class="search-btn cursor"
							style="border: none; background: none;">검색</button>
					</form>


				</div>

				<div id="mem_list_table">
					<table class="tg" style="border-spacing: 1px;">
						<thead>
							<tr id="list_table_tr"
								style="height: 40px; background: #dfdfdf; color: #3b3b3b; border-top: #a7a7a7 solid 2px;">
								<th class="tg-0pky">사번</th>
								<th class="tg-0lax">이름</th>
								<th class="tg-0lax">ID</th>
								<th class="tg-0lax">사내전화</th>
								<th class="tg-0lax">휴대전화</th>
								<th class="tg-0lax">부서</th>
								<th class="tg-0lax">직위</th>

							</tr>
						</thead>
						
						<c:if test="${!empty list}">
							<c:forEach var="list" items="${ list }" varStatus="vs">
								<tbody>
									<tr id="list_table_tr_input">
										<td class="tg-0lax"><a>${ list.memNo }</a></td>
										<td class="tg-0lax"><a>${ list.name }</a></td>
										<td class="tg-0lax"><a>${ list.id }</a></td>
										<td class="tg-0lax"><a>${ list.email }</a></td>
										<td class="tg-0lax"><a>${ list.phone }</a></td>
										<td class="tg-0lax"><a>${ list.deptName }부</a></td>
										<td class="tg-0lax"><a>${ list.rankName }</a></td>
									</tr>
								</tbody>
							</c:forEach>
						</c:if>

					</table>

					<span style="font-size: 14px;">소속원 수 : 10명</span> 
		
		<div>
			<table style=" margin: 10px 0px 0px 80px; width: 80%; border-collapse: collapse">
			<!-- 페이징처리 -->
			<tr align="center" height="20">
				<td colspan="6" align="center">
					<!-- [이전] --> <c:if test="${ pi.currentPage eq 1 }">
						이전 &nbsp;
					</c:if> <c:if test="${ pi.currentPage ne 1 }">
						<c:url var="before" value="userManagement.do">
							<c:param name="currentPage" value="${ pi.currentPage - 1 }" />
						</c:url>
						<a href="${ before }">이전</a> &nbsp;
					</c:if> <!-- 페이지 --> <c:forEach var="p" begin="${ pi.startPage }"
						end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<font color="#477A8F" size="3"><b>${ p }</b> </font>
						</c:if>

						<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination" value="userManagement.do">
								<c:param name="currentPage" value="${ p }" />
							</c:url>
							<a href="${ pagination }">${ p }</a> &nbsp;
						</c:if>
					</c:forEach> <!-- [다음] --> <c:if test="${ pi.currentPage eq pi.maxPage }">
						다음
					</c:if> <c:if test="${ pi.currentPage ne pi.maxPage }">
						<c:url var="after" value="userManagement.do">
							<c:param name="currentPage" value="${ pi.currentPage + 1 }" />
						</c:url>
						<a href="${ after }">다음</a>
					</c:if>
					</td>
			</tr>
		</table>
				</div>
			</div>

		</div>
	</div>

	</div>
	<!-- Modal -->




	<!-- Modal div -->
	<div id="info_modal" class="modal-dragscroll">
		<h4 style="color: #477A8F; margin-bottom: 20px; font-size: 20px;">사원
			정보</h4>
		<div class="n-emp-i">
			<div style="float: left;">
				<img src="" alt="" style="width: 110px; height: 120px;">
			</div>
			<div style="margin-left: 140px">
				<li style="margin-bottom: 6px;">사원명<span class="emp-info"
					style="position: absolute; left: 265px;">이름</span></li>
				<li style="margin-bottom: 6px;">부서 <span
					style="border: none; float: right; width: 100px; position: absolute; right: 78px; margin-right: 6px; font-size: 15px;">영업부

				</span>
				</li>

				<li style="margin-bottom: 6px;">직급 <span
					style="border: none; float: right; width: 100px; position: absolute; right: 78px; margin-right: 6px; font-size: 15px;">사장

				</span>
				</li>
				<li style="margin-bottom: 6px;">사번<span class="emp-info"
					style="position: absolute; left: 265px; font-size: 14px; margin-top: 2px;">
						1234</span></li>
			</div>
		</div>
		<div style="word-break: break-all; margin-top: 20px">
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

		<div style="text-align: center; margin-top: 40px;">
			<button class="edituser"
				style="background: #fff; color: #2c86dc; padding: 5px 27px 6px; border: 1px solid #c8c8c8">수정</button>
			<button
				style="padding: 5px 27px 6px; color: #444; letter-spacing: -1px; border: 1px solid #dadada; background: #dadada;">취소</button>
		</div>

		<a class="modal-close-btn cursor">X</a>
	</div>




	<!-- user edit modal -->

	<div id="edituser_modal" class="modal-dragscroll">
		<h4
			style="font-size: 23px; margin-bottom: 15px; margin-top: 30px; margin-left: 30px; color: #477A8f;">사원
			정보 수정</h4>

		<div style="margin-left: 30px; margin-bottom: 20px;">
			<table style="width: 550px; height: 565px;">
				<tr id="info-name">
					<th class="tl">이름</th>
					<td class="ts"><span>Han</span></td>
				</tr>
				<tr id="info-pwd">
					<th class="tl">비밀번호</th>
					<td class="ts"><input type="text" name="" id=""></td>
				</tr>
				<tr id="info-pwdcheck">
					<th class="tl">비밀번호 확인</th>
					<td class="ts"><input type="text" name="" id=""></td>
				</tr>
				<tr id="info-dept">
					<th class="tl">부서</th>
					<td class="ts"><select name="dept"
						style="border: none; width: 100px;">
							<option value="">부서 선택</option>
							<option value="기획부">기획부</option>
							<option value="ㅇㅇ부">ㅇㅇ부</option>
							<option value="ㅁㅁ부">ㅁㅁ부</option>
					</select></td>
				</tr>
				<tr id="info-rank">
					<th class="tl">직급</th>
					<td class="ts"><select name="rank"
						style="border: none; width: 100px;">
							<option value="">직급 선택</option>
							<option value="사장">사장</option>
							<option value="팀장">팀장</option>
							<option value="사원">사원</option>
							<option value="인턴">인턴</option>
					</select></td>


				</tr>
				<tr id="info-phone">
					<th class="tl"><img src="../../resources/images/lock-info.jpg"
						alt="" style="width: 30px; position: absolute; left: 40px;">
						휴대전화</th>
					<td class="ts"><input type="text" name="" id=""> <input
						type="checkbox" name="" id="s-phone" class="secret-info">
						<label for="s-phone" class="s-t">비공개</label></td>

				</tr>
				<tr id="info-email">
					<th class="tl">이메일</th>
					<td class="ts"><input type="text" name="" id=""></td>
				</tr>
				<tr id="info-personal-email">
					<th class="tl"><img src="../../resources/images/lock-info.jpg"
						alt="" style="width: 30px; position: absolute; left: 40px;">
						개인이메일</th>
					<td class="ts"><input type="text" name="" id=""> <input
						type="checkbox" name="" id="s-email" class="secret-info">
						<label for="s-email" class="s-t">비공개</label></td>
				</tr>
				<tr id="info-mem-no">
					<th class="tl">사번</th>
					<td class="ts"><span>2</span></td>
				</tr>
				<tr id="info-enrolldate">
					<th class="tl">입사일</th>
					<td class="ts"><span>2019-12-28</span></td>
				</tr>
				<tr id="info-birth">
					<th class="tl"><img src="../../resources/images/lock-info.jpg"
						alt="" style="width: 30px; position: absolute; left: 40px;">
						생년월일</th>
					<td class="ts"><input type="date" name="" id=""> <input
						type="checkbox" name="" id="s-birth" class="secret-info">
						<label for="s-birth" class="s-t">비공개</label></td>
				</tr>
				<tr id="info-address">
					<th class="tl"><img src="../../resources/images/lock-info.jpg"
						alt="" style="width: 30px;"> 주소</th>

					<td class="ts" id="zip">우편번호 : <input type="text" name="zip"
						style="width: 80px; height: 20px;" /> <a class="save-btn"
						onclick="openZipSearch()">검색</a> <br> 주소 : <input type="text"
						name="addr1" style="width: 300px; height: 20px;" readonly /><br>
						상세 : <input type="text" name="addr2"
						style="width: 300px; height: 20px;" /> <input type="checkbox"
						name="" id="s-address" class="secret-info"> <label
						for="s-address" class="s-t">비공개</label>

					</td>
				</tr>
				<tr>

				</tr>
			</table>
			<!-- save btn -->

		</div>




		<div style="text-align: center; margin-top: -27px;">
			<button id="edituser"
				style="background: #fff; color: #2c86dc; padding: 5px 27px 6px; border: 1px solid #c8c8c8">수정</button>
			<button
				style="padding: 5px 27px 6px; color: #444; letter-spacing: -1px; border: 1px solid #dadada; background: #dadada;">취소</button>
		</div>


		<a class="modal-close-btn cursor">X</a>
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
				backgroundColor: 'rgba(0,0,0,0.0)'
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
		

		$('.tg-0lax a').on('click', function() {
			// 모달창 띄우기
			modal2('info_modal');
		
		});
	
		$('.edituser').on('click', function() {
			// 모달창 띄우기
			modal2('edituser_modal');
	
			
			
		});
		
	

	
		
	</script>
</body>
</html>