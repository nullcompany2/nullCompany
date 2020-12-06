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
					<span class="ct1">휴직자 관리</span>
				</div>
				<!-- 1-1 -->
				<div class="contents-wrap drag-scrollbar">
					<div id="show-myleave" class="c-ic">
						<h4 style="font-weight:normal;">
							<br>
							※ 복직을 원하는 직원은 인사관리자가 수동으로 휴직자 목록에서 [복직]해야 합니다. 휴직자목록에서 복직 후 근태가 정상처리 됩니다.
						</h4>
	
						<div style="margin-top: 50px; margin-bottom: 10px;">
							
						</div>
						<table class="r-table" id="application-record">
							<thead style="background: #e8ecee;">
								<tr>
									<th scope="col"  class="ta">이름</th>
									<th scope="col" class="ta">소속</th>
									<th scope="col"  class="ta">사유</th>
									<th scope="col" class="ta">휴직일</th>
									<th scope="col" class="ta">복직</th>
								</tr>
							</thead>
							<!-- 휴직자 추가시 리스트 -->
							<tbody>
								<c:forEach var="list" items="${absenceList }">
								<c:if test="${list.status eq 'Y' }">
								<tr style="text-align:center">
									<td class="ta">${list.name }</td>
									<td class="ta">${list.deptName } </td>
									<td class="ta">${list.reasonAbsence }</td>
									<td class="ta">${list.absenceDate }</td>
									<td class="ta">
										<a href="#"id="${list.memNo }" class="cursor" onclick="retrunToWork(${list.noAbsence})" style="color: #477A8F;">복직</a>
									</td>
								</tr>
								</c:if>
								</c:forEach>
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
	<script>
		function retrunToWork(noAbsence){
			var result = confirm("휴직번호 : "+noAbsence+" 사원을 복직시키시겠습니까.?");
			if(result){
				location.href="returnToWork.do?noAbsence="+noAbsence;
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
			modal('my_modal')
			$.ajax({
				url : "previousAbsence.do",
				dataType : "json",
				success:function(data){
					console.log(data);
					
					$("#dListPaging").remove();
					$('#md_listTbl tr').remove();
					var $mdTbl = $("#md_listTbl");
	            	var $tr;
	            	var $td;
	            	var $td_name;
	            	var $td_memNo;
	            	var $td_reasonAbsence;
	            	var $td_absenceDate;
	            	var $td_returnDate;
					
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
	            	
	            	
					for(var i in data.previousAbsence){					
						$tr = $('<tr style="text-align:center">');
						$td_name = $('<td class="md-ta">').text(data.previousAbsence[i].name);
						$td_memNo = $('<td class="md-ta">').text(data.previousAbsence[i].memNo);
						$td_reasonAbsence = $(' <td class="md-ta">').text(data.previousAbsence[i].reasonAbsence);
						$td_absenceDate = $('<td class="md-ta">').text(data.previousAbsence[i].absenceDate);
						$td_returnDate = $('<td class="md-ta">').text(data.previousAbsence[i].returnDate);
						
						$tr.append($td_name);
						$tr.append($td_memNo);
						$tr.append($td_reasonAbsence);
						$tr.append($td_absenceDate);
						$tr.append($td_returnDate);
						$mdTbl.append($tr);
					}
					
					$tr = $('<tr align="center" height="20" id="dListPaging">'); 
					$td = $('<td colspan="6">');
					if(data.pi.currentPage == 1){
						
						$td0 = "[이전]";
						$td.append($td0);
					}
		        	
					if(data.pi.currentPage != 1){
						$td0 = $('<a onclick="mdListPaged('+ (data.pi.currentPage -1)+')">').text("[이전]");
			        	
			        	$td.append($td0);
					}    	
		        	
			       	
			       	
			       	for(var p = data.pi.startPage; p <=  data.pi.endPage; p++){
			       		if(p == data.pi.currentPage){
			       			$td0 = $("<b style='color:red; font-size:4'>").text("  "+p+"  ");
			       			$td.append($td0);
			       		}
			       		if(p != data.pi.currentPage ){
			       			$td0 = $('<a onclick="mdListPaged('+ (p)+')">').text("  "+p+"  ");
			       			$td.append($td0);
			       		}
			       	
			       	}
		        	
			       	if(data.pi.currentPage == data.pi.maxPage ){
			       		$td0 = "[다음]";
			       		$td.append($td0);
			       	}
		        	
		        	if(data.pi.currentPage != data.pi.maxPage){
		        		$td0 = $('<a onclick="mdListPaged('+ (data.pi.currentPage + 1)+')">').text("[다음]");
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
		});
		
		function mdListPaged(currentPage){
			$.ajax({
				url : "previousAbsence.do",
				data : {currentPage : currentPage},
				dataType : "json",
				success:function(data){
					console.log(data);
					
					$("#dListPaging").remove();
					$('#md_listTbl tr').remove();
					var $mdTbl = $("#md_listTbl");
	            	var $tr;
	            	var $td;
	            	var $td_name;
	            	var $td_memNo;
	            	var $td_reasonAbsence;
	            	var $td_absenceDate;
	            	var $td_returnDate;
					
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
	            	
	            	
					for(var i in data.previousAbsence){					
						$tr = $('<tr style="text-align:center">');
						$td_name = $('<td class="md-ta">').text(data.previousAbsence[i].name);
						$td_memNo = $('<td class="md-ta">').text(data.previousAbsence[i].memNo);
						$td_reasonAbsence = $(' <td class="md-ta">').text(data.previousAbsence[i].reasonAbsence);
						$td_absenceDate = $('<td class="md-ta">').text(data.previousAbsence[i].absenceDate);
						$td_returnDate = $('<td class="md-ta">').text(data.previousAbsence[i].returnDate);
						
						$tr.append($td_name);
						$tr.append($td_memNo);
						$tr.append($td_reasonAbsence);
						$tr.append($td_absenceDate);
						$tr.append($td_returnDate);
						$mdTbl.append($tr);
					}
					
					$tr = $('<tr align="center" height="20" id="dListPaging">'); 
					$td = $('<td colspan="6">');
					if(data.pi.currentPage == 1){
						
						$td0 = "[이전]";
						$td.append($td0);
					}
		        	
					if(data.pi.currentPage != 1){
						$td0 = $('<a onclick="mdListPaged('+ (data.pi.currentPage -1)+')">').text("[이전]");
			        	
			        	$td.append($td0);
					}    	
		        	
			       	
			       	
			       	for(var p = data.pi.startPage; p <=  data.pi.endPage; p++){
			       		if(p == data.pi.currentPage){
			       			$td0 = $("<b style='color:red; font-size:4'>").text("  "+p+"  ");
			       			$td.append($td0);
			       		}
			       		if(p != data.pi.currentPage ){
			       			$td0 = $('<a onclick="mdListPaged('+ (p)+')">').text("  "+p+"  ");
			       			$td.append($td0);
			       		}
			       	
			       	}
		        	
			       	if(data.pi.currentPage == data.pi.maxPage ){
			       		$td0 = "[다음]";
			       		$td.append($td0);
			       	}
		        	
		        	if(data.pi.currentPage != data.pi.maxPage){
		        		$td0 = $('<a onclick="mdListPaged('+ (data.pi.currentPage + 1)+')">').text("[다음]");
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
		}
		
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
		<h4 style="color: #477A8F; margin-bottom: 30px;">이전 휴직자 </h4>
		<table class="md-tbl" id="application-record">
            <thead style="background: #e8ecee;">
                <tr style="text-align:center">
                    <th scope="col"  class="md-ta">이름</th>
                    <th scope="col"  class="md-ta">사번</th>
                    <th scope="col"  class="md-ta">사유</th>
                    <th scope="col" class="md-ta">휴직일</th>
                    <th scope="col"  class="md-ta">복직일</th>
                </tr>
            </thead>
            <!-- 휴직자 추가시 리스트 -->
            <tbody id="md_listTbl">
            
                <tr style="text-align:center">
                    <td class="md-ta">${list.name }</td>
                    <td class="md-ta">${list.memNo }</td>
                    <td class="md-ta">${list.reasonAbsence }</td>
                    <td class="md-ta">${list.absenceDate }</td>
                    <td class="md-ta">${list.returnDate }</td>
                </tr>
            
            </tbody>
            
        </table>
        <div style="text-align: center; margin-top: 50px;">
			<table  style=" width: 100%; border-collapse: collapse;" id="md_page_tbl">
	            
			</table>
		</div>
		<div style="text-align: center; margin-top: 50px;">
			<span class="md-btn cursor md-btn-close" >닫기</span>
		</div>

		<a class="modal-close-btn cursor md-btn-close">X</a>
	</div>
    
</body>
</html>