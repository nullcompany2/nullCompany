<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	


	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<link rel="stylesheet" href="<c:url value="/resources/css/myDiligence.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/css/younsu-subNavi.css"/>">

	

</head>

<body>
	
    <div id='wrap'>
   		<c:import url="../common/header.jsp"/>
		
		<div class="container">
			<!-- 전체높이지정용 -->
			<div id="drag-wrap">
                <div id="drag"></div>
			</div>
			<!--  -->
			<!-- 세부 네비 시작 -->
			<c:import url="../common/personnelSubNavi.jsp"/>
			<!-- 세부 네비끝 -->
			
			<!-- 내부 컨텐츠 -->
			<div class="contents">
				<!-- 컨텐츠 타이틀명 -->
				<div class="contents-title">
					<span class="ct1">근태 현황</span>
				</div>
				<div class="contents-wrap drag-scrollbar">
					<!-- 근태현황 -->
					<div class="ic-navi">
						<div href="" class="cate cursor" id="status-diligence">근태 현황</div>
						<div href="" class="cate cursor" id="modi-diligence">근태 수정 내역</div>
					</div>
	
					<div id="show-status-diligence" class="c-ic">
						<h4>올해 근태 통계</h4>
						
						<table class="d-table" id="statistics-tbl">
							<tr class="d-tbl-il">
								<th class="d-tbl-th">근무시간</th>
								<td class="d-tbl-td" colspan="3">[기본근태] 기본근무시간 : ${setAttendance.timeAttendance } ~ ${setAttendance.timeOffWork }</td>
							</tr>
							<tr class="d-tbl-il">
								<th class="d-tbl-th">지각</th>
								<td class="d-tbl-td">${lateCount }회</td>
								<th class="d-tbl-th">월 평균 지각</th>
								<td class="d-tbl-td">${avgLateCount }회</td>
							</tr>
							<tr class="d-tbl-il">
								<th class="d-tbl-th">미체크(결근)</th>
								<td class="d-tbl-td">${noAttendanceCount }</td>
								<th class="d-tbl-th">퇴근체크(비정상)</th>
								<td class="d-tbl-td">${ noCheckOffwork }</td>
							</tr>                        
						</table>
						<style>
							.sixteen-thirtyOne{
								display: none;
							}
						</style>
						
						
						<div>
							<h4 style="margin-top: 100px; margin-bottom: 50px;">근태 현황</h4>
							<table class="i-table" id="application-record" onload="build();">
								<thead style="background: #e8ecee;">
									<tr class="date_tbl_title">
									</tr>                     
									<tr class="date_tbl">										
									</tr>
					
								</thead>
									
								<tbody>
									<tr >
										<td scope="col" rowspan="2" class="ta">Han</td>
										<td scope="col" rowspan="2" class="ta">인사</td>
										<td scope="col" rowspan="2" class="ta">0 / 3</td>
										<td scope="col" rowspan="2" class="ta"><a href="#"id="detail-r-l" class="cursor" style="color: #477A8F;">상세</a></td>
									</tr>
									<tr class="date_tbl_output">
										
									</tr>
									
									
								</tbody>
							</table>
							
						</div>
						
					</div>
					<!-- 근태 수정내역 -->
					<div id="show-modi-diligence" class="c-ic">
						<h4>수정내역</h4>
						<div style="margin-top: 10px; margin-bottom: 10px;">
							보기 : 
							<select name="modi-record" id="" class="sel-status cursor">
								<option value="">전체</option>
								<option value="">결재중</option>
								<option value="">결재 완료</option>
								<option value="">결재 취소</option>
								<option value="">반려</option>
							</select>
							<h4 style=" font-weight: normal;">총 <span>N</span>건</h4>
						</div>
						<table class="mr-tbl">
							<tr class="mr-tbl-il">
								<th class="mr-tbl-th" colspan="2">요청 날짜</th>
								<th class="mr-tbl-th">종류</th>
								<th class="mr-tbl-th" colspan="2">기존 시간</th>
								<th class="mr-tbl-th" colspan="2">요청 시간</th>
								<th class="mr-tbl-th" colspan="2">사유</th>
								<th class="mr-tbl-th">결과</th>
							</tr>
							<!-- 리스트 -->
							<tr>
								<td class="mr-tbl-td" colspan="2">2020-10-01</td>
								<td class="mr-tbl-td">출근</td>
								<td class="mr-tbl-td" colspan="2">00:00:00</td>
								<td class="mr-tbl-td" colspan="2">09:00:00</td>
								<td class="mr-tbl-td" colspan="2">전산오류</td>
								<td class="mr-tbl-td" >결재완료</td>
							</tr>
							
						</table>
					</div>
				</div>
				
			</div>
		</div>
		
	</div>
	<!-- 메인 -->
	<script>
		/* ic category */
		$("#status-diligence").click(function(){
			$("#show-modi-diligence").css("display","none")
			$("#show-status-diligence").css("display","block")
			$("#status-diligence").css("color","#477A8F")
			$("#modi-diligence").css("color","black")
		});
		$("#modi-diligence").click(function(){
			$("#show-status-diligence").css("display","none")
			$("#show-modi-diligence").css("display","block")
			$("#status-diligence").css("color","black")
			$("#modi-diligence").css("color","#477A8F")
		});

		var today = new Date(); // 오늘 날짜
		var date = new Date();
		var np = $('#np').click();
		var lastDay;
		
		$(function(){
		var forcalculDate = new Date(today.getFullYear(),today.getMonth()+1,0);	// 일자 테이블을 만들기위함.
			lastDay = forcalculDate.getDate();
			createDateTbl(lastDay);

			yearmonth.innerHTML = today.getFullYear() + "년 "+ (today.getMonth() + 1) + "월";
			build();
		});
		
		function beforem(){
			today = new Date(today.getFullYear(),today.getMonth() -1 ,today.getDate());
			var forcalculDate = new Date(today.getFullYear(),today.getMonth()+1,0);	// 일자 테이블을 만들기위함.
			lastDay = forcalculDate.getDate();
			createDateTbl(lastDay);
			
			$("#pp").trigger("click");
			console.log(today.getMonth()+1);
			build();
		}

		
		function nextm()  //다음 달을 today에 저장
		{
			today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
			var forcalculDate = new Date(today.getFullYear(),today.getMonth()+1,0);	// 일자 테이블을 만들기위함.
			lastDay = forcalculDate.getDate();
			createDateTbl(lastDay);
			
			build();
			$("#pp").trigger("click");
		}
		
		function build()
		{
			var yearmonth = document.getElementById("yearmonth"); //  년도와 월 출력할곳
			yearmonth.innerHTML = today.getFullYear() + "년 "+ (today.getMonth() + 1) + "월"; //년도와 월 출력
	
		}

		function nextdays(){
			$(".sixteen-thirtyOne").css('display','table-cell');
			$(".one-fifteen").css('display','none');
		}
		
		function predays(){
			$(".one-fifteen").css('display','table-cell');
			$(".sixteen-thirtyOne").css('display','none');	
		}
		
		// 일수 생성용 함수
		function createDateTbl(lastDay){
			console.log(lastDay);
			$(".date_tbl th").remove();
			$(".date_tbl_title th").remove();
			$("#cellCalendar lable").remove();
			$(".date_tbl_output td").remove();
			
			var $sTble = $(".date_tbl");
			var $rTble = $(".date_tbl_output");
			var $th_tr;
			var $th_title = $(".date_tbl_title");
			var $tr_td;
			
			var $th_tr = $('<th scope="col" rowspan="2" class="tr">').text("이름");
			$th_title.append($th_tr);
			var $th_tr =$('<th scope="col" rowspan="2" class="tr">').text("소속");
			$th_title.append($th_tr);
			var $th_tr =$('<th scope="col" rowspan="2" class="tr">').text("지각(미체크)");
			$th_title.append($th_tr);
			var $th_tr =$('<th scope="col" rowspan="2" class="tr">').text("상세");
			$th_title.append($th_tr);
			var $th_tr =$('<th scope="col" class="tr" style="text-align: center;" id="cellCalendar">').attr("colspan",lastDay-4);
			$th_title.append($th_tr);
			var $cellCalendar = $("#cellCalendar"); 
			$th_tr = $('<label class="cursor" for="" onclick="beforem()" id="before" style="margin-right: 20px;">').text("◁");
			$cellCalendar.append($th_tr);
			
			$th_tr = $('<label for="" id="yearmonth">');
			$cellCalendar.append($th_tr);
			
			$th_tr = $('<label class="cursor" for="" onclick="nextm()" id="next" style="margin-left: 20px;">').text("▷");
			$cellCalendar.append($th_tr);
			
			if(lastDay ==31){
				for(var i=1; i<=lastDay+2; i++) {
					if(i==16){
						$th_tr = $("<th class='tr one-fifteen cursor' id='np' onclick='nextdays()'>").text("NEXT");
						$tr_td = $("<td class='ta one-fifteen'>").text(">>");
						
					}
					else if(i<16){
						$th_tr = $("<th class='tr one-fifteen'>").text(i+"일");
						$tr_td = $("<td class='ta one-fifteen'>").attr("id",i + "R");
					}else if(i == lastDay+2){
						$th_tr = $("<th class='tr sixteen-thirtyOne cursor' id='pp' onclick='predays()'>").text("PRE");
						$tr_td = $("<td class='ta sixteen-thirtyOne'>").text("<<");
					}else{
						$th_tr = $("<th class='tr sixteen-thirtyOne' >").text(i-1+"일");
						$tr_td = $("<td class='ta sixteen-thirtyOne'>").attr("id",i-1 + "R");
					}
					$sTble.append($th_tr);
					$rTble.append($tr_td);
					
				}	
			}else if(lastDay == 30){
				for(var i=1; i<=lastDay+2; i++) {
					if(i==16){
						$th_tr = $("<th class='tr one-fifteen cursor' id='np' onclick='nextdays()'>").text("NEXT");
						$tr_td = $("<td class='ta one-fifteen'>").text(">>");
					}
					else if(i<16){
						$th_tr = $("<th class='tr one-fifteen'>").text(i+"일");		
						$tr_td = $("<td class='ta one-fifteen'>").attr("id",i + "R");

					}else if(i == lastDay+2){
						$th_tr = $("<th class='tr sixteen-thirtyOne cursor' id='pp' onclick='predays()'>").text("PRE");
						$tr_td = $("<td class='ta sixteen-thirtyOne'>").text("<<");

					}else{
						$th_tr = $("<th class='tr sixteen-thirtyOne'>").text(i-1+"일");
						$tr_td = $("<td class='ta sixteen-thirtyOne'>").attr("id",i-1 + "R");

					}
					$sTble.append($th_tr);
					$rTble.append($tr_td);
					
				}
			}else if(lastDay == 29){
				for(var i=1; i<=lastDay+2; i++) {
					if(i==16){
						$th_tr = $("<th class='tr one-fifteen cursor' id='np' onclick='nextdays()'>").text("NEXT");
						$tr_td = $("<td class='ta one-fifteen'>").text(">>");
					}
					else if(i<16){
						$th_tr = $("<th class='tr one-fifteen' >").text(i+"일");		
						$tr_td = $("<td class='ta one-fifteen'>").attr("id",i+"R");
					}else if(i == lastDay+2){
						$th_tr = $("<th class='tr sixteen-thirtyOne cursor' id='pp' onclick='predays()'>").text("PRE");
						$tr_td = $("<td class='ta sixteen-thirtyOne'>").text("<<");
					}else{
						$th_tr = $("<th class='tr sixteen-thirtyOne' >").text(i-1+"일");
						$tr_td = $("<td class='ta sixteen-thirtyOne'>").attr("id",i-1 + "R");
					}
					$sTble.append($th_tr);
					$rTble.append($tr_td);
					
				}
			}else{
				for(var i=1; i<=lastDay+2; i++) {
					if(i==16){
						$th_tr = $("<th class='tr one-fifteen cursor' id='np' onclick='nextdays()'>").text("NEXT");
						$tr_td = $("<td class='ta one-fifteen'>").text(">>");
					}
					else if(i<16){
						$th_tr = $("<th class='tr one-fifteen' >").text(i+"일");		
						$tr_td = $("<td class='ta one-fifteen'>").attr("id",i+"R");
					}else if(i == lastDay+2){
						$th_tr = $("<th class='tr sixteen-thirtyOne cursor' id='pp' onclick='predays()'>").text("PRE");
						$tr_td = $("<td class='ta sixteen-thirtyOne'>").text("<<");
					}else{
						$th_tr = $("<th class='tr sixteen-thirtyOne' >").text(i-1+"일");
						$tr_td = $("<td class='ta sixteen-thirtyOne'>").attr("id",i-1+"R");
					}
					$sTble.append($th_tr);
					$rTble.append($tr_td);
					
				}
			}
			
		}

	</script>	
	<!-- Modal -->
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
				.find('.md-btn-close')
				.on('click', function() {
					bg.remove();
					modal.hide();
				});
				
		}

		$('#detail-r-l').on('click', function() {
			// 모달창 띄우기
			modal('my_modal');
		});
		$(document).ready(function(){
			$(".md-btn-cancel").click(function(){
				var result = confirm("휴가신청을 취소하시겠습니까?");
			})
		})
	</script>
		<style>
			#my_modal {
				display: none;
				width: 900px;
				height: 550px;
				padding: 20px 60px;
				background-color: #fefefe;
				border: 1px solid #888;
				border-radius: 3px;
			}
	
			#my_modal .modal-close-btn {
				position: absolute;
				top: 10px;
				right: 10px;
			}
			.modal-dragscroll{
				overflow: auto;
			}
			.modal-dragscroll::-webkit-scrollbar {
				width: 10px;

			}
			.modal-dragscroll::-webkit-scrollbar-thumb {
				background-color: #e8ecee;
				border-radius: 15px;
			}
			.modal-dragscroll::-webkit-scrollbar-track {
				background-color: white;
				border-radius: 15px;
				box-shadow: white;
			}
			.md-tbl{
				width: 100%;
				border-top: solid 0.1px #477A8F;
				border-bottom: solid 0.1px #477A8F;
				border-collapse:collapse;
			}
			.md-tbl-il,
			.md-tbl-th,
			.md-tbl.td{
				width: 100%;
				border-top: solid 0.1px #477A8F;
				border-bottom: solid 0.1px #477A8F;
				border-collapse:collapse;
			}
			.md-tbl-th{
				width: 100px;
				height: 50px;
				background: #e8ecee;
				text-align: center;
				font-weight: normal;
			}
			.md-tbl-td{
				padding: 5px;
				text-align: center;
			}
			.md-btn{
				font-size: 17px;
				border: none;
				background-color: white;
				border-bottom: solid 0.1px #477A8F;
				border-bottom-right-radius: 2px;
				border-bottom-left-radius: 2px;
			}
		</style>
	<!-- Modal div -->
	<div id="my_modal" class="modal-dragscroll">
        <h4 style="color: #477A8F; margin-bottom: 30px;">근태 상세</h4>
        <h5 style="font-weight: normal;"><span>NAME</span> - <span>ID</span></h5>
        <h5 style="font-weight: normal; margin-bottom: 20px;">[기본 근무 시간] <span>09:00 ~ 18:00</span></h5>
        <div style="margin-bottom: 10px;">
            <select name="year" id="">
                <option value="">2020</option>
                <option value="">2019</option>
                <option value="">2018</option>
            </select>
            <select name="month" id="">
                <option value="">1월</option>
                <option value="">2월</option>
                <option value="">3월</option>
                <option value="">4월</option>
                <option value="">5월</option>
                <option value="">6월</option>
                <option value="">7월</option>
                <option value="">8월</option>
                <option value="">9월</option>
                <option value="">10월</option>
                <option value="">11월</option>
                <option value="">12월</option>
            </select>
            <h4 style="float: right; font-weight: normal;">총<span>N</span>건</h4>
        </div>
		<table class="md-tbl">
			<tr class="md-tbl-il">
				<th class="md-tbl-th">날짜</th>
                <th class="md-tbl-th" colspan="2">출근(시간/결과)</th>
                <th class="md-tbl-th" colspan="2">퇴근(시간/결과)</th>
                <th class="md-tbl-th" colspan="2">비고</th>
                <th class="md-tbl-th">수정</th>
            </tr>
            <!-- 리스트 -->
            <tr>
                <td class="md-tbl-td">2020-10-01</td>
                <td class="md-tbl-td" colspan="2">09:00:00 -/ 정상</td>
                <td class="md-tbl-td" colspan="2">00:00:00 -/</td>
                <td class="md-tbl-td" colspan="2"> </td>
                <td class="ta"><a href="#"id="detail-r-l" class="cursor" style="color: #477A8F; text-align:center">요청</a></td>
            </tr>
            
			
		</table>
		<div style="text-align: center; margin-top: 50px;">
			<span class="md-btn cursor md-btn-close">닫기</span>
		</div>

		<a class="modal-close-btn cursor md-btn-close">X</a>
	</div>
    
</body>
</html>