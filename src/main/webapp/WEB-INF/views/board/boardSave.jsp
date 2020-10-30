<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<c:import url="../common/header.jsp" />
<c:import url="../common/boardSubNav.jsp"/>

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">
<title>임시 보관함</title>

</head>
<style>
select {
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none; /* 화살표 모양의 이미지 */
	width: 100px; /* 원하는 너비설정 */
	padding: .5em .5em; /* 여백으로 높이 설정 */
	font-family: inherit; /* 폰트 상속 */
	background:
		url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg)
		no-repeat 95% 50%; /* 네이티브 화살표 대체 */
	-moz-appearance: none;
	border-radius: 0px;
}

body {
	font-family: "Noto Sans KR", sans-serif;
	padding: 0px;
	margin: 0px;
}

.container {
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

.drag-scrollbar {
	overflow: auto;
	height: 600px;
}

.H-personnel-subNavi {
	margin-left: 15px;
	margin-right: 15px;
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

.title {
	font-size: 16px;
	font-weight: bold;
	margin-right: 50px;
}

.subTitle {
	list-style: none;
}

/* contents */
.contents {
	position: relative;
	margin-left: 250px;
}

.contents-title {
	padding-top: 10px;
	height: 50px;
	border-bottom: solid 0.1px #cacaca;
}

.ct1 {
	margin-left: 50px;
	font-size: 20px;
	font-weight: bolder;
}

.del {
	opacity: 0%;
}

.del:hover {
	opacity: 100%;
}

a:active {
	font-weight: bolder;
}

#search {
	position: relatived;
	margin-left: 37%;
}

table tr:last-of-type {
	padding-bottom: 50px;
}
#mrv_table{
    margin: 10px 0px 0px 0px;
    width: 100%;
    border-top: 1px solid #cdcdcd;
    border-bottom: 1px solid #cdcdcd;
    border-collapse: collapse
}
#mrv_table>thead{
    width: 8px;
    border-radius: 8px;
    background: #e1e1e1;
}

thead tr{
    background: #e1e1e1;
}
tr>th{
    padding: 14px 10px 14px 15px; 
    text-align: left;
}
tr>td{
	
    padding: 14px 10px 14px 15px; 
    text-align: left;
    cursor: pointer;
}

.rv_but{
    border: 0 none; 
    background-color: transparent; 
    cursor: pointer; 
    color: #779ec0!important;
}


 .n-emp-i{
    width: 100%;
    height: 30%;
 }
 .modal-dragscroll>div>dl>dd{
    margin-bottom: 15px;
 }
 .modal-dragscroll{
    overflow: auto;
 }
 .modal-dragscroll::-webkit-scrollbar {
    width: 10px;
 }
 .modal-dragscroll::-webkit-scrollbar-thumb {
    background-color: #e8ecee;
    border-radius: 15px;
 }
 .modal-dragscroll::-webkit-scrollbar-track {
    background-color: white;
    border-radius: 15px;
    box-shadow: white;
 }
 #delete_modal {
    display: none;
    padding: 10px 60px;
    background-color: #fefefe;
    border: 1px solid #888;
    border-radius: 3px;
 }
 #delete_modal .modal-close-btn {
   position: absolute;
   top: 10px;
   right: 10px;
}

 
</style>

<body>

	<div class="contents">
            <div class="contents-title">
                <span class="ct1">임시 보관함</span>
			</div>
			
			<div style="margin-left:40px;">
			<!--여기다가 만들기 -->
			<br> 
				&nbsp;&nbsp;<input type="checkbox" id="checkall"> 
				&nbsp;&nbsp; <span style="color:#477A8F;" id="select"> 보기 : 
				<select> 
					<option>전체보기</option>
					<option value="boardAll">사내공지</option>
							<option value="boardTeam">팀내공지</option>
							<option disabled>--------------</option>
							<option value="boardFree">자유게시판</option>
				</select> &nbsp;
				</span> 
				&nbsp;&nbsp;
				<span id="hide" style="margin-right:40px;">  <span id="count"> </span> <a id="delBoard">삭제 </a>  &nbsp; <a id="realdelMail"> 완전삭제 </a> </span>
				 <span style="margin-left:65%;" id="countAll"> </span> <br><br>				
				 <table align="left" cellspacing="0" width="90%" id="tb">
					
					
					
					
					<tr> 
						<td>&nbsp;&nbsp;<input type="checkbox" name="board" id=""></td>
						<td>사내공지 </td>
						<td> 제2회 nullComp 체육대회 개최  </td>
						<td> 체육대회는 무슨 체육대회여....</td>
						<td align="right">   2020-10-09  11:32:21 </td>
					</tr>
					
					<tr> 
						<td>&nbsp;&nbsp;<input type="checkbox" name="board" id=""></td>
						<td>팀내공지 </td>
						<td>이번주 금요일 팀회식 참여 여부</td>
						<td>금요일에 팀회식이 있을...</td>
						<td align="right">   2020-10-26  11:32:21 </td>
					</tr>
					
					<tr> 
						<td>&nbsp;&nbsp;<input type="checkbox" name="board" id=""></td>
						<td>자유게시판</td>
						<td>머리도 아픈데 자랭 ㄱ?</td>
						<td>ㅈㄱㄴ 선착순 4명</td>
						<td align="right">   2020-10-18  15:32:21 </td>
					</tr>
					
					
					
					
					
					
				 </table>
			
        
        <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
        <script>
        $(document).ready(function(){
        	
        	var countAll = $("#tb tr").length;
        	$("#countAll").text("임시저장글 : " + countAll);
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
		



	<script>
    function modal(id) {
       var zIndex = 9999;
       var modal = $('#' + id);

       // 모달 div 뒤에 희끄무레한 레이어
       var bg = $('<div>')
          .css({
             position: 'fixed',
             zIndex: zIndex,
             left: '0px',
             top: '0px',
             width: '100%',
             height: '100%',
             overflow: 'auto',
             // 레이어 색갈은 여기서 바꾸면 됨
             backgroundColor: 'rgba(0,0,0,0.4)'
          })
          .appendTo('body');

       modal
          .css({
             position: 'fixed',
             boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

             // 시꺼먼 레이어 보다 한칸 위에 보이기
             zIndex: zIndex + 1,

             // div center 정렬
             top: '50%',
             left: '50%',
             transform: 'translate(-50%, -50%)',
             msTransform: 'translate(-50%, -50%)',
             webkitTransform: 'translate(-50%, -50%)'
          })
          .show()
          // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
          .find('.close_btn')
          .on('click', function() {
             bg.remove();
             modal.hide();
          });
    }

    $('#delete_btn').on('click', function() {
       // 모달창 띄우기
       modal('delete_modal');
    });
    
 </script>

</body>
</html>