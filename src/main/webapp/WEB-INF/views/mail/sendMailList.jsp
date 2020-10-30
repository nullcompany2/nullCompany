<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<c:import url="../common/header.jsp"/>

<title>보낸 메일함 </title>

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
	margin-bottom : 50px;
	padding-bottom : 30px;
	border-bottom:  1px solid #ECECEC;
	
	}
	
	#select, #hide, select, #hide a, #countAll{
		border:none;
		font-size:16px;
		color:#477A8F;
		
	}
	
	#hide {
	display:none; 
	}
	
	
	
</style>


<body>
		<c:import url="../common/mailSubNav.jsp"/>
        <div class="contents">
            <div class="contents-title">
                <span class="ct1">보낸 편지함</span>
			</div>
			
			<div style="margin-left:40px;">
			<!--여기다가 만들기 -->
			<br> 
				&nbsp;&nbsp;<input type="checkbox" id="checkall"> 
				&nbsp;&nbsp; <span style="color:#477A8F;" id="select"> 보기 : 
				<select> 
					<option> 모두  </option>
					<option> 읽은 메일  </option>
					<option> 안읽은 메일  </option>
				</select> &nbsp;
				</span> 
				&nbsp;&nbsp;
				<span id="hide" style="margin-right:40px;">  <span id="count"> </span> <a id="delMail">삭제 </a>  &nbsp; <a id="realdelMail"> 완전삭제 </a> </span>
				 <span style="margin-left:65%;" id="countAll"> </span> <br><br>				
				 <table align="left" cellspacing="0" width="90%" id="tb">
					
					<tr> 
						<td>&nbsp;&nbsp;<input type="checkbox" name="mail" id=""></td>
						<td align="left">  <a>이용희 </a>  </td>
						<td> 그래 집에 보내줄게! 집에 가 ! </td>
						<td align="right">   2020-10-09  11:32:21 </td>
					</tr>
					
					<tr> 
						<td>&nbsp;&nbsp;<input type="checkbox" name="mail" id=""></td>
						<td align="left">  <a>이용희 </a>  </td>
						<td> 집에 가 ! </td>
						<td align="right">   2020-10-09  11:32:21 </td>
					</tr>
					
					<tr> 
						<td>&nbsp;&nbsp;<input type="checkbox" name="mail" id=""></td>
						<td align="left">  <a>이용희 </a>  </td>
						<td> !!! 잘가  </td>
						<td align="right">   2020-10-09  11:32:21 </td>
					</tr>
					
					<tr> 
						<td>&nbsp;&nbsp;<input type="checkbox" name="mail" id=""></td>
						<td align="left">  <a>이용희 </a>  </td>
						<td> [중요] 집에 가고싶다....  </td>
						<td align="right">   2020-10-09  11:32:21 </td>
					</tr>
					
					
					
					
				 </table>
			</div>
			
			
			<input id="search" type="text" placeholder="메일 검색"> 
			<a> 돋보기 </a> <br>
			
			<a style="margin-left:35%;">처음</a>
			<a>이전</a>
			아무튼 페이징 처리 자리임 ! ^^
			 
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
                    $("#hide").show();
                    $("#select").hide(); 
                    
                    var count = $("input:checkbox[name=mail]:checked").length;
                   	$("#count").text(count);
                 
                    //클릭이 안되있으면
                }else{
                    //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
                    $("input[name=mail]").prop("checked",false);
                    $("tr").css("background","white");
                    $("#hide").hide();
                    $("#select").show(); 
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

        $("#delMail").click(function(){
			confirm("정말로 삭제하시겠습니까? 휴지통으로 이동합니다.");
		});
        
        $("#realdelMail").click(function(){
        	confirm("완전 삭제하시면 복구 할 수 없습니다. 정말로 삭제하시겠습니까?");
		});

        </script>
		

</body>
</html>