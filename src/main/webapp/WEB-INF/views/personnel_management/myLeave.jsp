<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>




<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	

	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<link rel="stylesheet" href="<c:url value="/resources/css/myLeave.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/css/younsu-subNavi.css"/>">

</head>

<body>

    <div id='wrap'>
		<!-- 헤더 -->
		<c:import url="../common/header.jsp"/>
		
		<!-- container -->
		<div class="container">
			<!-- 전체높이지정용 -->
			<div id="drag-wrap">
                <div id="drag"></div>
			</div>
			<!--  -->
			<!-- 세부 네비 시작 -->
			<c:import url="../common/personnelSubNavi.jsp"/>
			<!-- 세부 네비끝 -->
			
			<!-- 컨텐츠 -->
			<div class="contents">
				<!-- 컨텐츠 타이틀명 -->
				<div class="contents-title">
					<span class="ct1">휴가 현황</span>
				</div>
				<!-- 컨텐츠 -->				
	<c:set var="totalLeaveCount" value="${annualLeave}" scope="application"/>
	
				<div class="contents-wrap drag-scrollbar">
					<div class="ic-navi">
						<div onclick="location.href='myLeave.do'" class="cate cursor" id="myleave" style="color: #477A8F;">내 휴가</div>
						<div onclick="location.href='leaveCalendar.do'" class="cate cursor" id="calendar">휴가 캘린더</div>
					</div>
					
					<div id="show-myleave" class="c-ic">
						<h4 style="font-weight:normal;">휴가 생성내역(<span>${ createDate }</span>~<span>${ endDate }</span>)</h4>
						<h5 style="font-weight:normal;">입사일 : (<span>${loginUser.enrollDate }</span>)</h5>
						<table class="l-table" id="myleave-tbl">
							<thead style="background: #e8ecee;">
								<tr>
									<th scope="col" rowspan="2" class="tl">생성일</th>
									<th scope="col" colspan="2" class="tl">생성 내역</th>
									<th scope="col" rowspan="2" class="tl">내용</th>
									<th scope="col" rowspan="2" class="tl">비고</th>
								</tr>
								<tr>
									<th scope="col" class="ts">발생</th>
									<th scope="col" class="ts">최종</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="ta">${ createDate }</td>
									<td class="ta">${ annualLeave }</td>			
									<td class="ta">${ totalLeaveCount }</td>
									<td class="ta">정기 휴가</td>
									<td class="ta">금년발생일(${annualLeave}), 최종연차(${totalLeaveCount }) / ${loginUser.id }</td>
								</tr>
								<c:set var="totalL" value="${annualLeave }"/>
								<c:forEach var="rlist" items="${createdReward }">
								<tr>
									<fmt:formatDate value="${rlist.createDate }" var="createDate" pattern="yyyy-MM-dd"/>
									<td class="ta">${ createDate }</td>
									<td class="ta">${ rlist.rewardDays }</td>
									<c:set var="totalL" value="${totalL + rlist.rewardDays }"/>			
									<td class="ta">${ totalL }</td>
									<td class="ta">포상 휴가</td>
									<td class="ta">금년발생일(${rlist.rewardDays}), 최종연차(${totalL }) / ${loginUser.id }</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						<h5 style="font-weight:normal;">
						올해 휴가 현황 : 총 휴가 <span>${totalLeaveCount }</span>일 / 사용 <span>${totalUsedLeave }</span>일
						 / 잔여 (정기<span>${annualLeave - usedAnnualLeave }</span>일, 포상 <span>${rewardLeave - usedRewardLeave }</span>일)</h5>
	
						<!-- 1-2 -->
						<h4 style="margin-top: 150px; font-weight: normal;">휴가 신청 내역</h4>
						<table class="r-table" id="application-record">
							<thead style="background: #e8ecee;">
								<tr>
									<th scope="col" rowspan="2" class="tr">문서 번호</th>
									<th scope="col" rowspan="2" class="tr">신청자</th>
									<th scope="col" rowspan="2" class="tr">휴가 종류</th>
									<th scope="col" rowspan="2" class="tr">일수</th>
									<th scope="col" rowspan="2" class="tr">기간</th>
									<th scope="col" rowspan="2" class="tr">상태</th>
									<th scope="col" rowspan="2" class="tr">상세</th>
								</tr>
							</thead>
							<tbody id="outputPoint">
							<c:forEach var="mix" items="${mixLeave }">
								<tr>
									<td class="ta">${mix.noRecord}</td>
									<td class="ta">${loginUser.name }</td>
									<td class="ta" id="typeName">${mix.nameType}</td>
									<td class="ta">${mix.useDays}</td>
									
									<fmt:formatDate var="ad" value="${mix.applyDate}" pattern="yyyy-MM-dd" />
									<c:set var="kj" value="${fn:replace(ad, '-', '')}"/>

									
									<fmt:parseNumber var="chNum" value="${kj}" integerOnly="ture"/>
									<fmt:parseNumber var="until" value="${kj + mix.useDays }" integerOnly="ture"/>
									
									<td class="ta">${ad }~(${mix.useDays })일</td>
									<td class="ta">${mix.status }</td>
									<td class="ta"><a href="#" onclick="forModal(${mix.noRecord})" class="cursor" style="color: #477A8F;">상세</a></td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
						<h5 style="font-weight:normal;">당해 간략 통계 : 
						<c:forEach var="typeLeave" items="${typeUsedLeave}">
							<span>${typeLeave.tName}(${typeLeave.num }) </span>
						</c:forEach>
						</h5>
					</div>	
				</div>
				
			</div>
			<!--  -->
		</div>
		<script >
		</script>
		
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
				.find('.md-btn-close')
				.on('click', function() {
					bg.remove();
					modal.hide();
				});
				
		}
		
		function forModal(noRecord){
			// 모달창 띄우기
			modal('my_modal');
			detailRecordLeave(noRecord);
		};
		
		function detailRecordLeave(noRecord){
			console.log(noRecord)
			$.ajax({
				url : "detailRecordLeave.do",
				data : {noRecord : noRecord},
				datatype : "json",
				success : function(data){
					console.log(data)
					$("#requestedDate").html(data.requestedDate);
					$("#status").html(data.status);
					$("#nameType").html(data.nameType);
					$("#useDays").html(data.useDays);
					$("#term").html(data.applyDate + " ~ (" + data.useDays + ")일");
					$("#reason").html(data.reason);
					
				},
				error: function(request,status,error){
					console.log(request);
					console.log(status);
					console.log(error);
				}
				
			})
		}
		
	</script>
		<style>
			#my_modal {
				display: none;
				width: 700px;
				height: 550px;
				padding: 20px 60px;
				background-color: #fefefe;
				border: 1px solid #888;
				border-radius: 3px;
			}
	
			#my_modal .modal-close-btn {
				position: absolute;
				top: 10px;
				right: 10px;
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
			.md-tbl{
				width: 100%;
				border-top: solid 0.1px #477A8F;
				border-bottom: solid 0.1px #477A8F;
				border-collapse:collapse;
			}
			.md-tbl-il,
			.md-tbl-th,
			.md-tbl.td{
				width: 100%;
				border-top: solid 0.1px #477A8F;
				border-bottom: solid 0.1px #477A8F;
				border-collapse:collapse;
			}
			.md-tbl-th{
				width: 100px;
				height: 50px;
				background: #e8ecee;
				text-align: center;
				font-weight: normal;
			}
			.md-tbl-td{
				padding: 5px;
				width: 200px;
				text-align: left;
			}
			.md-btn{
				font-size: 17px;
				border: none;
				background-color: white;
				border-bottom: solid 0.1px #477A8F;
				border-bottom-right-radius: 2px;
				border-bottom-left-radius: 2px;
			}
		</style>
	<!-- Modal div -->
	<div id="my_modal" class="modal-dragscroll">
		<h4 style="color: #477A8F; margin-bottom: 30px;">휴가 신청 상세</h4>
		<table class="md-tbl">
			<tr class="md-tbl-il">
				<th class="md-tbl-th">신청일시</th>
				<td class="md-tbl-td" id="requestedDate">-</td>
				<th class="md-tbl-th">상태</th>
				<td class="md-tbl-td" id="status">-</td>
			</tr>
			<tr class="md-tbl-il">
				<th class="md-tbl-th">사용자 이름</th>
				<td class="md-tbl-td">${loginUser.name }</td>
				<th class="md-tbl-th">사용자 사번</th>
				<td class="md-tbl-td">${loginUser.memNo }</td>
			</tr>
			<tr class="md-tbl-il">
				<th class="md-tbl-th">소속</th>
				<td class="md-tbl-td" colspan="3">${loginUser.deptName }</td>
			</tr>
			<tr class="md-tbl-il">
				<th class="md-tbl-th">종류</th>
				<td class="md-tbl-td" id="nameType">-</td>
				<th class="md-tbl-th">일수</th>
				<td class="md-tbl-td" id="useDays">-</td>
			</tr>
			<tr class="md-tbl-il">
				<th class="md-tbl-th">기간</th>
				<td class="md-tbl-td" colspan="3" id="term">-</td>
			</tr>
			<tr class="md-tbl-il">
				<th class="md-tbl-th">사유</th>
				<td class="md-tbl-td" colspan="3" id="reason">-</td>
			</tr>
			<tr class="md-tbl-il">
				<th class="md-tbl-th">의견</th>
				<td class="md-tbl-td" colspan="3">----</td>
				
			</tr>
		</table>
		<div style="text-align: center; margin-top: 50px;">
			<span class="md-btn cursor md-btn-close" >닫기</span>
		</div>

		<a class="modal-close-btn cursor md-btn-close">X</a>
	</div>
    
</body>
</html>