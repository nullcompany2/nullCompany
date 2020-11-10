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
    <link rel="stylesheet" href="<c:url value="/resources/css/set-leave-standard.css"/>">
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
			<!--  -->
			<!-- 세부 네비 시작 -->
			<c:import url="../common/personnelSubNavi.jsp"/>
			<!-- 세부 네비끝 -->
			
			<!-- 내부 컨텐츠 -->
			<div class="contents">
				<!-- 컨텐츠 타이틀명 -->
				<div class="contents-title">
					<span class="ct1">기본 설정</span>
				</div>
				<!-- ---- -->
				<div class="contents-wrap drag-scrollbar">
					<form action="">
						<div class="c-ic">
							<div>
								<p>
									<h4>휴가 생성 조건</h4>
									- 사용자 입사일(입사일 기준)에 휴가가 자동 생성됩니다. <br>
									- 조직에 속하지 않거나 입사일이 없는 사용자는 휴가가 생성되지 않습니다. <br>
									- 사용하던 휴가 생성 기준을 변경 적용하는 경우, 기존 휴가 데이터는 초기화됩니다. (기존 휴가 생성분 삭제 및 새 기준에 맞추어 재생성) <br>
									- 1년미만 직원은 1개월당 1일의 휴가를 생성합니다.
								</p>
							</div>
							<div>
								<table class="set-tbl">
									<tbody>
										<tr>
											<th scope="row" style="background: #e8ecee;padding: 10px;">휴가일수</th>
											<td>
												<table class="set-en-tbl">
													<tr class="set-en-1">
														<td colspan="2">N(입사년도)   N+1</td>
														<td>	N+2	</td>
														<td>	N+3	</td>
														<td>	N+4	</td>
														<td>	N+5	</td>
														<td>	N+6	</td>
														<td>	N+7	</td>
														<td>	N+8	</td>
														<td>	N+9	</td>
														<td>	N+10	</td>
														<td>	N+11	</td>
														<td>	N+12	</td>
													</tr>
													<tr class="set-en-2">
														<td colspan="2"><input type="text" name="" id="N1" value="${setLeave[0].annualLeave }"  class="set-l-days">일</td>
														<td><input type="text" name="" id="N2" value="${setLeave[1].annualLeave }" class="set-l-days">일</td>
														<td><input type="text" name="" id="N3" value="${setLeave[2].annualLeave }" class="set-l-days">일</td>
														<td><input type="text" name="" id="N4" value="${setLeave[3].annualLeave }" class="set-l-days">일</td>
														<td><input type="text" name="" id="N5" value="${setLeave[4].annualLeave }" class="set-l-days">일</td>
														<td><input type="text" name="" id="N6" value="${setLeave[5].annualLeave }" class="set-l-days">일</td>
														<td><input type="text" name="" id="N7" value="${setLeave[6].annualLeave }" class="set-l-days">일</td>
														<td><input type="text" name="" id="N8" value="${setLeave[7].annualLeave }" class="set-l-days">일</td>
														<td><input type="text" name="" id="N9" value="${setLeave[8].annualLeave }" class="set-l-days">일</td>
														<td><input type="text" name="" id="N10" value="${setLeave[9].annualLeave }" class="set-l-days">일</td>
														<td><input type="text" name="" id="N11" value="${setLeave[10].annualLeave }" class="set-l-days">일</td>
														<td><input type="text" name="" id="N12" value="${setLeave[11].annualLeave }" class="set-l-days">일</td>
															
														
													</tr>
													<tr class="set-en-1">
														<td>	N+13	</td>
														<td>	N+14	</td>
														<td>	N+15	</td>
														<td>	N+16	</td>
														<td>	N+17	</td>
														<td>	N+18	</td>
														<td>	N+19	</td>
														<td>	N+20	</td>
														<td>	N+21	</td>
														<td>	N+22	</td>
														<td>	N+23	</td>
														<td>	N+24	</td>
														<td>	N+25	</td>
													</tr>
													<tr class="set-en-2">
														<td><input type="text" name="" id="N13" value="${setLeave[12].annualLeave }" class="set-l-days">일</td>
														<td><input type="text" name="" id="N14" value="${setLeave[13].annualLeave }" class="set-l-days">일</td>
														<td><input type="text" name="" id="N15" value="${setLeave[14].annualLeave }" class="set-l-days">일</td>
														<td><input type="text" name="" id="N16" value="${setLeave[15].annualLeave }" class="set-l-days">일</td>
														<td><input type="text" name="" id="N17" value="${setLeave[16].annualLeave }" class="set-l-days">일</td>
														<td><input type="text" name="" id="N18" value="${setLeave[17].annualLeave }" class="set-l-days">일</td>
														<td><input type="text" name="" id="N19" value="${setLeave[18].annualLeave }" class="set-l-days">일</td>
														<td><input type="text" name="" id="N20" value="${setLeave[19].annualLeave }" class="set-l-days">일</td>
														<td><input type="text" name="" id="N21" value="${setLeave[20].annualLeave }" class="set-l-days">일</td>
														<td><input type="text" name="" id="N22" value="${setLeave[21].annualLeave }" class="set-l-days">일</td>
														<td><input type="text" name="" id="N23" value="${setLeave[22].annualLeave }" class="set-l-days">일</td>
														<td><input type="text" name="" id="N24" value="${setLeave[23].annualLeave }" class="set-l-days">일</td>
														<td><input type="text" name="" id="N25" value="${setLeave[24].annualLeave }" class="set-l-days">일</td>
	
													</tr>
													<tr class="set-en-1">
														<td>	N+26	</td>
														<td>	N+27	</td>
														<td>	N+28	</td>
														<td>	N+29	</td>
														<td>	N+30	</td>
														<td>	N+31	</td>
														<td>	N+32	</td>
														<td>	N+33	</td>
														<td>	N+34	</td>
														<td>	N+35	</td>
														<td>	N+36	</td>
														<td>	N+37	</td>
														<td>	N+38	</td>
													</tr>
													<tr class="set-en-3">
														<td><input type="text" name="" id="N26" value="${setLeave[25].annualLeave }" class="set-l-days">일</td>
														<td><input type="text" name="" id="N27" value="${setLeave[26].annualLeave }" class="set-l-days">일</td>
														<td><input type="text" name="" id="N28" value="${setLeave[27].annualLeave }" class="set-l-days">일</td>
														<td><input type="text" name="" id="N29" value="${setLeave[28].annualLeave }" class="set-l-days">일</td>
														<td><input type="text" name="" id="N30" value="${setLeave[29].annualLeave }" class="set-l-days">일</td>
														<td><input type="text" name="" id="N31" value="${setLeave[30].annualLeave }" class="set-l-days">일</td>
														<td><input type="text" name="" id="N32" value="${setLeave[31].annualLeave }" class="set-l-days">일</td>
														<td><input type="text" name="" id="N33" value="${setLeave[32].annualLeave }" class="set-l-days">일</td>
														<td><input type="text" name="" id="N34" value="${setLeave[33].annualLeave }" class="set-l-days">일</td>
														<td><input type="text" name="" id="N35" value="${setLeave[34].annualLeave }" class="set-l-days">일</td>
														<td><input type="text" name="" id="N36" value="${setLeave[35].annualLeave }" class="set-l-days">일</td>
														<td><input type="text" name="" id="N37" value="${setLeave[36].annualLeave }" class="set-l-days">일</td>
														<td><input type="text" name="" id="N38" value="${setLeave[37].annualLeave }" class="set-l-days">일</td>
	
													</tr>   
												</table>
											</td>
										</tr>
									</tbody>
								</table>
								<div class="set-checkbox-1">
									<h4 class="set-e-1">휴가 이월 설정</h4> 
									<span class="set-e-2">포상,정기휴가 이월</span> 
									<span class="set-e-3 cursor" id="ch-set">변경</span>
								</div>
								<div class="set-checkbox-1" >
									<h4 class="set-e-1">1년차 휴가 자동생성</h4>
																		
									<input type="radio" name="ck-firstyear" id="use-fy"><label for="use-fy">사용함</label>
									<input type="radio" name="ck-firstyear" id="n-use-fy" style="margin-left: 20px;"><label for="n-use-fy">사용 안함</label>
								</div>
							</div>
							<div>
								<div style="margin-top: 50px; margin-bottom: 20px;">
									<h4 class="set-e-1">휴가 종류</h4> 
									<span class="set-e-3 cursor " id="AddLeaveType">+추가</span>
								</div>
								<table class="tp-l-list" id="LeaveList">
									<tr class="tp-l-list-il">
										<th class="tp-l-list-th">휴가명</th>
										<th class="tp-l-list-th">사용 여부</th>
										<th class="tp-l-list-th">차감여부</th>
										
									</tr>
									<!-- 리스트 -->
									<c:forEach var="tl" items="${leaveList}">
									<tr >
										<td class="tp-l-list-td">${tl.nameType }</td>
										<td class="tp-l-list-td">
										<c:if test="${tl.status eq 'Y'}">
											<select name="" id="availability ${ tl.noType }able">
												<option value="L-use">사용</option>
												<option value="L-n-use">사용안함</option>
											</select>										
										</c:if>
										<c:if test="${tl.status ne 'Y'}">
											<select name="" id="availability ${ tl.noType }able" >
												<option value="L-n-use">사용안함</option>
												<option value="L-use">사용</option>
											</select>										
										</c:if>
										</td>
										<c:if test="${tl.annualUse eq 'Y' }">
											<td class="tp-l-list-td" id="${tbl.noType }ann">
												<input type="checkbox" name="" id="use-a${tl.noType }" checked>
												연차사용여부
											</td>
										</c:if>
										<c:if test="${tl.annualUse ne 'Y' }">
											<td class="tp-l-list-td" id="${tbl.noType }ann">
												<input type="checkbox" name="" id="use-a${tl.noType }">
												연차사용여부
											</td>
										</c:if>
									</tr>
									</c:forEach>
									
									
								</table>
							</div>
							<input type="button" value="적용" class="save-btn cursor" id="saveBtn">
						</div>
					</form>
				</div>
			</div>
		</div>
		
    </div>
    
    <script >
    	
    	var newLeaveArr = new  Array();
    	var setAnnualLeave = new  Array();
    	var newLeaveCount = 1;
    	var firstyear;
    	$(function(){
    		if(${setLeave[0].firstyear} == 0){
    			$("#use-fy").attr('checked','true');
    			firstyear = 0 ;
    		}else{
    			$("#n-use-fy").attr('checked','true');
    			firstyear = 1 ;
    		}
    	});
    	
    	$("#saveBtn").click(function(){
    		for(var i =1; i<=38; i++){
    			var data = new Object();
    			
    			var num ="N" + i;
    			
    			data.year= num;
    			data.days = $("#N"+i).val();
	    		setAnnualLeave.push(data);
    		}
    		console.log(setAnnualLeave);
    		
    		for(var j =1; j<newLeaveCount; j++){
    			var data = new Object();
    			var name ;
    			var able ;
    			var useAnnual;
    			
    			var newLeave = Object();
    			
    			data.name = $("#"+j+"Name").val();
    			data.able = $("#"+j+"able option:selected").val();
    			data.useAnnual = $("#"+j+"annual").is(":checked");
    			 
    			newLeaveArr.push(data);
    			
    		}
   			for(var i = 0; i < newLeaveArr.length; i++){
   				console.log(newLeaveArr[i]);
   			}
    		//newLeaveArr : newLeaveArr, setAnnualLeave : setAnnualLeave, firstyear : firstyear
    		$.ajax({
    			url: "fixSetLeave.do",
    			data : {firstyear : firstyear,setAnnualLeave : JSON.stringify(setAnnualLeave),newLeaveArr :  JSON.stringify(newLeaveArr)},
    			type : "post",
    			dataType:"json",
    			success:function(data){
					console.log(data);
				},
				error: function(request,status,error){
					console.log(request);
					console.log(status);
					console.log(error);
				}
    		});
    		
    	});
    	
    	
    
    	$("#AddLeaveType").click(function(){
    		var $leaveTbl = $("#LeaveList");
    		var $tr;
    		var $leaveName;
    		var $status;
    		var $checkBoxTd;
    		var $checkBox;
    		var select;
    		var $option1;
    		var $option2;
    		var $input;
    		
    		$tr = $('<tr>');
    		$leaveName = $('<td class="tp-l-list-td">');
    		$input = $('<input type="text" name="AddLeaveName" style="width: 70px;" />').attr("id",newLeaveCount+"Name");
    		$status = $('<td class="tp-l-list-td">');
    		$select = $('<select name="availability">').attr("id",newLeaveCount+"able");
    		$option1 = $('<option value="able">사용</option>');
    		$option2 = $('<option value="notable">사용안함</option>');
    		$checkBoxTd = $('<td class="tp-l-list-td">');
    		$checkBox = $('<input type="checkbox" name="">').attr("id",newLeaveCount+"annual");
    		
    		
    		$leaveName.append($input);
    		$select.append($option1);
    		$select.append($option2);
    		$status.append($select);
    		$checkBoxTd.append($checkBox);
    		$checkBoxTd.append(" 연차사용여부");
    		
    		$tr.append($leaveName);
    		$tr.append($status);
    		$tr.append($checkBoxTd);
    		
    		$leaveTbl.append($tr);
    		
    		newLeaveCount++;
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