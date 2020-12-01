<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>업무연락 문서 작성하기</title>
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
       
       #drafterCheck{
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
       
       #drafterCheck .modal-close-btn{
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
       .staffList{
          position: absolute;
          width: 400px;
          height: 430px;
          top: 100px;
          left: 300px;
          text-align: left;
          padding:15px;
          
       }
       
       .staffList input{
       	  margin-top:10px;
       }
       
       #apprdList{
       	  padding:3px;
          position: absolute;
          width: 170px;
          height: 430px;
          top: 100px;
          left: 60px;
          text-align: left;
       }
       
       #apprdList input{
       	  margin-top:10px;
       }

       #checkdList{
          padding:3px;
          position: absolute;
          width: 170px;
          height: 430px;
          top: 100px;
          left: 290px;
          text-align: left;
       }
       
       #checkdList input{
       	  margin-top:10px;
       }

       #receivedList{
          padding:3px;
          position: absolute;
          width: 170px;
          height: 430px;
          top: 100px;
          left: 520px;
          text-align: left;
       }
       
       #receivedList input{
       	  margin-top:10px;
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
       
       #d3{
          position: absolute;
          top: 50px;
          left: 60px;
       }

       #d4{
          position: absolute;
          top: 50px;
          left: 290px;
       }
       
       #d5{
          position: absolute;
          top: 50px;
          left: 520px;
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
       
       #staffDelete{
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
       
       .tdStaff{
       		margin-left:20px;
       }
    </style>
    <script>
    	$(function(){
    		var warning = true;
    		
    		// 문서 기안하기
   	    	$('#draftBtn').on('click',function(){
   	            warning = false;
   	            
   	    		var docTempNo = $('#docTempNo').val();
   	    		var dTitle = $('#dTitle').val();
   	            var dContent = $("#dContent").val();
   	            
   	            location.href = "insertBusinessDocumet.do?docTempNo="+docTempNo+"&dTitle="+dTitle+"&dContent="+dContent;
   	    	});
    		
	    	$(window).on('beforeunload', function(){
	    		
	    		if(warning){
	    			// 페이지 나갈 때 현재 문서 정보 삭제
		    		var docTempNo = $('#docTempNo').val();
	    			$.ajax({
	                    url: "deleteTempInfo.do",
	                    type: "post",
	                    data: {
	                        "docTempNo": docTempNo
	                    },
	                    success: function (data) {
							console.log("성공");
	                    },
	                    error: function (request,
	                        status, error) {
	                        console.log("에이작스 오류");   
	                    }
	                });
	    		}else{
	    			
	    		}
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
								<td>기안자</td>
								<td>${d.drafterDeptName}부 / ${d.drafterRankName} / ${d.drafterName}</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="appr_line" id="appr_line">
                        <span id="appr_set">결재선 설정</span>
                        <span class="cb" id="cb2">결재자 설정</span>
                        <span class="cb" id="cb3">참조자 설정</span>
                        <span class="cb" id="cb4">수신자 설정</span>
                        <span class="cb" id="cb5">결재선 미리보기</span>
                    </div>
                    <table class="appr_insert_table2" >
                        <tbody>
							<tr id="tr2">
								<td>결재</td>
								<td style="text-align: left;"></td>
							</tr>
							<tr id="tr6">
								<td>참조</td>
                                <td style="text-align: left;"></td>
							</tr>
							<tr id="tr9">
								<td>수신</td>
                                <td style="text-align: left;"></td>
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
         <div class="staffList" style="border: 1px solid black;">
         </div>
         <p id="lt" style="text-align: left; color: #477A8F; font-size: 10pt; margin: 0px;">&nbsp;<결재자 선택></p><br>
         <button class="staffInsert" id="apprStaffInsert">등록</button>
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
         <div class="staffList" style="border: 1px solid black;">
         </div>
         <p id="lt" style="text-align: left; color: #477A8F; font-size: 10pt; margin: 0px;">&nbsp;<참조자 선택></p><br>
         <button class="staffInsert" id="checkStaffInsert">등록</button>
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
         <div class="staffList" style="border: 1px solid black;">
         </div>
         <p id="lt" style="text-align: left; color: #477A8F; font-size: 10pt; margin: 0px;">&nbsp;<수신자 선택></p><br>
         <button class="staffInsert" id="receiveStaffInsert">등록</button>
         <a class="modal-close-btn cursor">X</a>
      </div>
      
      <!-- 결재선 미리보기 모달 -->
      <div id="previewSet" class="modal-dragscroll">
         <span style="float: left; color: #477A8F; font-weight: bolder;">결재선 미리보기</span>

         <span id="d3"style="color: #477A8F;"><결재자 목록></span>
         <span id="d4"style="color: #477A8F;"><참조자 목록></span>
         <span id="d5"style="color: #477A8F;"><수신자 목록></span>
         <div id="apprdList" style="border: 1px solid black;">
         </div>
         <div id="checkdList" style="border: 1px solid black;">
         </div>
         <div id="receivedList" style="border: 1px solid black;">
        </div>
         <button id="staffDelete">삭제</button>
         <a class="modal-close-btn cursor">X</a>  
      </div>
      
      <!-- 기안 모달창 -->
      <div id="drafterCheck">
        <span style="font-size:20px; color: black; font-weight: bold;">${ loginUser.name }</span>님 
           <div class="n-emp-i">
                <h4 style="color: #477A8F; margin-bottom: 5px; font-weight: bolder;">문서를 기안 하시겠습니까? </h4> <br>
                <div>
                    <button id="draftBtn">기안</button>
                </div>
            </div>
            <a class="modal-close-btn cursor">X</a>
        </div>
      
      <!-- 현재 임시문서번호 -->
      <input type="hidden" id="docTempNo" value="${ d.docTempNo }"/>

 <script>
    function modal(id) {
       var zIndex = 9999;
       var modal = $('#' + id);
       var staffList = $('.staffList');

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
          .find('.modal-close-btn, .staffInsert, #staffDelete')
          .on('click', function() {
             bg.remove();
             modal.hide();
             staffList.html("");
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
    
    $('#cb5').on('click',function(){
    	// 결재선 미리보기 모달
    	modal('previewSet');
    });
    
    $('#cb1').on('click',function(){
    	// 기안 시 보이는 모달
    	var apprExist = $("#tr2").children();
   		var chkExist = $("#tr6").children();
   		var recExist = $("#tr9").children();
   		
   		// 결재선이 존재할 때
   		if(apprExist.eq(1).find('.tdStaff').length || chkExist.eq(1).find('.tdStaff').length || recExist.eq(1).find('.tdStaff').length){
	    	modal('drafterCheck');
   		}else{
   			alert("결재선을 지정하세요");
   		}
    });
    
    // 부서별 사원정보 가져오기
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
                	
                	$staffList = $(".staffList");
                	$staffList.html("");
                    $staffs = "";
                	
                    for(var i in data){
                    	$staffs += '<input id="step" type="checkbox" name="staff" value="'+data[i].memNo + '_' + data[i].rankNo 
                    	          +'" onclick="doOpenCheck(this);"/><label for="staff">&nbsp;&nbsp;['
                    	          +data[i].rankName+']&nbsp;&nbsp;&nbsp;&nbsp;'+data[i].name+'</label><br>';
                    }
                    $staffList.html($staffs);
                },
                error: function (request,
                    status, error) {
                    console.log("에이작스 오류");   
                }
            });
    	});
    	
    	$('.staffInsert').on('click',function(){
    		var chkMem = $('.staffList input[name="staff"]:checked').val();
    		var docTempNo = $('#docTempNo').val();
    		
    		var valSplit = chkMem.split('_');
    		
    		var staffNo = valSplit[0];
    		var staffRankNo = valSplit[1];
    		var lineNo = 0;
    		
    		var btnId = $(this).attr('id');
    		
    		if(btnId == 'apprStaffInsert'){
    			lineNo = 1;
    		}else if(btnId == 'checkStaffInsert'){
    			lineNo = 2;
    		}else{
    			lineNo = 3;
    		}

    		$.ajax({
                url: "insertStep.do",
                type: "post",
                traditional : true,
                data: {
                    "docTempNo": docTempNo,
                    "staffNo" : staffNo,
                    "staffRankNo" : staffRankNo,
                    "lineNo" : lineNo
                },
                success: function (data) {
                	if(data.lineNo == 1){
                		$apprTd = $('#tr2 td').eq(1);
                		$staff1 = "";
                		$apprdList = $('#apprdList');
                		$staff2 = "";
                		
						$staff1 = '<span class="tdStaff" id="'+ data.staffNo +'"/>'+data.staffRankName+'&nbsp;&nbsp;/&nbsp;&nbsp;'
						        + data.staffName + '</label>';
                		
                		$staff2 = '<input id = "'+ data.staffNo + '" type="checkbox" name="step" value="'+data.staffNo
                				+'"/><label id="'+data.staffNo+'" for="'+ data.staffNo +'">&nbsp;&nbsp;['
			          	        +data.staffRankName+']&nbsp;&nbsp;&nbsp;&nbsp;'+data.staffName+'</label><br>';
			          	
	          	        $apprTd.append($staff1);
                		$apprdList.append($staff2);
                		
                	}else if(data.lineNo == 2){
                		$checkTd = $('#tr6 td').eq(1);
                		$staff1 = "";
                		$checkdList = $('#checkdList');
                		$staff2 = "";
                		
                		$staff1 = '<span class="tdStaff" id="'+ data.staffNo +'"/>'+data.staffRankName+'&nbsp;&nbsp;/&nbsp;&nbsp;'
				        		+ data.staffName + '</label>';
        		
        				$staff2 = '<input id = "'+ data.staffNo + '" type="checkbox" name="step" value="'+data.staffNo
		        				+'"/><label id="'+data.staffNo+'" for="'+ data.staffNo +'">&nbsp;&nbsp;['
			          	        +data.staffRankName+']&nbsp;&nbsp;&nbsp;&nbsp;'+data.staffName+'</label><br>';
			          	        
			          	$checkTd.append($staff1);
			          	$checkdList.append($staff2);
			          	
                	}else{
                		$receiveTd = $("#tr9 td").eq(1);
                		$staff1 = "";
                		$receivedList = $("#receivedList");
                		$staff2 = "";
                		
                		$staff1 = '<span class="tdStaff" id="'+ data.staffNo +'"/>'+data.staffRankName+'&nbsp;&nbsp;/&nbsp;&nbsp;'
		        				+ data.staffName + '</label>';
		
						$staff2 = '<input id = "'+ data.staffNo + '" type="checkbox" name="step" value="'+data.staffNo
		        				+'"/><label id="'+data.staffNo+'" for="'+ data.staffNo +'">&nbsp;&nbsp;['
			          	        +data.staffRankName+']&nbsp;&nbsp;&nbsp;&nbsp;'+data.staffName+'</label><br>';
			          	
			          	$receiveTd.append($staff1);
			          	$receivedList.append($staff2);
                	}
                	
                },
                error: function (request,
                    status, error) {
                    console.log("에이작스 오류");   
                }
            });
    	});
    	// 결재선 미리보기 --> 스텝 삭제
    	$('#staffDelete').on('click',function(){
    		var staffNoArray = [];
    		$('#previewSet input[name="step"]:checked').each(function(i){
    			staffNoArray.push($(this).val());
    		});
    		
    		var docTempNo = $('#docTempNo').val();
    		
    		console.log(docTempNo);
    		console.log(staffNoArray);
    		
    		$.ajax({
    			url :"deleteStep.do",
    			type : "post",
    			dataType : "json",
                traditional : true,
                data : { "docTempNo" : docTempNo, "staffNoArray" : staffNoArray },
                success: function (data) {
                	for(var i in data){
                		$('span').remove('#' + data[i].staffNo);
                		$('input').remove('#' + data[i].staffNo);
                		$('label').remove('#' + data[i].staffNo);
                	}
                	
                },
                error: function (request,
                    status, error) {
                    console.log("에이작스 오류");   
                }
    		});
    	});
    });
    
    // 사원 선택 시 하나만 체크 되도록
    function doOpenCheck(chk){
    	var obj = document.getElementsByName("staff");
    	for(var i=0; i<obj.length; i++){
    		if(obj[i] != chk){
    			obj[i].checked = false;
    		}
    	}
    }
 </script>
	
</body>
</html>