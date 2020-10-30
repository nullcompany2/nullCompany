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
	<link rel="stylesheet" href='<c:url value="/resources/css/approval_leaveInsertForm.css"/>'>
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
						<button id="appr_insert_btn">작성하기</button>
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
						<span class="cb" id="cb1">기안하기</span>
						<span class="cb" id="cb2">임시저장</span>
                </div>
				<div class="c-ic">
                    <span id="appr_set">기본 설정</span>
					<table class="appr_insert_table1" >
						<tbody>
							<tr id="tr1">
								<td>문서 종류</td>
								<td>
                                    <select class="doc_type" id="doc_type">
                                        <option value="">선택</option>
                                        <option value="">업무 연락</option>
                                        <option value="">회람</option>
                                        <option value="">휴가</option>
                                        <option value="">휴직</option>
                                        <option value="">사직</option>
                                    </select>
                                </td>
								<td>기안자</td>
								<td>현재 로그인 사용자 부서/직급/성명</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="appr_line" id="appr_line">
                        <span id="appr_set">결재선 설정</span>
                        <span class="cb" id="cb3">결재선 설정</span>
                    </div>
                    <table class="appr_insert_table2" >
                        <tbody>
							<tr id="tr2">
								<td rowspan="4">결재</td>
								<td>결재자 직급</td>
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
								<td>결재완료 이미지</td>
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
								<td>결재완료 일자</td>
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
								<td>결재자 성명</td>
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
                                <td>확인자 직급</td>
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
								<td>확인 완료 문구</td>
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
								<td>확인자 성명</td>
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
                                <td>수신자 직급</td>
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
								<td>수신자 성명</td>
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
                    <span id="appr_set">휴가 설정</span>
                    <table class="appr_insert_table3" >
                        <tbody>
							<tr id="tr11">
								<td>휴가 종류</td>
								<td>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <span>휴가 종류&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</span>
                                    <select class="leave_type" id="leave_type">
                                        <option value="">선택</option>
                                        <option value="">연차</option>
                                        <option value="">경조사</option>
                                        <option value="">병가</option>
                                        <option value="">훈련</option>
                                        <option value="">교육</option>
                                    </select>
                                    <span id="w1">* 종류가 다른 휴가는 별도 신청</span>
                                </td>
							</tr>
							<tr id="tr12">
								<td><span>휴가 기간</span></td>
								<td>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <span>휴가 시작일&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</span>
                                    <input type="date" id="start_date"/>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <span>휴가 종료일&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</span>
                                    <input type="date" id="end_date"/>
                                    <button id="calc">일수 계산</button>
                                    <span id="w2">* 휴가 기간은 규정 단위(일)로 선택 / 비연속 기간은 별도 신청</span>
                                    <br><br>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <span>선택 일수&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</span>
                                    <span id="period">0</span>
                                    <span>일</span>
                                </td>
							</tr>
							<tr id="tr13">
								<td><span>사유</span></td>
								<td><input type="text" id="reason" placeholder="휴가 사유를 입력하세요"/></td>
							</tr>
						</tbody>
					</table>
					<!-- 휴가/휴직 일수 계산 함수-->
                    <script>
                        $(function(){
                            $("#calc").on("click",function(){
                                var start = $("#start_date").val();
                                var end = $("#end_date").val();
                                
                                if(start != "" && end != ""){
                                    var sarr = start.split('-');
                                    var earr = end.split('-');

                                    var day1 = new Date(sarr[0],sarr[1]-1,sarr[2]);
                                    var day2 = new Date(earr[0],earr[1]-1,earr[2]);

                                    var calcDate = 0;

									var startDate = day1;
									var endDate = day2;

                                    if(day1.getTime() > day2.getTime()){
                                        alert("잘못 입력하셨습니다. 휴가 종료일을 확인하세요.");
                                    }else{
                                        while(true){

                                            if(startDate.getTime() > endDate.getTime()){
                                                if(calcDate == 0){
                                                    alert("주말은 휴가 일수에 포함되지 않습니다.");
                                                    $("#period").empty();
                                                    $("#period").text(calcDate);
                                                    break;
                                                }else{
                                                    $("#period").empty();
                                                    $("#period").text(calcDate);
                                                    break;
                                                }
                                            }else{
                                                var tmpDay = startDate.getDay();

                                                if(tmpDay != 0 && tmpDay != 6){
                                                    calcDate++;
                                                }
                                            }
                                            startDate.setDate(day1.getDate()+1);
											
                                        }
                                    }

                                }else if(start == "" && end == ""){
                                    alert("휴가 기간을 입력하세요.");
                                }else if(start == ""){
                                    alert("휴가 시작일을 입력하세요.");
                                }else{
                                    alert("휴가 종료일을 입력하세요.");
                                }
                            });
                        });
                    </script>
					<!-- <br>
					<br>
					<span id="appr_set">제목</span>
					<input type="text" id="doc_title"/>
					<br>
					<br>
					<span id="appr_set">상세입력</span>
					 -->
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