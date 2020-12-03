<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<c:import url="../common/header.jsp"/>

<title>받은 편지함 </title>

	</head>
	
	<style>
	body {
		padding: 0px; margin: 0px;
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

	
	a:active {
		font-weight: bolder;
	}

	#category {
		border : none;
		padding : 3px;
		font-size : 15px;
		margin-bottom : 5px;
		left:750px;
		
	}
	
	#search {
		
		border: 1px solid #3E4247;
		border-radius : 3px;
		padding : 3px;
		font-size : 15px;
		left:860px;				
	
	}
	
	#category,#search,#searchBtn{
	position : absolute;
	}
	
	#searchBtn {
	
	background:#477A8F;
	padding:5px 10px;
	border-radius:3px;
	border:none;
	color:white;
	cursor :pointer;
	left:1040px;		
		
	}
	
	#tb {
	margin-bottom : 10px;
	padding-bottom : 10px;
	border-bottom:  1px solid #ECECEC;
	table-layout : fixed;
	}
	
	
	#tb:last-child {
	margin-bottom : 30px;
	}
	
	#select, #hide, select, #hide a, #countAll{
		border:none;
		font-size:16px;
		color:#477A8F;
	}
	
	#hide {
	display:none; 
	}
	
	#countAll {
	position: absolute;
	right : 115px;
	}
	
	#idWrite {
	color : black;
	}
	
	#tb #firstTd{
	width : 35px;
	}
	
	
	
	
</style>

<body>
		<c:import url="../common/mailSubNav.jsp"/>
		
        <div class="contents">
            <div class="contents-title">
                <span class="ct1">받은 편지함</span>
                <select id="category"> 
				<option>-----</option>
				<option value="받는사람">받는사람</option>
				<option value="제목">제목</option>
				<option value="내용">내용</option>
				<option value="제목내용">제목 + 내용</option>
			</select>
			<input  id="search" type="text" placeholder="메일 검색"> 
			<button id="searchBtn" onclick="goSearch();" > 검색 </button> <br>
			</div>
			
			<div style="margin-left:40px;">
			<!--여기다가 만들기 -->
			<br> 
						
						&nbsp;&nbsp;
						<span id="countAll"> </span> <br><br>
						
						<div id="tableDiv"> 
						<h3 style="margin-left : 10px;">  " ${search} "  검색 결과입니다. </h3>
						<br>
					<c:choose>
				    <c:when test="${!empty list }">
				        <c:forEach var="ma" items="${list}">
				        
						 <table align="left" cellspacing="0" width="90%" id="tb">
						
						<c:url var="mailWriteId" value="mailWriteId.do">
							<c:param name="memNo" value="${ma.memNo}" />
						</c:url>
						
						 <c:url var="maildetailView" value="maildetailView.do">
							<c:param name="mailNo" value="${ma.mailNo}" />
						</c:url>
						
						<tr class="trMail" onClick="location.href='${maildetailView}'"> 
							<td align="left"><a id="idWrite" onClick="event.stopPropagation(); location.href='${mailWriteId}'">${ma.name} < ${ma.sender} > </a></td>
							<td>${ ma.mTitle }</td>
							<td align="right"> ${ma.sendDate }</td>
						</tr>
						</table>
					</c:forEach>
				    </c:when>
				    
				    <c:otherwise>
				      <span style="margin-left : 30px;"> 검색된 메일이 없습니다. </span>
				    </c:otherwise>
				</c:choose>
				</div>
			</div>
			
		<br>
			
        </div>
        
        <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
        <script>
        $(document).ready(function(){
        	
        	var countAll = $("#tb tr").length;
        	$("#countAll").text("편지수 : " + countAll);
        	 //선택된 갯수
           
        })
        
	
        $(document).ready(function(){
		   $('table tr').mouseover(function(){
		      $(this).css("cursor","pointer");
		   });
		   $('table tr').mouseout(function(){
		      $(this).css("font-weight","normal");
		   });
		});

        $("#delMail").click(function(){
			 if (confirm("정말로 삭제하시겠습니까? 휴지통으로 이동합니다.") == true){    //확인

				 document.location.href='allDelMail.do';

		        }else{   //취소

		            return;
		        }

		});
        
        
        $("#realdelMail").click(function(){
        	 if (confirm("완전 삭제하시면 복구 할 수 없습니다. 정말로 삭제하시겠습니까?") == true){ 

				 document.location.href='allRealDelMail.do';

		        }else{   //취소

		            return;
		        }
		});
        
        $("#listOption").change(function() {
    		/* alert($(this).val());
    		alert($(this).children("option:selected").text()); */
    		
    		var val = $(this).val();
    		console.log(val);
    		if( val.length == 5){
    			// 읽은 메일 
    			document.location.href='readMail.do';
    		}else if ( val.length == 6){
    			// 안읽은 메일  
    			document.location.href='unReadMail.do';
    		}else {
    			document.location.href='recieveMail.do';
    		}
    		});
        
        
        // 검색 카테고리 분류 
    	
   		function goSearch(){
   	
   		var category=  $("#category").children("option:selected").val();
    	var search = $("#search").val();
    	
    	console.log(category+search);

    	if(category =="-----"){
      	  alert("분류를 선택하지 않았습니다.");
    	}else if(search != ""){
    		document.location.href='searchRecieve.do?category='+category+'&search='+search;	
    	}
    	  }
        
        </script>
</body>
</html>