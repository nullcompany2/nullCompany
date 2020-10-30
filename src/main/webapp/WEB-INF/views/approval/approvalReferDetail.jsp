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
	<link rel="stylesheet" href='<c:url value="/resources/css/approval_referDetail.css"/>'>
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
							<li><a href="approvalProgressDList.do" id="">전체</a></li>
							<li><a href="#" id="">대기</a></li>
							<li><a href="#" id="">확인</a></li>
							<li><a href="#" id="">예정</a></li>
							<li><a href="#" id="">진행</a></li>
						</ul>
		
						<div class="H-personnel-subNavi Depth01-2">
							<li class="subTitle">
								<a href="#">문서함</a>
							</li>
						</div>
						<ul id="Tab2" class="H-personnel-subNavi Depth02">
							<li><a href="approvalCompleteDList.do" id="">전체</a></li>
							<li><a href="#" id="">기안</a></li>
							<li><a href="#" id="">결재</a></li>
							<li><a href="#" id="">수신</a></li>
							<li><a href="#" id="">회람</a></li>
							<li><a href="#" id="">반려</a></li>
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
						<span class="doc_type" id="doc_type">회람</span>
					</div>
					<br>
					<br>
					<table class="appr_detail_table" >
						<tbody>
							<tr id="tr1">
								<td>기안 부서</td>
								<td colspan="4">기안자 소속부서</td>
								<td>기안자</td>
								<td colspan="4">기안자 성명</td>
							</tr>
							<tr id="tr2">
								<td>문서 번호</td>
								<td colspan="4">등록된 문서 번호</td>
								<td>기안 일시</td>
								<td colspan="4">기안시 일자</td>
							</tr>
							<tr id="tr3">
								<td rowspan="3">참조</td>
                                <td>확인자 직급</td>
                                <td>대리</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
                                <td></td>
                                <td></td>
							</tr>
							<tr id="tr4">
								<td>확인 완료 문구</td>
								<td><button class="confirm_btn">확인</button></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
                                <td></td>
                                <td></td>
                                <td></td>
							</tr>
							<tr id="tr5">
								<td>확인자 성명</td>
								<td>이뫄뫄</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
                                <td></td>
                                <td></td>
                                <td></td>
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