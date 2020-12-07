<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet"
	href="<c:url value="/resources/css/set-leave-standard.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/younsu-subNavi.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/p_rankmanage.css"/>">

</head>
<style>
dd {
    display: block;
    margin-inline-start: 40px;
    margin-bottom: 13px;
    font-size: 14px;
    margin-left: 130px;
    color: #676767;
    
 }
 
 #rank_mem li{
 cursor: pointer;
 }
</style>
<body>
<script>
function forModal(md_memNo){
	mdMemNo = md_memNo;
	console.log(mdMemNo);
	modal('info_modal');
	
	
	
	detailMemberInfo();
}

function detailMemberInfo(){
	$.ajax({
		
		url : "detailMemberInfo.do",
		data : {memNo : mdMemNo},
		dataType: "json",
		success : function(data){
			console.log(data);
			$("#md_memNo").html(data.memNo);
			$("#md_name").html(data.name);
			$("#md_birth").html(data.birth);
			$("#md_email").html(data.id + "@nullcompany.com");
			$("#md_enrollDate").html(data.enrollDate);
			$("#md_phone").html(data.phone);
			$("#md_address").html(data.address);
			$("#md_deptName").html(data.deptName);
			$("#selectRank").val(data.lankNo).attr("selected","selected");
			console.log(data.lankNo);
			console.log(data.rankName);
		
			$("#md_myInfo").html(data.myInfo);
			$("#md_indiemail").html(data.email);
			 $("#dept_no").val(data.deptNo);
			
			
	
			$("#md_photo").attr('src',data.photo);

		
		},error: function(request,status,error){
			console.log(request);
		
		}

		})
	};
	
	
	 //사원 인포 수정 버튼

	$(document).on("click", "#edit_info", function(){
		var sel_rank = $("#selectRank option:selected").val();
		var md_memNo = $("#md_memNo").text(); 
		
		$.ajax({
			url:"updateMemRank.do",
			type:"post",
			data:{
           	rankNo : sel_rank,
           	memNo : md_memNo,
			},
			success:function(data){
				console.log(data);
				location.reload();
			},error: function(request,status,error){
				console.log(request);
		}
			})
	
	});
</script>
	<div id='wrap'>
		<c:import url="../common/header.jsp" />

		<div class="container">
			<!-- 전체높이지정용 -->
			<div id="drag-wrap">
				<div id="drag"></div>
			</div>
			<!--  -->
			<!-- 세부 네비 시작 -->
			<c:import url="../common/personnelSubNavi.jsp" />
			<!-- 세부 네비끝 -->

				<!-- 내부 컨텐츠 -->
			<div class="contents" style="width: 2000px; overflow: scroll">
				<div class="contents-title">
					<span class="ct1">직위 관리</span>
					
					<button id="rank_add"> 직위 추가</button>
				</div>
		
				
			
				
				<div id="rank_list_table">
					<div>
						<div style="top: -20px;
						position: relative;">
						
						
						</div>
						
					</div>
					<a style="    color: #676767;
    font-size: 14px;
    cursor: auto;">※ 직위 삭제는 해당 직위인 사용자가 0명 일 때 가능합니다.<br>
    직위 등급은 [직위 추가]버튼으로 총 15개까지 생성할 수 있습니다. <br><br>
    설정한 직위 등급은 전자결재 설정에 적용됩니다.
    </a>
					<table class="tg" style="margin-top: 15px;">
						<thead>
						  <tr>
							<th id="firstth" class="tg-0pky rank">1</th>
							<th id="사장" class="tg-0pky rankname" style="width: 550px;
								border-bottom: #b9b9b9 solid 1px;
								border-top: #b9b9b9 solid 1px;
								border-width: 1px;
								font-size: 14px;
								overflow: hidden;
								padding: 10px 5px;
								word-break: normal;">사장</th>
						  </tr>
						</thead>
						<tbody id="rank_table">

							<c:if test="${!empty rankList}">
								<c:forEach var="rankList" items="${ rankList }" begin="1" varStatus="vs">
								

									<tr>
									
										<td class="tg-0pky rank">${rankList.orderByRank}</td>
									
										<td class="tg-0pky rankname" id="${rankList.rankName}"><span 
										style="cursor:pointer; margin-right: -4%;" class="ranknamespan"  id="${rankList.rankName}">${rankList.rankName}</span>
										<a style="float: right;
									    font-size: 12px;"
									    id="${ rankList.rankName }" class="rank_delete"
									    >삭제</a></td>
										
										
									</tr>
								
								</c:forEach>
							</c:if>

						
						  
						</tbody>
						</table>

					
				</div>
			</div>
	  </div>
				
			</div>
		
		
	</div>
	<!-- Modal -->

	<!-- 추가 모달 -->
	<!-- add modal-->
	<div id="add_rank_modal" class="modal-dragscroll">

		<h4 style="color: #477A8F;
    margin-left: -25px;
    margin-top: -7px;
    margin-bottom: 11px;">직위 추가</h4>
		
		
		<input style="margin-top: 5px;" id="addranknameInput" type="text" placeholder="직위명을 입력해주세요" />
		
		<p style="color: #707070;
    margin-top: 5px;
    font-size: 14px;">입력한 직위를 추가하시겠습니까?</p>

		<div style="text-align: center; margin-top: 20px;">
			<button id="add_rank_btn"
				style="background: #fff; color: #2c86dc; padding: 5px 27px 6px; border: 1px solid #c8c8c8">추가</button>
			<button class="modal-close-btn cursor" 
				style="padding: 5px 27px 6px; color: #444; letter-spacing: -1px; border: 1px solid #dadada; background: #dadada;">취소</button>
		</div>
	
		<a style="position: absolute;
	top: 10px;
	right: 10px;" class="modal-close-btn cursor">X</a>
	</div>
		
	<!-- 수정 모달 -->
	<!-- Modal div -->
	<div id="edit_rank_modal" class="modal-dragscroll">
		<h4 style="color: #477A8F; margin-bottom: 5px; margin-top: 5px;">직위 수정</h4>
		
		
		<div style="margin-left: 35px;">
		<span id="rank_name_edit" style="    margin-bottom: 5px;
		    font-size: 15px;
		    font-weight: bold;">dd</span>
		    <span style="color: #707070; margin-bottom: 5px; font-size: 14px;">직위를</span><br>
		    
		    <input style="margin-top: 5px;"
		   id="editranknameInput" type="text" autofocus />
		
		  <p style="color: #707070;
		    margin-top: 5px;
		    font-size: 14px;">위와 같이 변경하시겠습니까?</p>
		 </div>
	
		
		<div style="text-align: center;margin-top: 15px;" >
		
			<button id="edit_rank_btn" style=" background: #fff; color: #2c86dc; padding: 5px 27px 6px; border: 1px solid #c8c8c8">수정</button>
			
			<button id="" class="modal-close-btn cursor" style="    padding: 5px 27px 6px;
			color: #444; 
			cursor : pointer;
			letter-spacing: -1px;
			border: 1px solid #dadada;
			background: #dadada;">취소</button>

			
<a style="position: absolute;
	top: 10px;
	right: 10px;" class="modal-close-btn cursor">X</a>
		</div>
		</div>
		
		
		<!-- 삭제 모달 -->
	<div id="delete_rank_modal" style="padding: 20px 60px;
	background-color: #fefefe;
	border-radius: 3px;
	z-index: 10201;
	width: 425px;
    height: 435px;" class="modal-dragscroll">
	<h4 style="color: #477A8F;
    margin-left: -25px;
    margin-bottom: 11px;
    margin-top: 11px;">직위 삭제</h4>
		<div style="margin-bottom: 20px;">
			
			<span style="color: #707070; margin-bottom: 5px; font-size: 14px;">현재 </span>
			<span id="rank_name_delete" style="    margin-bottom: 5px;
				    font-size: 15px;
				    font-weight: bold;">dd</span>
			<span style="color: #707070; margin-bottom: 5px; font-size: 14px;"> 직위인 사용자는</span>
			<span id="rank_name_delete_Count" style="    margin-bottom: 5px;
				    font-size: 15px;
				    font-weight: bold;">5</span>
	    	<span style="color: #707070; margin-bottom: 5px; font-size: 14px;">명 입니다. </span><br>
	    				<span style="color: #707070; margin-bottom: 5px; font-size: 14px;">아래에 보이는 사용자의 직위를 변경해주세요.</span><br>
		</div>
	
			<input id="rank_no" type="hidden"/> 
			<ul id="rank_mem" style="margin-left: 60px;">
 			
			</ul>
			<table  style=" width: 100%; border-collapse: collapse;" id="md_page_tbl2">
	            
			</table>
		
	<div style="margin-top:20px">
		<span style="color: #707070;
		    margin-top: 5px;
		    font-size: 14px;">위와 같이 변경하고</span>
    	<span id="rank_name_delete2" style="    margin-bottom: 5px;
		    font-size: 15px;
		    font-weight: bold;">dd</span>
   		<span style="color: #707070;
		    margin-top: 5px;
		    font-size: 14px;">부서를 삭제하시겠습니까?</span>
    </div>
    

		<div style="text-align: center; margin-top: 25px;">
			<button id="delete_rank_btn"
				style="background: #fff; color: #2c86dc; padding: 5px 27px 6px; border: 1px solid #c8c8c8">삭제</button>
			<button class="modal-close-btn cursor" 
				style="padding: 5px 27px 6px; color: #444; letter-spacing: -1px; border: 1px solid #dadada; background: #dadada;">취소</button>
		</div>

		<a style="	position: absolute;
	top: 10px;
	right: 10px;" class="modal-close-btn cursor">X</a>
	</div>
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
				.find('.modal-close-btn')
				.on('click', function() {
					bg.remove();
					modal.hide();
				});
		}

		function modal2(id) {
			var zIndex = 9999;
			var modal = $('#' + id);

	

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
				.find('.modal-close-btn')
				.on('click', function() {
					
					modal.hide();
				});
		}

		// 수정 모달
		$('.ranknamespan').on('click', function() {
		    var rank_name = $(this).attr("id");
			// 모달창 띄우기
	
			modal('edit_rank_modal');
			
			$("#rank_name_edit").text(rank_name);
			$("#editranknameInput").val(rank_name);
			$("#editranknameInput").focus();
		});
		
		
		 //랭크 수정 버튼
		 $('#edit_rank_btn').on('click', function() {
	
				 
			var text = $("#editranknameInput").val();
			var rankName = $("#rank_name_edit").text();
		
			console.log(text + rankName);
			if(text == ""){
				alert('직위명을 입력해주세요.');
				return false;
			}
			
			if(text == rankName){
				alert('수정 전 직위명과 같은 직위명은 사용할 수 없습니다.');
				return false;
				
			}
			
			$.ajax({
				url: "rankEdit.do",
				data: {"rankName" : rankName,
						"text":text	
					},
				
				success : function(data){
					console.log("수정성공임");  
					location.reload();
				},
				error :function(request,status,error){
					console.log(error);  
					location.reload();
				}
			});
			
		});

		 
		 $('#rank_add').on('click', function() {
				modal('add_rank_modal');
				 $("#addranknameInput").focus();
		 });
			
				
				
		// 추가 모달
		$('#add_rank_btn').on('click', function() {
		
			
			// 모달창 띄우기
			var rankName = $("#addranknameInput").val();
			var trCnt = parseInt($('#rank_table tr').length);
			
			if(rankName == ""){
				alert('부서명을 입력해주세요.')
				return false;
			}
			

			if (trCnt < 14) {
				
				$.ajax({
					url: "rankAdd.do",
					data: {"rankName" : rankName},
					success : function(data){
						location.reload();
					},
					error :function(request,status,error){
						console.log(error);  
						
					}
				});

			} else {
				alert("직위는 최대 15개 까지만 가능합니다.")
				return false;
			}
		});

		
		// 삭제 모달
		$('.rank_delete').on('click', function() {
			var rankName = $(this).attr("id");
			$("#rank_name_delete").text(rankName);
			$("#rank_name_delete2").text(rankName);
		
			mdListPaged();
			
			modal('delete_rank_modal');
		
		});
		
		function mdListPaged(currentPage){
			var rankName = $("#rank_name_delete").text();
			
			 $.ajax({
		            url: "rankTypeMemlist.do",
		            datatype : "json",
		            data: {"rankName" : rankName,
		            	currentPage:currentPage},
		            success : function(data){
		               console.log("성공");
		               $("#rListPaging").remove();
		               $('.rank_memList').remove();
		               $('#rank_mem').empty();
		               $("#rank_name_delete_Count").text(data.listCount);
		            
		               
		               
		               var $pageTbl = $('#md_page_tbl2');
		               
		            	var td0;
		            	var td1;
		            	var td2;
		            	var td3;
		            	var td1_1;
		            	var td1_1_1;
		            	var td2_1;
		            	var td2_1_1;
		            	var td2_2;
		            	
		            	var li;
		            	var name;
		            	var liend;
		            	var select;
		            	var selectend;
		            	
		            	var $rank_mem = $("#rank_mem");
		            	
		            	if(data.mlist.length > 0 ){
		            		for(var i in data.mlist){
			            		
			            		console.log(data.mlist[i]);
			            $li = $("<li style='width:230px; margin-bottom: 5px;font-size: 15px;'  class='rank_memList' onclick='forModal("+ data.mlist[i].memNo +")'>");
			            $name = data.mlist[i].name;
			            $liend = $("</li>");
			            
			            $li.append($name);
						$li.append($liend);
						$rank_mem.append($li);
									
			            	
			            	}
		            		

			            	$tr = $('<tr align="center" height="20" id="rListPaging">'); 
							$td = $('<td colspan="6">');
							if(data.pi.currentPage == 1){
								
								$td0 = "[이전]";
								$td.append($td0);
							}
				        	
							if(data.pi.currentPage != 1){
								$td0 = $('<a onclick="mdListPaged('+ (data.pi.currentPage -1) + ')">').text("[이전] ");
					        	
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
				        		$td0 = $('<a onclick="mdListPaged('+ (data.pi.currentPage + 1)+')">').text(" [다음]");
				        		$td.append($td0);
				        	}
				        	
			            	$tr.append($td);
							
			            	$pageTbl.append($tr);
			            	
		            	}else{
		            		
		            		 $li = $("<li style=' height: 150px; width:230px; margin-bottom: 5px;font-size: 15px;' >");
					            $name = '해당 직위는 삭제가 가능합니다.'
					            $liend = $("</li>");
					            $li.append($name);
								$li.append($liend);
								$rank_mem.append($li);
		            	}

		            	
		            	


	 
					},
		            error :function(request,status,error){
		               console.log(error);  
		            
		            }
		         });
			
		
		}
		
		// 삭제 모달에서 삭제 버튼 클릭 시~!
		$('#delete_rank_btn').on('click', function() {
			var count = $("#rank_name_delete_Count").text();
			var rankName = $("#rank_name_delete").text();
			
			if(count>0){
				alert("해당 직위에 속해 있는 모든 사용자의 직위를 변경해주세요.");
				return false;
			}
			
			$.ajax({
				url:"rankDelete.do",
				type:"post",
				data:{
					rankName : rankName,
				},
				success:function(data){
					console.log(data);
					alert("직위가 삭제 되었습니다.");
					location.reload();
				},error: function(request,status,error){
					console.log(request);
			}
				})
			
			
			  

		});
		
		
	</script>
		
		
	<!-- Modal div -->
	<div id="info_modal" class="modal-dragscroll"
	style="
	display: none;
	width: 450px;
	height: 510px;
	padding: 20px 60px;
	background-color: #fefefe;
	border-radius: 3px;
"
	>
		<h4 style="color: #477A8F; margin-bottom: 20px; font-size: 20px;">사원
			정보</h4>
		<div class="n-emp-i">
			<div style="float: left;">
				<img id="md_photo" src="" alt=""
					style="width: 110px; height: 120px;">
			</div>

		<div style="margin-left: 140px">
				<li style="margin-bottom: 6px;">사원명<span id="md_name"
					class="emp-info" style="position: absolute; left: 265px;">-</span></li>
					
			   <li style="margin-bottom: 6px;">직급
				<select name="rank" id="selectRank"
					style="border: none;
						    float: right;
						    width: 110px;
						    position: absolute;
						    right: 79px;
						    font-size: 15px;
						    margin-right: 2px;
						    margin-top: 4px;
					">
						<c:forEach var="rankList" items="${ rankList }" varStatus="vs">
							<option class="selectRank" value="${ rankList.rankNo }">${ rankList.rankName }</option>
						</c:forEach>

				</select>
				</li>
				<li style="margin-bottom: 6px;">부서<span id="md_deptName"
					class="emp-info" style="position: absolute; left: 265px;">-</span></li>

			

				<li style="margin-bottom: 6px;">사번<span id="md_memNo"
					class="emp-info"
					style="position: absolute; left: 265px; font-size: 14px; margin-top: 3px"><span></li>
			</div>
		<div id="info_dl" style="word-break: break-all; margin-top: 40px">
			<dl style="margin-top: -20px;">
				<dt style="float: left;">휴대전화</dt>
				<dd style="margin-left: 150px;" id="md_phone">010-0000-0000</dd>
				<dt style="float: left;">이메일</dt>
				<dd style="margin-left: 150px;" id="md_email">00000000</dd>
				<dt style="float: left;">입사일</dt>
				<dd style="margin-left: 150px;" id="md_enrollDate">00000000</dd>
				<dt style="float: left;">개인이메일</dt>
				<dd style="margin-left: 150px;" id="md_indiemail">00000000</dd>
				<dt style="float: left;">생년월일</dt>
				<dd style="margin-left: 150px;" id="md_birth">00000000</dd>
				<dt style="float: left;">주소</dt>
				<dd style="margin-left: 150px;" id="md_address">00000000</dd>

			</dl>

		</div>


		<div style="text-align: center; margin-top: 30px;">
			<button id="edit_info"
				style="background: #fff; cursor:pointer; color: #2c86dc; padding: 5px 27px 6px; border: 1px solid #c8c8c8">수정</button>
			<button  class="modal-close-btn cursor"
				style="padding: 5px 27px 6px; color: #444; letter-spacing: -1px; border: 1px solid #dadada; background: #dadada;">취소</button>
		</div>

	</div>
	</div>
	
	



    
</body>
</html>