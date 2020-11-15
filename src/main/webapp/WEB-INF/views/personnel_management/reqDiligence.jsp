<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/resources/css/req-diligence.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/css/younsu-subNavi.css"/>">

</head>

<body>
	
    <div id='wrap'>
    	<c:import url="../common/header.jsp"/>
		
		<div class="container" >
			<!-- 전체높이지정용 -->
			<div id="drag-wrap">
                <div id="drag"></div>
			</div>
			<!--  -->
			<!-- 세부 네비 시작 -->
			<c:import url="../common/personnelSubNavi.jsp"/>
			<!-- 세부 네비끝 -->
			<!-- 내부 컨텐츠 -->

			<div class="contents">
				<!-- 컨텐츠 타이틀명 -->
				<div class="contents-title">
					<span class="ct1">근태 수정요청</span>
				</div>
				<!-- ---- -->
				<div class="contents-wrap drag-scrollbar">
					<form action="modificationDiligence.do" method="post" enctype="multipart/form-data">
						<div class="c-ic">
							<h5>
							 지각 선택시 입력한 요청시간은 출근시간이 변경되며,<br>
							 비정상퇴근은 퇴근시간,<br>
							 결근은 출근시간이 변경되고 퇴근시간은 자동으로 정상퇴근처리됩니다.</h5><br>
							<h5>※수정 승인시 해당 근태기록은 수정됨으로 변경됨을 알려드립니다.</h5>
							<h5>※파일 업로드시 반드시 파일명은 사원명/사번으로 올려주시기바랍니다.</h5>
							<table class="req-table" id="statistics-tbl">
								<tr class="req-tbl-il">
									<th class="req-tbl-th" >신청자</th>
									<td class="req-tbl-td" > ${loginUser.name }</td>
								</tr>
								<tr class="req-tbl-il">
									<th class="req-tbl-th">요청날짜</th>
									<fmt:formatDate var="reqDate" value="${record.dateDiligence }" pattern="yyyy/MM/dd"/>
									<td class="req-tbl-td">${ reqDate }</td>
								</tr>
								<tr class="req-tbl-il">
									<th class="req-tbl-th">종류</th>
									<td class="req-tbl-td">
										<select name="d-type" id="d-type" class="req-sel">
											<option value="지각">지각</option>
											<option value="비정상퇴근">비정상퇴근(미체크)</option>
											<option value="결근">결근</option>
										</select>
									</td>
								</tr> 
								<tr class="req-tbl-il">
									<th class="req-tbl-th">기존 시간 및 상태</th>
									<td class="req-tbl-td">
										<c:choose>
											<c:when test="${record.statusDiligence ne '결근' }">
												<c:choose>
													<c:when test="${record.timeExit ne 'null' }">
														<span> 출근 : ${ record.timeEnter }</span>
														-<span> 퇴근 : ${ record.timeExit } / </span>												
													</c:when>
													<c:otherwise>
														<span> 출근 : ${ record.timeEnter }</span>
														-<span> 퇴근 : 미체크 /</span>
													</c:otherwise>
												</c:choose>
											</c:when>
										</c:choose>
										<span id="rsd">${ record.statusDiligence }</span>
									</td>
								</tr> 
								                        
								<tr class="req-tbl-il">
									<th class="req-tbl-th">사유</th>
									<td class="req-tbl-td">
										<input type="text" name="reasonMod" style="width: 70%; ">
										
									</td>
								</tr> 
							</table>
							
							<div style="
								border: dotted;
								width: 60%;
								margin-top: 50px;
								padding: 10px;"
							>
								<input type="file" name="uploadFile" >
							</div>
							<input type="hidden" name="noMod" value="${record.noDiligence }"/>
							<input type="hidden" name="memNo" value="${ record.memNo }"/>
							<input type="hidden" name="name" value="${loginUser.name }"/>
							<input type="hidden" name="id" value="${loginUser.id }"/>
							<input type="hidden" name="dateMod" value="${reqDate }"/>
							<input type="hidden" name="statusMod" value="${record.statusDiligence }"/>
							<button class="req-btn cursor" style="margin-top: 20px; margin-left:0px">요청하기</button>
						</div>
					</form>
				</div>
				
			</div>
		</div>
		<script >
			$(function(){
				var status = $("#rsd").text();
				switch(status){
				case '지각' :  $("#d-type").val('지각'); break;
				case '비정상퇴근' : $("#d-type").val('비정상퇴근'); break;
				case '결근' :  $("#d-type").val('결근'); break;
				}
			});
		</script>
	</div>
		
	
</body>
</html>