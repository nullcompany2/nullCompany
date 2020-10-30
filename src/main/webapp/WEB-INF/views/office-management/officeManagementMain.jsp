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
    <link rel="stylesheet" href='<c:url value="/resources/css/office-management-main.css" />'>

	<link rel="stylesheet" href='<c:url value="/resources/css/office-subNavi.css" />'>
	
</head>

<body>
	
    <div id='wrap'>
		<c:import url="../common/header.jsp" />
		
		<div class="office-container" >
			<!-- 오피스 세부 네비 시작 -->
			
			<div id="office-sub-navigation">
				<div class="blackline"></div>
				<div class="underline cursor" onclick="location.href='officeMain.do'">
					<h2 style="text-align: center;">오피스 정보</h2>
				</div>
				<div class="office-subNavi">
					<li>❏ 회사명</li>
					<li>❏ NullCompany</li>
					<li>❏ 오피스주소</li>
					<li >❏ kh-final-h15.com</li>
				</div>	
				<div>
					<li class="topline"><a href="officeLogo.do" style="margin-left: 15px;">⏣ 로고 변경</a></li>
					<li class="topline"><a href="officeAdminAP.do" style="margin-left: 15px;">⏣ 관리자 지정</a></li>
				</div>
				<script>
					$(function(){
						/* ic category */
						$("#status-diligence").click(function(){
							$("#show-modi-diligence").css("display","none")
							$("#show-status-diligence").css("display","block")
							$("#status-diligence").css("color","#477A8F")
							$("#modi-diligence").css("color","black")
						})
						$("#modi-diligence").click(function(){
							$("#show-status-diligence").css("display","none")
							$("#show-modi-diligence").css("display","block")
							$("#status-diligence").css("color","black")
							$("#modi-diligence").css("color","#477A8F")
						})
					})
				</script>
			</div>
			<!-- 세부 네비끝 -->

			<!-- 내부 컨텐츠 -->
			<div class="contents">
				<!-- 컨텐츠 타이틀명 -->
	
				<!-- ---- -->
				<div class="contents-wrap drag-scrollbar">
					<table class="office-tbl">
						<tr style="text-align: left;">
							<th>◈ 게시판 사용현황</th>
							<th>◈ 조직관리</th>
						</tr>
						<tr >
							<td class="top-vertical">
								<div class="office-tbl-board-le">
									<h4 class="underline">» 게시판 : 사용중 N 개 / 전체 N 개</h4>
									<h4 class="underline">» 최근 게시물 이용 : DATE</h4>
								</div>
							</td>
							<td class="top-vertical">
								<div class="office-tbl-board-ri">
									<h4 class="underline">» 승인 사용자 : N 명 등록됨</h4>
									<h4 class="underline">» 조직 : N 개 등록됨</h4>
	
								</div>
							</td>
						</tr>
						<tr style="text-align: left;">
							<th>◈ 주요인원 연락처</th>
							<th>◈ 전자결재</th>
						</tr>
						<tr >
							<td class="top-vertical">
								<div class="office-tbl-board-le">
									<h4 class="underline">» 사장 : Phone-Num</h4>
									<h4 class="underline">» 부서장 : Phone-Num</h4>
									<h4 class="underline">» 부서장 : Phone-Num</h4>
									<h4 class="underline">» 부서장 : Phone-Num</h4>
									<h4 class="underline">» 부서장 : Phone-Num</h4>
								</div>
							</td>
							<td class="top-vertical">
								<div class="office-tbl-board-ri">
									<h4 class="underline">» 등록된문서 : N 건</h4>
									<h4 class="underline">» 회사명 : NullCompany</h4>
								</div>
							</td>
						</tr>
						<tr style="text-align: left;">
							<th>◈ 환경설정</th>
						</tr>
						<tr >
							<td class="top-vertical">
								<div class="office-tbl-board-lo">
									<h4 class="underline">» 회사명 : NullCompany</h4>
									<h4 class="underline">» 직위 : 11</h4>
									<h4 class="underline">» 직무 : 4</h4>
									<h4 class="underline">» 오피스관리자 : Han(ys211),구승현(qkdn0004)...</h4>
								</div>
							</td>
	
						</tr>
					</table>
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

		$('#ch-set').on('click', function() {
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
				width: 500px;
				height: 380px;
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
			.cb-po-1{
                margin-top: 50px;
            }
            .md-btn{
                border: solid 0.1px #477A8F;
                border-radius: 5px;
                margin: 5px;
                padding-left: 15px;
                padding-right: 15px;
            }
            .md-btn-close{
                background: #e8ecee;
            }
		</style>
	<!-- Modal div -->
	<div id="my_modal" class="modal-dragscroll">
        <h4 style="color: #477A8F; margin-bottom: 30px;">휴가 이월 설정</h4>
        <div>
            <span>
                올해 사용하지 않고 남은 연차 휴가, <br>
                포상 휴가를 다음 연도 기준으로 이월하려면 체크하세요.
            </span>
        </div>
        <div class="cb-po-1">
            <input type="checkbox" name="" id="a-ov"><label for="a-ov"> 연차 휴가 이월</label> 
        </div>
        <div class="cb-po-1">
            <input type="checkbox" name="" id="r-ov"><label for="r-ov"> 포상 휴가 이월</label> 
        </div>
        <div style="text-align: center; margin-top: 50px;">
            <span class="md-btn cursor ">저장</span>
			<span class="md-btn cursor md-btn-close">닫기</span>
		</div>

		<a class="modal-close-btn cursor md-btn-close">X</a>
    </div>
    
</body>
</html>