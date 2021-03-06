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
	<link rel="stylesheet" href='<c:url value="/resources/css/approval_InsertForm.css"/>'>
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
				<div class="c-ic">
                    <span id="appr_set">기본 설정</span>
                    <br>
                    <br>
                    <span id="w1">* 문서 종류를 선택하고 결재선을 지정하세요.</span>
					<table class="appr_insert_table1" >
						<tbody>
							<tr id="tr1">
								<td>문서 종류</td>
								<td>
                                    <select class="doc_type" id="doc_type" style="height:30px;">
                                        <option value="">선택</option>
                                        <option value="1">업무 연락</option>
                                        <option value="2">회람</option>
                                        <option value="3">휴가</option>
                                        <option value="4">휴직</option>
                                        <option value="5">사직</option>
                                    </select>
                               
                                    <button id="selectFormBtn">선택</button>
                                </td>
								<td>기안자</td>
								<td>${loginUser.deptName}부 / ${loginUser.rankName} / ${ loginUser.name }</td>
                            </tr>
                        </tbody>
                    </table>
                    <script>
                    	$(function(){
                    		$('#selectFormBtn').click(function(){
                    			var option = $('#doc_type option:selected').val();
                    			
                    			if(!option == ""){
									location.href='selectFormView.do?option='+option;
                    			}else{
                    				alert('문서 종류를 선택하세요');
                    			}
							});
                    	});
                    </script>
				</div>
			</div>
		</div>
	</div>
</body>
</html>