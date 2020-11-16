<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<c:import url="../common/header.jsp"/>
<c:import url="../common/mailSubNav.jsp"/>

<title> 전송 완료  </title>


	<style>
	
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
	
	#tb {
		border-top : 1px solid  #C8CACC;
		border-bottom : 1px solid #C8CACC;
		
	}
	
	th {
		background : #C8CACC;
		text-align : left;
		padding-left : 30px;
	}
	
	td {
		padding-left : 30px;
	}

</style>

</head>
<body>
    <div id='wrap'>
        <div class="contents">
            <div class="contents-title">
                <span class="ct1">메일 전송 실패 </span>
			</div>
			<div>
<div style="width: 90%; margin: auto;">
	<br>
	메일 주소가 유효하지 않아 메일 전송에 실패했습니다. 
	 <br><br>
	
	 <br><br>
	 <a href="recieveMail.do"> 메일 홈으로 가기  </a>
	 
</div>
</div>
</div>
</div>

</body>
</html>