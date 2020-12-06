<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<link rel="stylesheet" href="<c:url value="/resources/css/em-diligence-managerment.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/css/younsu-subNavi.css"/>">
	

</head>

<body>
	
    <div id='wrap'>
    <c:import url="../common/header.jsp"/>
		
		<div class="container" >
			<!-- 전체높이지정용 -->
			<div id="drag-wrap">
                <div id="drag"></div>
			</div>
			<!-- 세부네비 -->
			<c:import url="../common/personnelSubNavi.jsp"/>
			<!-- 세부 네비끝 -->
			
			<!-- 내부 컨텐츠 -->
			<div class="contents">
				<!-- 컨텐츠 타이틀명 -->
				<div class="contents-title">
					<span class="ct1">직원 근태 관리</span>
				</div>
				<div class="contents-wrap drag-scrollbar">
					<div id="em-diligence-management" class="c-ic">
						<h4>올해 근태 통계</h4>
						<div style="margin-left: 100px;">
							· 전 직원 총 지각 수 : ${diligenceCount.lateCountM }회(월) ${diligenceCount.lateMemberCountM }명(월)/
										   	${diligenceCount.lateCountY }회(년) ${diligenceCount.lateMemberCountY }명(년)
										   	<br><br>
							· 출결 미체크(결근) : ${diligenceCount.absenceCountM }회(월)  ${diligenceCount.absenceMemberCountM }명(월)/
											 ${diligenceCount.absenceCountY }회(년)	${diligenceCount.absenceMemberCountY }명(년)
											 <br><br>
							· 데이터 수정 : ${diligenceCount.modificationCountM }건(월)	${diligenceCount.modificationCountY }건(년) <br>
							
						</div>
						<!-- 근태현황 -->
						<div style="margin-top: 50px; margin-right: 50px; width: 100%;">
							<h4 style="float: left; width: 80%;">근태 현황</h4>
							<form action="searchEmDiligence.do" style="width: 30%; float: right; text-align: right;">
								<a href="emDiligenceManagement.do"id="" class="cursor" style="height:25px; color: #477A8F; font-size: 14px;">
									검색취소 <img alt="" src="resources/images/return.png" style="height:12px; color:#477A8F;">
								</a>  &nbsp;&nbsp;&nbsp;
								<input type="text" name="searchKey" class="search-emp" 
										placeholder="이름 또는 부서 입력" style="border-radius: 10px; border: solid 0.5px #477A8F;">
								<button class="search-btn cursor" style="border-radius: 3px;
																	    background: white;
																	    color: #477A8F;
																	    border: none;">
						    		검색
						    	</button>
							</form>
						</div>


						<style>
							.sixteen-thirtyOne{
								display: none;
							}
						</style>
						
						<div style="margin-top: 150px;">
														
							<div>
								
								<table class="i-table" id="application-record" onload="build();">
									<thead style="background: #e8ecee;">
										<tr class="date_tbl_title">
										</tr>                     
										<tr class="date_tbl">										
										</tr>
						
									</thead>
									<c:choose>
									<c:when test="${!empty mList}">
									<c:forEach var="mem" items="${mList}">
											<tbody id="${mem.memNo }TB">
												<tr >
													<td scope="col" rowspan="2" class="ta">${mem.name }</td>
													<td scope="col" rowspan="2" class="ta">${mem.deptName }</td>
													<td scope="col" rowspan="2" class="ta" id="${mem.memNo }Count">0 / 3</td>
													<td scope="col" rowspan="2" class="ta"><a href="#"  onclick="detail(${mem.memNo})" class="curso detail-r-l" style="color: #477A8F;">상세</a></td>
												</tr>
												<tr class="date_tbl_output" id="${mem.memNo }Tr">
												
												</tr>
												
												
											</tbody>
									</c:forEach>
									</c:when>
									<c:otherwise>
											<tbody id="">
												<tr >
													<td scope="col" rowspan="2" colspan="4" class="ta" style="color:#477A8F; font-size:20px;">검색정보가 없습니다.</td>
												</tr>
												<tr class="date_tbl_output" id="">
												</tr>
												
												
											</tbody>
									</c:otherwise>
									</c:choose>
								</table>
								
							</div>
							<h5 style="padding:10px">
							정상(<span style="color:#477A8F">○</span>),
							지각(<span style="color:#477A8F">△</span>),
							결근(<span style="color:#477A8F">X</span>),
							휴가(<span style="color:#477A8F">휴</span>),
							수정됨(<span style="color:#477A8F">◇</span>)
							
							</h5>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	<script>
		$("#np").click(function(){
			$(".sixteen-thirtyOne").css('display','table-cell');
			$(".one-fifteen").css('display','none');
		})
		$("#pp").click(function(){
			$(".one-fifteen").css('display','table-cell');
			$(".sixteen-thirtyOne").css('display','none');
		})
		
		var today = new Date(); // 오늘 날짜
		var date = new Date();
		var np = $('#np').click();
		var lastDay;
		var countTd = 1;
		
		$(function(){
			var forcalculDate = new Date(today.getFullYear(),today.getMonth()+1,0);	// 일자 테이블을 만들기위함.
			lastDay = forcalculDate.getDate();
			createDateTbl(lastDay);
			
			yearmonth.innerHTML = today.getFullYear() + "년 "+ (today.getMonth() + 1) + "월";
			var todayFW =today.getFullYear()+"/"+(today.getMonth()+1)+"/"+1; // 요일 체크용
			daysLable(todayFW,lastDay);
			
			var todayDate = today.getFullYear()+"/"+(today.getMonth()+1);	// showRecordDiligence를 위함.
			showRecordDiligence(todayDate);
			
			
			
			build();
			
			
		});
		
		function beforem(){
			today = new Date(today.getFullYear(),today.getMonth() -1 ,today.getDate());
			var forcalculDate = new Date(today.getFullYear(),today.getMonth()+1,0);	// 일자 테이블을 만들기위함.
			lastDay = forcalculDate.getDate();
			createDateTbl(lastDay);
			
			$("#pp").trigger("click");
			
			var todayDate = today.getFullYear()+"/"+(today.getMonth()+1);	// showRecordDiligence를 위함.
			showRecordDiligence(todayDate);
			
			var todayFW =today.getFullYear()+"/"+(today.getMonth()+1)+"/"+1; // 요일 체크용
			daysLable(todayFW,lastDay);
			
			build();
		}

		
		function nextm()  //다음 달을 today에 저장
		{
			today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
			var forcalculDate = new Date(today.getFullYear(),today.getMonth()+1,0);	// 일자 테이블을 만들기위함.
			lastDay = forcalculDate.getDate();
			createDateTbl(lastDay);
			
			var todayDate = today.getFullYear()+"/"+(today.getMonth()+1);	// showRecordDiligence를 위함.
			showRecordDiligence(todayDate);
			
			var todayFW =today.getFullYear()+"/"+(today.getMonth()+1)+"/"+1; // 요일 체크용
			daysLable(todayFW,lastDay);
			
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
			var $th_tr =$('<th scope="col" rowspan="2" class="tr">').text("지각 / 결근");
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
						$th_tr = $("<th class='tr one-fifteen'>").text(i+"일").attr("id",i+"D");
						$tr_td = $("<td class='ta one-fifteen'>").attr("id",i + "R");
						
					}else if(i == lastDay+2){
						$th_tr = $("<th class='tr sixteen-thirtyOne cursor' id='pp' onclick='predays()'>").text("PRE");
						$tr_td = $("<td class='ta sixteen-thirtyOne'>").text("<<");
					}else{
						$th_tr = $("<th class='tr sixteen-thirtyOne' >").text(i-1+"일").attr("id",i-1+"D");
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
						$th_tr = $("<th class='tr one-fifteen'>").text(i+"일").attr("id",i+"D");		
						$tr_td = $("<td class='ta one-fifteen'>").attr("id",i + "R");

					}else if(i == lastDay+2){
						$th_tr = $("<th class='tr sixteen-thirtyOne cursor' id='pp' onclick='predays()'>").text("PRE");
						$tr_td = $("<td class='ta sixteen-thirtyOne'>").text("<<");

					}else{
						$th_tr = $("<th class='tr sixteen-thirtyOne'>").text(i-1+"일").attr("id",i-1+"D");
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
						$th_tr = $("<th class='tr one-fifteen' >").text(i+"일").attr("id",i+"D");		
						$tr_td = $("<td class='ta one-fifteen'>").attr("id",i+"R");
					}else if(i == lastDay+2){
						$th_tr = $("<th class='tr sixteen-thirtyOne cursor' id='pp' onclick='predays()'>").text("PRE");
						$tr_td = $("<td class='ta sixteen-thirtyOne'>").text("<<");
					}else{
						$th_tr = $("<th class='tr sixteen-thirtyOne' >").text(i-1+"일").attr("id",i-1+"D");
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
						$th_tr = $("<th class='tr one-fifteen' >").text(i+"일").attr("id",i+"D");		
						$tr_td = $("<td class='ta one-fifteen'>").attr("id",i+"R");
					}else if(i == lastDay+2){
						$th_tr = $("<th class='tr sixteen-thirtyOne cursor' id='pp' onclick='predays()'>").text("PRE");
						$tr_td = $("<td class='ta sixteen-thirtyOne'>").text("<<");
					}else{
						$th_tr = $("<th class='tr sixteen-thirtyOne' >").text(i-1+"일").attr("id",i-1+"D");
						$tr_td = $("<td class='ta sixteen-thirtyOne'>").attr("id",i-1+"R");
					}
					$sTble.append($th_tr);
					$rTble.append($tr_td);
					
				}
			}
			
			
						
		}
		// 주말 체크용
		function daysLable(todayFW,lastDay){
			var getday = new Date(todayFW).getDay();
			
			for(var i =1; i<=lastDay; i++){
				if(getday == 6){
					$("#"+i+"D").attr("style","color:#387CCC");
				}else if(getday ==0){
					$("#"+i+"D").attr("style","color:#E94B4B");
				}
				
				getday ++;
				if(getday == 7){
					getday=0;
				}
			}
			
		}
		// 근태기록 생성용
		function showRecordDiligence(todayDate){
			
			
			<c:forEach var="list" items="${recordDiligenceList}" varStatus="status">
				
				<fmt:formatDate var="dateY" value="${list.dateDiligence }" pattern="yyyy"/>
				<fmt:formatDate var="dateM" value="${list.dateDiligence }" pattern="MM"/>
				<fmt:formatDate var="dateD" value="${list.dateDiligence }" pattern="dd"/>
				var date = ${dateY}+"/"+${dateM};// 근태기록 날짜
				<c:set var="memNo" value="${list.memNo}"/>
				
				if(date == todayDate){
					var day = ${dateD}+"R";
					var status ="";
					<c:choose>
						<c:when test="${list.statusDiligence eq '결근'}">
							status ="X";
							$("#"+${memNo}+"Tr").find()
							$("#"+${memNo}+"Tr "+"#"+day).text(status).attr("style","color:#477A8F");
						</c:when>
						<c:when test="${list.statusDiligence eq '지각'}">
							status ="△";
							$("#"+${memNo}+"Tr "+"#"+day).text(status).attr("style","color:#477A8F");
						</c:when>
						<c:when test="${list.statusDiligence eq '정상'}">
							status ="○";
							$("#"+${memNo}+"Tr "+"#"+day).text(status).attr("style","color:#477A8F");
						</c:when>
						<c:when test="${list.statusDiligence eq '휴가'}">
							status ="휴";
							$("#"+${memNo}+"Tr "+"#"+day).text(status).attr("style","color:#477A8F");
						</c:when>
						<c:otherwise>
							status ="◇";
							$("#"+${memNo}+"Tr "+"#"+day).text(status).attr("style","color:#477A8F");
						</c:otherwise>
					</c:choose>
				}
				
			</c:forEach>
			
			
		}
		
		
	</script>
	<script type="text/javascript">
		$(function(){
			<c:forEach var="list" items="${memberDiligenceCount}" varStatus="status">
				<c:set var="lateCount" value="${list.lateCount}" />
				<c:set var="absenceCount" value="${list.absenceCount}" />
				var DCountText = ${lateCount}+" / "+${absenceCount};
				<c:set var="memNo" value="${list.memNo}"/>
				console.log("11231dfa");
				$("#"+${memNo}+"Count").text(DCountText);
			
			</c:forEach>
		});
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

		// 모달 열기
		function detail(memNo){
			modal('my_modal');
			$.ajax({
				url : "detailMemberInfo.do",
				data : { memNo : memNo},
				dataType : "json",
				success : function(data){
					$("#md_id").text("("+data.id+")");
					$("#md_name").text(data.name);
					$("#md_memNo").text(data.memNo);
					$("#md_searchBtn").attr("onclick","md_searchBtn("+data.memNo+")");
					$('.mdDListPot').remove();
					$("#totalListCount").text("");
				},
				error :function(status,error, request){
					console.log(status);
					console.log(error);
					console.log(request);
				}
				
			});
			
		}
				
		function mdListPaged(currentPage,memNo){
			var year = $("#md_searchYear").val();
			var month = $("#md_searchMonth").val();
			
			
			if(year !=0 && month !=0){
				$.ajax({
					url : "searchDiligenceYM.do",
					data : {year : year , month : month , currentPage:currentPage, memNo : memNo},
					datatype : "json",
					success:function(data){
						console.log(data);
						$("#totalListCount").text(data.dListCount);
						$("#dListPaging").remove();
						$('.mdDListPot').remove();
						var $mdTbl = $(".md-tbl");
		            	var $tr;
		            	var $td;
		            	var $td_date;
		            	var $td_enterTime;
		            	var $td_exitTime;
		            	var $td_status;
		            	var $td_reqMod;
						
		            	var $pageTbl = $('#md_page_tbl');
		            	var td0;
		            	var td1;
		            	var td2;
		            	var td3;
		            	var td1_1;
		            	var td1_1_1;
		            	var td2_1;
		            	var td2_1_1;
		            	var td2_2;
		            	
		            	
		            	
						for(var i in data.dList){					
							$tr = $("<tr class='mdDListPot'>");
							$td_date = $(' <td class="md-tbl-td">').text(data.dList[i].dateDiligence);
							$td_enterTime = $(' <td class="md-tbl-td" colspan="2">').text(data.dList[i].timeEnter);
							$td_exitTime = $(' <td class="md-tbl-td" colspan="2">').text(data.dList[i].timeExit);
							$td_status = $(' <td class="md-tbl-td" colspan="2">').text(data.dList[i].statusDiligence);
							
							
							if(data.dList[i].statusDiligence == '정상'){
								$td_reqMod = $(' <td class="md-tbl-td">').attr("id",data.dList[i].noDiligence);
							}else{
								$td_reqMod = $(' <td class="md-tbl-td">').attr("id",data.dList[i].noDiligence);
								$td_reqMod.append($('<a href="reqDiligence.do?noDiligence='+ data.dList[i].noDiligence +'" id="detail-r-l" class="cursor" style="color: #477A8F;">').text("요청"));								
							}
							$tr.append($td_date);
							$tr.append($td_enterTime);
							$tr.append($td_exitTime);
							$tr.append($td_status);
							$tr.append($td_reqMod);
							$mdTbl.append($tr);
						}
						
						$tr = $('<tr align="center" height="20" id="dListPaging">'); 
						$td = $('<td colspan="6">');
						if(data.pi.currentPage == 1){
							
							$td0 = "[이전]";
							$td.append($td0);
						}
			        	
						if(data.pi.currentPage != 1){
							$td0 = $('<a onclick="mdListPaged('+ (data.pi.currentPage -1)+","+memNo  +')">').text("[이전]");
				        	
				        	$td.append($td0);
						}    	
			        	
				       	
				       	
				       	for(var p = data.pi.startPage; p <=  data.pi.endPage; p++){
				       		if(p == data.pi.currentPage){
				       			$td0 = $("<b style='color:red; font-size:4'>").text("  "+p+"  ");
				       			$td.append($td0);
				       		}
				       		if(p != data.pi.currentPage ){
				       			$td0 = $('<a onclick="mdListPaged('+ (p)+","+memNo  +')">').text("  "+p+"  ");
				       			$td.append($td0);
				       		}
				       	
				       	}
			        	
				       	if(data.pi.currentPage == data.pi.maxPage ){
				       		$td0 = "[다음]";
				       		$td.append($td0);
				       	}
			        	
			        	if(data.pi.currentPage != data.pi.maxPage){
			        		$td0 = $('<a onclick="mdListPaged('+ (data.pi.currentPage + 1)+","+memNo  +')">').text("[다음]");
			        		$td.append($td0);
			        	}
			        	
		            	$tr.append($td);
						
		            	$pageTbl.append($tr);
	 
					},
					error: function(request,status,error){
						console.log(request);
						console.log(status);
						console.log(error);
					}
				});
			}else{
				alert("년도와 월수를 선택해주세요.");
			}			
		}
		
		function md_searchBtn(memNo){
			var year = $("#md_searchYear").val();
			var month = $("#md_searchMonth").val();
			
			
			if(year !=0 && month !=0){
				$.ajax({
					url : "searchDiligenceYM.do",
					data : {year : year , month : month , memNo : memNo},
					datatype : "json",
					success:function(data){
						$("#totalListCount").text(data.dListCount);
						$("#dListPaging").remove();
						$('.mdDListPot').remove();
						var $mdTbl = $(".md-tbl");
		            	var $tr;
		            	var $td;
		            	var $td_date;
		            	var $td_enterTime;
		            	var $td_exitTime;
		            	var $td_status;
		            	var $td_reqMod;
						
		            	var $pageTbl = $('#md_page_tbl');
		            	var td0;
		            	var td1;
		            	var td2;
		            	var td3;
		            	var td1_1;
		            	var td1_1_1;
		            	var td2_1;
		            	var td2_1_1;
		            	var td2_2;
		            	
		            	
		            	
						for(var i in data.dList){					
							$tr = $("<tr class='mdDListPot'>");
							$td_date = $(' <td class="md-tbl-td">').text(data.dList[i].dateDiligence);
							$td_enterTime = $(' <td class="md-tbl-td" colspan="2">').text(data.dList[i].timeEnter);
							$td_exitTime = $(' <td class="md-tbl-td" colspan="2">').text(data.dList[i].timeExit);
							$td_status = $(' <td class="md-tbl-td" colspan="2">').text(data.dList[i].statusDiligence);
														
							if(data.dList[i].statusDiligence == '정상'){
								$td_reqMod = $(' <td class="md-tbl-td">').attr("id",data.dList[i].noDiligence);
							}else{
								$td_reqMod = $(' <td class="md-tbl-td">').attr("id",data.dList[i].noDiligence);
								$td_reqMod.append($('<a href="reqDiligence.do?noDiligence='+ data.dList[i].noDiligence +'" id="detail-r-l" class="cursor" style="color: #477A8F;">').text("요청"));								
							}
							
							$tr.append($td_date);
							$tr.append($td_enterTime);
							$tr.append($td_exitTime); 	
							$tr.append($td_status);
							$tr.append($td_reqMod);
							$mdTbl.append($tr);
						}
						
						$tr = $('<tr align="center" height="20" id="dListPaging">'); 
						$td = $('<td colspan="6">');
						if(data.pi.currentPage == 1){
							
							$td0 = "[이전]";
							$td.append($td0);
						}
			        	
						if(data.pi.currentPage != 1){
							$td0 = $('<a onclick="mdListPaged('+ (data.pi.currentPage -1)+","+memNo  +')">').text("[이전]");
				        	
				        	$td.append($td0);
						}    	
			        	
				       	
				       	
				       	for(var p = data.pi.startPage; p <=  data.pi.endPage; p++){
				       		if(p == data.pi.currentPage){
				       			$td0 = $("<b style='color:red; font-size:4'>").text("  "+p+"  ");
				       			$td.append($td0);
				       		}
				       		if(p != data.pi.currentPage ){
				       			$td0 = $('<a onclick="mdListPaged('+ (p)+","+memNo  +')">').text("  "+p+"  ");
				       			$td.append($td0);
				       		}
				       	
				       	}
			        	
				       	if(data.pi.currentPage == data.pi.maxPage ){
				       		$td0 = "[다음]";
				       		$td.append($td0);
				       	}
			        	
			        	if(data.pi.currentPage != data.pi.maxPage){
			        		$td0 = $('<a onclick="mdListPaged('+ (data.pi.currentPage + 1)+","+memNo  +')">').text("[다음]");
			        		$td.append($td0);
			        	}
			        	
		            	$tr.append($td);
						
		            	$pageTbl.append($tr);
	 
					},
					error: function(request,status,error){
						console.log(request);
						console.log(status);
						console.log(error);
					}
				});
			}else{
				alert("년도와 월수를 선택해주세요.");
			}
		}
		
		$(function(){
			var today = new Date().getFullYear();
			var $md_select = $("#md_searchYear");
			var $yearOption;
			for(var i =0; i<3; i++){
				$yearOption = $("<option>").text(today-i).attr("value",today-i);				
				$md_select.append($yearOption);
			}
			
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
	<div id="my_modal" class="modal-dragscroll">
        <h4 style="color: #477A8F; margin-bottom: 30px;">근태 상세</h4>
        <h5 style="font-weight: normal;"><span id="md_name"></span> - <span id="md_memNo"></span><span id="md_id">(${loginUser.id })</span></h5>
        <h5 style="font-weight: normal; margin-bottom: 20px;">[기본 근무 시간] <span> ${setAttendance.timeAttendance } ~ ${setAttendance.timeOffWork }</span></h5>
        <div style="margin-bottom: 10px;">
            <select name="year" id="md_searchYear">
            	<option value="0">----</option>
                
            </select>
            <select name="month" id="md_searchMonth">
           		<option value="0">----</option>
                <option value="1">1월</option>
                <option value="2">2월</option>
                <option value="3">3월</option>
                <option value="4">4월</option>
                <option value="5">5월</option>
                <option value="6">6월</option>
                <option value="7">7월</option>
                <option value="8">8월</option>
                <option value="9">9월</option>
                <option value="10">10월</option>
                <option value="11">11월</option>
                <option value="12">12월</option>
            </select>
            <button style=" font-size: 15px;
						    color: #ffffff;
						    border: none;
						    background-color: #477A8F;
						    width: 60px;
						    height: 20px;
						    border-radius: 3px;
						    margin-left: 10px;
						    cursor: pointer;" onclick="md_searchBtn()" id="md_searchBtn">
		    	검색
		    </button>
            <h4 style="float: right; font-weight: normal;">총<span id="totalListCount">N</span>건</h4>
        </div>
		<table class="md-tbl">
			<tr class="md-tbl-il">
				<th class="md-tbl-th">날짜</th>
                <th class="md-tbl-th" colspan="2">출근</th>
                <th class="md-tbl-th" colspan="2">퇴근</th>
                <th class="md-tbl-th" colspan="2">상태(결과)</th>
                <th class="md-tbl-th">수정</th>
            </tr>
            <!-- 리스트 -->
            
            
		</table>
		<div style="text-align: center; margin-top: 50px;">
			<table  style=" width: 100%; border-collapse: collapse;" id="md_page_tbl">
	            
			</table>
		</div>
		<span class="md-btn cursor md-btn-close" style="float:right; color:#477A8F; margin-right:30px">닫기</span>

		<a class="modal-close-btn cursor md-btn-close">X</a>
	</div>
    
</body>
</html>