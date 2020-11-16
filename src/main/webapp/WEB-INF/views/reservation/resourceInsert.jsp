<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자원 추가</title>
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
    $(function () {
      $("#menu").click(function () {
        $("#menuToggle").toggle();
      });
    });


    // 인포용 토글
    $(function () {
      $("#infoToggle").hide();
      $("#infobtn").click(function () {
        $("#infoToggle").toggle();
      });
    });


  </script>
<body>

	<div class="contents">
		<div class="contents-title">
			<span class="ct1">자원 추가하기</span>
		</div>
		<form action="resourceInsert.do" method="POST">
		<input type="hidden" name ="rcNo" id ="rcNo" value="${ rcNo }">
			<ul>
				<li>
					<p>자원 이름</p> <input type="text" name="rsTitle" id="rsTitle"> <br>
				</li>
				<li>
					<p>자원 설명</p> <textarea name="rsContent" id="rsContent" cols="50" rows="10"
						style="resize: none;"></textarea>
				</li>
				<li>
					<p>사진</p> <input type="file" name="rsImg" id="rsImg">
				</li>
				<li>
					<p>반납여부</p> <input type="radio" name="return" value="Y"> 반납
					필요 &nbsp; <input type="radio" name="return" value="N"> 반납
					불필요
				</li>
				<input type="hidden" id="rsReturn" name="rsReturn" value=""/>
			</ul>
			<button id="submit"
				style="background: #fff; color: #2c86dc; padding: 5px 27px 6px; border: 1px solid #c8c8c8">저
				장</button>
		</form>
		
		<script>
		$("#submit").click(function(){
			var rsTitle = $("#rsTitle").val();
			var rsContent = $("#rsContent").val();
 		 if(rsTitle.length < 1){
			 alert('자원이름을 입력해주세요.');
			 return false;
		 } 
 		 if($('input[name="return"]:checked').val() !== "Y" && $('input[name="return"]:checked').val() !=="N"){
			 alert('반납여부를 선택해 주세요.');
			 return false;
		 }
 		 if(rsContent.length<1){
			 alert('자원설명을 입력해주세요.');
			 return false;
 		 }
		var r = $('input[name="return"]:checked').val();
		$('#rsReturn').val(r);
		});
		</script>
	</div>
</body>
</html>