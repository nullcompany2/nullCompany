<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">
</head>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Noto Sans KR", sans-serif;
}

.container2 {
	position: relative;
	border-radius: 10px;
	background: #e8ecee;
	color: #676767;
	width: 250px;
	height: 100%;
	font-size: 1.15em;
	float: left;
	border-bottom: none;
	padding-top: 2px;
}

.drag-scrollbar2 {
	overflow: auto;
	height: 600px;
}

.H-personnel-subNavi2 {
	margin-left: 15px;
	margin-right: 15px;
}

.H-personnel-subNavi2 Depth01-1 li {
	list-style: none;
	margin-bottom: 10px;
	font-size: 18px;
}

.container2 a, .container2 a:hover {
	text-decoration: none;
	color: #676767;
}

.del {
	opacity: 0%;
}

.del:hover {
	opacity: 100%;
}

li {
	list-style: none;
	margin-bottom: 10px;
	font-size: 18px;
}

a {
	text-decoration: none;
	color: #676767;
}

.subTitle {
	list-style: none;
	margin-top: 10px;
}

.input-group {
	font-size: 15px;
	width: 180px;
	margin-left: 10px;
	line-height: 30px;
}

.calbtn {
	border: none;
	background-color: none;
	float: right;
	color: #676767;
	outline: none;
}

.calbtn:hover {
	font-weight: bold;
}

.input-group a {
	font-size: 14px;
	position: relative;
	float: right;
	color: #477A8F;
	left: -30px;
}

.input-group input {
	padding-bottom: 5px;
}

.input-group a:hover {
	color: #477A8F;
	font-weight: bold;
}

.input-group {
	cursor: pointer;
}
</style>
</head>

<body>
	<!-- 세부 네비 시작 -->
	<div class="container2" style="">
		<div class="H-personnel-subNavi underline" style="border: none;">
			<h2 id="mailTitle"
				style="text-align: center; padding-top: 20px; padding-bottom: 10px;">일정
				관리</h2>
			<div class="H-personnel-subNavi2 underline" style="border: none;">
				<div>

					<button id="sche_add"
						style="border: none; border-radius: 3px; background: #477A8F; color: white; font-size: 20px; width: 90%; height: 50px; margin-left: 12px;">
						일정 추가</button>
				</div>
			</div>
			<div class="drag-scrollbar2">
				<div class="H-personnel-subNavi2 underline" style="border: none">
					<div class="H-personnel-subNavi2 Depth01-1">

						<li class="subTitle"><label for="calendar_view"
							style="font-weight: bold;">내 캘린더</label>
						<button class="calbtn">만들기</button>
							<br>
							<div class="input-group">
								<!-- <select class="filter" id="type_filter" multiple="multiple"> -->
								<input type="checkbox" name="sche_cate" value="카테고리1">
								집에가요</input><a>수정</a><br> <input type="checkbox" name="sche_cate"
									value="카테고리2"> 집!</input> <a>수정</a><br> <input
									type="checkbox" name="sche_cate" value="카테고리4"> 집!!</input><a>수정</a><br>
								<!-- </select> -->
							</div></li>

						<hr>

						<li class="subTitle"><label for="calendar_view"
							style="font-weight: bold;">공유 캘린더</label>
						<button class="calbtn">만들기</button>
							<br>
							<div class="input-group">
								<!-- <select class="filter" id="type_filter" multiple="multiple"> -->
								<input type="checkbox" name="sche_cate" value="카테고리1">
								ㅇㅇㅇ</input><a>수정</a><br> <input type="checkbox" name="sche_cate"
									value="카테고리2"> ㅁㅁㅁ</input><a>수정</a><br>

								<!-- </select> -->
							</div></li>
					</div>
				</div>
			</div>
		</div>
		<!-- 세부 네비 끝 -->
</body>
</html>