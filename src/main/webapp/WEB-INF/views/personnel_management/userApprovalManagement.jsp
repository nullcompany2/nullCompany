<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
	href="<c:url value="/resources/css/p_approvalmanage.css"/>">

</head>

<body>

<script>


function forMd(md_memNo){

	mdMemNo = md_memNo;
	console.log(mdMemNo);
	modal('accept_modal');
	detailMemberInfo();
};

function detailMemberInfo(){
	$.ajax({
		
		url : "detailMemberInfo_y.do",
		data : {memNo : mdMemNo},
		dataType: "json",
		success : function(data){
			console.log('data');
	
			$("#md_memNo").html(data.memNo);
			$("#md_name").html(data.name);
			$("#md_birth").html(data.birth);
			$("#md_email").html(data.id + "@nullcompany.com");
			$("#md_enrollDate").html(data.enrollDate);
			$("#md_phone").html(data.phone);
			$("#md_address").html(data.address);
			$("#md_rankName").val(data.rankName);
			$("#md_deptName").val(data.deptName);
			$("#md_myInfo").html(data.myInfo);
			$("#md_indiemail").html(data.email);
			
			
	
			$("#md_photo").attr('src',data.photo);

		
		},error: function(request,status,error){
			console.log(error);
		
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
					<span class="ct1">사용자 승인 관리</span>



				</div>

				<div id="mem_list_table">
					<table class="tg">
						<thead>
							<tr id="list_table_tr"
								style="height: 40px; background: #dfdfdf; color: #3b3b3b; border-top: #a7a7a7 solid 2px;">
								<th class="tg-0pky">이름</th>
								<th class="tg-0lax">ID</th>
								<th class="tg-0lax">신청일</th>
								<th class="tg-0lax">승인</th>


							</tr>
						</thead>
						<tbody>
						<c:if test="${!empty ApprovalList}">
							<c:forEach var="list" items="${ ApprovalList }" varStatus="vs">
							
								<tr id="list_table_tr_input">
									<td class="tg-0lax" id=${ list.name }><p>${ list.name }</p></td>
									<td class="tg-0lax"><p>${ list.id }</p></td>
									<td class="tg-0lax"><p>${ list.enrollDate }</p></td>
									<td class="tg-0lax"><button id="morebtn"
											onclick="forMd(${list.memNo})" class="forMd(${list.memNo})">승인
											대기</button></td>
								<tr>
							
							</c:forEach>
							</c:if>
							
							<c:if test="${empty ApprovalList}">
								<tr id="list_table_tr_input">
									<td class="tg-0lax" colspan="4"><p>승인 대기 중인 회원이 없습니다.</p></td>
								
								<tr>
							</c:if>
						</tbody>


					</table>

					<span
						style="font-size: 14px; position: absolute; left: 10%; top: 540px;">승인 대기자
						:  ${fn:length(ApprovalList)} 명</span> 
						
						<div>
			<table style="position: absolute;
    top: 535px;
    left: 535px;
    font-size: 14px;">
			<!-- 페이징처리 -->
			<tr align="center" height="20">
				<td colspan="6" align="center">
					<!-- [이전] --> <c:if test="${ pi.currentPage eq 1 }">
						이전 &nbsp;
					</c:if> <c:if test="${ pi.currentPage ne 1 }">
						<c:url var="before" value="userApprovalManagement.do">
							<c:param name="currentPage" value="${ pi.currentPage - 1 }" />
						</c:url>
						<a href="${ before }">이전</a> &nbsp;
					</c:if> <!-- 페이지 --> <c:forEach var="p" begin="${ pi.startPage }"
						end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<font color="#477A8F" size="3"><b>${ p }</b> </font>
						</c:if>

						<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination" value="userApprovalManagement.do">
								<c:param name="currentPage" value="${ p }" />
							</c:url>
							<a href="${ pagination }">${ p }</a> &nbsp;
						</c:if>
					</c:forEach> <!-- [다음] --> <c:if test="${ pi.currentPage eq pi.maxPage }">
						다음
					</c:if> <c:if test="${ pi.currentPage ne pi.maxPage }">
						<c:url var="after" value="userApprovalManagement.do">
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


	</div>


	<script>
	var mdMemNo;
	
		function modal(id) {
			var zIndex = 9999;
			var modal = $('#' + id);
			var btncolor = document.getElementById("accepttype");

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

				modal.css({
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
					.find('.modal-close-btn').on('click', function() {
						bg.remove();
						modal.hide();
					});

			/* 		// 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
					.find('#accept').on('click', function() {
						bg.remove();
						modal.hide();
						btncolor.style.backgroundColor = "#477A8F"
						$("#accepttype").text("승인 완료");

					}); */

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


		

		
	
	</script>
	
	
	<div id="accept_modal" class="modal-dragscroll">
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
				<li style="margin-bottom: 6px;">부서 <select name="dept"  id="selectDept"
					style="border: none; float: right; width: 100px; position: absolute; right: 78px; margin-top: 4px; margin-right: 10px;">

						<c:forEach var="deptselectlist" items="${ DeptList }" 
							varStatus="vs">
							<option class="selectDept" value="${ deptselectlist.deptNo }">${ deptselectlist.deptName }</option>
						</c:forEach>



				</select>
				</li>

				<li style="margin-bottom: 6px;">직급 <select name="rank" id="selectRank"
					style="border: none; float: right; width: 100px; position: absolute; right: 78px; margin-top: 4px; margin-right: 10px;">
						<c:forEach var="rankselectlist" items="${ RankList }"
							varStatus="vs">
							<option value="${ rankselectlist.rankNo }">${ rankselectlist.rankName }</option>
						</c:forEach>

				</select>
				</li>
				<li style="margin-bottom: 6px;">사번<span id="md_memNo"
					class="emp-info"
					style="position: absolute; left: 265px; font-size: 14px; margin-top: 3px">${list.memNo}</span></li>
			</div>
		</div>
		<div style="word-break: break-all; margin-top: 20px">
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
				style="background: #fff; color: #2c86dc; padding: 5px 27px 6px; border: 1px solid #c8c8c8">승인</button>
			<button class="modal-close-btn cursor"
				style="padding: 5px 27px 6px; color: #444; letter-spacing: -1px; border: 1px solid #dadada; background: #dadada;">취소</button>
		</div>

		<a style="position: absolute;
	top: 10px;
	right: 10px;" class="modal-close-btn cursor">X</a>
	</div>
	
	<script>
	$(document).on("click", "#accept", function(event){
		var sel_rank = $("#selectRank option:selected").val();
		var sel_dept = $("#selectDept option:selected").val();
		var md_memNo = $("#md_memNo").text();
		
	    if(sel_rank== 0){
        	alert("회원 승인 시 직급 선택은 필수 입니다.");
        	 return false;
        }
	    
	    if(sel_dept== 0){
        	alert("회원 승인 시 부서 선택은 필수 입니다.");
        	 return false;
        }
		
		$.ajax({
			url:"updateacceptMember.do",
			type:"post",
			data:{
				lankNo : sel_rank,
            	deptNo : sel_dept,
            	memNo : md_memNo,
			},
			success:function(data){
				console.log(data);
				location.reload();
			},error: function(request,status,error){
				console.log(request);
		}
			})
		});
	
	function acceptemail() {
		var email_address = $("#md_email").text();
		var md_memNo = $("#md_memNo").text();
		
		
	
		$.ajax({
			url:"aprrovalEmail.do",
			type:"post",
			data:{
				email_address : email_address,
            	memNo : md_memNo,
			},
			success:function(data){
				console.log(data);
				location.reload();
			},error: function(request,status,error){
				console.log(error);
		}
			})
	}
	</script>

	
<style>
#accept_modal {
	display: none;
	width: 450px;
	height: 520px;
	padding: 20px 60px;
	background-color: #fefefe;
	border-radius: 3px;
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




</body>
</html>