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
	href="<c:url value="/resources/css/info_organization.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/younsu-subNavi.css"/>">


</head>
<c:set var="codenum" value= '-1'/>

<body>

	<div id='wrap'>
		<c:import url="../common/header.jsp" />

		<div class="container">
			<!-- 전체높이지정용 -->
			<div id="drag-wrap">
				<div id="drag"></div>
			</div>
			<!-- 세부 네비 시작 -->
			<c:import url="../common/personnelSubNavi.jsp" />
			<!-- 세부 네비끝 -->

			<!-- 내부 컨텐츠 -->
			<div class="contents">
				<!-- 컨텐츠 타이틀명 -->
				<div class="contents-title">
					<span class="ct1">조직도</span>
				</div>
				<!-- ---- -->
				<div class="contents-wrap drag-scrollbar">
					<div class="listbox" style="position: fixed">
						<table>
							<li>
								<div class="H-personnel-organization cursor AllM" id="-1"
									onclick="choiceDept(-1)"  name="DL">
									<label class="cursor">전체사원 </label>
								</div>
							</li>
							<c:forEach var="dept" items="${ deptList }" begin="1">
								<li>
									<div class="H-personnel-organization cursor"
										id=${ dept.deptNo } onclick="choiceDept(${dept.deptNo})" name="DL">
										<label class="cursor" style="margin-left: 10px">${ dept.deptName }</label>
									</div>
								</li>
							</c:forEach>
						</table>
					</div>

					<div class="ic" style="position: absolute; left: 200px;">
						<form action="organization.do" 
							  style="float: right; margin-right: 300px; margin-top: 20px;"
							  method="post">
							<input type="text" name="searchText" id="searchMember" class="search-emp">
							<button class="search-btn cursor" id="searchBtn">검색</button>
						</form>
						<table id="memList_tbl">
							<c:forEach var="dept" items="${ deptList }" varStatus="deptN" begin="1">
							<tr name="${deptN.index }">
								<c:if test="${deptN.index == codenum || codenum == '-1'}">
								<th>
									<div class="ic-title" style="padding-top: 30px" >
										<label class="H-personnel-organization">${ dept.deptName }</label>
									</div>
								</th>
								<tr  name="${deptN.index }">
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
	<script>
		 function choiceDept(dNum){
			 codeNum = dNum;
			 
			 if(codeNum == -1){
				 location.href="organization.do";
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
		var mdMemNo;
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

			modal.css({
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
		//모달창 띄우기
		function forModal(md_memNo){
			mdMemNo = md_memNo;
			console.log(mdMemNo);
			modal('my_modal');
			
			
			
			detailMemberInfo();
		}
		
		function detailMemberInfo(){
			$.ajax({
				url : "detailMemberInfo.do",
				data : {memNo : mdMemNo},
				dataType: "json",
				success : function(data){
					
					$("#md_memNo").html(data.memNo);
					$("#md_name").html(data.name);
					$("#md_birth").html(data.birth);
					$("#md_personalemail").html(data.email);
					$("#md_enrollDate").html(data.enrollDate);
					$("#md_phone").html(data.phone);
					$("#md_address").html(data.address);
					$("#md_rankName").html(data.rankName);
					$("#md_deptName").html(data.deptName);
					$("#md_myInfo").html(data.myInfo);
					
					$("#md_photo").attr('src',data.photo);
				},
				error: function(request,status,error){
					console.log(request);
					console.log(status);
					console.log(error);
				}
			})
		}
		
	</script>
	<style>
#my_modal {
	display: none;
	width: 450px;
	height: 600px;
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

.n-emp-i {
	width: 100%;
	height: 30%;
}

.modal-dragscroll>div>dl>dd {
	margin-bottom: 15px;
}

.modal-dragscroll {
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
</style>
	<!-- Modal div -->
	<div id="my_modal" class="modal-dragscroll">
		<h4 style="color: #477A8F; margin-bottom: 5px;">사원 정보</h4>
		<div class="n-emp-i">
			<div style="float: left;">
				<img src="" alt="" style="width: 120px; height: 120px; border-radius:60px" id="md_photo">
			</div>
			<div style="margin-left: 150px">
				<li>사원명<span class="emp-info" id="md_name">-</span></li> <br>
				<li>부서<span class="emp-info" id="md_deptName">-</span></li> <br>
				<li>직급<span class="emp-info" id="md_rankName">-</span></li>
			</div>
		</div>
		<div style="word-break: break-all;">
			<dl>
				<dt style="float: left;">휴대전화</dt>
				<dd style="margin-left: 150px;" id="md_phone">-</dd>
				<dt style="float: left;">이메일</dt>
				<dd style="margin-left: 150px;" id="md_email">${loginUser.id }@nullcompany.com</dd>
				<dt style="float: left;">입사일</dt>
				<dd style="margin-left: 150px;" id="md_enrollDate">-</dd>
				<dt style="float: left;">사번</dt>
				<dd style="margin-left: 150px;" id="md_memNo">-</dd>
				<dt style="float: left;">개인이메일</dt>
				<dd style="margin-left: 150px;" id="md_personalemail">-</dd>
				<dt style="float: left;">생년월일</dt>
				<dd style="margin-left: 150px;" id="md_birth">-</dd>
				<dt style="float: left;">주소</dt>
				<dd style="margin-left: 150px;" id="md_address">-</dd>
				<dt style="float: left;">기타 정보</dt>
				<dd style="margin-left: 150px;" id="md_myInfo">-</dd>
			</dl>

		</div>

		<a class="modal-close-btn cursor">X</a>
	</div>

</body>
</html>