<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문서 상세보기</title>
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<link rel="stylesheet" href='<c:url value="/resources/css/approval_contactDetail.css"/>'>
	<link rel="stylesheet" href='<c:url value="/resources/css/approval_subNavi.css"/>'>
</head>
<body>
	<div id='wrap'>
	<c:import url="../common/header.jsp"/>
		<div class="container" >
			<div id="sub-navigation">
				<div id="sub-navi-topinfo" class="H-personnel-subNavi underline">		
					<h2 style="text-align: center;">전자결재</h2>
					<li>
						<button id="appr_insert_btn" onclick="location.href='approvalInsertView.do'">작성하기</button>
					</li>
				</div>
				<div id="sub-navi-deinfo" class="drag-scrollbar">
					<div class="H-personnel-subNavi underline" style="border: none;">
						<div class="H-personnel-subNavi Depth01-1">
							<li class="subTitle" style="margin-top: 15px;">
								<a href="#">진행 중인 문서</a>
							</li>
						</div>
						<ul id="Tab1" class="H-personnel-subNavi Depth02">
							<li><a href="approvalProgressAllListView.do" id="">전체</a></li>
							<li><a href="standByDocListView.do" id="">대기</a></li>
							<li><a href="checkDocListView.do" id="">확인</a></li>
							<li><a href="scheduledDocListView.do" id="">예정</a></li>
							<li><a href="progressListView.do" id="">진행</a></li>
						</ul>
		
						<div class="H-personnel-subNavi Depth01-2">
							<li class="subTitle">
								<a href="#">문서함</a>
							</li>
						</div>
						<ul id="Tab2" class="H-personnel-subNavi Depth02">
							<li><a href="approvalCompleteAllListView.do" id="">전체</a></li>
							<li><a href="draftListView.do" id="">기안</a></li>
							<li><a href="approvalListView.do" id="">결재</a></li>
							<li><a href="receiveListView.do" id="">수신</a></li>
							<li><a href="referenceListView.do" id="">회람</a></li>
							<li><a href="rejectListView.do" id="">반려</a></li>
							<li><a href="#" id="">임시 저장</a></li>
						</ul>
						<div class="H-personnel-subNavi Depth01-3">
							<li class="subTitle"><a href="#">전자결재 관리자</a></li>
						</div>
						<ul id="Tab3" class="H-personnel-subNavi Depth02">
							<li><a href="approvalAllDList.do" id="">전체 문서 관리</a></li>
							<li><a href="approvalDeleteDList.do" id="">삭제 문서 관리</a></li>
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
					})
				</script>
			</div>
			<!-- 세부 네비끝 -->
		</div>
		<!-- 내부 컨텐츠 -->
        <div class="contents" style="top:110px">
			<div class="contents-wrap drag-scrollbar">
				<div class="top-btns">
						
						<span class="cb" id="cb3">결재선 변경</span>
				</div>
				<div class="c-ic">
					<div class="doc_type">
						<span class="doc_type" id="doc_type">${d.formName}</span>
					</div>
					<br>
					<br>
					<table class="appr_detail_table" >
						<tbody>
							<tr id="tr1">
								<td>기안 부서</td>
								<td colspan="4">${d.drafterDeptName}부</td>
								<td>기안자</td>
								<td colspan="4">${d.drafterRankName} / ${d.drafterName}</td>
							</tr>
							<tr id="tr2">
								<td>문서 번호</td>
								<td colspan="4">${d.formCode}_${d.docNo}</td>
								<td>기안 일시</td>
								<td colspan="4">${d.draftDate}</td>
							</tr>
							<tr id="tr3">
								<td rowspan="4">결재</td>
								<td>${ apprList[0].staffRankName }</td>
								<td>${ apprList[1].staffRankName }</td>
								<td>${ apprList[2].staffRankName }</td>
								<td>${ apprList[3].staffRankName }</td>
								<td>${ apprList[4].staffRankName }</td>
								<td>${ apprList[5].staffRankName }</td>
								<td>${ apprList[6].staffRankName }</td>
								<td>${ apprList[7].staffRankName }</td>
								<td>${ apprList[8].staffRankName }</td>
							</tr>
							<tr id="tr4">
								<td></td>
								<td><button class="appr_btn">결재</button></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr id="tr5">
								<td>${ apprList[0].apprDate }</td>
								<td>${ apprList[1].apprDate }</td>
								<td>${ apprList[2].apprDate }</td>
								<td>${ apprList[3].apprDate }</td>
								<td>${ apprList[4].apprDate }</td>
								<td>${ apprList[5].apprDate }</td>
								<td>${ apprList[6].apprDate }</td>
								<td>${ apprList[7].apprDate }</td>
								<td>${ apprList[8].apprDate }</td>
							</tr>
							<tr id="tr6">
								<td>${ apprList[0].staffName }</td>
								<td>${ apprList[1].staffName }</td>
								<td>${ apprList[2].staffName }</td>
								<td>${ apprList[3].staffName }</td>
								<td>${ apprList[4].staffName }</td>
								<td>${ apprList[5].staffName }</td>
								<td>${ apprList[6].staffName }</td>
								<td>${ apprList[7].staffName }</td>
								<td>${ apprList[8].staffName }</td>
							</tr>
							<tr id="tr7">
								<td rowspan="3">참조</td>
                                <td>${ checkList[0].staffRankName }</td>
                                <td>${ checkList[1].staffRankName }</td>
								<td>${ checkList[2].staffRankName }</td>
								<td>${ checkList[3].staffRankName }</td>
								<td>${ checkList[4].staffRankName }</td>
								<td>${ checkList[5].staffRankName }</td>
								<td>${ checkList[6].staffRankName }</td>
                                <td>${ checkList[7].staffRankName }</td>
                                <td>${ checkList[8].staffRankName }</td>
							</tr>
							<tr id="tr8">
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
                                <td></td>
                                <td></td>
                                <td></td>
							</tr>
							<tr id="tr9">
								<td>${ checkList[0].staffName }</td>
								<td>${ checkList[1].staffName }</td>
								<td>${ checkList[2].staffName }</td>
								<td>${ checkList[3].staffName }</td>
								<td>${ checkList[4].staffName }</td>
								<td>${ checkList[5].staffName }</td>
                                <td>${ checkList[6].staffName }</td>
                                <td>${ checkList[7].staffName }</td>
                                <td>${ checkList[8].staffName }</td>
							</tr>
							<tr id="tr10">
								<td rowspan="2">수신</td>
                                <td>${ receiveList[0].staffRankName }</td>
                                <td>${ receiveList[1].staffRankName }</td>
								<td>${ receiveList[2].staffRankName }</td>
								<td>${ receiveList[3].staffRankName }</td>
								<td>${ receiveList[4].staffRankName }</td>
								<td>${ receiveList[5].staffRankName }</td>
								<td>${ receiveList[6].staffRankName }</td>
                                <td>${ receiveList[7].staffRankName }</td>
                                <td>${ receiveList[8].staffRankName }</td>
							</tr>
							<tr id="tr11">
								<td>${ receiveList[0].staffName }</td>
								<td>${ receiveList[1].staffName }</td>
								<td>${ receiveList[2].staffName }</td>
								<td>${ receiveList[3].staffName }</td>
								<td>${ receiveList[4].staffName }</td>
								<td>${ receiveList[5].staffName }</td>
                                <td>${ receiveList[6].staffName }</td>
                                <td>${ receiveList[7].staffName }</td>
                                <td>${ receiveList[8].staffName }</td>
							</tr>
						</tbody>
					</table>
					<br>
					<br>
					<span id="doc_title">문서 제목입니다.</span>
					<br>
					<br>
					<br>
				    <div id="doc_content">
						<p>문서 상세 내용입니다.</p>
					</div>
					<br>
					<br>
					<label id="uploadFile">첨부파일(관련문서 첨부)&nbsp;&nbsp;&nbsp;</label>
					<input type="file" name="uploadFile"></td>
					<br>
					<br>
					<br>
					<hr>
				</div>
			</div>
		</div>
	</div>
</body>
</html>