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


		// 모달창 info
		
		function forMd(md_memNo){
			mdMemNo = md_memNo;
			console.log(mdMemNo);
			modal('info_modal');
			detailMemberInfo();
		};
		
		function detailMemberInfo(){
			$.ajax({
				
				url : "detailMemberInfo.do",
				data : {memNo : mdMemNo},
				dataType: "json",
				success : function(data){
					console.log(data);
					$("#md_memNo").html(data.memNo);
					$("#md_name").html(data.name);
					$("#md_birth").html(data.birth);
					$("#md_email").html(data.id + "@nullcompany.com");
					$("#md_enrollDate").html(data.enrollDate);
					$("#md_phone").html(data.phone);
					$("#md_address").html(data.address);
					$("#md_rankName").html(data.rankName);
					console.log(data.rankName);
					$("#md_deptName").html(data.deptName + '부');
					$("#md_myInfo").html(data.myInfo);
					$("#md_indiemail").html(data.email);
					
					
			
					$("#md_photo").attr('src',data.photo);
	
				
				},error: function(request,status,error){
					console.log(request);
				
				}

				})
			};
	

	
		
	</script>

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
						<select  id="search_option" name="search" 
							style="border-radius: 8px; border: #676767 solid 1px; margin-right: 3px;">
							<option value="이름">이름</option>
							<option value="ID">ID</option>
						</select> 
						<input type="text" name="" id="search_text" class="search-emp"
							placeholder="&nbsp; 이름, ID 검색"
							style="border-radius: 8px; border: #676767 solid 1px;">&nbsp;&nbsp;
						<a id="searchbtn" class="search-btn cursor"
							style="border: none; background: none;">검색</a>
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
								<th class="tg-0lax">이메일</th>
								<th class="tg-0lax">휴대전화</th>
								<th class="tg-0lax">부서</th>
								<th class="tg-0lax">직위</th>

							</tr>
						</thead>
				<c:choose>
				    <c:when test="${!empty list }">
							<c:forEach var="list" items="${ list }">
								<tbody onclick='forMd(${list.memNo})'>
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
								</table>

					<div>
						<table
							style="position: absolute; top: 535px; left: 535px; font-size: 14px;">
							<!-- 페이징처리 -->
							<tr align="center" height="20">
								<td colspan="6" align="center">
									<!-- [이전] --> <c:if test="${ pi.currentPage eq 1 }">
						이전 &nbsp;
					</c:if> <c:if test="${ pi.currentPage ne 1 }">
										<c:url var="before" value="userManagermentSearch.do">
											<c:param name="currentPage" value="${ pi.currentPage - 1 }" />
										</c:url>
										<a href="${ before }">이전</a> &nbsp;
					</c:if> <!-- 페이지 --> <c:forEach var="p" begin="${ pi.startPage }"
										end="${ pi.endPage }">
										<c:if test="${ p eq pi.currentPage }">
											<font color="#477A8F" size="3"><b>${ p }</b> </font>
										</c:if>

										<c:if test="${ p ne pi.currentPage }">
											<c:url var="pagination" value="userManagermentSearch.do">
												<c:param name="currentPage" value="${ p }" />
											</c:url>
											<a href="${ pagination }">${ p }</a> &nbsp;
						</c:if>
									</c:forEach> <!-- [다음] --> <c:if test="${ pi.currentPage eq pi.maxPage }">
						다음
					</c:if> <c:if test="${ pi.currentPage ne pi.maxPage }">
										<c:url var="after" value="userManagermentSearch.do">
											<c:param name="currentPage" value="${ pi.currentPage + 1 }" />
										</c:url>
										<a href="${ after }">다음</a>
									</c:if>
								</td>
							</tr>
						</table>
					</div>
					   
					  </c:when>
						
						
						
						
						<c:when test="${empty list }">
								<tr id="list_table_tr_input">
									<td class="tg-0lax" colspan="7" style="text-align: center;"><p>검색 내용이 없습니다.</p></td>
								<tr>
						</c:when>
						
							
					
					    
					   </c:choose>

					

					
		
		
			</div>

		</div>
	</div>

	</div>
	<!-- Modal -->

<style>
.n-emp-i {
	width: 100%;
	height: 30%;
}

dd {
    display: block;
    margin-inline-start: 40px;
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
	<div id="info_modal" class="modal-dragscroll">
		
		<h4 style="color: #477A8F; margin-bottom: 20px; font-size: 20px;">사원
			정보</h4>
		<div class="n-emp-i">
			<div style="float: left;">
				<img id="md_photo" src="" alt=""
					style="width: 110px; height: 120px;">
			</div>

		<div style="margin-left: 140px">
				<li style="margin-bottom: 6px;">사원명<span id="md_name"
					class="emp-info" style="position: absolute; left: 265px;">-</span></li>
				<li style="margin-bottom: 6px;">직급<span id="md_rankName"
					class="emp-info" style="position: absolute; left: 265px;">-</span></li>

				<li style="margin-bottom: 6px;">부서<span id="md_deptName"
					class="emp-info" style="position: absolute; left: 265px;">-</span></li>

				<li style="margin-bottom: 6px;">사번<span id="md_memNo"
					class="emp-info"
					style="position: absolute; left: 265px; font-size: 14px; margin-top: 3px"><span></li>
			</div>
		<div id="info_dl" style="word-break: break-all; margin-top: 40px">
			<dl style="margin-top: -20px;">
				<dt style="float: left;">휴대전화</dt>
				<dd style="margin-left: 150px;" id="md_phone">010-0000-0000</dd>
				<dt style="float: left;">이메일</dt>
				<dd style="margin-left: 150px;" id="md_email">00000000</dd>
				<dt style="float: left;">입사일</dt>
				<dd style="margin-left: 150px;" id="md_enrollDate">00000000</dd>
				<dt style="float: left;">개인이메일</dt>
				<dd style="margin-left: 150px;" id="md_indiemail">00000000</dd>
				<dt style="float: left;">생년월일</dt>
				<dd style="margin-left: 150px;" id="md_birth">00000000</dd>
				<dt style="float: left;">주소</dt>
				<dd style="margin-left: 150px;" id="md_address">00000000</dd>

			</dl>

		</div>


		<div style="text-align: center; margin-top: 30px;">
			<button id="accept" onclick="acceptemail();"
				style="background: #fff; color: #2c86dc; padding: 5px 27px 6px; border: 1px solid #c8c8c8">수정</button>
			<button  class="modal-close-btn cursor"
				style="padding: 5px 27px 6px; color: #444; letter-spacing: -1px; border: 1px solid #dadada; background: #dadada;">취소</button>
		</div>

	</div>
	</div>

<script>
// 검색
$("#searchbtn").on('click',function () {
var text = $("#search_text").val();

if(text == ''){
	 alert("검색 내용을 입력해주세요.")
	 return false;}

var select_option = $("#search_option option:selected").val();
document.location.href='userManagermentSearch.do?text='+text+'&select_option='+select_option;	


})
</script>

	
</body>
</html>