<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<c:import url="../common/header.jsp"/>
<c:import url="../common/mailSubNav.jsp"/>


<title>임시저장 완료  </title>


	<style>
	body {
		font-family: "Noto Sans KR", sans-serif;
		padding: 0px; margin: 0px;

	}

	.container{
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
	
	
	
	/* contents */
	.contents{
		position: relative;
		margin-left: 250px;
	}
	.contents-title{
		padding-top: 10px;
		height: 50px;
		border-bottom: solid 0.1px #cacaca;
	}
	.ct1{

		margin-left: 50px;
		font-size: 20px;
		font-weight: bolder ;
	}


	form input[type=button]{
	
	font-size : 18px;
	margin: 7px 5px 7px 5px;
	background: none;
	border :none;
	color :#477A8F;
	
	}
	
	form>input[type=text] {
	margin: 5px 0px 5px 0px;
	border:none;
	background:#F3F3F3;
	height : 30px;
	}
	
	form input[type=button]:focus,
	form>input[type=text]:focus,
	li:focus,
	a:focus{
	outline:none;
	}
	
	a:active {
		font-weight: bolder;
	}
	
	

</style>

</head>
<body>

   
    <div id='wrap'>

		
        <div class="contents">
            <div class="contents-title">
                <span class="ct1">저장하기 </span>
			</div>
			
			<div>
<div style="width: 90%; margin: auto;">
	<br>
	 메일이 임시보관함에 저장되었습니다.
	 <br><br>
	 <a href="saveMailList.do"> 임시보관함으로 가기 </a>
	 
</div>
</div>
</div>
</div>

</body>
</html>