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
							<li class="subTitle" style="margin-top: 15px; cursor:pointer;">
								<span>진행 중인 문서</span>
							</li>
						</div>
						<ul id="Tab1" class="H-personnel-subNavi Depth02">
							<li><a href="approvalProgressAllListView.do">전체</a></li>
							<li><a href="standByDocListView.do">대기</a></li>
							<li><a href="checkDocListView.do">참조</a></li>
							<li><a href="scheduledDocListView.do">예결</a></li>
							<li><a href="progressListView.do">진행</a></li>
						</ul>
		
						<div class="H-personnel-subNavi Depth01-2">
							<li class="subTitle" style="cursor:pointer;">
								<span>문서함</span>
							</li>
						</div>
						<ul id="Tab2" class="H-personnel-subNavi Depth02">
							<li><a href="approvalCompleteAllListView.do">전체</a></li>
							<li><a href="draftListView.do">기안</a></li>
							<li><a href="approvalListView.do">결재</a></li>
							<li><a href="receiveListView.do">수신</a></li>
							<li><a href="referenceListView.do">회람</a></li>
							<li><a href="rejectListView.do">반려</a></li>
						</ul>

						<c:if test="${ loginUser.deptNo != 0 && loginUser.lankNo < 4 }">
							<div class="H-personnel-subNavi Depth01-3">
								<li class="subTitle" style="cursor:pointer;">
								    <span>${ loginUser.deptName }부 문서 관리</span>
								</li>
							</div>
								<ul id="Tab3" class="H-personnel-subNavi Depth02">
									<li><a href="adminAllList.do">전체 문서 관리</a></li>
									<li><a href="adminDeleteList.do">삭제 문서 관리</a></li>
								</ul>
						</c:if>
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
				<c:choose>
					<c:when test="${ !empty dList }">
					<table class="appr_list" >
						<thead>
							<tr>
								<th>문서 번호</th>
								<th style="color: #999;">|</th>
								<th>제목</th>
								<th style="color: #999;">|</th>
								<th>기안자</th>
								<th style="color: #999;">|</th>
								<th>기안일&nbsp;&nbsp;</th>
								<th style="color: #999;">|</th>
								<th>완료일&nbsp;&nbsp;</th>
								<th style="color: #999;">|</th>
								<th>결재 상태</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="d" items="${ dList }">
							<c:url var="approvalAdminDetail" value="approvalAdminDetail.do">
								<c:param name="docNo" value="${d.docNo}"/>
							</c:url>
							<tr onclick="location.href='${approvalAdminDetail}'">
								<td>${ d.formCode }_${ d.docNo }</td>
								<td></td>
								<td>${ d.dTitle}</td>
								<td></td>
								<td>${ d.drafterName }</td>
								<td></td>
								<td>${ d.draftDate }</td>
								<td></td>
								<td>${ d.completeDate }</td>
								<td></td>
								<td>${ d.sStatus }</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					</c:when>
					<c:otherwise>
						<br>
						<br>
						<span style=" margin-left: 430px; font-size:26pt; font-weight: bolder;">문서가 없습니다.</span>
						<br>
						<br>
						<br>
					</c:otherwise>
				</c:choose>
					<label id="doc_count">문서 수&nbsp;&nbsp;:&nbsp;&nbsp;
						<span id="doc_count_value">${ listCount }</span>
					</label>
					<br>
					<br>
					<table style=" margin: 10px 0px 0px 80px; width: 80%; border-collapse: collapse">
							<!-- 페이징처리 -->
							<tr align="center" height="20">
								<td colspan="6" align="center">
									<!-- [이전] --> <c:if test="${ pi.currentPage eq 1 }">
										이전 &nbsp;
									</c:if> <c:if test="${ pi.currentPage ne 1 }">
										<c:url var="before" value="adminAllList.do">
											<c:param name="currentPage" value="${ pi.currentPage - 1 }" />
										</c:url>
										<a href="${ before }">이전</a> &nbsp;
									</c:if> <!-- 페이지 --> <c:forEach var="p" begin="${ pi.startPage }"
										end="${ pi.endPage }">
										<c:if test="${ p eq pi.currentPage }">
											<font color="#477A8F" size="3"><b>${ p }</b> </font>
										</c:if>
				
										<c:if test="${ p ne pi.currentPage }">
											<c:url var="pagination" value="adminAllList.do">
												<c:param name="currentPage" value="${ p }" />
											</c:url>
											<a href="${ pagination }">${ p }</a> &nbsp;
										</c:if>
									</c:forEach> <!-- [다음] --> <c:if test="${ pi.currentPage eq pi.maxPage }">
										다음
									</c:if> <c:if test="${ pi.currentPage ne pi.maxPage }">
										<c:url var="after" value="adminAllList.do">
											<c:param name="currentPage" value="${ pi.currentPage + 1 }" />
										</c:url>
										<a href="${ after }">다음</a>
									</c:if>
								</td>
							</tr>
						</table>
					<br>
					<!-- <div id="search_bar">
						<select class="search_tool" id="search_tool">
							<option value="dWriter">기안자</option>
							<option value="dTitle">문서 제목</option>
						</select>
						<input type="text" id="appr_search" maxlength="24" placeholder="문서검색"/>
						<input type="button" id="search_btn" value="   "/>
					</div> -->
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