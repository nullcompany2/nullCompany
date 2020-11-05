<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 추가</title>
<c:import url="../common/header.jsp" />
<c:import url="../common/reservationSubNav.jsp" />
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">
</head>
<style>
form {
	margin: 30px 0px 0px 20px;
}

form p {
	width: 150px;
	float: left;
}
</style>
<script>
	// 메뉴 아이콘용 토글 
	$(function() {
		$("#menu").click(function() {
			$("#menuToggle").toggle();
		});
	});

	// 인포용 토글
	$(function() {
		$("#infoToggle").hide();
		$("#infobtn").click(function() {
			$("#infoToggle").toggle();
		});
	});
</script>

<body>
	<div class="contents">
		<div class="contents-title">
			<span class="ct1">카테고리 추가하기</span>
		</div>
		<form action="categoryInsert.do" method="POST">
			<ul>
				<li>
					<p>카테고리 이름</p> <input type="text" name="rcTitle"> <br>
				</li>
				<li>
					<p>카테고리 설명</p> <textarea name="rcContent" id="" cols="50" rows="10"
						style="resize: none;"></textarea>
				</li>
			</ul>
			<button
				style="background: #fff; color: #2c86dc; padding: 5px 27px 6px; border: 1px solid #c8c8c8">저
				장</button>
		</form>
	</div>
</body>
</html>