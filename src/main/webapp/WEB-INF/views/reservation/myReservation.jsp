<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 예약 목록</title>
<c:import url="../common/header.jsp" />
<c:import url="../common/reservationSubNav.jsp" />
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">
</head>

<style>
#mrv_table {
	margin: 50px 0px 0px 0px;
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

#detail_modal {
	display: none;
	padding: 10px 60px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
}

#detail_modal .modal-close-btn {
	position: absolute;
	top: 10px;
	right: 10px;
}

#close_btn {
	
}

.close_btn {
	cursor: pointer;
}
</style>

<body>

	<div class="contents">
		<div class="contents-title">
			<span class="ct1">나의 예약 목록</span>
		</div>

		<div style="padding: 0px 30px 0px 30px;">
			<table id="mrv_table">
				<thead>
					<tr>
						<th>분류</th>
						<th>자원명</th>
						<th>예약시간</th>
						<th>반납 현황</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="list">
						<tr>
						
							<input type="hidden" id="rcTitle" name="rcTitle" value="${list.rcTitle}">
							<input type="hidden" id="rsTitle" name="rsTitle" value="${list.rsTitle}">
							<input type="hidden" id="rDate" name="rDate" value="${list.rDate}">
							<input type="hidden" id="starttime" name="starttime" value="${list.start_time }">
							<input type="hidden" id="endtime" name="endtime" value="${list.end_time}">
							<input type="hidden" id="rContent" name="rContent" value="${list.rContent}">
							<input type="hidden" id="rNo" name="rNo" value="${list.rNo}">
							<input type="hidden" id="rReturn" name="rReturn" value="${list.rReturn}">
							<td>${list.rcTitle}</td>
							<td>${list.rsTitle}</td>
							<td>${list.rDate}일   ${list.start_time }~ ${list.end_time}</td>
							<c:choose>
								<c:when test="${list.rReturn eq 'N' }">
								<td>미반납</td>
								</c:when>
								<c:when test="${list.rReturn eq 'Y' }">
								<td>반납</td>
								</c:when>
								<c:otherwise>
								<td>반납 불필요</td>
								</c:otherwise>
							</c:choose>
							<td><button class="rv_but" id="delete_btn">삭제</button> <span
								style="color: #e4e4e4;">|</span>
								<button class="rv_but detail_btn" id="detail_btn">상세보기</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<div id="delete_modal" class="modal-dragscroll">
		<h4 style="color: #477A8F; margin-bottom: 25px;">예약 취소</h4>
		<div class="n-emp-i">예약 삭제 하시겠습니까?</div>
		<div style="text-align: center; margin-top: 30px;">
			<input type="hidden" id="rNo3" >
			<input type="hidden" id="rDate3" >
			<input type="hidden" id="startTime3" >
			<input type="hidden" id="rReturn3" >
			<button class="close_btn" id="modal_delete_btn"
				style="background: #fff; color: #2c86dc; padding: 5px 27px 6px; border: 1px solid #c8c8c8">확인</button>
			<button class="close_btn"
				style="padding: 5px 27px 6px; color: #444; letter-spacing: -1px; border: 1px solid #dadada; background: #dadada;">취소</button>
		</div>
	</div>

	<div id="detail_modal" class="modal-dragscroll">
		<h4 style="color: #477A8F; margin-bottom: 25px;">상세 보기</h4>
		<div class="n-emp-i">
			<dl>
				<dt style="float: left;">
					<label>자원 이름</label>
				</dt>
				<dd style="margin-left: 150px;">
					<input type="text" id="rsTitle2" value="" readonly="readonly">
				</dd>
			</dl>
			<dl>
				<dt style="float: left;">
					<label>예약 날짜</label>
				</dt>
				<dd style="margin-left: 150px;">
					<input type="text" id="rDate2" value="" readonly="readonly">
				</dd>
			</dl>
			<dl>
				<dt style="float: left;">
					<label>예약 시간</label>
				</dt>
				<dd style="margin-left: 150px;">
					<input type="time" name="startTime2" id="startTime2"
						readonly="readonly"> ~ <input type="time" name="endTime2"
						id='endTime2' readonly="readonly">
				</dd>
			</dl>
			<dl>
				<dt style="float: left;">
					<label>사용 용도</label>
				</dt>
				<dd style="margin-left: 150px;">
					<input type="text" id="rContent2" readonly="readonly" style="width: 260px; height: 150px;">
				</dd>
			</dl>
		</div>
		<div style="text-align: center; margin-top: 50px;">
			<input type="hidden" id="rNo2" >
			<input type="hidden" id="rReturn2" >
			<button class="close_btn" id="returnbtn"
				style="background: #fff; color: #2c86dc; padding: 5px 27px 6px; border: 1px solid #c8c8c8">반납</button>
			<button class="close_btn"
				style="background: #fff; color: #2c86dc; padding: 5px 27px 6px; border: 1px solid #c8c8c8">확인</button>
		</div>
	</div>

	<script>
		function modal(id) {
			var zIndex = 9999;
			var modal = $('#' + id);

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
					.find('.close_btn').on('click', function() {
						bg.remove();
						modal.hide();
					});
		}

		$(document).on('click', '#delete_btn', function(){
			$("#rNo3").val($(event.target).parent().siblings()[6].value);
			$("#rDate3").val($(event.target).parent().siblings()[2].value);
			$("#startTime3").val($(event.target).parent().siblings()[3].value);
			$("#rReturn3").val($(event.target).parent().siblings()[7].value);
			modal('delete_modal');
		});
		
		$(document).on('click', '#detail_btn', function(){
			 $("#rsTitle2").val($(event.target).parent().siblings()[1].value);
			 $("#rDate2").val($(event.target).parent().siblings()[2].value);
			 $("#startTime2").val($(event.target).parent().siblings()[3].value);
			 $("#endTime2").val($(event.target).parent().siblings()[4].value);
			 $("#rContent2").val($(event.target).parent().siblings()[5].value);
			 $("#rNo2").val($(event.target).parent().siblings()[6].value);
			 $("#rReturn2").val($(event.target).parent().siblings()[7].value);
			modal('detail_modal');
		});
		
		$("#returnbtn").on("click",function(){
			var rReturn = $("#rReturn2").val();
			if(rReturn =='N'){
	    	 var rNo = $("#rNo2").val();
	     	document.location.href="reservationReturn.do?rNo="+rNo+"&rMember=${loginUser.id}";
			}else if(rReturn =='Y'){
				alert("이미 반납되었습니다.");
			}
		});
		
		$("#modal_delete_btn").on("click",function(){
			var rNo = $("#rNo3").val();
			var rReturn = $("#rReturn3").val();
	        var sd = $("#rDate3").val();
	        var sd2 = sd.split("-");
	        var sdt = $("#startTime3").val();
	        var sdt2 = sdt.split(':'); 
	        var sd3 = new Date(sd2[0],sd2[1]-1,sd2[2],sdt2[0],sdt2[1]);
	        var date = new Date();
			if(sd3 <= date ){
				alert("대여하기 전에만 삭제가 가능합니다.");
			}else {				
			location.href="reservationDelete.do?rNo="+rNo+"&rMember=${loginUser.id}";
			}
		});
	</script>
</body>
</html>