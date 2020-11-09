<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<c:import url="../common/header.jsp"/>

<title> 휴지통 </title>

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

	#search {
		position:relatived;
		margin-left:37%;
		border : none;
		border-bottom : 2px solid #477A8F;
		padding : 3px;
		font-size : 15px;
		margin-bottom : 5px;
		
	}
	
	
	#tb {
	margin-bottom : 10px;
	padding-bottom : 10px;
	border-bottom:  1px solid #ECECEC;
	}
	
	#hide,#hide a, #countAll{
		border:none;
		font-size:16px;
		color:#477A8F;
		
	}
	
	#select, #hide, select, #hide a, #countAll{
		border:none;
		font-size:16px;
		color:#477A8F;
	}
	

</style>


<body>
		<c:import url="../common/mailSubNav.jsp"/>
        <div class="contents">
            <div class="contents-title">
                <span class="ct1">휴지통</span>
			</div>
			
			<div style="margin-left:40px;">
			<!--여기다가 만들기 -->
			<br> 
				&nbsp;&nbsp;<input type="checkbox" id="checkall"> 
				&nbsp;&nbsp;<span style="color:#477A8F;" id="select"> 보기 : 
				<select name="listOption" id="listOption"> 
							<option selected> 받은 편지함 </option>
							<option>  보낸 편지함 </option>
							<option> 임시 보관함  </option>
						</select> &nbsp;
				</span> 
						
				&nbsp;&nbsp;
				<span id="hide" style="margin-right:40px;">  <span id="count"> </span> &nbsp; <a id="realdelMail"> 완전삭제 </a> </span>
				 <span style="margin-left:50%;" id="countAll"> </span> <br><br>				
				 
				 <div id="tableDiv"> 
					<c:choose>
				    <c:when test="${!empty list }">
				        <c:forEach var="ma" items="${list}">
				        
						 <table align="left" cellspacing="0" width="90%" id="tb">
						 
						 <c:url var="maildetailView" value="maildetailView.do">
							<c:param name="mailNo" value="${ma.mailNo}" />
						</c:url>
						
						<tr class="trMail" onClick="location.href='${maildetailView}'"> 
						
						<c:url var="mailWriteId" value="mailWriteId.do">
							<c:param name="senderNo" value="${ma.senderNo}" />
						</c:url>
						
							<td>&nbsp;&nbsp;<input type="checkbox" onClick="event.cancelBubble=true" name="mail"></td>
							<td align="left"><a onClick="event.stopPropagation(); location.href='${mailWriteId}'">${ma.name} < ${ma.sender} > </a></td>
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
			
        </div>
        
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
                    $("tr").css("background","#ECECEC");
                  
                    var count = $("input:checkbox[name=mail]:checked").length;
                   	$("#count").text(count);
                 
                    //클릭이 안되있으면
                }else{
                    //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
                    $("input[name=mail]").prop("checked",false);
                    $("tr").css("background","white");
                   
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

        
        $("#realdelMail").click(function(){
        	confirm("완전 삭제하시면 복구 할 수 없습니다. 정말로 삭제하시겠습니까?");
		});
        
        

        </script>
		

</body>
</html>