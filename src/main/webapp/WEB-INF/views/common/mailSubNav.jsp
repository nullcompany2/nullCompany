<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
	
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
	
	.H-personnel-subNavi2{
		margin-left: 15px;
		margin-right: 15px;
	}
	
	.H-personnel-subNavi2 Depth01-1 li{
		list-style: none;
		margin-bottom: 10px;
		font-size : 18px;
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
}
	
</style>
</head>

<body>
		<br>
		<!-- 세부 네비 시작 -->
		<div class="container2" >
			<h2  id="mailTitle"style="text-align: center; padding-top:20px; padding-bottom:10px;">Mail </h2>
			<div class="H-personnel-subNavi2 underline">		
					<div>
						<button style="border: none; border-radius: 3px; background:#477A8F; font-size: 20px; width: 198px; height: 50px; margin-left: 9px;">
							 <a style="color:white;" href="mailWrite.do"> 메일 쓰기 </a>
						</button>
					</div>
					<br>
			</div>
			<div class="drag-scrollbar2">
				<div class="H-personnel-subNavi2 underline" >
					<div class="H-personnel-subNavi2 Depth01-1">
						<li class="subTitle">
							<a href="recieveMail.do">받은 편지함 </a>
						</li>
						<li class="subTitle">
							<a href="sendMailList.do">보낸 편지함</a>
						</li>
						<li class="subTitle">
							<a href="saveMailList.do">임시 보관함</a>
						</li>
						<li class="subTitle">
							<a class="bin" href="RecieveMailbinList.do">휴지통 </a>
							<a id="gobin" href="#"><span class="del" style="color: red; font-size: 13px; margin-left:65px;">비우기</span></a>
						</li>
					</div>
				</div>
			</div>
		</div>
		<!-- 세부 네비 끝 -->
		
		<script>
		$("#gobin").click(function(){
			confirm("완전 삭제하시면 복구 할 수 없습니다. 정말로 삭제하시겠습니까?");
		});
		
		</script>

</body>
</html>