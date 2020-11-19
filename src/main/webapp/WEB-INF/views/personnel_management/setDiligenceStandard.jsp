<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.kh.nullcompany.personnelManagement.model.vo.SetAttendance"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/resources/css/set-diligence-standard.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/css/younsu-subNavi.css"/>">

</head>

<script>
	$(function(){
		for(var i =0; i<7; i++){
			console.log($("#"+i).val());
			if($("#"+i).val() == "Y"){
				console.log("확인");
				switch(i){
				case 0 : $("#SUN").attr("checked",true); break;
				case 1 : $("#MON").attr("checked",true); break;
				case 2 : $("#TUE").attr("checked",true); break;
				case 3 : $("#WED").attr("checked",true); break;
				case 4 : $("#THU").attr("checked",true); break;
				case 5 : $("#FRI").attr("checked",true); break;
				case 6 : $("#SAT").attr("checked",true); break;
				}
			}
		}
		
		$("#timeA").val($("#TAttendance").val());
		$("#timeO").val($("#TOffwork").val());

	});
	
	function saveBtn(){
		var setDate = new Array();
		var sDate = "";
		var eDate = "";
		for(var i =0; i<7; i++){
			if($("input:checkbox[name="+i+"]").is(":checked") == true){
				setDate.push('Y');
			}else{
				setDate.push('N');
			}			
		}
		sDate = $("#timeA").val();
		eDate = $("#timeO").val();
		
		console.log(setDate + "/" + sDate + "/" + eDate);
		location.href="setDiligenceStandard.do?setDate="+setDate+"&sDate="+sDate+"&eDate="+eDate;
	}

</script>

<body>
	<c:forEach var="set" items="${settingArr }">
		<input type="hidden" value="${set.dayAvailable }" id="${set.noDay }"/>
	</c:forEach>
		<input type="hidden" value="${settingArr[1].timeAttendance }" id="TAttendance"/>
		<input type="hidden" value="${settingArr[1].timeOffWork }" id="TOffwork"/>
	
    <div id='wrap'>
		<c:import url="../common/header.jsp"/>
		<div class="container">
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
					<span class="ct1">근태 기본 설정</span>
				</div>
				<!-- ---- -->
				<div class="contents-wrap drag-scrollbar">
					<div id="set-diligence-standard" class="c-ic">
						<form action="">
							<table class="set-d-tbl">
								<tbody>
									<tr style="border-bottom: solid 0.1px #477A8F ;">
										<th scope="row" style="background: #e8ecee;padding: 10px;">기본 근태</th>
										<td style="padding: 10px; float: left;">
											<span>출근일 및 출퇴근 시간 설정</span>
										</td>
									</tr>
									<tr>
										<th scope="row" style="background: #e8ecee; padding: 10px;" ></th>
										<td >
											<div class="set-d set-d-1">
												
												<input type="checkbox" name="1" id="MON" ><label for="mon">월</label>
												<input type="checkbox" name="2" id="TUE" ><label for="tue">화</label>
												<input type="checkbox" name="3" id="WED" ><label for="web">수</label>
												<input type="checkbox" name="4" id="THU" ><label for="thu">목</label>
												<input type="checkbox" name="5" id="FRI" ><label for="fri">금</label>
												<input type="checkbox" name="6" id="SAT"><label for="sat">토</label>
												<input type="checkbox" name="0" id="SUN"><label for="sun">일</label>
											</div>
											<div class="set-d set-d-2">
												<div class="sw-time">
													출근
													<input type="time" name="" id="timeA">
													시
												</div>
												<div class="dw-time">
													퇴근
													<input type="time" name="" id="timeO">
													시
												</div>
											</div>
											<div style=" border-top: solid 0.1px #477A8F;" class="set-d set-d-3">
												<h5>※ 14:00 까지 미출근시 자동으로 결근처리됩니다.</h5>
											</div>                                               
										</td>                                    
									</tr>
								</tbody>
							</table>
							
							<div>
								<input type="button" value="저장하기" class="save-btn cursor" onclick="saveBtn()">
							</div>
						</form>
					</div>
				</div>
				
			</div>
		</div>
		
	</div>
</body>
</html>