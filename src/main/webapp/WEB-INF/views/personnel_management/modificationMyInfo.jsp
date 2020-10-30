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
	<link rel="stylesheet" href="<c:url value="/resources/css/modification-myinfo.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/younsu-subNavi.css"/>">
    <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

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
					<span class="ct1">내 정보 관리</span>
				</div>
				<!-- 수정창 -->
				<div class="contents-wrap drag-scrollbar">
                    <!-- photo -->
                    <div style="position: absolute; left: 500px; top: 70px;">
                        <div> 
                            <img src="${ loginUser.photo }" alt="" style="width: 100px; height: 100px;" id="emp-photo">
						</div>
						<div class="filebox"> 
							<label for="ex_file" id="up-file" >
								<img src="resources/images/camera.png" alt="" style="width: 50px; margin-left: -13px;">
							</label>
							<input type="file" id="ex_file">
							<label for="" style="float: right;" id="delete-file">
							</label>
						</div>
                    </div>
					<div id="myinfo" class="c-ic">
                        <div >
                            <table>
                                <tr id="info-name">
                                    <th class="tl">이름</th>
                                    <td class="ts"><span>${ loginUser.name }</span></td>
                                </tr>
                                <tr id="info-dept">
                                    <th class="tl">부서</th>
                                    <td class="ts"><span>${ loginUser.deptName }부</span></td>
                                </tr>
                                <tr id="info-rank">
                                    <th class="tl">직급</th>
                                    <td class="ts"><span>${ loginUser.rankName }</span></td>
                                </tr>
                                <tr id="info-phone">
                                    <th class="tl">
										<img src="resources/images/lock-info.jpg" alt="" style="width: 30px; position: absolute;
										left: 40px;">
										휴대전화</th>
									<td class="ts">
										<input type="text" name="" id="">
										<input type="checkbox" name="" id="s-phone" class="secret-info">
										<label for="s-phone" class="s-t">비공개</label>
										
									</td>

                                </tr>
                                <tr id="info-email">
                                    <th class="tl">이메일</th>
                                    <td class="ts">${ loginUser.id} @nullcompany.com</td>
                                </tr>
                                <tr id="info-personal-email">
                                    <th class="tl">
										<img src="resources/images/lock-info.jpg" alt="" style="width: 30px; position: absolute;
										left: 40px;">
										개인이메일
									</th>
									<td class="ts">
										<input type="text" name="" id="">
										<input type="checkbox" name="" id="s-email" class="secret-info">
										<label for="s-email" class="s-t">비공개</label>
									</td>
                                </tr>
                                <tr id="info-mem-no">
                                    <th class="tl">사번</th>
                                    <td class="ts"><span>${ loginUser.memNo}</span></td>
                                </tr>
                                <tr id="info-enrolldate">
                                    <th class="tl">입사일</th>
                                    <td class="ts"><span>${ loginUser.enrollDate}</span></td>
                                </tr>
                                <tr id="info-birth">
                                    <th class="tl">
										<img src="resources/images/lock-info.jpg" alt="" style="width: 30px; position: absolute;
										left: 40px;">
										생년월일
									</th>
                                    <td class="ts">
										${ loginUser.birth}
										<input type="checkbox" name="" id="s-birth" class="secret-info">
										<label for="s-birth" class="s-t">비공개</label>
										
                                    </td>
                                </tr>
                                <tr id="info-address">
                                    <th class="tl">
										<img src="resources/images/lock-info.jpg" alt="" style="width: 30px; position: absolute;
										left: 40px;">
										 자택 주소
									</th>
                                    <td class="ts">
                                     	<input type="text" name="zip" style="width:80px; height:26px;" placeholder="우편번호"/>
										<button type="button" class="save-btn" onclick="openZipSearch()">검색</button><br>
										<input type="text" name="addr1" style="width:300px; height:30px;" readonly placeholder="도로명 주소"/><br>
									    <input type="text" name="addr2" style="width:300px; height:30px;" placeholder="상세 주소" />

										<input type="checkbox" name="" id="s-address" class="secret-info">
										<label for="s-address" class="s-t">비공개</label>

                                    </td>
                                </tr>
                                <tr>
    
                                </tr>
                            </table>
                            <!-- save btn -->
                            <div style="padding: 10px;">
                                <input type="button" value="저장" class="save-btn cursor">
                            </div>
                        </div>
                        
					</div>	
                </div>
                <script>
					function openZipSearch() {
						new daum.Postcode({
							oncomplete: function(data) {
								$('[name=zip]').val(data.zonecode); // 우편번호 (5자리)
								$('[name=addr1]').val(data.address);
								$('[name=addr2]').val(data.buildingName);
							}
						}).open();
					}

					$("#ex_file").click(function(){
						console.log($("#ex_file").attr("src"));
						 
					})
				</script>
				
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
		<table class="md-tbl" id="application-recode">
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