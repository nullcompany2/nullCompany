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
							· 전 직원 총 지각 수 : 0회(월)/0명 0회(년)/0명 평균 0일(월)/0일(년) 무지각 수 : 10명 비정상 퇴근 : 0명 <br>
							· 출결 미체크 : 72 건 <br>
							· 데이터 수정 : 1 건 <br>
							· 퇴근 체크 대상 : 0 명 <br>
						</div>
						<!-- 근태현황 -->
						<div style="margin-top: 50px; margin-right: 50px; width: 100%;">
							<h4 style="float: left; width: 80%;">근태 현황</h4>
							<form action="" style="width: 20%; float: right; text-align: right;">
								<a href="#"id="" class="cursor" style="color: #477A8F; font-size: 12px;">검색취소</a>
								<input type="text" name="" id="" class="search-emp">
								<button class="search-btn cursor">검색</button>
							</form>
						</div>


						<style>
							.sixteen-thirtyOne{
								display: none;
							}
						</style>
						
						<script>
							
							var today = new Date(); // 오늘 날짜
							var date = new Date();
							var np = $('#np').click();
							
							function beforem(){
								today = new Date(today.getFullYear(),today.getMonth() -1 ,today.getDate());
								build();
								$("#pp").trigger("click");
							}

							
							function nextm()  //다음 달을 today에 저장
							{
								today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
								build();
								$("#pp").trigger("click");

							}
							
							function build()
							{
								var tbcal = document.getElementById("application-record"); // 테이블 달력을 만들 테이블
								var yearmonth = document.getElementById("yearmonth"); //  년도와 월 출력할곳
								yearmonth.innerHTML = today.getFullYear() + "년 "+ (today.getMonth() + 1) + "월"; //년도와 월 출력
						
							}
						</script>
						<div style="margin-top: 150px;">
							<table class="i-table" id="application-record">
								<thead style="background: #e8ecee;">
									<tr>
										<th scope="col" rowspan="2" class="tr">이름</th>
										<th scope="col" rowspan="2" class="tr">소속</th>
										<th scope="col" rowspan="2" class="tr">지각(미체크)</th>
										<th scope="col" rowspan="2" class="tr">상세</th>
										<th scope="col" colspan="31" class="tr" style="text-align: center;">
											<label class="cursor" for="" onclick="beforem()" id="before" style="margin-right: 20px;"> ◁ </label>
											<label for="" id="yearmonth"></label>
											<label class="cursor" for="" onclick="nextm()" id="next" style="margin-left: 20px;"> ▷</label>
										</th>

									</tr>                     
									<tr>
										<th class="tr one-fifteen" >1일</th>
										<th class="tr one-fifteen" >2일	</th>
										<th class="tr one-fifteen" >3일	</th>
										<th class="tr one-fifteen" >4일	</th>
										<th class="tr one-fifteen">	5일	</th>
										<th class="tr one-fifteen">	6일	</th>
										<th class="tr one-fifteen">	7일	</th>
										<th class="tr one-fifteen">	8일	</th>
										<th class="tr one-fifteen">	9일	</th>
										<th class="tr one-fifteen">	10일	</th>
										<th class="tr one-fifteen">	11일	</th>
										<th class="tr one-fifteen">	12일	</th>
										<th class="tr one-fifteen">	13일	</th>
										<th class="tr one-fifteen">	14일	</th>
										<th class="tr one-fifteen">	15일	</th>
										<th class="tr one-fifteen" id="np">next</th>
										<th class="tr sixteen-thirtyOne">	16일	</th>
										<th class="tr sixteen-thirtyOne">	17일	</th>
										<th class="tr sixteen-thirtyOne">	18일	</th>
										<th class="tr sixteen-thirtyOne">	19일	</th>
										<th class="tr sixteen-thirtyOne">	20일	</th>
										<th class="tr sixteen-thirtyOne">	21일	</th>
										<th class="tr sixteen-thirtyOne">	22일	</th>
										<th class="tr sixteen-thirtyOne">	23일	</th>
										<th class="tr sixteen-thirtyOne">	24일	</th>
										<th class="tr sixteen-thirtyOne">	25일	</th>
										<th class="tr sixteen-thirtyOne">	26일	</th>
										<th class="tr sixteen-thirtyOne">	27일	</th>
										<th class="tr sixteen-thirtyOne">	28일	</th>
										<th class="tr sixteen-thirtyOne">	29일	</th>
										<th class="tr sixteen-thirtyOne">	30일	</th>
										<th class="tr sixteen-thirtyOne" id="HDay-th">	31일	</th>
										<th class="tr sixteen-thirtyOne" id="pp">pre</th>
									</tr>                               
								</thead>
								<tbody>
									<!-- 직원 리스트 -->
									<tr class="topline">
										<td class="ta">Han</td>
										<td class="ta">인사</td>
										<td class="ta">0 / 3</td>
										<td class="ta"><a href="#"id="detail-r-l" class="cursor" style="color: #477A8F;">상세</a></td>
										<td class="ta one-fifteen"></td>
										<td class="ta one-fifteen"></td>
										<td class="ta one-fifteen"></td>
										<td class="ta one-fifteen"></td>
										<td class="ta one-fifteen"></td>
										<td class="ta one-fifteen"></td>
										<td class="ta one-fifteen"></td>
										<td class="ta one-fifteen"></td>
										<td class="ta one-fifteen"></td>
										<td class="ta one-fifteen"></td>
										<td class="ta one-fifteen"></td>
										<td class="ta one-fifteen"></td>
										<td class="ta one-fifteen"></td>
										<td class="ta one-fifteen"></td>
										<td class="ta one-fifteen"></td>
										<td class="ta one-fifteen" id="emptyfornext" ></td>
										<td class="ta sixteen-thirtyOne"></td>
										<td class="ta sixteen-thirtyOne"></td>
										<td class="ta sixteen-thirtyOne"></td>
										<td class="ta sixteen-thirtyOne"></td>
										<td class="ta sixteen-thirtyOne"></td>
										<td class="ta sixteen-thirtyOne"></td>
										<td class="ta sixteen-thirtyOne"></td>
										<td class="ta sixteen-thirtyOne"></td>
										<td class="ta sixteen-thirtyOne"></td>
										<td class="ta sixteen-thirtyOne"></td>
										<td class="ta sixteen-thirtyOne"></td>
										<td class="ta sixteen-thirtyOne"></td>
										<td class="ta sixteen-thirtyOne"></td>
										<td class="ta sixteen-thirtyOne"></td>
										<td class="ta sixteen-thirtyOne"></td>
										<td class="ta sixteen-thirtyOne" id="HDay-td" ></td>
										<td class="ta sixteen-thirtyOne" id="pp">pre</td>
									</tr>
									<!-- 직원리스트 -->
									<tr>
										<td class="ta">Han</td>
										<td class="ta">인사</td>
										<td class="ta">0 / 3</td>
										<td class="ta"><a href="#"id="detail-r-l" class="cursor" style="color: #477A8F;">상세</a></td>
										<td class="ta one-fifteen"></td>
										<td class="ta one-fifteen"></td>
										<td class="ta one-fifteen"></td>
										<td class="ta one-fifteen"></td>
										<td class="ta one-fifteen"></td>
										<td class="ta one-fifteen"></td>
										<td class="ta one-fifteen"></td>
										<td class="ta one-fifteen"></td>
										<td class="ta one-fifteen"></td>
										<td class="ta one-fifteen"></td>
										<td class="ta one-fifteen"></td>
										<td class="ta one-fifteen"></td>
										<td class="ta one-fifteen"></td>
										<td class="ta one-fifteen"></td>
										<td class="ta one-fifteen"></td>
										<td class="ta one-fifteen" id="emptyfornext" ></td>
										<td class="ta sixteen-thirtyOne"></td>
										<td class="ta sixteen-thirtyOne"></td>
										<td class="ta sixteen-thirtyOne"></td>
										<td class="ta sixteen-thirtyOne"></td>
										<td class="ta sixteen-thirtyOne"></td>
										<td class="ta sixteen-thirtyOne"></td>
										<td class="ta sixteen-thirtyOne"></td>
										<td class="ta sixteen-thirtyOne"></td>
										<td class="ta sixteen-thirtyOne"></td>
										<td class="ta sixteen-thirtyOne"></td>
										<td class="ta sixteen-thirtyOne"></td>
										<td class="ta sixteen-thirtyOne"></td>
										<td class="ta sixteen-thirtyOne"></td>
										<td class="ta sixteen-thirtyOne"></td>
										<td class="ta sixteen-thirtyOne"></td>
										<td class="ta sixteen-thirtyOne" id="HDay-td" ></td>
										<td class="ta sixteen-thirtyOne" id="pp">pre</td>
									</tr>
									
								</tbody>
							</table>
							<script>
								$("#np").click(function(){
									$(".sixteen-thirtyOne").css('display','table-cell');
									$(".one-fifteen").css('display','none');
								})
								$("#pp").click(function(){
									$(".one-fifteen").css('display','table-cell');
									$(".sixteen-thirtyOne").css('display','none');
								})
							</script>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
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
                <td class="ta"><a href="#"id="detail-r-l" class="cursor" style="color: #477A8F;">요청</a></td>
            </tr>
            <tr>
                <td class="md-tbl-td">2020-10-01</td>
                <td class="md-tbl-td" colspan="2">09:00:00 -/ 정상</td>
                <td class="md-tbl-td" colspan="2">00:00:00 -/</td>
                <td class="md-tbl-td" colspan="2"> </td>
                <td class="ta"><a href="#"id="detail-r-l" class="cursor" style="color: #477A8F;">요청</a></td>
            </tr>
			
		</table>
		<div style="text-align: center; margin-top: 50px;">
			<span class="md-btn cursor md-btn-close">닫기</span>
		</div>

		<a class="modal-close-btn cursor md-btn-close">X</a>
	</div>
    
</body>
</html>