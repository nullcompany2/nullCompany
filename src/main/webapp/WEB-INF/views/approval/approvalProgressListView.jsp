<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>진행 중인 문서</title>
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<link rel="stylesheet" href='<c:url value="/resources/css/approval_progressDList.css"/>'>
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
				<div class="contents-title">
						<span class="ct1">
							진행 중인 문서&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;${ catagory }
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
												<th>기안일</th>
												<th style="color: #999;">|</th>
												<th>문서 종류</th>
												<th style="color: #999;">|</th>
												<th>상태</th>
											</tr>
									</thead>
									<tbody>
									<c:forEach var="d" items="${ dList }">
									<c:url var="approvalDetail" value="approvalDetail.do">
										<c:param name="docNo" value="${d.docNo}"/>
									</c:url>
										<tr onclick="location.href='${approvalDetail}'">
											<td>${ d.formCode }_${ d.docNo }</td>
											<td></td>
											<td>${ d.dTitle}</td>
											<td></td>
											<td>${ d.drafterName }</td>
											<td></td>
											<td>${ d.draftDate }</td>
											<td></td>
											<td>${ d.formName }</td>
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
							<span id="doc_count_value">${ dList.size() }</span>
						</label>
						<br>
						<br>
				<c:choose>
					<c:when test="${ catagory eq '전체' }">
						<table style=" margin: 10px 0px 0px 80px; width: 80%; border-collapse: collapse">
							<!-- 페이징처리 -->
							<tr align="center" height="20">
								<td colspan="6" align="center">
									<!-- [이전] --> <c:if test="${ pi.currentPage eq 1 }">
										이전 &nbsp;
									</c:if> <c:if test="${ pi.currentPage ne 1 }">
										<c:url var="before" value="approvalProgressListView.do">
											<c:param name="currentPage" value="${ pi.currentPage - 1 }" />
										</c:url>
										<a href="${ before }">이전</a> &nbsp;
									</c:if> <!-- 페이지 --> <c:forEach var="p" begin="${ pi.startPage }"
										end="${ pi.endPage }">
										<c:if test="${ p eq pi.currentPage }">
											<font color="#477A8F" size="3"><b>${ p }</b> </font>
										</c:if>
				
										<c:if test="${ p ne pi.currentPage }">
											<c:url var="pagination" value="approvalProgressListView.do">
												<c:param name="currentPage" value="${ p }" />
											</c:url>
											<a href="${ pagination }">${ p }</a> &nbsp;
										</c:if>
									</c:forEach> <!-- [다음] --> <c:if test="${ pi.currentPage eq pi.maxPage }">
										다음
									</c:if> <c:if test="${ pi.currentPage ne pi.maxPage }">
										<c:url var="after" value="approvalProgressListView.do">
											<c:param name="currentPage" value="${ pi.currentPage + 1 }" />
										</c:url>
										<a href="${ after }">다음</a>
									</c:if>
								</td>
							</tr>
						</table>
					</c:when>
					<c:when test="${ catagory eq '대기' }">
						<table style=" margin: 10px 0px 0px 80px; width: 80%; border-collapse: collapse">
							<!-- 페이징처리 -->
							<tr align="center" height="20">
								<td colspan="6" align="center">
									<!-- [이전] --> <c:if test="${ pi.currentPage eq 1 }">
										이전 &nbsp;
									</c:if> <c:if test="${ pi.currentPage ne 1 }">
										<c:url var="before" value="standByDocListView.do">
											<c:param name="currentPage" value="${ pi.currentPage - 1 }" />
										</c:url>
										<a href="${ before }">이전</a> &nbsp;
									</c:if> <!-- 페이지 --> <c:forEach var="p" begin="${ pi.startPage }"
										end="${ pi.endPage }">
										<c:if test="${ p eq pi.currentPage }">
											<font color="#477A8F" size="3"><b>${ p }</b> </font>
										</c:if>
				
										<c:if test="${ p ne pi.currentPage }">
											<c:url var="pagination" value="standByDocListView.do">
												<c:param name="currentPage" value="${ p }" />
											</c:url>
											<a href="${ pagination }">${ p }</a> &nbsp;
										</c:if>
									</c:forEach> <!-- [다음] --> <c:if test="${ pi.currentPage eq pi.maxPage }">
										다음
									</c:if> <c:if test="${ pi.currentPage ne pi.maxPage }">
										<c:url var="after" value="standByDocListView.do">
											<c:param name="currentPage" value="${ pi.currentPage + 1 }" />
										</c:url>
										<a href="${ after }">다음</a>
									</c:if>
								</td>
							</tr>
						</table>
					</c:when>
					<c:when test="${ catagory eq '확인' }">
						<table style=" margin: 10px 0px 0px 80px; width: 80%; border-collapse: collapse">
							<!-- 페이징처리 -->
							<tr align="center" height="20">
								<td colspan="6" align="center">
									<!-- [이전] --> <c:if test="${ pi.currentPage eq 1 }">
										이전 &nbsp;
									</c:if> <c:if test="${ pi.currentPage ne 1 }">
										<c:url var="before" value="checkDocListView.do">
											<c:param name="currentPage" value="${ pi.currentPage - 1 }" />
										</c:url>
										<a href="${ before }">이전</a> &nbsp;
									</c:if> <!-- 페이지 --> <c:forEach var="p" begin="${ pi.startPage }"
										end="${ pi.endPage }">
										<c:if test="${ p eq pi.currentPage }">
											<font color="#477A8F" size="3"><b>${ p }</b> </font>
										</c:if>
				
										<c:if test="${ p ne pi.currentPage }">
											<c:url var="pagination" value="checkDocListView.do">
												<c:param name="currentPage" value="${ p }" />
											</c:url>
											<a href="${ pagination }">${ p }</a> &nbsp;
										</c:if>
									</c:forEach> <!-- [다음] --> <c:if test="${ pi.currentPage eq pi.maxPage }">
										다음
									</c:if> <c:if test="${ pi.currentPage ne pi.maxPage }">
										<c:url var="after" value="checkDocListView.do">
											<c:param name="currentPage" value="${ pi.currentPage + 1 }" />
										</c:url>
										<a href="${ after }">다음</a>
									</c:if>
								</td>
							</tr>
						</table>
					</c:when>
					<c:when test="${ catagory eq '예정' }">
						<table style=" margin: 10px 0px 0px 80px; width: 80%; border-collapse: collapse">
							<!-- 페이징처리 -->
							<tr align="center" height="20">
								<td colspan="6" align="center">
									<!-- [이전] --> <c:if test="${ pi.currentPage eq 1 }">
										이전 &nbsp;
									</c:if> <c:if test="${ pi.currentPage ne 1 }">
										<c:url var="before" value="scheduledDocListView.do">
											<c:param name="currentPage" value="${ pi.currentPage - 1 }" />
										</c:url>
										<a href="${ before }">이전</a> &nbsp;
									</c:if> <!-- 페이지 --> <c:forEach var="p" begin="${ pi.startPage }"
										end="${ pi.endPage }">
										<c:if test="${ p eq pi.currentPage }">
											<font color="#477A8F" size="3"><b>${ p }</b> </font>
										</c:if>
				
										<c:if test="${ p ne pi.currentPage }">
											<c:url var="pagination" value="scheduledDocListView.do">
												<c:param name="currentPage" value="${ p }" />
											</c:url>
											<a href="${ pagination }">${ p }</a> &nbsp;
										</c:if>
									</c:forEach> <!-- [다음] --> <c:if test="${ pi.currentPage eq pi.maxPage }">
										다음
									</c:if> <c:if test="${ pi.currentPage ne pi.maxPage }">
										<c:url var="after" value="scheduledDocListView.do">
											<c:param name="currentPage" value="${ pi.currentPage + 1 }" />
										</c:url>
										<a href="${ after }">다음</a>
									</c:if>
								</td>
							</tr>
						</table>
					</c:when>
					<c:otherwise>
						<table style=" margin: 10px 0px 0px 80px; width: 80%; border-collapse: collapse">
							<!-- 페이징처리 -->
							<tr align="center" height="20">
								<td colspan="6" align="center">
									<!-- [이전] --> <c:if test="${ pi.currentPage eq 1 }">
										이전 &nbsp;
									</c:if> <c:if test="${ pi.currentPage ne 1 }">
										<c:url var="before" value="progressListView.do">
											<c:param name="currentPage" value="${ pi.currentPage - 1 }" />
										</c:url>
										<a href="${ before }">이전</a> &nbsp;
									</c:if> <!-- 페이지 --> <c:forEach var="p" begin="${ pi.startPage }"
										end="${ pi.endPage }">
										<c:if test="${ p eq pi.currentPage }">
											<font color="#477A8F" size="3"><b>${ p }</b> </font>
										</c:if>
				
										<c:if test="${ p ne pi.currentPage }">
											<c:url var="pagination" value="progressListView.do">
												<c:param name="currentPage" value="${ p }" />
											</c:url>
											<a href="${ pagination }">${ p }</a> &nbsp;
										</c:if>
									</c:forEach> <!-- [다음] --> <c:if test="${ pi.currentPage eq pi.maxPage }">
										다음
									</c:if> <c:if test="${ pi.currentPage ne pi.maxPage }">
										<c:url var="after" value="progressListView.do">
											<c:param name="currentPage" value="${ pi.currentPage + 1 }" />
										</c:url>
										<a href="${ after }">다음</a>
									</c:if>
								</td>
							</tr>
						</table>
					</c:otherwise>
				</c:choose>
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