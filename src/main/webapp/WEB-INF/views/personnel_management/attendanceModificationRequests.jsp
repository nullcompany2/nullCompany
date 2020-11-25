<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
					<span class="ct1">근태 수정 요청 관리</span>
				</div>
				<!-- 1-1 -->
				<div class="contents-wrap drag-scrollbar">
					<div id="show-myleave" class="c-ic">
						<h4 style="font-weight:normal;">
							<br>
							
						</h4>
	
						<div style="margin-top: 50px; margin-bottom: 10px;">
							
						</div>
						<table class="r-table" id="application-record">
							<thead style="background: #e8ecee;">
								<tr>
									<th scope="col"  class="ta">문서 번호</th>
									<th scope="col" class="ta">이름</th>
									<th scope="col"  class="ta">아이디</th>
									<th scope="col" class="ta">사번</th>
									<th scope="col" class="ta">요청신청일</th>
									<th scope="col" class="ta">수정일</th>
									<th scope="col" class="ta">사유</th>
									<th scope="col" class="ta">첨부파일</th>
									<th scope="col" class="ta">승인 / 반려</th>
								</tr>
							</thead>
							<!-- 휴직자 추가시 리스트 -->
							<tbody>
								<c:forEach var="list" items="${modRequestList }">
								<c:if test="${list.statusMod eq '결재중' }">
								<tr style="text-align:center">
									<td class="ta">${list.noMod }</td>
									<td class="ta">${list.name }</td>
									<td class="ta">${list.id } </td>
									<td class="ta">${list.memNo }</td>
									<fmt:formatDate var="applyDate" value="${list.dateApply }" pattern="yyyy-MM-dd"/>
									<td class="ta">${applyDate }</td>
									<fmt:formatDate var="modDate" value="${list.dateMod }" pattern="yyyy-MM-dd"/>
									<td class="ta">${modDate }</td>
									<td class="ta">${list.reasonMod}</td>
									<td class="ta">
										<c:if test="${list.renameAttachmentMod ne null}">
											<a href="${contextPath }/resources/modificationDiligenceUploadFiles/${list.renameAttachmentMod}"
												download="${list.renameAttachmentMod}">${list.renameAttachmentMod}</a>										
										</c:if>
									</td>
									<td class="ta">
										<a href="#"id="${list.memNo }" class="cursor" onclick="modification(${list.noMod})" style="color: #477A8F;">승인</a>
										/
										<a href="#"id="${list.memNo }" class="cursor" onclick="cancel(${list.noMod})" style="color: #477A8F;">반려</a>
									</td>
								</tr>
								</c:if>
								</c:forEach>
							</tbody>
						</table>
						<div style="float: right; margin-top: 10px;">
							<a href="#" id="detail-r-l" class="cursor">이전 요청 기록</a>
						</div>
					</div>	
				</div>
				
			</div>
		</div>
		
		
	</div>
	<script>
		function modification(noMod){
			var result = confirm("문서번호 : "+noMod+" 근태수정을 승인하시겠습니까?");
			if(result){
				location.href="modificationAcknowledgment.do?noMod="+noMod;
			}
			
		};
		function cancel(noMod){
			var result = confirm("문서번호: "+noMod+" 근태수정을 반려하시겠습니까?");
			if(result){
				location.href="modificationCancel.do?noMod="+noMod;
			}
			
		};
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
			})
		})
	</script>
		<style>
			#my_modal {
				display: none;
				width: 1100px;
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
		<h4 style="color: #477A8F; margin-bottom: 30px;">근태 수정 기록</h4>
		<table class="md-tbl" id="application-record">
            <thead style="background: #e8ecee;">
                <tr style="text-align:center">
                    <th scope="col"  class="ta">문서 번호</th>
					<th scope="col" class="ta">이름</th>
					<th scope="col"  class="ta">아이디</th>
					<th scope="col" class="ta">사번</th>
					<th scope="col" class="ta">요청신청일</th>
					<th scope="col" class="ta">수정일</th>
					<th scope="col" class="ta">사유</th>
					<th scope="col" class="ta">첨부파일</th>
					<th scope="col" class="ta">상태</th>
                </tr>
            </thead>
            <!-- 휴직자 추가시 리스트 -->
            <tbody>
            <c:forEach var="list" items="${ modRequestList }">
            <c:if test="${list.statusMod ne '결재중' }">
                <tr style="text-align:center">
                    <td class="md-ta">${list.noMod }</td>
					<td class="md-ta">${list.name }</td>
					<td class="md-ta">${list.id } </td>
					<td class="md-ta">${list.memNo }</td>
					<fmt:formatDate var="applyDate" value="${list.dateApply }" pattern="yyyy-MM-dd"/>
					<td class="md-ta">${applyDate }</td>
					<fmt:formatDate var="modDate" value="${list.dateMod }" pattern="yyyy-MM-dd"/>
					<td class="md-ta">${modDate }</td>
					<td class="md-ta">${list.reasonMod}</td>
					<td class="md-ta">
						<c:if test="${list.renameAttachmentMod ne null}">
							<a href="${contextPath }/resources/modificationDiligenceUploadFiles/${list.renameAttachmentMod}"
												download="${list.renameAttachmentMod}">${list.renameAttachmentMod}</a>											
						</c:if>
					</td>
					<td class=md-ta> ${list.statusMod }</td>
                </tr>
            </c:if>
            </c:forEach>
            </tbody>
        </table>
		<div style="text-align: center; margin-top: 50px;">
			<span class="md-btn cursor md-btn-close" >닫기</span>
		</div>

		<a class="modal-close-btn cursor md-btn-close">X</a>
	</div>
    
</body>
</html>