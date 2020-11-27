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
    <link rel="stylesheet" href="<c:url value="/resources/css/office-setting-logo.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/css/office-subNavi.css"/>">

</head>

<body>
	
    <div id='wrap'>
		<c:import url="../common/header.jsp"/>
		
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
				<div class="contents-title underline">
					<h4>로고 설정</h4>
				</div>
				<!-- ---- -->
				<div class="contents-wrap drag-scrollbar c-ic">
					<div id="logo-explain">
						<h5>회사 로고를 등록하면, 로그인 페이지와 사용자 화면에 동시에 적용됩니다.</h5>
					</div>

					<div >
						<table id="ch-tbl">
							<tr class="underline" style="border-top: 0.1px solid;">
								<th class="ch-tbl-cate">로고변경</th>
								<td class="ch-tbl-c">
									<input type="radio" name="s-btn" id="logo-p" value="1" checked><label for="logo-p">기본로고</label>
									<input type="radio" name="s-btn" id="logo-n" value="2"><label for="logo-n">로고변경</label>
								</td>
							</tr>
							<tr class="underline">
								<th class="ch-tbl-cate">현재이미지</th>
								<td  class="ch-tbl-c">
									이미지경로
								</td>
							</tr>
							<form method="post" action="logoUpload.do" enctype="multipart/form-data"> 
							<tr id="up-file" class="underline">
								<th class="ch-tbl-cate" rowspan="2">파일올리기</th>
								<td  class="ch-tbl-c">
									<input type="file" name="logoFile" id="InputLogo">
									<div id="warning">
										500KB 미만의 JPG,GIF,PNG,SWF(플래시) 형식만 등록 가능합니다. <br>

										새로운 이미지를 등록하면, 기존에 저장되어 있던 이미지는 자동 삭제됩니다. <br>

										최적 사이즈 280*61px로 이미지를 업로드하시면, 로그인 페이지(280*61)와 오피스 상단 로고(140*30.5) 사이즈로 자동 적용됩니다. <br>

										또한, 기타 사이즈로 업로드한 경우에도 업로드하신 이미지의 비율에 맞게 축소되어 각 영역에 자동 적용됩니다.
									</div>
								</td>
							</tr>
							<tr id="upBtn"> 
								<td>
								<button type="submit" id="logoBtn"> 등록하기 </button>
								</td>
							</tr>
							</form>
							<script>
								$(function(){
									$('input[type=radio][name=s-btn]').click(function(){
										var chkLogo = $('input[type=radio][name=s-btn]:checked').val();
										if(chkLogo=='1'){
											$("#up-file").css('visibility','hidden');
											$("#upBtn").css('visibility','hidden');
										}else if(chkLogo =='2'){
											$("#up-file").css('visibility','visible');
											$("#upBtn").css('visibility','visible');
										}
					
									})
								})
							</script>
						</table>
					</div>
				</div>
				
			</div>
		</div>

		
    </div>
   
		
    
</body>
</html>