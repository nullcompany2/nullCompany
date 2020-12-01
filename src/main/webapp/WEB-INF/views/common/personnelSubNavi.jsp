<%@page import="com.kh.nullcompany.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet"
	href="<c:url value="/resources/css/younsu-subNavi.css"/>">
</head>
<body>
	<div id="sub-navigation">
		<div id="sub-navi-topinfo" class="H-personnel-subNavi underline">
			<h2 style="text-align: center;">인사관리</h2>
			<li>
				<div>
					<span class="title">남은 휴가</span>
					<label class="num" id="remainLeave"></label> 일
					

				</div>
			</li>
			<li>
				<div>
					<label class="title">지각(년/월)</label> <label class="num" id="lateCount"></label>
				</div>
			</li>
		</div>
		<div id="sub-navi-deinfo" class="drag-scrollbar">
			<div class="H-personnel-subNavi underline">
				<div class="H-personnel-subNavi Depth01-1">
					<li class="subTitle"><a href="#">인사 정보</a></li>
				</div>
				<ul id="Tab1" class="H-personnel-subNavi Depth02">
					<li><a href="organization.do" id="">조직 목록</a></li>
					<li><a href="modificationMyInfo.do" id="">내 정보 관리</a></li>
				</ul>

				<div class="H-personnel-subNavi Depth01-2">
					<li class="subTitle"><a href="#">휴가 / 근태</a></li>
				</div>
				<ul id="Tab2" class="H-personnel-subNavi Depth02">
					<li><a href="myLeave.do" id="">휴가 현황</a></li>
					<li><a href="myDiligence.do" id="">근태 현황</a></li>
				</ul>
			</div>

			<div class="H-personnel-subNavi ">
				<div class="H-personnel-subNavi Depth01-3">
					<li class="subTitle"><a href="#">인사 관리</a></li>
				</div>
				<ul id="Tab3" class="H-personnel-subNavi Depth02">
					<li><a href="OrganizationManagement.do" id="">조직 관리</a></li>
					<li><a href="userManagement.do" id="">사용자 관리</a></li>
					<li><a href="rankManagement.do" id="">직위 관리</a></li>
					<li><a href="userApprovalManagement.do" id="">사용자 승인 관리</a></li>
				</ul>
				<div class="H-personnel-subNavi Depth01-4">
					<li class="subTitle"><a href="#">휴가 관리</a></li>

				</div>
				<ul id="Tab4" class="H-personnel-subNavi Depth02">
					<li><a href="setLeaveStandard.do" id="">기본 설정</a></li>
					<li><a href="emLeaveManagement.do" id="">직원 휴가 관리</a></li>
				</ul>
				<div class="H-personnel-subNavi Depth01-5">
					<li class="subTitle"><a href="#">근태 관리</a></li>

				</div>
				<ul id="Tab5" class="H-personnel-subNavi Depth02">
					<li><a href="setDiligenceStandard.do" id="">기본 설정</a></li>
					<li><a href="emAbsenceManagement.do" id="">휴직자 관리</a></li>
					<li><a href="emDiligenceManagement.do" id="">직원 근태 관리</a></li>
					<li><a href="attendanceModificationRequests.do" id="">근태 수정요청 관리</a></li>
				</ul>
			</div>
		</div>
		<script>
			$(function(){
				$(".Depth01-1").click(function(){
					if($("#Tab1").css("display") == 'none'){
						$("#Tab1").css("display","block")
					}else{
						$("#Tab1").css("display","none")
					}
				})
				$(".Depth01-2").click(function(){
					if($("#Tab2").css("display") == 'none'){
						$("#Tab2").css("display","block")
					}else{
						$("#Tab2").css("display","none")
					}
				})
				$(".Depth01-3").click(function(){
					if($("#Tab3").css("display") == 'none'){
						$("#Tab3").css("display","block")
					}else{
						$("#Tab3").css("display","none")
					}
				})
				$(".Depth01-4").click(function(){
					if($("#Tab4").css("display") == 'none'){
						$("#Tab4").css("display","block")
					}else{
						$("#Tab4").css("display","none")
					}
				})
				$(".Depth01-5").click(function(){
					if($("#Tab5").css("display") == 'none'){
						$("#Tab5").css("display","block")
					}else{
						$("#Tab5").css("display","none")
					}
				})
				
				$(function(){
					
					leaveCalculate();
					
				})
				
				function leaveCalculate(){
					
					var edate = "<%= ((Member)session.getAttribute("loginUser")).getEnrollDate()%>";
					var mem_no = ${loginUser.memNo};
					$.ajax({
						url : "leaveCalculate.do",
						data : {enDate : edate, memNo : mem_no },
						datatype : "json",
						success:function(data){
							$("#remainLeave").html(data.remainingLeave);
							$("#lateCount").html(data.lateCountY + " / " + data.lateCountM);
							
						},
						error: function(request,status,error){
							console.log(request);
							console.log(status);
							console.log(error);
						}
						
					})
				}

				
			})
		</script>
		<!-- 세부 네비끝 -->
	</div>

</body>
</html>