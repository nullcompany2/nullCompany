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
    <link rel="stylesheet" href="<c:url value="/resources/css/set-diligence-standard.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/css/younsu-subNavi.css"/>">

</head>

<body>
	
    <div id='wrap'>
		<c:import url="../common/header.jsp"/>
		<div class="container">
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
					<span class="ct1">근태 기본 설정</span>
				</div>
				<!-- ---- -->
				<div class="contents-wrap drag-scrollbar">
					<div id="set-diligence-standard" class="c-ic">
						<form action="">
							<table class="set-d-tbl">
								<tbody>
									<tr style="border-bottom: solid 0.1px #477A8F ;">
										<th scope="row" style="background: #e8ecee;padding: 10px;">기본 근태</th>
										<td style="padding: 10px; float: left;">
											<span>출근일 및 출퇴근 시간 설정</span>
										</td>
									</tr>
									<tr>
										<th scope="row" style="background: #e8ecee; padding: 10px;" ></th>
										<td >
											<div class="set-d set-d-1">
												<input type="checkbox" name="" id="mon" checked><label for="mon">월</label>
												<input type="checkbox" name="" id="tue" checked><label for="tue">화</label>
												<input type="checkbox" name="" id="web" checked><label for="web">수</label>
												<input type="checkbox" name="" id="thu" checked><label for="thu">목</label>
												<input type="checkbox" name="" id="fri" checked><label for="fri">금</label>
												<input type="checkbox" name="" id="sat"><label for="sat">토</label>
												<input type="checkbox" name="" id="sun"><label for="sun">일</label>
											</div>
											<div class="set-d set-d-2">
												<div class="sw-time">
													출근
													<input type="time" name="" id="">
													시
												</div>
												<div class="dw-time">
													퇴근
													<input type="time" name="" id="">
													시
												</div>
											</div>
											<div style=" border-top: solid 0.1px #477A8F;" class="set-d set-d-3">
												<input type="checkbox" name="" id="" checked> 퇴근 체크 여부
											</div>                                               
										</td>                                    
									</tr>
								</tbody>
							</table>
							
							<div>
								<input type="button" value="저장하기" class="save-btn cursor">
							</div>
						</form>
					</div>
				</div>
				
			</div>
		</div>
		
	</div>
</body>
</html>