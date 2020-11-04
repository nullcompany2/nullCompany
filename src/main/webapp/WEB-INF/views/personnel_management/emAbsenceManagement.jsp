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
	<link rel="stylesheet" href='<c:url value="/resources/css/em-sbsence-management.css"/>'>
	

</head>

<body>
	
    <div id='wrap'>
    <c:import url="../common/header.jsp"/>
		
		  
		<div class="container" >
			<!-- 전체높이지정용 -->
			<div id="drag-wrap">
                <div id="drag"></div>
			</div>
			<!-- 세부 네비 시작 -->
			<c:import url="../common/personnelSubNavi.jsp"/>
			<!-- 내부 컨텐츠 -->
			<div class="contents">
				<!-- 컨텐츠 타이틀명 -->
				<div class="contents-title">
					<span class="ct1">휴직자 관리</span>
				</div>
				<!-- 1-1 -->
				<div class="contents-wrap drag-scrollbar">
					<div id="show-myleave" class="c-ic">
						<h4 style="font-weight:normal;">
							휴직자 관리에서 추가/수정/삭제한 내역은 실제 근태에 다음날부터 반영됩니다. <br>
							※ 휴직 기간이 만료된 직원은 인사관리자가 수동으로 휴직자 목록에서 [삭제]해야 합니다. 휴직자목록에서 삭제 후 근태가 정상처리 됩니다.
						</h4>
	
						<div style="margin-top: 50px; margin-bottom: 10px;">
							<a href="#" class="cursor">+ 휴직자 추가</a>
						</div>
						<table class="r-table" id="application-record">
							<thead style="background: #e8ecee;">
								<tr>
									<th scope="col" rowspan="1" class="tr">이름</th>
									<th scope="col" rowspan="2" class="tr">소속</th>
									<th scope="col" rowspan="2" class="tr">사유</th>
									<th scope="col" rowspan="2" class="tr">기간</th>
									<th scope="col" rowspan="2" class="tr"></th>
								</tr>
							</thead>
							<!-- 휴직자 추가시 리스트 -->
							<tbody>
								<tr>
									<td class="ta"><input type="text" name="" id="" class="absence-in-t"></td>
									<td class="ta"><span>소속자동입력</span></td>
									<td class="ta"><input type="text" name="" id="" class="absence-in-t"></td>
									<td class="ta">
										<input type="date" name="" id="" >
										부터
										<input type="date" name="" id="" >
										까지
									</td>
									<td>
										<a href="#"id="delect-chk" class="cursor" style="color: #477A8F;">저장</a>
										|
										<a href="#"id="delect-chk" class="cursor" style="color: #477A8F;">취소</a>
									</td>
								</tr>
							</tbody>
						</table>
						<div style="float: right; margin-top: 10px;">
							<a href="#" id="detail-r-l" class="cursor">이전 휴직자</a>
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
				height: 500px;
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
			.md-btn{
				font-size: 17px;
				border: none;
				background-color: white;
				border-bottom: solid 0.1px #477A8F;
				border-bottom-right-radius: 2px;
				border-bottom-left-radius: 2px;
            }

            .md-tr{
                padding: 10px;
                text-align: left;
            }
            .md-ta{
                padding: 10px;
            }
		</style>
	<!-- Modal div -->
	<div id="my_modal" class="modal-dragscroll">
		<h4 style="color: #477A8F; margin-bottom: 30px;">휴가 신청 상세</h4>
		<table class="md-tbl" id="application-record">
            <thead style="background: #e8ecee;">
                <tr>
                    <th scope="col" rowspan="1" class="md-tr">이름</th>
                    <th scope="col" rowspan="2" class="md-tr">아이디</th>
                    <th scope="col" rowspan="2" class="md-tr">사유</th>
                    <th scope="col" rowspan="2" class="md-tr">기간</th>
                    <th scope="col" rowspan="2" class="md-tr">삭제일</th>
                </tr>
            </thead>
            <!-- 휴직자 추가시 리스트 -->
            <tbody>
                <tr>
                    <td class="md-ta">Name</td>
                    <td class="md-ta">ID</td>
                    <td class="md-ta">Reason</td>
                    <td class="md-ta">term</td>
                    <td class="md-ta">deleteDate</td>
                </tr>
            </tbody>
        </table>
		<div style="text-align: center; margin-top: 50px;">
			<span class="md-btn cursor md-btn-close" >닫기</span>
		</div>

		<a class="modal-close-btn cursor md-btn-close">X</a>
	</div>
    
</body>
</html>