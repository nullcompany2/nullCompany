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
	<link rel="stylesheet" href='<c:url value="/resources/css/approval_absenceDetail.css"/>'>
	<link rel="stylesheet" href='<c:url value="/resources/css/approval_subNavi.css"/>'>
<style>
	   body {
                font-family: "Noto Sans KR", sans-serif;
                padding: 0px; margin: 0px;
                box-sizing:board-box;
            }

            
       #my_modal {
          display: none;
          width: 350px;
          height: 200px;
          padding: 20px 60px;
          background-color: #fefefe;
          border: 1px solid #888;
          border-radius: 3px;
          text-align: center;
          color:rgb(65, 65, 66);
       }
       
       #my_modal1 {
          display: none;
          width: 350px;
          height: 200px;
          padding: 20px 60px;
          background-color: #fefefe;
          border: 1px solid #888;
          border-radius: 3px;
          text-align: center;
          color:rgb(65, 65, 66);
       }
 
       #my_modal .modal-close-btn {
          position: absolute;
          top: 10px;
          right: 10px;
       }
       #my_modal1 .modal-close-btn {
          position: absolute;
          top: 10px;
          right: 10px;
       }
       .n-emp-i{
          width: 100%;
          height: 30%;
       }

       .n-emp-i button {
           width: 180px;
           height: 40px;
           background: #477A8F;
           color:white;
           border: none;
           border-radius: 3px;
           font-size: 15px;
           margin: 20px;
       }
       
       button:hover{
           cursor: pointer;
       }

       .modal-close-btn{
          cursor: pointer;
       }
</style>
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
								<td>
									<c:if test="${ !empty apprList[0]}">
										<c:choose>
											<c:when test = "${ d.completeDate != null && apprList[0].apprStatus eq 'N' && d.rStatus eq 'Y'}">
												반려 처리
											</c:when>
											<c:when test = "${ d.completeDate != null && apprList[0].apprStatus eq 'N' }">
												전결
											</c:when>
											<c:when test = "${ loginUser.memNo eq apprList[0].staffNo && apprList[0].apprStatus eq 'N'}">
												<button class="appr_btn">결재</button>
											</c:when>
											<c:when test = "${ apprList[0].apprStatus eq 'Y' && apprList[0].rStatus eq 'N'}">
												결재 완료
											</c:when>
											<c:when test = "${ apprList[0].apprStatus eq 'Y' && apprList[0].rStatus eq 'Y'}">
												반려 완료
											</c:when>
										</c:choose>
									</c:if>
								</td>
								<td>
									<c:if test="${ !empty apprList[1]}">
										<c:choose>
											<c:when test = "${ d.completeDate != null && apprList[1].apprStatus eq 'N' && d.rStatus eq 'Y'}">
												반려 처리
											</c:when>
											<c:when test = "${ d.completeDate != null && apprList[1].apprStatus eq 'N' }">
												전결
											</c:when>
											<c:when test = "${ loginUser.memNo eq apprList[1].staffNo && apprList[1].apprStatus eq 'N'}">
												<button class="appr_btn">결재</button>
											</c:when>
											<c:when test = "${ apprList[1].apprStatus eq 'Y' && apprList[1].rStatus eq 'N'}">
												결재 완료
											</c:when>
											<c:when test = "${ apprList[1].apprStatus eq 'Y' && apprList[1].rStatus eq 'Y'}">
												반려
											</c:when>
										</c:choose>
									</c:if>
								</td>
								<td>
									<c:if test="${ !empty apprList[2]}">
										<c:choose>
											<c:when test = "${ d.completeDate != null && apprList[2].apprStatus eq 'N' && d.rStatus eq 'Y'}">
												반려 처리
											</c:when>
											<c:when test = "${ d.completeDate != null && apprList[2].apprStatus eq 'N' }">
												전결
											</c:when>
											<c:when test = "${ loginUser.memNo eq apprList[2].staffNo && apprList[2].apprStatus eq 'N'}">
												<button class="appr_btn">결재</button>
											</c:when>
											<c:when test = "${ apprList[2].apprStatus eq 'Y' && apprList[2].rStatus eq 'N'}">
												결재 완료
											</c:when>
											<c:when test = "${ apprList[2].apprStatus eq 'Y' && apprList[2].rStatus eq 'Y'}">
												반려
											</c:when>
										</c:choose>
									</c:if>
								</td>
								<td>
									<c:if test="${ !empty apprList[3]}">
										<c:choose>
											<c:when test = "${ d.completeDate != null && apprList[3].apprStatus eq 'N' && d.rStatus eq 'Y'}">
												반려 처리
											</c:when>
											<c:when test = "${ d.completeDate != null && apprList[3].apprStatus eq 'N' }">
												전결
											</c:when>
											<c:when test = "${ loginUser.memNo eq apprList[3].staffNo && apprList[3].apprStatus eq 'N'}">
												<button class="appr_btn">결재</button>
											</c:when>
											<c:when test = "${ apprList[3].apprStatus eq 'Y' && apprList[3].rStatus eq 'N'}">
												결재 완료
											</c:when>
											<c:when test = "${ apprList[3].apprStatus eq 'Y' && apprList[3].rStatus eq 'Y'}">
												반려
											</c:when>
										</c:choose>
									</c:if>
								</td>
								<td>
									<c:if test="${ !empty apprList[4]}">
										<c:choose>
											<c:when test = "${ d.completeDate != null && apprList[4].apprStatus eq 'N' && d.rStatus eq 'Y'}">
												반려 처리
											</c:when>
											<c:when test = "${ d.completeDate != null && apprList[4].apprStatus eq 'N' }">
												전결
											</c:when>
											<c:when test = "${ loginUser.memNo eq apprList[4].staffNo && apprList[4].apprStatus eq 'N'}">
												<button class="appr_btn">결재</button>
											</c:when>
											<c:when test = "${ apprList[4].apprStatus eq 'Y' && apprList[4].rStatus eq 'N'}">
												결재 완료
											</c:when>
											<c:when test = "${ apprList[4].apprStatus eq 'Y' && apprList[4].rStatus eq 'Y'}">
												반려
											</c:when>
										</c:choose>
									</c:if>
								</td>
								<td>
									<c:if test="${ !empty apprList[5]}">
										<c:choose>
											<c:when test = "${ d.completeDate != null && apprList[5].apprStatus eq 'N' && d.rStatus eq 'Y'}">
												반려 처리
											</c:when>
											<c:when test = "${ d.completeDate != null && apprList[5].apprStatus eq 'N' }">
												전결
											</c:when>
											<c:when test = "${ loginUser.memNo eq apprList[5].staffNo && apprList[5].apprStatus eq 'N'}">
												<button class="appr_btn">결재</button>
											</c:when>
											<c:when test = "${ apprList[5].apprStatus eq 'Y' && apprList[5].rStatus eq 'N'}">
												결재 완료
											</c:when>
											<c:when test = "${ apprList[5].apprStatus eq 'Y' && apprList[5].rStatus eq 'Y'}">
												반려
											</c:when>
										</c:choose>
									</c:if>
								</td>
								<td>
									<c:if test="${ !empty apprList[6]}">
										<c:choose>
											<c:when test = "${ d.completeDate != null && apprList[6].apprStatus eq 'N' && d.rStatus eq 'Y'}">
												반려 처리
											</c:when>
											<c:when test = "${ d.completeDate != null && apprList[6].apprStatus eq 'N' }">
												전결
											</c:when>
											<c:when test = "${ loginUser.memNo eq apprList[6].staffNo && apprList[6].apprStatus eq 'N'}">
												<button class="appr_btn">결재</button>
											</c:when>
											<c:when test = "${ apprList[6].apprStatus eq 'Y' && apprList[6].rStatus eq 'N'}">
												결재 완료
											</c:when>
											<c:when test = "${ apprList[6].apprStatus eq 'Y' && apprList[6].rStatus eq 'Y'}">
												반려
											</c:when>
										</c:choose>
									</c:if>
								</td>
								<td>
									<c:if test="${ !empty apprList[7]}">
										<c:choose>
											<c:when test = "${ d.completeDate != null && apprList[7].apprStatus eq 'N' && d.rStatus eq 'Y'}">
												반려 처리
											</c:when>
											<c:when test = "${ d.completeDate != null && apprList[7].apprStatus eq 'N' }">
												전결
											</c:when>
											<c:when test = "${ loginUser.memNo eq apprList[7].staffNo && apprList[7].apprStatus eq 'N'}">
												<button class="appr_btn">결재</button>
											</c:when>
											<c:when test = "${ apprList[7].apprStatus eq 'Y' && apprList[7].rStatus eq 'N'}">
												결재 완료
											</c:when>
											<c:when test = "${ apprList[7].apprStatus eq 'Y' && apprList[7].rStatus eq 'Y'}">
												반려
											</c:when>
										</c:choose>
									</c:if>
								</td>
								<td>
									<c:if test="${ !empty apprList[8]}">
										<c:choose>
											<c:when test = "${ d.completeDate != null && apprList[8].apprStatus eq 'N' && d.rStatus eq 'Y'}">
												반려 처리
											</c:when>
											<c:when test = "${ d.completeDate != null && apprList[8].apprStatus eq 'N' }">
												전결
											</c:when>
											<c:when test = "${ loginUser.memNo eq apprList[8].staffNo && apprList[8].apprStatus eq 'N'}">
												<button class="appr_btn">결재</button>
											</c:when>
											<c:when test = "${ apprList[8].apprStatus eq 'Y' && apprList[8].rStatus eq 'N'}">
												결재 완료
											</c:when>
											<c:when test = "${ apprList[8].apprStatus eq 'Y' && apprList[8].rStatus eq 'Y'}">
												반려
											</c:when>
										</c:choose>
									</c:if>
								</td>
							</tr>
							<script>
								$(function(){
					
									var td = $("#tr4").children();
									var td2 = $("#tr8").children();

								    var size = ${apprList.size()};
								    var size2 = ${checkList.size()};
								   
								    // 후결 버튼 생성
								    
								    for(var i = 8; i > -1; i--){
										tdText = (td.eq(i).text()).trim();
										if(tdText == '결재 완료'){
											for(var j = i-1; j > -1; j--){ 
												if(td.eq(j).find('.appr_btn').length){
													td.eq(j).children().text("후결");
												}
											}
												break;
										}
								    }
								    
								    // 결재선 완료 문구 글씨 색
								    for(var i = 0; i < size; i++){
								    	var tdText = td.eq(i);
								    	if((tdText.text()).trim() == '결재 완료' || (tdText.text()).trim() == '전결' || (tdText.text()).trim() == '반려 처리'){
								    		tdText.css("color","#477A8F");
								    		tdText.css("font-weight","bold");
								    	}else{
								    		tdText.css("color","#E94B4B");
								    		tdText.css("font-weight","bold");
								    	}
								    }
								    
								    // 참조선 완료 문구 글씨 색
								    for(var i = 0; i < size2; i++){
								    	var tdText = td2.eq(i);
								    	if((tdText.text()).trim() == '확인 완료'){
								    		tdText.css("color","#477A8F");
								    		tdText.css("font-weight","bold");
								    	}else{
								    		tdText.css("color","#E94B4B");
								    		tdText.css("font-weight","bold");
								    	}
								    }
								});
							</script>
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
								<td>
									<c:if test="${ !empty checkList[0]}">
										<c:choose>
											<c:when test = "${ d.completeDate != null && checkList[0].apprStatus eq 'N' }">
												미확인
											</c:when>
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
											<c:when test = "${ d.completeDate != null && checkList[1].apprStatus eq 'N' }">
												미확인
											</c:when>
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
											<c:when test = "${ d.completeDate != null && checkList[2].apprStatus eq 'N' }">
												미확인
											</c:when>
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
											<c:when test = "${ d.completeDate != null && checkList[3].apprStatus eq 'N' }">
												미확인
											</c:when>
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
											<c:when test = "${ d.completeDate != null && checkList[4].apprStatus eq 'N' }">
												미확인
											</c:when>
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
											<c:when test = "${ d.completeDate != null && checkList[5].apprStatus eq 'N' }">
												미확인
											</c:when>
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
											<c:when test = "${ d.completeDate != null && checkList[6].apprStatus eq 'N' }">
												미확인
											</c:when>
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
											<c:when test = "${ d.completeDate != null && checkList[7].apprStatus eq 'N' }">
												미확인
											</c:when>
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
											<c:when test = "${ d.completeDate != null && checkList[8].apprStatus eq 'N' }">
												미확인
											</c:when>
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
					<span id="doc_title">${ d.dTitle }</span>
				    <table class="appr_detail_subtable">
						<tr class="tr2" id="tr2-1">
							<td>신청일</td>
							<td colspan="3">${ d.draftDate }</td>
						</tr>
						<tr class="tr2" id="tr2-2">
							<td>휴직자 성명</td>
							<td colspan="3">${ d.drafterName }</td>
						</tr>
						<tr class="tr2" id="tr2-3">
							<td>소속</td>
							<td>${ d.drafterDeptName}부</td>
							<td>직위</td>
							<td>${ d.drafterRankName }</td>
						</tr>
						<tr class="tr2" id="tr2-4">
							<td>휴직 사유</td>
							<td>${ absenceInfo.reason }</td>
							<td>일수</td>
							<td>${ absenceInfo.totalDate }</td>
						</tr>
						<tr class="tr2" id="tr2-5">
							<td>휴직 시작일</td>
							<td>${ absenceInfo.startDate }</td>
							<td>휴직 종료일</td>
							<td>${ absenceInfo.endDate }</td>
						</tr>
					</table>
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
	<!-- 결재 버튼 모달 -->
       <div id="my_modal" class="modal-dragscroll">
	       <span style="font-size:20px; color: black; font-weight: bold;"> ${ loginUser.name } </span>님 
	       <br>
	       <br>
           <div class="n-emp-i">
            	<h4 style="color: #477A8F; margin-bottom: 5px; font-weight: bolder;">결재/반려 하시겠습니까? </h4> <br>
                <div style="display: flex;">
	                <c:url var="approvalSigning" value="approvalSigning.do">
						<c:param name="docTempNo" value="${d.docTempNo}"/>
						<c:param name="docNo" value="${ d.docNo }"/>
					</c:url>
					<c:url var="approvalRejecting" value="approvalRejecting.do">
						<c:param name="docTempNo" value="${d.docTempNo}"/>
						<c:param name="docNo" value="${ d.docNo }"/>
					</c:url>
                    <button onclick="location.href='${approvalSigning}'">결재</button>
                    
                    <button onclick="location.href='${approvalRejecting}'">반려</button>
                </div>
           </div>
    	   <a class="modal-close-btn cursor">X</a>
        </div>
        
    <!-- 확인 버튼 모달 -->
        <div id="my_modal1" class="modal-dragscroll">
	       <br>
	       <span style="font-size:20px; color: black; font-weight: bold;"> ${ loginUser.name } </span>님
           <div class="n-emp-i">
            	<h4 style="color: #477A8F; margin-bottom: 5px; font-weight: bolder;">확인 하시겠습니까? </h4> <br>
                <div>
                    <c:url var="referSigning" value="referSigning.do">
						<c:param name="docTempNo" value="${d.docTempNo}"/>
						<c:param name="docNo" value="${ d.docNo }"/>
					</c:url>
                    <button onclick="location.href='${referSigning}'">확인</button>
                </div>
           </div>
    	   <a class="modal-close-btn cursor">X</a>
        </div>

 <script>
    function modal(id) {
       var zIndex = 9999;
       var modal = $('#' + id);

       // 모달 div 뒤에 희끄무레한 레이어
       var bg = $('<div>')
          .css({
             position: 'fixed',
             zIndex: zIndex,
             left: '0px',
             top: '0px',
             width: '100%',
             height: '100%',
             overflow: 'auto',
             // 레이어 색갈은 여기서 바꾸면 됨
             backgroundColor: 'rgba(0,0,0,0.4)'
          })
          .appendTo('body');

       modal
          .css({
             position: 'fixed',
             boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

             // 시꺼먼 레이어 보다 한칸 위에 보이기
             zIndex: zIndex + 1,

             // div center 정렬
             top: '50%',
             left: '50%',
             transform: 'translate(-50%, -50%)',
             msTransform: 'translate(-50%, -50%)',
             webkitTransform: 'translate(-50%, -50%)'
          })
          .show()
          // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
          .find('.modal-close-btn')
          .on('click', function() {
             bg.remove();
             modal.hide();
          });
    }

    $('.appr_btn').on('click', function() {
       // 결재버튼 모달창 띄우기
       modal('my_modal');
    });
    
    $('.confirm_btn').on('click', function(){
       // 확인버튼 모달창 띄우기
       modal('my_modal1');
    });
 </script>
</body>
</html>