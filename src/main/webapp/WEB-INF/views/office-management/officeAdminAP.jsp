<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/resources/css/office-admin-ap.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/css/office-subNavi.css"/>">
	

</head>

<body>
	
    <div id='wrap'>
		<c:import url="../common/header.jsp"/>
		<div class="office-container" >
			<!-- 오피스 세부 네비 시작 -->
			<div id="office-sub-navigation">
				<div class="blackline"></div>
				<div class="underline cursor" onclick="location.href='officeMain.do'">
					<h2 style="text-align: center;">오피스 정보</h2>
				</div>
				<div class="office-subNavi">
					<li>❏ 회사명</li>
					<li>❏ NullCompany</li>
					<li>❏ 오피스주소</li>
					<li >❏ kh-final-h15.com</li>
				</div>	
				<div>
					<li class="topline"><a href="officeLogo.do" style="margin-left: 15px;">⏣ 로고 변경</a></li>
					<li class="topline"><a href="officeAdminAP.do" style="margin-left: 15px;">⏣ 관리자 지정</a></li>
				</div>
				<script>
					$(function(){
						/* ic category */
						$("#status-diligence").click(function(){
							$("#show-modi-diligence").css("display","none")
							$("#show-status-diligence").css("display","block")
							$("#status-diligence").css("color","#477A8F")
							$("#modi-diligence").css("color","black")
						})
						$("#modi-diligence").click(function(){
							$("#show-status-diligence").css("display","none")
							$("#show-modi-diligence").css("display","block")
							$("#status-diligence").css("color","black")
							$("#modi-diligence").css("color","#477A8F")
						})
					})
				</script>
			</div>
			<!-- 세부 네비끝 -->

			<!-- 내부 컨텐츠 -->
			<div class="contents">
				<!-- 컨텐츠 타이틀명 -->
                <div class="contents-title underline">
					<h4>관리자 설정</h4>
				</div>
				<!-- ---- -->
				<div class="contents-wrap drag-scrollbar" style="top: 65px; padding: 15px;">
					<div id="manalist" style="margin-bottom: 10px">
						<h3 for="" style="color: #477A8F">전체관리자 지정하기</h3>
					</div>
					<div id="tbl-outline" style=" box-shadow: 0px 0px 5px 0px lightgray; height: 400px; width: 800px; padding: 10px;">
						<table class="m-tbl">
							<tr>
								<th>이름/ 아이디 검색</th>
								<th><input type="text" name="" id=""></th>
								<th><input type="button" value="검색"></th>
							</tr>
							<tr>
								<td colspan="3">
									<div id="searchList" class="listbox" style="overflow:scroll;">
									<c:forEach var="list" items="${nomalMember }">
										<input type="radio" name="managerList"  id="${list.memNo }" value="${list.memNo }">
										<label for="${list.memNo }" class="cursor">${list.name}(${list.id })</label> <br>
									</c:forEach>
									</div>
								</td>
							</tr>
						</table>
						<div class="btn-div">
							<input type="button" value="추가" class="m-btn" id="ap-manager">
							<input type="button" value="삭제" class="m-btn" id="de-manager">
						</div>
						<table class="m-tbl">
							<tr>
								<th colspan="3">전체관리자(최대 5명)</th>
							</tr>
							<tr>
								<td colspan="3">
									<div id="selectList" class="listbox">
										<c:forEach var="list" items="${managerMember }">
										<input type="radio" name="managerList" id="${list.memNo }" value="dongwon">
										<label for="${list.memNo }" class="cursor">${list.name}(${list.id })</label> <br>
										</c:forEach>
									</div>
								</td>
							</tr>
						</table>
						<input type="button" value="저장" class="m-save-btn">
					</div>
				</div>
			</div>
			
		</div>
		<script>
			$("#ap-manager").click(function(){
				var sv = $('input:radio[name=af]:checked').val();
				var si = $('input:radio[name=af]:checked').attr('id');
				console.log(sv);
				console.log(si);

				$("#selectList").append("<input type='radio' name='af' id='"+si+"'><label for='"+si+"' class='cursor'>"+sv+"</label> <br>")
				$("#searchList").remove('#'+si);

			})
			$("#de-manager").click(function(){
				var st = $('input:radio[name=af]:checked').val();
				var si = $('input:radio[name=af]:checked').attr('id');
				console.log(st);

				$("#searchList").append("<input type='radio' name='af' id='"+si+"'><label for='"+si+"' class='cursor'>"+sv+"</label> <br>")
				$("#selectList").remove("<input type='radio' name='af' id='"+si+"'><label for='"+si+"' class='cursor'>"+sv+"</label> <br>")
			})
		</script>
		
    </div>
    
</body>
</html>