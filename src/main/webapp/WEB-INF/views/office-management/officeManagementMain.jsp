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
    <link rel="stylesheet" href='<c:url value="/resources/css/office-management-main.css" />'>

	<link rel="stylesheet" href='<c:url value="/resources/css/office-subNavi.css" />'>
	
</head>

<body>
	
    <div id='wrap'>
		<c:import url="../common/header.jsp" />
		
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
				
			</div>
			<!-- 세부 네비끝 -->

			<!-- 내부 컨텐츠 -->
			<div class="contents">
				<!-- 컨텐츠 타이틀명 -->
	
				<!-- ---- -->
				<div class="contents-wrap drag-scrollbar">
					<table class="office-tbl">
						<tr style="text-align: left;">
							<th>◈ 게시판 사용현황</th>
							<th>◈ 조직관리</th>
						</tr>
						<tr >
							<td class="top-vertical">
								<div class="office-tbl-board-le">
									<h4 class="underline">» 게시판 : 공지 ${mic.boardCount } 개 </h4>
									<fmt:formatDate var="date" value="${mic.latestNoticeDate }" pattern="yyyy-MM-dd" />
									<h4 class="underline">» 최근 게시물 이용 : ${date }</h4>
								</div>
							</td>
							<td class="top-vertical">
								<div class="office-tbl-board-ri">
									<h4 class="underline">» 승인 사용자 : ${mic.memberCount } 명 등록됨</h4>
									<h4 class="underline">» 부서 : ${mic.deptCount } 개 등록됨</h4>
									<h4 class="underline">» 직위 : ${mic.rankCount } 개 등록됨</h4>
	
								</div>
							</td>
						</tr>
						<tr style="text-align: left;">
							<th>◈ 주요인원 연락처</th>
							<th>◈ 전자결재</th>
						</tr>
						<tr >
							<td class="top-vertical">
								<div class="office-tbl-board-le">
									<c:forEach var="list" items="${mci }">
									<h4 class="underline">» ${list.name} - ${list.rankName }  : ${list.phone }</h4>
									</c:forEach>
									
								</div>
							</td>
							<td class="top-vertical">
								<div class="office-tbl-board-ri">
									<h4 class="underline">» 등록된문서 : ${mic.existDocumentCount } 건</h4>
									<h4 class="underline">» 삭제된문서 : ${mic.deleteDocumentCount } 건</h4>
									
								</div>
							</td>
						</tr>
						<tr style="text-align: left;">
							<th>◈ 환경설정</th>
						</tr>
						<tr >
							<td class="top-vertical">
								<div class="office-tbl-board-lo">
									<h4 class="underline">» 회사명 : NullCompany</h4>
									<h4 class="underline">» 오피스관리자 </h4>
									<c:forEach var="list" items="${om }">
									<h4 class="underline">» ${list.name }(${list.email })-${list.phone} </h4>
									</c:forEach>
								</div>
							</td>
	
						</tr>
					</table>
				</div>
				
			</div>
		</div>

		
    </div>
   
    
</body>
</html>