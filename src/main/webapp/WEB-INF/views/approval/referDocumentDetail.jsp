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
					<c:if test="${ d.completeDate == null }">
						<c:if test="${ loginUser.memNo eq d.drafterNo }">
								<span class="cb" id="cb1">내용 수정</span>
		                        <span class="cb" id="cb2">기안 취소</span>
						</c:if>
								<span class="cb" id="cb3">결재선 변경</span>
					</c:if>
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
							<tr id="tr4">
								<td>
									<c:if test="${ !empty checkList[0]}">
										<c:choose>
											<c:when test = "${ loginUser.memNo eq checkList[0].staffNo && checkList[0].apprStatus eq 'N'}">
												<button class="confirm_btn">확인</button>
											</c:when>
											<c:when test = "${ checkList[0].apprStatus eq 'Y'}">
												확인 완료
											</c:when>
										</c:choose>
									</c:if>
								</td>
								<td>
									<c:if test="${ !empty checkList[1]}">
										<c:choose>
											<c:when test = "${ loginUser.memNo eq checkList[1].staffNo && checkList[1].apprStatus eq 'N'}">
												<button class="confirm_btn">확인</button>
											</c:when>
											<c:when test = "${ checkList[1].apprStatus eq 'Y'}">
												확인 완료
											</c:when>
										</c:choose>
									</c:if>
								</td>
								<td>
									<c:if test="${ !empty checkList[2]}">
										<c:choose>
											<c:when test = "${ loginUser.memNo eq checkList[2].staffNo && checkList[2].apprStatus eq 'N'}">
												<button class="confirm_btn">확인</button>
											</c:when>
											<c:when test = "${ checkList[2].apprStatus eq 'Y'}">
												확인 완료
											</c:when>
										</c:choose>
									</c:if>
								</td>
								<td>
									<c:if test="${ !empty checkList[3]}">
										<c:choose>
											<c:when test = "${ loginUser.memNo eq checkList[3].staffNo && checkList[3].apprStatus eq 'N'}">
												<button class="confirm_btn">확인</button>
											</c:when>
											<c:when test = "${ checkList[3].apprStatus eq 'Y'}">
												확인 완료
											</c:when>
										</c:choose>
									</c:if>
								</td>
								<td>
									<c:if test="${ !empty checkList[4]}">
										<c:choose>
											<c:when test = "${ loginUser.memNo eq checkList[4].staffNo && checkList[4].apprStatus eq 'N'}">
												<button class="confirm_btn">확인</button>
											</c:when>
											<c:when test = "${ checkList[4].apprStatus eq 'Y'}">
												확인 완료
											</c:when>
										</c:choose>
									</c:if>
								</td>
								<td>
									<c:if test="${ !empty checkList[5]}">
										<c:choose>
											<c:when test = "${ loginUser.memNo eq checkList[5].staffNo && checkList[5].apprStatus eq 'N'}">
												<button class="confirm_btn">확인</button>
											</c:when>
											<c:when test = "${ checkList[5].apprStatus eq 'Y'}">
												확인 완료
											</c:when>
										</c:choose>
									</c:if>
								</td>
                                <td>
									<c:if test="${ !empty checkList[6]}">
										<c:choose>
											<c:when test = "${ loginUser.memNo eq checkList[6].staffNo && checkList[6].apprStatus eq 'N'}">
												<button class="confirm_btn">확인</button>
											</c:when>
											<c:when test = "${ checkList[6].apprStatus eq 'Y'}">
												확인 완료
											</c:when>
										</c:choose>
									</c:if>
								</td>
                                <td>
									<c:if test="${ !empty checkList[7]}">
										<c:choose>
											<c:when test = "${ loginUser.memNo eq checkList[7].staffNo && checkList[7].apprStatus eq 'N'}">
												<button class="confirm_btn">확인</button>
											</c:when>
											<c:when test = "${ checkList[7].apprStatus eq 'Y'}">
												확인 완료
											</c:when>
										</c:choose>
									</c:if>
								</td>
                                <td>
									<c:if test="${ !empty checkList[8]}">
										<c:choose>
											<c:when test = "${ loginUser.memNo eq checkList[8].staffNo && checkList[8].apprStatus eq 'N'}">
												<button class="confirm_btn">확인</button>
											</c:when>
											<c:when test = "${ checkList[8].apprStatus eq 'Y'}">
												확인 완료
											</c:when>
										</c:choose>
									</c:if>
								</td>
							</tr>
							<script>
								$(function(){
					
									var td = $("#tr4").children();
									
								    var size = ${checkList.size()};
								    
								    // 참조선 완료 문구 글씨 색
								    for(var i = 0; i < size; i++){
								    	var tdText = td.eq(i);
								    	if((tdText.text()).trim() == '확인 완료'){
								    		tdText.css("color","#477A8F");
								    		tdText.css("font-weight","bold");
								    	}
								    }
								}); 
							</script>
							<tr id="tr5">
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
						</tbody>
					</table>
					<br>
					<br>
					<span id="doc_title">${ d.dTitle }</span>
					<br>
					<br>
					<br>
				    <div id="doc_content">
						<p>${ d.dContent }</p>
					</div>
					<br>
					<br>
					<span style="color:#477A8F; font-weight:bold">첨부파일 : 
						<c:if test="${ d.fileName != null }">
							    <a href="${ contextPath }/resources/approvalUploadFiles/${d.fileName}"
								  download="${ d.fileName }">${ d.fileName }</a>
						</c:if>
						<c:if test="${ d.fileName == null }">
							없음
						</c:if>
					</span>
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