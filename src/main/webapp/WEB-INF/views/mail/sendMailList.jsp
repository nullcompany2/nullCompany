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
	
	#tb #idWrite {
	overflow:hidden;
	white-space : nowrap;
	text-overflow: ellipsis;
	color : black;
	}
	
	#tb #firstTd{
	width : 35px;
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
	
	
</style>

<body>
		<c:import url="../common/mailSubNav.jsp"/>
		
        <div class="contents">
            <div class="contents-title">
                <span class="ct1">보낸 편지함</span>
                <select id="category"> 
				<option>-----</option>
				<option value="받는사람">받는 사람</option>
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
						&nbsp;
						<input type="checkbox" id="checkall"> 
						&nbsp;&nbsp;
						전체선택 &nbsp;&nbsp;
						<span id="hide" style="margin-right:40px;">  <span id="count"> </span> <a id="delMail">삭제 </a>  &nbsp; <a id="realdelMail"> 완전삭제 </a> </span>
						<span id="countAll"> </span> <br><br>
						
					<c:choose>
				    <c:when test="${!empty list }">
				        <c:forEach var="ma" items="${list}">
				        
						 <table align="left" cellspacing="0" width="90%" id="tb">
						 
						 <c:url var="maildetailView" value="sendMaildetailView.do">
							<c:param name="mailNo" value="${ma.mailNo}" />
						 </c:url>
						
						<tr class="trMail" onClick="location.href='${maildetailView}'"> 
						
							<td id="firstTd">&nbsp;&nbsp;<input type="checkbox" onClick="event.cancelBubble=true" name="mail" value="${ma.mailNo}"></td>
							<td align="left"><a id="idWrite">${ma.name} < ${ma.recipient} > </a></td>
							<td>${ ma.mTitle }</td>
							<td align="right"> ${ma.sendDate }</td>
						
						</tr>
						</table>
						
					</c:forEach>
				    </c:when>
				    
				    <c:otherwise>
				      <span> 현재 편지함에 메일이 없습니다. </span>
				    </c:otherwise>
				</c:choose>
				</div>
			</div>
			
			<table style=" margin: 10px 0px 0px 80px; width: 80%; border-collapse: collapse">
			<!-- 페이징처리 -->
			<tr align="center" height="20">
				<td colspan="6" align="center">
					<!-- [이전] --> <c:if test="${ pi.currentPage eq 1 }">
						이전 
					</c:if> <c:if test="${ pi.currentPage ne 1 }">
						<c:url var="before" value="sendMailList.do">
							<c:param name="currentPage" value="${ pi.currentPage - 1 }" />
						</c:url>
						<a href="${ before }">이전</a> 
					</c:if> <!-- 페이지 --> <c:forEach var="p" begin="${ pi.startPage }"
						end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<font color="#477A8F" size="3"><b>${ p }</b> </font>
						</c:if>

						<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination" value="sendMailList.do">
								<c:param name="currentPage" value="${ p }" />
							</c:url>
							<a href="${ pagination }">${ p }</a>
						</c:if>
					</c:forEach> <!-- [다음] --> <c:if test="${ pi.currentPage eq pi.maxPage }">
						다음
					</c:if> <c:if test="${ pi.currentPage ne pi.maxPage }">
						<c:url var="after" value="sendMailList.do">
							<c:param name="currentPage" value="${ pi.currentPage + 1 }" />
						</c:url>
						<a href="${ after }">다음</a>
					</c:if>
				</td>
			</tr>
		</table>
		<br>
        
        <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
        <script>
        $(document).ready(function(){
        	
        	var countAll = $("#tb tr").length;
        	$("#countAll").text("편지수 : " + countAll);
        	 //선택된 갯수
        	
        	
 //최상단 체크박스 클릭
            
            $("#checkall").click(function(){
                //클릭되었으면
                if($("#checkall").prop("checked")){
                    //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
                    $("input[name=mail]").prop("checked",true);
                    $("#select").hide();
                    $("#hide").show(); 
                   	
                    //클릭이 안되있으면
                }else {
                    //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
                    $("input[name=mail]").prop("checked",false);
                    $("#hide").hide(); 
                    $("#select").show();  
                  
                }
            })
            
              $("input[name=mail]").click(function(e){
                //클릭되었으면
                if($(e.target).prop("checked")){
                    //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
                    $(e.target).prop("checked",true);
                    $("#select").hide();
                    $("#hide").show(); 
                   	
                    //클릭이 안되있으면
                }else {
                    //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
                    $(e.target).prop("checked",false);
                    var j =0;
                    for( var i =0; i<$("input[name=mail]").length;i++){
	                    console.log($("input[name=mail]")[i].checked);
                    	if($("input[name=mail]")[i].checked){
                    		j++;
                    	};
                    }
                    if(j == 0){
	                    $("#hide").hide(); 
	                    $("#select").show();  
                    	$("#checkall").prop("checked",false);
                    }  
                  
                }
            })
        })
	
        $(document).ready(function(){
		   $('table tr').mouseover(function(){
		      $(this).css("cursor","pointer");
		   });
		   $('table tr').mouseout(function(){
		      $(this).css("font-weight","normal");
		   });
		});

     // 체크 박스 삭제 하기 
      	 var mailNoArr = new Array();
      
      	 $("#delMail").click(function(){
       	
      		 if (confirm("정말로 삭제하시겠습니까? 휴지통으로 이동합니다.") == true){ 
      		 mailNoArr = new Array();
		
           var page = "보낸메일";
           var size = $('input:checkbox[name="mail"]').length;
           for( var i =0;i<size;i++ ){
              if($('input:checkbox[name="mail"]')[i].checked){
           	   mailNoArr.push($('input:checkbox[name="mail"]')[i].value);
           	   	console.log(mailNoArr);
           	   document.location.href='delMail.do?mailNoArr=' + mailNoArr + '&page=' + page;
              	}
             }
             
           }
              
       	});
      	 
      	
      	 // 체크 박스 완전 삭제하기 
        $("#realdelMail").click(function(){
       	 if (confirm("완전 삭제하시면 복구 할 수 없습니다. 정말로 삭제하시겠습니까?") == true){ 
       		 mailNoArr = new Array();
       			
                var size = $('input:checkbox[name="mail"]').length;
                for( var i =0;i<size;i++ ){
                   if($('input:checkbox[name="mail"]')[i].checked){
                	   mailNoArr.push($('input:checkbox[name="mail"]')[i].value);
                	   	console.log(mailNoArr);
                	   document.location.href='realDelMail.do?mailNoArr=' + mailNoArr;
                   	}
                  }
                  
                }
                   
            	});
        
        
     // 검색 카테고리 분류 
  		
    	
   		function goSearch(){
   	
   		var category=  $("#category").children("option:selected").val();
    	var search = $("#search").val();
    	
    	if(category =="-----"){
      	  alert("분류를 선택하지 않았습니다.");
    	}else if(search != ""){
    			document.location.href='searchSend.do?category='+category+'&search='+search;	
    	}
    	  }
        
        </script>
</body>
</html>