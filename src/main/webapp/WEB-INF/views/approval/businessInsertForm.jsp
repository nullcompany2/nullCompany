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
	<style>  
       body {
                font-family: "Noto Sans KR", sans-serif;
                padding: 0px; margin: 0px;
                box-sizing:board-box;
            }
 
      .modal-dragscroll{
      	  display: none;
          width: 750px;
          height: 600px;
          padding: 10px 10px;
          background-color: #fefefe;
          border: 1px solid #888;
          border-radius: 3px;
          text-align: center;
          color:rgb(65, 65, 66);
         overflow: auto;
      }
       .modal-dragscroll .modal-close-btn {
          position: absolute;
          top: 10px;
          right: 10px;
       }
       
       button:hover{
           cursor: pointer;
       }

       .modal-close-btn{
          cursor: pointer;
       }

       #deptList{
          position: absolute;
          width: 200px;
          height: 430px;
          top: 100px;
          left: 50px;
       }

       .depts{
          border:none;
          color: white;
          background: #477A8F;
          width: 80px;
          height: 30px;
          margin: 10px;
          margin-top: 20px;
          border-radius: 10px;
       }
       #staffList{
         position: absolute;
          width: 400px;
          height: 430px;
          top: 100px;
          left: 300px;
          text-align: left;
          
       }
       #selBtns{
          position: absolute;
          width: 50px;
          height: 430px;
          top: 100px;
          left: 490px;
          padding: 10px;
       }

       #selBtns img{
          cursor: pointer;
       }
       



       #d1{
          position: absolute;
          top: 50px;
          left: 50px;
       }

       #d2{
          position: absolute;
          top: 50px;
          left: 300px;
       }

       .staffInsert{
          position: absolute;
          width: 80px;
          height: 30px;
          top: 560px;
          left: 335px;
          border: none;
          background: #477A8F;
          color: white;
          border-radius: 10px;
       }
       #lt{
         position: absolute;
         top: 80px;
         left: 300px;
       }
    </style>
    <script>
    	$(document).ready(function(){
    		var checkload = true;
    		
    		
	    	$(window).on('beforeunload', function(){
	    		return '...';
	    	});
    	});
    </script>
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
						<span class="cb" id="cb1">기안하기</span>
                </div>
				<div class="c-ic">
                    <span id="appr_set">기본 설정</span>
					<table class="appr_insert_table1" >
						<tbody>
							<tr id="tr1">
								<td>문서 종류</td>
								<td>${ d.formName }</td>
								<td>기안부서</td>
								<td>${d.drafterDeptName}부</td>
                            </tr>
                            <tr id="tr1">
								<td>임시 번호</td>
								<td>${ d.docTempNo }</td>
								<td>기안자</td>
								<td>${d.drafterRankName} / ${d.drafterName}</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="appr_line" id="appr_line">
                        <span id="appr_set">결재선 설정</span>
                        <span class="cb" id="cb2">결재자 설정</span>
                        <span class="cb" id="cb3">참조자 설정</span>
                        <span class="cb" id="cb4">수신자 설정</span>
                    </div>
                    <table class="appr_insert_table2" >
                        <tbody>
							<tr id="tr2">
								<td rowspan="4">결재</td>
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
							<tr id="tr3">
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
							<tr id="tr4">
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
							<tr id="tr5">
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
							<tr id="tr6">
								<td rowspan="3">참조</td>
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
							<tr id="tr7">
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
								<td rowspan="2">수신</td>
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
							<tr id="tr10">
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
                        </tbody>
                    </table>
                    <br>
					<br>
					<span id="detail_set">상세 입력</span>
					<br>
					<br>
					<br>
                    <span style="color: #477A8F; font-weight: bolder;">제목</span>
                    <input id="dTitle" type="text"/>
                    <br>
                    <br>
                    <span style="color: #477A8F; font-weight: bolder;">내용</span>
                    <br>
                    <br>
					<textarea id="dContent" name="dContent"></textarea>
					<br>
					<br>
					<br>
					<hr>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 결재자 선택 모달 -->
     <div id="apprSet" class="modal-dragscroll">
         <span style="float: left; color: #477A8F; font-weight: bolder;">결재선 설정</span>

         <span id="d1"style="color: #477A8F;">부서 선택</span>
         <span id="d2"style="color: #477A8F;">사원 목록</span>
         <div id="deptList" style="border: 1px solid black;">
         	<c:choose>
         		<c:when test="${ !empty dtList }">
         			<c:forEach var="dt" items="${ dtList }">
	         			<c:choose>
	         				<c:when test="${ dt.deptName eq '부서 선택' }">
	         					<button class="depts" id="${ dt.deptNo }">미등록</button>
	         				</c:when>
	         				<c:otherwise>         				
	         					<button class="depts" id="${ dt.deptNo }">${ dt.deptName }부</button>
	         				</c:otherwise>
	         			</c:choose>
         			</c:forEach>
         		</c:when>
         	</c:choose>
         </div>
         <div id="staffList" style="border: 1px solid black;">
         </div>
         <p id="lt" style="text-align: left; color: #477A8F; font-size: 10pt; margin: 0px;">&nbsp;<결재자 선택></p><br>
         <button class="staffInsert">등록</button>
         <a class="modal-close-btn cursor">X</a>
      </div>
      
      <!-- 참조자 선택 모달 -->
      <div id="checkSet" class="modal-dragscroll">
         <span style="float: left; color: #477A8F; font-weight: bolder;">결재선 설정</span>

         <span id="d1"style="color: #477A8F;">부서 선택</span>
         <span id="d2"style="color: #477A8F;">사원 목록</span>
         <div id="deptList" style="border: 1px solid black;">
         	<c:choose>
         		<c:when test="${ !empty dtList }">
         			<c:forEach var="dt" items="${ dtList }">
	         			<c:choose>
	         				<c:when test="${ dt.deptName eq '부서 선택' }">
	         					<button class="depts" id="${ dt.deptNo }">미등록</button>
	         				</c:when>
	         				<c:otherwise>         				
	         					<button class="depts" id="${ dt.deptNo }">${ dt.deptName }부</button>
	         				</c:otherwise>
	         			</c:choose>
         			</c:forEach>
         		</c:when>
         	</c:choose>
         </div>
         <div id="staffList" style="border: 1px solid black;">
         </div>
         <p id="lt" style="text-align: left; color: #477A8F; font-size: 10pt; margin: 0px;">&nbsp;<참조자 선택></p><br>
         <button class="staffInsert">등록</button>
         <a class="modal-close-btn cursor">X</a>
      </div>
      
      <!-- 수신자 선택 모달 -->
      <div id="receiveSet" class="modal-dragscroll">
         <span style="float: left; color: #477A8F; font-weight: bolder;">결재선 설정</span>

         <span id="d1"style="color: #477A8F;">부서 선택</span>
         <span id="d2"style="color: #477A8F;">사원 목록</span>
         <div id="deptList" style="border: 1px solid black;">
         	<c:choose>
         		<c:when test="${ !empty dtList }">
         			<c:forEach var="dt" items="${ dtList }">
	         			<c:choose>
	         				<c:when test="${ dt.deptName eq '부서 선택' }">
	         					<button class="depts" id="${ dt.deptNo }">미등록</button>
	         				</c:when>
	         				<c:otherwise>         				
	         					<button class="depts" id="${ dt.deptNo }">${ dt.deptName }부</button>
	         				</c:otherwise>
	         			</c:choose>
         			</c:forEach>
         		</c:when>
         	</c:choose>
         </div>
         <div id="staffList" style="border: 1px solid black;">
         </div>
         <p id="lt" style="text-align: left; color: #477A8F; font-size: 10pt; margin: 0px;">&nbsp;<수신자 선택></p><br>
         <button class="staffInsert">등록</button>
         <a class="modal-close-btn cursor">X</a>
      </div>
      <!-- 현재 임시문서번호 -->
      <input type="hidden" id="docTempNo" value="${ d.docTempNo }"/>
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

    $('#cb2').on('click', function() {
       // 결재자 설정 모달
       modal('apprSet');
    });
    
    $('#cb3').on('click', function() {
        // 결재자 설정 모달
        modal('checkSet');
     });
    
    $('#cb4').on('click', function() {
        // 결재자 설정 모달
        modal('receiveSet');
     });
    
    $(function(){
    	$('.depts').on('click',function(){
    		var deptNo = $(this).attr('id');
    		var docTempNo = $('#docTempNo').val();
    		$.ajax({
                url: "selectDeptStaff.do",
                type: "post",
             
                data: {
                    "deptNo": deptNo,
                    "docTempNo": docTempNo
                },
                success: function (data) {
                    console.log("성공띠");
                },
                error: function (request,
                    status, error) {
                    console.log("에이작스 오류");   
                }
            });
    	});
    });
 </script>
	
</body>
</html>