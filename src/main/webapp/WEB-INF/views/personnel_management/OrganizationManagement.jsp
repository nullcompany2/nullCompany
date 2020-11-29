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
	<link rel="stylesheet" href="<c:url value="/resources/css/info_organization.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/p_organization.css"/>">

</head>
<style>
.deptlist {
	border-bottom: solid 0.1px #cacaca;
	height: 27px;
}

dd {
    display: block;
    margin-inline-start: 40px;
    margin-bottom: 13px;
    font-size: 14px;
    margin-left: 130px;
    color: #676767;
</style>


<c:set var="codenum" value= '-1'/>
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
			$("#md_rankName").html(data.rankName);
			$("#selectDept").val(data.deptNo).attr("selected","selected");
			console.log(data.deptNo);
			$("#md_myInfo").html(data.myInfo);
			$("#md_indiemail").html(data.email);
			
			
	
			$("#md_photo").attr('src',data.photo);

		
		},error: function(request,status,error){
			console.log(request);
		
		}

		})
	};
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
			<div class="contents">
				<!-- 컨텐츠 타이틀명 -->
				<div class="contents-title">
					<span class="ct1">조직 관리</span>
					
						<form action=""
						style="float: right; position: absolute; right: 100px; top: 10px;">
						<select name="search"
							style="border-radius: 8px; border: #676767 solid 1px; margin-right: 3px;">
							<option value="이름">이름</option>
							<option value="부서">부서</option>
						</select> <input type="text" name="" id="" class="search-emp"
							placeholder="&nbsp; 이름, 부서 검색"
							style="border-radius: 8px; border: #676767 solid 1px;">&nbsp;&nbsp;
						<button class="search-btn cursor"
							style="border: none; background: none;">검색</button>
					</form>
					
				</div>
				<!-- ---- -->
				<div class="contents-wrap drag-scrollbar">
				<div>
                     <button id="dept_add">부서 추가</button>&nbsp;&nbsp;&nbsp;     
                  </div>
					<div class="listbox" style="position: fixed">
						<table>
							<li>
								<div class="deptlist cursor AllM" id="-1"
									onclick="choiceDept(-1)"  name="DL">
									<label class="cursor">전체사원 </label>
								</div>
							</li>
							<c:forEach var="dept" items="${ deptList }" begin="1">
								<li>
									<div class="deptlist cursor"
										id=${ dept.deptNo } onclick="choiceDept(${dept.deptNo})" name="DL">
										<label class="cursor" style="margin-left: 10px">${ dept.deptName }</label>
									</div>
								</li>
							</c:forEach>
						</table>
					</div>
					
				

					<div class="ic" style="position: absolute; left: 200px;">
					
						<table id="memList_tbl">
							<c:forEach var="dept" items="${ deptList }" varStatus="deptN" begin="1">
							<tr name="${dept.deptNo}">
								<c:if test="${deptN.index == codenum || codenum == '-1'}">
								<th>
									<div class="ic-title" style="padding-top: 30px" >
										<label class="H-personnel-organization" id="${ dept.deptName }">${ dept.deptName }</label>
										<button id="${ dept.deptName }" class="dept_delete">부서 삭제</button>
									</div>
								</th>
								<tr name="${dept.deptNo}">
									<c:set var="i" value="0" />
									<c:set var="j" value="5" />
									<c:forEach var="mlist" items="${ mList }" varStatus="vst">
										<c:if test="${dept.deptNo eq mlist.deptNo}">
											<c:if test="${i == j }">
												<tr name="${deptN.index }">
												<c:set var="i" value="0" />
											</c:if>
											<td>
												<div class=" ic-emp-info cursor" onclick="forModal(${mlist.memNo})">
													<img src="${ mlist.photo }" alt="" class="emp-img" style="border-radius:50px">
													<div style="width: 180px;">
														<span class="emp-info" id="mName">${ mlist.name }</span><br> 
														<span class="emp-info">${ mlist.deptName }</span><br> 
														<span class="emp-info">${ mlist.rankName }</span>
													</div>
												</div>
											</td>
											
											<c:set var="i" value="${i+1}" />
										</c:if>
									</c:forEach>
								</tr>
								</c:if>
							</tr>
							</c:forEach>
						</table>
					</div>

				</div>

			</div>
		</div>
		
	</div>

	<!-- 수정 모달 -->
	<div id="edit_dept_modal" class="modal-dragscroll">
		<h4 style="color: #477A8F;
    margin-left: -25px;
    margin-top: -7px;
    margin-bottom: 11px;">부서 수정</h4>
		
		<span id="dept_name_edit" style="    margin-bottom: 5px;
    font-size: 15px;
    font-weight: bold;">dd</span>
		<span style="color: #707070; margin-bottom: 5px; font-size: 14px;">부서를</span>
		<input style="margin-top: 5px;"
		id="editdeptnameInput" type="text" autofocus />
		
		<p style="color: #707070;
    margin-top: 5px;
    font-size: 14px;">위와 같이 변경하시겠습니까?</p>

		<div style="text-align: center; margin-top: 25px;">
			<button id="edit_dept_btn"
				style="background: #fff; color: #2c86dc; padding: 5px 27px 6px; border: 1px solid #c8c8c8">수정</button>
			<button class="modal-close-btn cursor" 
				style="padding: 5px 27px 6px; color: #444; letter-spacing: -1px; border: 1px solid #dadada; background: #dadada;">취소</button>
		</div>

		<a style="	position: absolute;
	top: 10px;
	right: 10px;" class="modal-close-btn cursor">X</a>
	</div>


	<!-- 추가 모달 -->
	<div id="add_dept_modal" class="modal-dragscroll">

		<h4 style="color: #477A8F;
    margin-left: -25px;
    margin-top: -7px;
    margin-bottom: 11px;">부서 추가</h4>
		

		<input style="margin-top: 5px;" id="adddeptnameInput" type="text" placeholder="부서명을 입력해주세요" />
		
		<p style="color: #707070;
    margin-top: 5px;
    font-size: 14px;">입력한 부서를 추가하시겠습니까?</p>

		<div style="text-align: center; margin-top: 20px;">
			<button id="add_dept_btn"
				style="background: #fff; color: #2c86dc; padding: 5px 27px 6px; border: 1px solid #c8c8c8">추가</button>
			<button class="modal-close-btn cursor" 
				style="padding: 5px 27px 6px; color: #444; letter-spacing: -1px; border: 1px solid #dadada; background: #dadada;">취소</button>
		</div>
	
		<a style="position: absolute;
	top: 10px;
	right: 10px;" class="modal-close-btn cursor">X</a>
	</div>
	
	<!-- 삭제 모달 -->
	<div id="delete_dept_modal" style="	width: 421px; height: 385px" class="modal-dragscroll">
	<h4 style="color: #477A8F;
    margin-left: -25px;
    margin-top: -7px;
    margin-bottom: 11px;">부서 삭제</h4>
		<div style="margin-bottom: 20px;"><span id="dept_name_delete" style="    margin-bottom: 5px;
    font-size: 15px;
    font-weight: bold;">dd</span>
		<span style="color: #707070; margin-bottom: 5px; font-size: 14px;">부서에 소속되어 있는 사용자</span></div>
		
			
			<ul id="dept_mem">
 			
			</ul>
			<table  style=" width: 100%; border-collapse: collapse;" id="md_page_tbl">
	            
			</table>
		
	<div style="margin-top:20px">
		<span style="color: #707070;
		    margin-top: 5px;
		    font-size: 14px;">이와 같이 변경하고</span>
    	<span id="dept_name_delete2" style="    margin-bottom: 5px;
		    font-size: 15px;
		    font-weight: bold;">dd</span>
   		<span style="color: #707070;
		    margin-top: 5px;
		    font-size: 14px;">부서를 삭제하시겠습니까?</span>
    </div>
    

		<div style="text-align: center; margin-top: 25px;">
			<button id="edit_dept_btn"
				style="background: #fff; color: #2c86dc; padding: 5px 27px 6px; border: 1px solid #c8c8c8">수정</button>
			<button class="modal-close-btn cursor" 
				style="padding: 5px 27px 6px; color: #444; letter-spacing: -1px; border: 1px solid #dadada; background: #dadada;">취소</button>
		</div>

		<a style="	position: absolute;
	top: 10px;
	right: 10px;" class="modal-close-btn cursor">X</a>
	</div>
	
	<script>
		 function choiceDept(dNum){
			 codeNum = dNum;
			 
			 if(codeNum == -1){
				 location.href="OrganizationManagement.do";
				 $("#memList_tbl tr").attr("style","display:block");
			 }else{
				 $("#memList_tbl tr").attr("style","display:none");
				 $('div[name ="DL"]').attr("style","background:white");
				 $('tr[name ='+codeNum+']').attr("style","display:block");
				 $('div[id ='+codeNum+']').attr("style","background:#e8ecee");
			 }
		 }
		 
		 
		
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
	
		// 부서 추가모달
		$('#dept_add').on('click', function() {
			modal('add_dept_modal');
			 $("#adddeptnameInput").focus();
		});
		
		

		// 삭제 모달
		$('.dept_delete').on('click', function() {
			var deptName = $(this).attr("id");
			$("#dept_name_delete").text(deptName);
			$("#dept_name_delete2").text(deptName);
		
			mdListPaged();
			
			modal('delete_dept_modal');
		
		});
		
		function mdListPaged(currentPage){
			var deptName = $("#dept_name_delete").text();
			
			 $.ajax({
		            url: "deptTypeMemlist.do",
		            datatype : "json",
		            data: {"deptName" : deptName,
		            	currentPage:currentPage},
		            success : function(data){
		               console.log("성공");
		               $("#dListPaging").remove();
		               $('.dept_memList').remove();
		               
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
		            	
		            	var li;
		            	var name;
		            	var liend;
		            	var select;
		            	var selectend;
		            	
		            	var $dept_mem = $("#dept_mem");
		            	
		            	for(var i in data.mlist){
		            		
		            		console.log(data.mlist[i]);
		            		$li = $("<li style='width:230px; margin-bottom: 5px;font-size: 15px;'  class='dept_memList' id='li" + data.mlist[i].memNo +"'>");
		            		$name = data.mlist[i].name;
		            		$liend = $("</li>");
		            		$select = $("<select style='float:right; width:100px; margin-right:20px' class='dept_list_select' id='" + data.mlist[i].memNo +"' >");
		            		$selectend = $("</select>");
		            		$li.append($name);
							$li.append($select);
							$li.append($selectend);
							$li.append($liend);
							$dept_mem.append($li);
								
		            	
		            	}
		            	
		            	for(var i in data.deptListmodal){      
		            		if(data.deptListmodal[i].deptName != deptName){
		            			var option = $("<option value="+ data.deptListmodal[i].deptNo+">"+data.deptListmodal[i].deptName +"</option>");
			                    $('.dept_list_select').append(option);
		            		
		            		}
		            	
		                    
		                }


		            	$tr = $('<tr align="center" height="20" id="dListPaging">'); 
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
	 
					},
		            error :function(request,status,error){
		               console.log(error);  
		            
		            }
		         });
			
		
		}


		// 수정시 모달
		$('.H-personnel-organization').click(function(){
		    var dept_name = $(this).attr("id");
		    modal('edit_dept_modal');
		    $("#dept_name_edit").text(dept_name);
		    console.log(dept_name);
		    $("#editdeptnameInput").val(dept_name);
		    $("#editdeptnameInput").focus();
		    
		});
		
		 //수정 버튼
		 $('#edit_dept_btn').on('click', function() {
			var deptName = $("#editdeptnameInput").val();
			var deptName2 = $("#dept_name_edit").text();
			
			if(deptName == deptName2){
				alert('수정 전 부서명과 같은 부서명은 사용할 수 없습니다.');
				return false;
				
			} 
		});
		
		 //부서 추가 버튼
		 $('#add_dept_btn').on('click', function() {
			var deptName = $("#adddeptnameInput").val();
		
			if(deptName == ""){
				alert('부서명을 입력해주세요.')
			}
			
			$.ajax({
				url: "deptAdd.do",
				data: {"deptName" : deptName},
				success : function(data){
					alert("추가 성공")
					location.reload();
				},
				error :function(request,status,error){
					console.log(error);  
					location.reload();
				}
			});
			
		});
		 
		 //부서 수정 버튼
		 $('#edit_dept_btn').on('click', function() {
			var text = $("#editdeptnameInput").val();
			var deptName = $("#dept_name_edit").text();
		
			if(text == ""){
				alert('부서명을 입력해주세요.')
			}
			
			$.ajax({
				url: "deptEdit.do",
				data: {"deptName" : deptName,
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
		 
			
		
	</script>

	<!-- Modal div -->
	<div id="info_modal" class="modal-dragscroll">
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
				<li style="margin-bottom: 6px;">직급<span id="md_rankName"
					class="emp-info" style="position: absolute; left: 265px;">-</span></li>

				<li style="margin-bottom: 6px;">부서
				<select name="dept" id="selectDept"
					style="border: none;
					    float: right;
					    width: 110px;
					    position: absolute;
					    right: 67px;
					    font-size: 15px;
					    margin-right: 3px;
					">
						<c:forEach var="deptList" items="${ deptList }" varStatus="vs">
							<option class="selectDept" value="${ deptList.deptNo }">${ deptList.deptName }부</option>
						</c:forEach>

				</select>
				</li>

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
			<button id="accept" onclick="acceptemail();"
				style="background: #fff; color: #2c86dc; padding: 5px 27px 6px; border: 1px solid #c8c8c8">수정</button>
			<button  class="modal-close-btn cursor"
				style="padding: 5px 27px 6px; color: #444; letter-spacing: -1px; border: 1px solid #dadada; background: #dadada;">취소</button>
		</div>

	</div>
	</div>
    
</body>
</html>