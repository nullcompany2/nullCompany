<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="com.kh.nullcompany.member.model.vo.Member"%>
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
body {
	font-family: "Noto Sans KR", sans-serif;
	padding: 0px;
	margin: 0px;
}

.container {
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

.drag-scrollbar {
	overflow: auto;
	height: 600px;
}

.H-personnel-subNavi {
	margin-left: 15px;
	margin-right: 15px;
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

.title {
	font-size: 16px;
	font-weight: bold;
	margin-right: 50px;
}

.subTitle {
	list-style: none;
}
/* contents */
.contents {
	position: relative;
	margin-left: 250px;
}

.contents-title {
	padding-top: 10px;
	height: 50px;
	border-bottom: solid 0.1px #cacaca;
}

.ct1 {
	margin-left: 50px;
	font-size: 20px;
	font-weight: bolder;
}

.del {
	opacity: 0%;
}

.del:hover {
	opacity: 100%;
}

a:active {
	font-weight: bolder;
}
</style>
<body>
	<br>
	<!-- 세부 네비 시작 -->
	<div class="container">
		<h2 style="text-align: center;">예약</h2>
		<div class="H-personnel-subNavi underline">
		</div>
		<div class="drag-scrollbar">
			<div class="H-personnel-subNavi underline">
				<div class="H-personnel-subNavi Depth01-1">
					<li class="subTitle" ><a href="myReservation.do?rMember=${loginUser.id}">나의 예약 목록</a></li>
					<li id="sub">
					</li>
				</div>
			</div>
			<c:if test="${loginUser.deptNo == 5}">
			<div class="H-personnel-subNavi Depth01-1"
				style="border-top: 1px solid black;">
				<h2 style="text-align: center;">예약 관리</h2>
				<div class="H-personnel-subNavi Depth01-1" >
					<li class="subTitle"><a href="reservationList.do">예약 현황</a></li>
					<li class="subTitle"><a href="categoryList.do">카테고리 관리</a></li>
					<li class="subTitle"><a href="resourceList.do">자원 관리</a></li>
				</div>
			</div>
			</c:if>
		</div>
	</div>
	
	<script>
	  $(function() {
		$.ajax({
			url:"subNavi2.do",
			type:"post",
			success:function(data){
				$div =$("#sub");
 				var add;
				for(var i in data){
				$add = $('<li class="subTitle" id="sub"><a href="reservation.do?rcNo='+data[i].rcNo+'">'+data[i].rcTitle+'</a></li>');
				$div.append($add);
				}
				
			},error : function() {
				console.log("전송실패");
			} 
		})
	});
	</script>
</body>
</html>