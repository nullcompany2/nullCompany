<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자원 수정</title>
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

<body>

	<div class="contents">
		<div class="contents-title">
			<span class="ct1">자원 수정하기</span>
		</div>
		<form action="resourceUpdate.do" method="POST" enctype="multipart/form-data" >
			<ul>
				<li>
					<p>자원 이름</p> <input type="text" name = "rsTitle" value="${ r.rsTitle }"> <br>
				</li>
				<li>
					<p>자원 설명</p> <textarea name="rsContent" id="" cols="50" rows="10"
						style="resize: none;">${r.rsContent }</textarea>
				</li>
				<li>
					<p>사진</p> <input type="file" name="reloadFile" id="rsImg" >
				</li>
				<li>					
					<c:if test="${ !empty r.originalFileName }">
						현재 업고드한 파일: 
						<a href = "${ contextPath }/resources/reservationFile/${ r.renameFileName }"
						download="${ r.originalFileName }">${ r.originalFileName }</a>
					</c:if>
				</li>
				<li>
				<c:choose>
				 <c:when test="${r.rsReturn eq 'Y'}">
					<p>반납여부</p> <input type="radio" name="return" value="Y" checked>
					반납 필요 &nbsp; <input type="radio" name="return" value="N">
					반납 불필요
				</c:when>
				<c:when test="${r.rsReturn eq 'N'}">
					<p>반납여부</p> <input type="radio" name="return" value="Y">
					반납 필요 &nbsp; <input type="radio" name="return" value="N" checked>
					반납 불필요
				</c:when>
				</c:choose>
				<input type="hidden" id="rsReturn" name="rsReturn" value=""/>
				<input type="hidden" id="rsNo" name="rsNo" value="${r.rsNo }"/>
				<input type="hidden" id="rcNo" name="rcNo" value="${r.rcNo }"/>
				</li>
			</ul>
			<button id = "submit"
				style="background: #fff; color: #2c86dc; padding: 5px 27px 6px; border: 1px solid #c8c8c8">저
				장</button>
		</form>
		
		<script>
		$("#submit").click(function(){
		var r = $('input[name="return"]:checked').val();
		$('#rsReturn').val(r);
		});
		</script>
	</div>
</body>
</html>