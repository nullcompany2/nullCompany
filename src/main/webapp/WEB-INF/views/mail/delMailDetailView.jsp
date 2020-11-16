<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<c:import url="../common/header.jsp"/>
<c:import url="../common/mailSubNav.jsp"/>

<title>메일 디테일 뷰</title>

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
	
	
	input[type=button] {
		font-size: 18px;
		margin: 20px 5px 7px 5px;
		background: none;
		border: none;
		color: #477A8F;
		cursor:pointer;
	} 

	input[type=button]:focus,
	li:focus,
	a:focus{
	outline:none;
	}
	
	a:active {
		font-weight: bolder;
	}
	
	.contents-title:first-child {
		padding-left:55px;
	}
	
	#viewmailContent {
		height : 440px;
		background:#FDFDFD;
		overflow:scroll;
		border-bottom: 1px solid #9E9D9B; 
		border-top: 1px solid #9E9D9B;
		padding-top : 20px;
		
	}
	
	#viewTitle {
	font-size : 20px;
	}
	
	#viewdate {
		color:#9E9D9B;
		font-size:15px;
		padding-left : 20px;
	}
	
</style>

</head>
<body>
        <div class="contents">
             <div class="contents-title">
              
              <c:url var="mailReply" value="mailReply.do">
				<c:param name="mailNo" value="${ma.mailNo}" />
			  </c:url>  
              
                <a href="${mailReply}"><input type="button" value="답장"/> </a> 
						<input  id="backMail" type="button" value="복원" /> 
						<input id="realdelMail" type="button" value="완전삭제" />
						<br> 
			</div>
			<div style="width: 90%; margin: auto; margin-top:20px;">
				<span id="viewTitle"> ${ma.mTitle}   </span>	 
				 <span id="viewdate"> ${ma.sendDate} </span> <br>
				
				보낸 사람 : ${ma.name} < ${ma.email} ><br> 
				받는 사람 : ${ma.rName} < ${ma.recipient}@nullcompany.com > <br> 
				<br> 
				
				<div id="viewmailContent"> 

				 <c:if test="${ !empty ma.mFileName }">
				첨부파일 : <a href="${contextPath }/resources/mailuploadFiles/${ma.mFileName}"
							download="${ ma.mFileName }">${ ma.mFileName }</a> <br> <br>
				</c:if> 
				${ma.mContent}
				
				</div>
			</div>
		</div>

	<script>
	
	var test = ${ ma.mailNo };
	
	 $("#backMail").click(function(){
			if (confirm("복원하시겠습니까?") == true){ 

				 document.location.href='backMail.do?mailNo='+ test;

		        }else{   //취소

		            return;
		        }
		});
     
	 $("#realdelMail").click(function(){
     	 if (confirm("완전 삭제하시면 복구 할 수 없습니다. 정말로 삭제하시겠습니까?") == true){ 

			 document.location.href='realDeleteOneMail.do?mailNo='+ test;

	        }else{   //취소

	            return;
	        }
		});

	</script>
</body>
</html>