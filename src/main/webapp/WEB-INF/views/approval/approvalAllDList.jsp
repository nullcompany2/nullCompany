<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전체 문서 관리</title>
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<link rel="stylesheet" href='<c:url value="/resources/css/approval_admin_allDList.css"/>'>
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
				<div class="contents-title">
						<span class="ct1">
							전체 문서 목록
						</span>
				</div>
				<div class="c-ic">
					<table class="appr_list" >
						<thead>
							<tr>
								<th>문서 번호</th>
								<th style="color: #999;">|</th>
								<th>제목</th>
								<th style="color: #999;">|</th>
								<th>기안자</th>
								<th style="color: #999;">|</th>
								<th>기안일&nbsp;&nbsp;<label class="appr_date_desc" id="insert_date">▼</label></th>
								<th style="color: #999;">|</th>
								<th>완료일&nbsp;&nbsp;<label class="appr_date_desc" id="complete_date">▼</label></th>
								<th style="color: #999;">|</th>
								<th>결재 상태</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>00001</td>
								<td></td>
								<td>문서제목</td>
								<td></td>
								<td>현승구</td>
								<td></td>
								<td>2020-10-20</td>
								<td></td>
								<td></td>
								<td></td>
								<td>결재 중</td>
							</tr>
							<tr>
								<td>00002</td>
								<td></td>
								<td>문서제목</td>
								<td></td>
								<td>현승구</td>
								<td></td>
								<td>2020-10-20</td>
								<td></td>
								<td>2020-10-21</td>
								<td></td>
								<td>결재 완료</td>
							</tr>
							<tr>
								<td>00003</td>
								<td></td>
								<td>문서제목</td>
								<td></td>
								<td>현승구</td>
								<td></td>
								<td>2020-10-20</td>
								<td></td>
								<td>2020-10-21</td>
								<td></td>
								<td>결재 완료</td>
							</tr>
							
						</tbody>
					</table>
					<label id="doc_count">문서 수&nbsp;&nbsp;:&nbsp;&nbsp;
						<span id="doc_count_value">3</span>
					</label>
					<br>
					<br>
					<div id="numberList" style="text-align: center;">
						<button><strong>1</strong></button>
						<button><strong>2</strong></button>
						<button><strong>3</strong></button>
						<button><strong>4</strong></button>
						<button><strong>5</strong></button>
					</div>
					<br>
					<div id="search_bar">
						<select class="search_tool" id="search_tool">
							<option value="dNo">문서 번호</option>
							<option value="dWriter">기안자</option>
							<option value="dTitle">문서 제목</option>
						</select>
						<input type="text" id="appr_search" maxlength="24" placeholder="문서검색"/>
						<input type="button" id="search_btn" value="   "/>
					</div>
				</div>
			</div>
			<script>
				$(function(){
					$("#numberList button").mouseover(function(){
						$(this).css({"color" : "#477A8F"});
					}).mouseout(function(){
						$(this).css({"color" : "black"});
					});
				});
			</script>
		</div>
	</div>
</body>
</html>