<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.nullcompany.personnelManagement.model.vo.ForEmUsedLeave" %>
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
    <link rel="stylesheet" href="<c:url value="/resources/css/em-leave-management.css"/>">
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
			<!-- 세부 네비 시작 -->
            <c:import url="../common/personnelSubNavi.jsp"/>
            <!-- 세부 네비끝 -->

            <!-- 내부 컨텐츠 -->
            <div class="contents">
                <!-- 컨텐츠 타이틀명 -->
                <div class="contents-title">
                    <span class="ct1">직원 휴가 관리</span>
                </div>
                <!-- ---- -->
                <div class="contents-wrap drag-scrollbar" style="top: 50px;">
                    <div class="ic-navi">
                        <div href="" class="cate cursor" id="leave-status">올해 휴가 현황조회</div>
                        <div href="" class="cate cursor" id="reward-leave">포상휴가 생성</div>
                    </div>
    				
                    <div id="show-leave-status" class="c-ic">
                    <div style="margin-left: 100px; margin-top: 50px; color:#477A8F;">
    					※ 휴가 잔여일은 해당직원이 로그인하여 휴가현황을 조회하여야 업데이트 됩니다.
    				</div>
                        <form action="searchEmLeave.do" style="float: right;">
                        	<a href="emLeaveManagement.do"id="" class="cursor" style="height:25px; color: #477A8F; font-size: 14px;">검색취소»
								</a>  &nbsp;&nbsp;&nbsp;
                            <input type="text" name="searchKey"  class="search-emp">
                            <button class="search-btn cursor">검색</button>
                        </form>
                        <table class="l-table" id="leave-status-tbl">
                            <thead style="background: #e8ecee;">
                                <tr>
                                    <th scope="col" rowspan="2" class="tl">이름</th>
                                    <th scope="col" rowspan="2" class="tl">입사일</th>
                                    <th scope="col" rowspan="2" class="tl">올해생성</th>
                                    <th scope="col" colspan="2" class="tl">생성내역</th>
                                    <th scope="col" colspan="${leaveList.size() }" class="tl">사용현황</th>
                                    <th scope="col" rowspan="2" class="tl">잔여</th>
                                    <th scope="col" rowspan="2" class="tl sepa-line">수정 | 상세</th>
    
                                </tr>
                                <tr>
                                    <th scope="col" class="tl">정기</th>
                                    <th scope="col" class="tl">포상</th>
                                    <!-- 휴가 목록 리스트-->
                                <c:forEach var="leaveType" items="${ leaveList }">
                                    <th scope="col" class="ts" id="${leaveType.noType }">${leaveType.nameType }</th>
                                </c:forEach>
                                </tr>
                            </thead>
                            <tbody id="memList">
                            	<c:choose>
                            	<c:when test="${! empty emList }">
                            	
                            	<c:forEach var="m" items="${emList}">
	                           		<tr id="${m.memNo }_tr" style="    border-bottom: solid 1px #477A8F;">
	                                    <td class="ta">${m.name }</td>
	                                    <td class="ta"><fmt:formatDate value="${m.enrollDate}" pattern="yyyy.MM.dd"/></td>
	                                    <td class="ta">${m.annualLeave + m.rewardLeave }</td>
	                                    <td class="ta">${m.annualLeave }</td>
	                                    <td class="ta">${m.rewardLeave }</td>
	                                    <!-- 휴가 목록 리스트 맞춰서 -->
	                                    <c:forEach var="leaveL" items="${leaveList }">
	                                    <c:set var="i" value="${m.memNo }_${leaveL.noType }"/>
	                                    <c:set var="j" value="${usedL.num }"/>
	                                   	
	                                   		<td class="ta" id="${m.memNo}_${leaveL.noType}">0</td>
	                                    </c:forEach>
	                                    <!-- 여기까지 -->
	                                    <td class="ta">${ m.remainAnnual + m.remainReward }</td>
	                                    <td class="ta sepa-line">
	                                        <a href="#" class="cursor" style="color: #477A8F;" onclick="modfiy(${m.memNo})">수정</a> |
	                                        <a href="#" class="cursor" style="color: #477A8F;" onclick="detail(${m.memNo})">상세</a>
	                                    </td>
	                                </tr>
                                </c:forEach>
                                </c:when>
                                <c:otherwise>
                                	<tr id="" style="    border-bottom: solid 1px #477A8F;">
                                		<td class="ta" colspan="8">검색결과가 없습니다.</td>
                               		</tr>
                                </c:otherwise>
                                </c:choose>                                
                            </tbody>
                        </table>
                    </div>	
                    <div id="show-reward-leave" class="c-ic">
                        <form action="">
                            <table class="re-l-tbl">
                                <tbody>
                                    <tr style="border-bottom: solid 0.1px #477A8F ;">
                                        <th scope="row" style="background: #e8ecee;padding: 10px;">대상자 선택</th>
                                        <td style="padding: 10px; float: left;">
                                            <span>대상자를 선택하세요</span>
                                            <a href="#"id="pick-em-1" class="cursor" style="color: #477A8F; margin-left: 20px;">선택하기</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" style="background: #e8ecee;padding: 10px;" >휴가일수</th>
                                        <td style="padding: 10px;">
                                            <h5 style="float: left; margin-bottom: 20px;">포상 휴가 일수를 입력한 후 '생성하기'를 클릭하세요.</h5>                                         
                                            <table class="re-l-list">
                                                <tr class="re-l-list-il">
                                                    <th class="re-l-list-ck-th" rowspan="2"><input type="checkbox" name="" id="All-chk"></th>
                                                    <th class="re-l-list-th" rowspan="2">이름</th>
                                                    <th class="re-l-list-th" rowspan="2">ID</th>
                                                    <th class="re-l-list-th" rowspan="2">부서</th>
                                                    <th class="re-l-list-th" rowspan="2">연차</th>
                                                    <th class="re-l-list-th sepa-line" colspan="2">포상</th>
                                                    
                                                </tr>
                                                <tr class="re-l-list-il">
                                                    <th class="re-l-list-th sepa-line">현재</th>
                                                    <th class="re-l-list-th">생성 일</th>
                                                    
                                                </tr>
                                                <tbody id="selectedList">
                                                <!-- 리스트 -->
	                                                
                                                </tbody>
                                            </table>
                                            <div style="text-align: left;margin-top: 10px; height: 30px;">
                                                
                                            </div>                                               
                                        </td>                                    
                                    </tr>
                                </tbody>
                            </table>
                            
                            <div>
                                <input type="button" value="생성하기" class="save-btn cursor" onclick="createBtn()">
                            </div>
                        </form>
                    </div>
                </div>
                
            </div>

		</div>
	</div>
	<!-- Main -->
	<script>
		/* ic category */
		$("#leave-status").click(function(){
			$("#show-reward-leave").css("display","none")
			$("#show-leave-status").css("display","block")
			$("#leave-status").css("color","#477A8F")
			$("#reward-leave").css("color","black")
		})
		$("#reward-leave").click(function(){
			$("#show-leave-status").css("display","none")
			$("#show-reward-leave").css("display","block")
			$("#leave-status").css("color","black")
			$("#reward-leave").css("color","#477A8F")
		})
		
		$(function(){
			$.ajax({
				url: "AllMemberUsedLeave.do",
				dataType : "json",
				success:function(data){
					for( var i=0; i<data.length; i++) {
						var num = data[i].num;
						console.log(num);
						$("#"+num).html(data[i].useCount);
					}
						
					
					
				},
				error: function(request,status,error){
					console.log(request);
					console.log(status);
					console.log(error);
				}
			})
		})
		
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
		function modfiy(memNo){
			modal('my_modal-1');
			
			$.ajax({
				url : "modalModifyLeave.do",
				data : {memNo : memNo},
				dataType : "json",
				success:function(data){
					console.log(data);
					$("#md1_leaveCreateRecord").text("휴가 생성내역 : ("+data.createDate + ") ~ (" + data.endDate + ")");
					$("#md1_enrollDate").text("입사일 : ( "+data.m.enrollDate+" )");
					$("#md1_memName").text("사원명 : " + data.m.name );
					$("#md1_memNo").text( data.m.memNo);
					$("#md1_annualLeave").attr('value',data.m.annualLeave).text(data.m.annualLeave);
					$("#md1_rewardLeave").attr('value',data.m.rewardLeave).text(data.m.rewardLeave);
				},
				error: function(request,status,error){
					console.log(request);
					console.log(status);
					console.log(error);
				}
			})
		}
        function md1_saveBtn(){
        	var md1_memNo = $("#md1_memNo").text();
        	var md1_memName  =$("#md1_memName").text();
        	var md1_annualLeave = $("#md1_annualLeave").text();
        	var md1_rewardLeave = $("#md1_rewardLeave").text();
        	
        	var md1_changeAnnual = $("#md1_changeAnnual").val();
        	var md1_changeReward = $("#md1_changeReward").val();
        	
        	var md1_reasonAnnual = $("#md1_reasonAnnual").val();
        	var md1_reasonReward = $("#md1_reasonReward").val();
        	
        	
        	if(md1_changeAnnual != "" && md1_changeReward != ""){
        		if(md1_annualLeave == md1_changeAnnual && md1_rewardLeave == md1_changeReward){
        			alert("변경될 휴가가 존재하지 않습니다.");
        		}else if(md1_annualLeave >= md1_changeAnnual && md1_rewardLeave >= md1_changeReward){
        			var result = confirm(md1_memNo + " / " + md1_memName + "의 휴가를 변경하시겠습니까 ? ")
        			if(result){
        				$.ajax({
        					url : "emLeaveManagement.do",
        					data : {
        							changeAnnual : md1_changeAnnual , changeReward : md1_changeReward ,
        							reasonAnnual : md1_reasonAnnual , reasonReward : md1_reasonReward ,
        							changeMemNo : md1_memNo
        							},
        					Type : "POST",
        					success:function(data){
                				alert("변경 완료");
                				location.href = location.href;
    						},
    						error: function(request,status,error){
    							console.log(request);
    							console.log(status);
    							console.log(error);
    						}
        				});
        			}
        			
        		}else{
					alert("변경할 값이 기존의 값보다 클수는 없습니다. (기존휴가에서 차감만 가능.)");
        		}
        	}else{
        		alert("변경후 값을 입력해주세요. 변경을 원하지않을경우 동일한 값을 입력해주세요.");
        	}
        }
		
		function detail(memNo){
			modal('my_modal-2');
			
			$.ajax({
				url : "selectedMemberDetailLeave.do",
				data : {memNo : memNo},
				dataType : "json",
				success:function(data){
					
				
                
					
					console.log(data);
					$("#md2_createLeaveList tr").remove();
					var $recordTbl = $("#md2_createLeaveList");
					var $tr;
					var $createDate;
					var $createLeave;
					var $totalLeave;
					var $contentDescription;
					var $fullRecord;
					
					
					
					var totalLeaveCount = data.annualLeave;
					// 정기휴가(기본);
					$tr = $('<tr>');
					$createDate = $('<td class="md-ta">').text(data.createDate);
					$createLeave = $('<td class="md-ta">').text(data.annualLeave+"일");
					$totalLeave = $('<td class="md-ta">').text(totalLeaveCount+"일");
					$contentDescription = $('<td class="md-ta">').text("정기휴가");
					$fullRecord = $('<td class="md-ta">').text("금년발생일("+ data.annualLeave +") , 최종연차("+totalLeaveCount+")");
										
					$tr.append($createDate);
					$tr.append($createLeave);
					$tr.append($totalLeave);
					$tr.append($contentDescription);
					$tr.append($fullRecord);
					$recordTbl.append($tr);
					
					//포상휴가 (반복);
					
					for(var j in data.createdReward){
						totalLeaveCount = totalLeaveCount + data.createdReward[j].rewardDays;
						
						$tr = $('<tr>');
						$createDate = $('<td class="md-ta">').text(data.createdReward[j].createDate);
						$createLeave = $('<td class="md-ta">').text(data.createdReward[j].rewardDays+"일");
						$totalLeave = $('<td class="md-ta">').text(totalLeaveCount+"일");
						$contentDescription = $('<td class="md-ta">').text("포상휴가");
						$fullRecord = $('<td class="md-ta">').text("포상("+ data.createdReward[j].rewardDays +") , 최종연차("+totalLeaveCount+")");
						
						
						$tr.append($createDate);
						$tr.append($createLeave);
						$tr.append($totalLeave);
						$tr.append($contentDescription);
						$tr.append($fullRecord);
						$recordTbl.append($tr);
					}
				
					// 휴가사용 기록
					$("#md2_usedLeaveHistory tr").remove();
					var $usedLeaveTbl = $("#md2_usedLeaveHistory");
					var $noRecord;
					var $name;
					var $leaveTypeName;
					var $useDays
					var $useTerm;
					var $status;
					
					var $typeUsedLeave = "";
					for(var j in data.typeUsedLeave){
						$typeUsedLeave +=(data.typeUsedLeave[j].tName+"("+data.typeUsedLeave[j].num+") "); 
					}
					
					for(var j in data.mixLeave){
						$tr = $('<tr>');
						$noRecode =$('<td class="md-ta">').text(data.mixLeave[j].noRecord);
						$name =$('<td class="md-ta">').text(data.m.name);
						$leaveTypeNo = $('<td class="md-ta">').text(data.mixLeave[j].nameType);
						$useDays = $('<td class="md-ta">').text(data.mixLeave[j].useDays);
						$useTerm =$('<td class="md-ta">').text(data.mixLeave[j].applyDate + "~ (" + data.mixLeave[j].useDays + ")일");
						$status = $('<td class="md-ta">').text(data.mixLeave[j].status);
						
						$tr.append($noRecode);
						$tr.append($name);
						$tr.append($leaveTypeNo);
						$tr.append($useDays);
						$tr.append($useTerm);
						$tr.append($status);
						$usedLeaveTbl.append($tr);
						
					}
					
					
					$("#md2_leaveCreateRecord").text("휴가 생성내역 : ("+data.createDate + ") ~ (" + data.endDate + ")");
					$("#md2_enrollDate").text("입사일 : ( " + data.m.enrollDate + " )");
					$("#md2_memName").text("사원명 : " + data.m.name );
					$("#md2_memNo").text( data.m.memNo);
					$("#md2-1_leaveCreateRecord").text("휴가 생성내역 : ("+data.createDate + ") ~ (" + data.endDate + ")");
					$("#md2-1_enrollDate").text("입사일 : ( " + data.m.enrollDate + " )");
					$("#md2-1_memName").text("사원명 : " + data.m.name );
					$("#md2-1_memNo").text( data.m.memNo);
					
					$("#md2-1_simpleStatistics").text("당해 사용휴가 간략 통계 : "+ $typeUsedLeave);
					
					
				},
				error: function(request,status,error){
					console.log(request);
					console.log(status);
					console.log(error);
				}
			})
		}
       
        $('#pick-em-1').on('click', function() {
			// 모달창 띄우기
			
			modal('my_modal-3');
        });
        
        function md3_search(){
        	var sDate = $("#sDate").val();
        	var eDate = $("#eDate").val();
        	var inputword = $("#md3_inputwords").val();
        	
        	var check = 0;
        	
	        if(sDate >eDate){
	    		alert("날짜를 올바르게 입력해주세요.");
	    	}else if(sDate !="" && eDate == ""){
        		alert("날짜를 모두 입력해주세요");
        	}else if(sDate =="" && eDate != ""){
        		alert("날짜를 모두 입력해주세요");
        	}else{
        		check = 1;
        	}
	        
	        if(check ==1){
	        	if(sDate != "" || inputword !=""){
	        		$.ajax({
	        			url: "selectTargetReward.do",
	        			data : {sDate : sDate , eDate : eDate, inputword : inputword},
	        			dataType : "json",
	        			success : function(data){
	        				console.log(data);

		        			$("#md3_searchList tr").remove();
	        				var $searchTbl =$("#md3_searchList");
	        				var $tr;
	        				var $checkBox;
	        				var $name;
	        				var $id;
	        				var $dept;
	        				var $annual;
	        				var $reward;
	        				var $td;
	        				for(var i in data){
		        				$tr = $('<tr class="re-l-list">');
		        				$checkBox = $(' <td class="re-l-list-ck-td">');
		        				$td = $('<input type="checkbox" name="md-chk" id="">').attr('id',data[i].memNo)
		        				$name = $('<td class="re-l-list-td">').text(data[i].name);
		        				$id = $('<td class="re-l-list-td">').text(data[i].id);
		        				$dept = $('<td class="re-l-list-td">').text(data[i].deptName);
		        				$annual = $('<td class="re-l-list-td">').text(data[i].annualLeave);
		        				$reward = $('<td class="re-l-list-td">').text(data[i].rewardLeave);
	        					
		        				$checkBox.append($td);
		        				$tr.append($checkBox);
		        				$tr.append($name);
		        				$tr.append($id);
		        				$tr.append($dept);
		        				$tr.append($annual);
		        				$tr.append($reward);
		        				$searchTbl.append($tr);
	        				}
	        			},
	        			error : function(request,status,error){
	        				console.log(request);
	        				console.log(status);
	        				console.log(error);
	        			}
	        		});
	        	}else{
	        		alert("날짜 또는 검색어를 입력해주세요.");
	        	}
	        }
	        
        };
        
       	var listArr = new Array();
       	
        function md3_saveBtn(){
        	listArr = new Array();
        	var size = $('input:checkbox[name="md-chk"]').length;
        	console.log(size);
        	for( var i =0; i<size;i++){
	        	if($('input:checkbox[name="md-chk"]')[i].checked){
	        		listArr.push($('input:checkbox[name="md-chk"]')[i].id);
	        		console.log(listArr);
	        		console.log(listArr.length);
	        	}
        		
        	}
        	if(listArr.length > 0){
        		console.log(listArr);
	        	$.ajax({
	        		url: "grantReward.do",
	        		data : {listArr :  JSON.stringify(listArr) },
	        		type:"post",
	        		
	        		success : function(data){
	        			console.log(data);
	        			
        				$("#selectedList tr").remove();
        				var $searchTbl =$("#selectedList");
        				var $tr;
        				var $checkBox;
        				var $name;
        				var $id;
        				var $dept;
        				var $annual;
        				var $reward;
        				var $createReward;
        				var $inputCheckbox;
        				var $inputText;
        				
        				
        				for(var i in data){
       					
	        				$tr = $('<tr>').attr('id',data[i].memNo+"TR");
	        				$checkBox = $('<td class="re-l-list-ck-td">');
	        				$inputCheckbox = $('<input type="checkbox" name="chk" />').attr('id',data[i].memNo)
	        				$name = $('<td class="re-l-list-td">').text(data[i].name);
	        				$id = $('<td class="re-l-list-td">').text(data[i].id);
	        				$dept = $('<td class="re-l-list-td">').text(data[i].deptName);
	        				$annual = $('<td class="re-l-list-td">').text(data[i].annualLeave);
	        				$reward = $('<td class="re-l-list-td sepa-line">').text(data[i].rewardLeave);
	        				$createReward = $('<td class="re-l-list-td">');
	        				$inputText = $('<input type="text" name="inputT" id="" style="width: 40px;" onkeypress="return digit_check(event)"> 일').attr('id',data[i].memNo+"C");
	        				
	        				$checkBox.append($inputCheckbox);
	        				$createReward.append($inputText);
	        				$tr.append($checkBox);
	        				$tr.append($name);
	        				$tr.append($id);
	        				$tr.append($dept);
	        				$tr.append($annual);
	        				$tr.append($reward);
	        				$tr.append($createReward);
	        				$searchTbl.append($tr);
	        			
        						
       					}
	        		},
	        		error : function(request,status,error){
	        			console.log(request);
	        			console.log(status);
	        			console.log(error);
	        		}
	        	});
	        	
        	}else{
        		alert("대상자를 선택하세요.");
        	}
        	
        	
        }
        

        var cMemNoArr = new Array();
        var cDaysArr = new Array();
        
        
        function createBtn(){
        	cMemNoArr = new Array();
            cDaysArr = new Array();
            var able = 0;
            
        	var size = $('input:checkbox[name="chk"]').length;
        	console.log(size);
        	for( var i =0; i<size;i++){
	        	if($('input:checkbox[name="chk"]')[i].checked){
	        		if($('input:text[name="inputT"]')[i].value == ""){
	        			alert("생성일을 모두 입력해주세요.");
	        			return;
	        			able =0;
	        		}else{
	        			cMemNoArr.push($('input:checkbox[name="chk"]')[i].id);
	        			cDaysArr.push($('input:text[name="inputT"]')[i].value);
	        			able = 1;
	        		}
	        		
	        	}
        		
        	}
        	if(able == 1){
        		location.href="grantReward1.do?cMemNoArr="+cMemNoArr+"&cDaysArr="+cDaysArr;
        	}else{
        		alert("대상선택후 생성하기를 눌러주세요");
        	}
        	console.log(cMemNoArr);
        	console.log(cDaysArr);
    		console.log(cMemNoArr.length);
    		console.log(cDaysArr.length);
        }
        
        $(function(){
            $("#modal-create-history").click(function(){
                $("#show-used-history").css("display","none")
                $("#show-create-history").css("display","block")
                $("#modal-create-history").css("color","#477A8F")
                $("#modal-used-history").css("color","black")
            })
            $("#modal-used-history").click(function(){
                $("#show-create-history").css("display","none")
                $("#show-used-history").css("display","block")
                $("#modal-create-history").css("color","black")
                $("#modal-used-history").css("color","#477A8F")
            })
            /* ic checkbox onclick */
            $("#md-All-chk").click(function(){
                if($("#md-All-chk").prop("checked")){
                    $("input[name=md-chk]").prop("checked",true);
                }else{
                    $("input[name=md-chk]").prop("checked",false);
                }
            })
            $("#All-chk").click(function(){
                if($("#All-chk").prop("checked")){
                    $("input[name=chk]").prop("checked",true);
                }else{
                    $("input[name=chk]").prop("checked",false);
                }
            })
        })
        
        function digit_check(evt){
		    var code = evt.which?evt.which:event.keyCode;
		    if(code < 48 || code > 57){
		        return false;
		    }
		}
        
        

    </script>
    <style>
        #my_modal-1 {
            display: none;
            width: 700px;
            height: 400px;
            padding: 20px 60px;
            background-color: #fefefe;
            border: 1px solid #888;
            border-radius: 3px;
        }
        #my_modal-2{
            display: none;
            width: 800px;
            height: 500px;
            padding: 20px 60px;
            background-color: #fefefe;
            border: 1px solid #888;
            border-radius: 3px;
        }
        #my_modal-3{
            display: none;
            width: 800px;
            height: 450px;
            padding: 20px 60px;
            background-color: #fefefe;
            border: 1px solid #888;
            border-radius: 3px;
        }

        #my_modal-1 .modal-close-btn {
            position: absolute;
            top: 10px;
            right: 10px;
        }
        #my_modal-2 .modal-close-btn {
            position: absolute;
            top: 10px;
            right: 10px;
        }
        #my_modal-3 .modal-close-btn {
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
        .md-ic-navi{
            margin-top: 30px;
            width:80%;
            height: 10%;
        }
        .md-tbl{
            width: 100%;
            border-top: solid 0.1px #477A8F;
            border-bottom: solid 0.1px #477A8F;
            border-collapse:collapse;
        }
        .md-l-table{
            margin-top: 20px;
            width: 100%;
            border-top: solid 0.1px  #477A8F;
            border-bottom: solid 0.1px #477A8F;
            text-align: center;
            border-collapse: collapse;

        }
        .modal-cate{
                
            float: left;
            width: 90px;
            margin-right: 20px;
            border-bottom: solid 0.1px #477A8F;
            border-bottom-right-radius: 10px;
            border-bottom-left-radius: 2px;
        }
        .md-tl{
            padding: 10px;
        }
        .md-tr{
            padding: 10px;
        }
        .md-ta{
            padding: 10px;
        }
        #modal-create-history{
            color: #477A8F;
        }
        #show-used-history{
            display: none;
        }
        .md-btn{
            margin-top: 10px;
            width: 70px;
            background: white;
            border: solid 0.1px #477A8f;
            border-radius: 5px;
            font-size: 15px;
            color: white;
            background: #477A8f;
        }
        .md-search-reward-pick{
            margin-bottom: 10px;
        }
        .md-search-btn{
            text-align: center;
            margin-bottom: 30px;
        }
    </style>
    <!-- 첫번째 modal -->
	<div id="my_modal-1" class="modal-dragscroll">
		<h4 style="color: #477A8F; margin-bottom: 30px;">직원 휴가일 수정</h4>
		<table class="md-l-table">
			<h4 style="font-weight:normal;" id="md1_leaveCreateRecord">휴가 생성내역(<span>2019-12-28</span>~<span>2020-12-28</span>)</h4>
            <h5 style="font-weight:normal;" id="md1_enrollDate">입사일 : (<span>1992-12-28</span>)</h5>
            <h5 style="font-weight:normal;" id="md1_memName">사원명 : (<span>ID</span>)</h5>
            <h5 style="font-weight:normal;" id="md1_memNo"></h5>
            <thead style="background: #e8ecee;">
                <tr>
                    <th scope="col" rowspan="2" class="md-tr">종류</th>
                    <th scope="col" rowspan="2" class="md-tr">현재</th>
                    <th scope="col" rowspan="2" class="md-tr">변경후</th>
                    <th scope="col" rowspan="2" class="md-tr">비고</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="md-ta">정기연차</td>
                    <td class="md-ta" id="md1_annualLeave"></td>
                    <td class="md-ta"><input type="text" name="" id="md1_changeAnnual" style="width: 30px;" onkeypress="return digit_check(event)"></td>
                    <td class="md-ta"><input type="text" name="" id="md1_reasonAnnual" style="width: 100%;" placeholder="내용을 입력하세요."></td>
                </tr>
                <tr>
                    <td class="md-ta">포상</td>
                    <td class="md-ta" id="md1_rewardLeave"></td>
                    <td class="md-ta"><input type="text" name="" id="md1_changeReward" style="width: 30px;" onkeypress="return digit_check(event)"></td>
                    <td class="md-ta"><input type="text" name="" id="md1_reasonReward" style="width: 100%;" placeholder="내용을 입력하세요."></td>
                </tr>
            </tbody>
		</table>
		<div style="text-align: center; margin-top: 50px;">
			<input type="button" class="md-btn cursor md-btn-save" onclick="md1_saveBtn()" value="저장">
			<input type="button" class="md-btn cursor md-btn-close" style="margin-left: 50px;" value="닫기">
		</div>

		<a class="modal-close-btn cursor md-btn-close">X</a>
    </div>
    <!-- 2번째 modal -->
    <div id="my_modal-2" class="modal-dragscroll">
        <h4 style="color: #477A8F; margin-bottom: 30px;">휴가 상세</h4>
        <div class="md-ic-navi">
            <div href="" class="modal-cate cursor" id="modal-create-history">생성 내역</div>
            <div href="" class="modal-cate cursor" id="modal-used-history">사용 내역</div>
        </div>
        <!-- 생성내역 -->
        <div id="show-create-history">
            <h4 style="font-weight:normal;" id="md2_leaveCreateRecord">휴가 생성내역(<span>2019-12-28</span>~<span>2020-12-28</span>)</h4>
            <h5 style="font-weight:normal;" id="md2_enrollDate">입사일 : (<span>1992-12-28</span>)</h5>
            <h5 style="font-weight:normal;" id="md2_memName">사원명 : (<span>ID</span>)</h5>
            <h5 style="font-weight:normal;" id="md2_memNo"></h5>
            <table class="md-l-table" id="md-create-tbl">
                <thead style="background: #e8ecee;">
                    <tr>
                        <th scope="col" rowspan="2" class="md-tl">생성일</th>
                        <th scope="col" colspan="2" class="md-tl">생성 내역</th>
                        <th scope="col" rowspan="2" class="md-tl">내용</th>
                        <th scope="col" rowspan="2" class="md-tl">비고</th>
                    </tr>
                    <tr>
                        <th scope="col" class="ts">발생</th>
                        <th scope="col" class="ts">최종</th>
                    </tr>
                </thead>
                <tbody id="md2_createLeaveList">
                    <!-- 휴가 획득 리스트 -->
                    
                    
                </tbody>
            </table>
        </div>
        <!-- 사용내역 -->
        <div id="show-used-history">
            <table class="md-tbl">
                <h4 style="font-weight:normal;" id="md2-1_leaveCreateRecord">휴가 생성내역(<span>2019-12-28</span>~<span>2020-12-28</span>)</h4>
	            <h5 style="font-weight:normal;" id="md2-1_enrollDate">입사일 : (<span>1992-12-28</span>)</h5>
	            <h5 style="font-weight:normal;" id="md2-1_memName">사원명 : (<span>ID</span>)</h5>
	            <h5 style="font-weight:normal;" id="md2-1_memNo"></h5>
				<h5 style="font-weight:normal;" id="md2-1_simpleStatistics">당해 간략 통계 : 연차() 포상() 교육() 경조사() 병가() 출산() 무급()</h5>
                <table class="md-l-table" id="md-used-tbl">
                    <thead style="background: #e8ecee;">
                        <tr>
                            <th scope="col" rowspan="2" class="md-tr">번호</th>
                            <th scope="col" rowspan="2" class="md-tr">신청자</th>
                            <th scope="col" rowspan="2" class="md-tr">휴가 종류</th>
                            <th scope="col" rowspan="2" class="md-tr">일수</th>
                            <th scope="col" rowspan="2" class="md-tr">기간</th>
                            <th scope="col" rowspan="2" class="md-tr">상태</th>
                        </tr>
                    </thead>
                    <tbody id="md2_usedLeaveHistory">
                        <tr>
                            <td class="md-ta">1</td>
                            <td class="md-ta">Shin</td>
                            <td class="md-ta">3</td>
                            <td class="md-ta">연차</td>
                            <td class="md-ta">2020-09-16 ~ 2020-09-18</td>
                            <td class="md-ta">결재완료</td>
                        </tr>
                    </tbody>
                </table>
            </table>
        </div>
        <div style="text-align: center; margin-top: 30px;">
			<input type="button" class="md-btn cursor md-btn-close" value="닫기">
		</div>
		<a class="modal-close-btn cursor md-btn-close">X</a>
    </div>
    <!-- 3번째 modal-pick-em -->
    <div id="my_modal-3" class="modal-dragscroll">
        <h4 style="color: #477A8F; margin-bottom: 30px;">포상휴가 대상자 설정</h4>
        <form action="">
            <div class="md-search-reward-pick">
                <dl>
                    <dt style="width: 100px; float: left;">입사일</dt>
                    <dd>
                        <input type="date" name="" id="sDate">
                        ~
                        <input type="date" name="" id="eDate">
                    </dd>
                </dl>
            </div>
            <div class="md-search-reward-pick">
                <dl>
                    <dt style="width: 100px; float: left;">이름 / 부서</dt>
                    <dd>
                        <input type="text" name="" id="md3_inputwords">
                    </dd>
                </dl>
            </div>
            <div class="md-search-btn">
                <input type="button" id="md3_searchBtn" onclick="md3_search()" value="검색" class="md-btn cursor ">
            </div>
        </form>
        <table class="re-l-list">
            <tr class="re-l-list-il">
                <th class="re-l-list-ck-th" ><input type="checkbox" id="md-All-chk"></th>
                <th class="re-l-list-th" >이름</th>
                <th class="re-l-list-th">ID</th>
                <th class="re-l-list-th" >부서</th>
                <th class="re-l-list-th">연차</th>
                <th class="re-l-list-th">포상</th>                
            </tr>
		<tbody id="md3_searchList">
            <!-- 리스트 -->
            
		</tbody>
            
        </table>
		<div style="text-align: center; margin-top: 50px;">
			<input type="button" class="md-btn cursor md-btn-save md-btn-close" onclick="md3_saveBtn()" value="저장">
			<input type="button" class="md-btn cursor md-btn-close" style="margin-left: 50px;" value="닫기">
		</div>

		<a class="modal-close-btn cursor md-btn-close">X</a>
    </div>
</body>
</html>