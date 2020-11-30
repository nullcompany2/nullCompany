<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<c:import url="../common/header.jsp" />

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
   rel="stylesheet">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>사내공지</title>

</head>
<style>
#category {
		position:relatived;
		margin-left:35%;
		border : none;
		padding : 3px;
		font-size : 15px;
		margin-bottom : 5px;
		
	}
	
	#search {
		position:relatived;
		border: 1px solid #3E4247;
		border-radius : 3px;
		padding : 3px;
		font-size : 15px;
		margin-bottom : 5px;
		margin-left:5px;
	
	}
	
	#searchBtn {
	
	background:#477A8F;
	padding:5px 10px;
	border-radius:3px;
	border:none;
	color:white;
	margin-bottom :5px;
	cursor :pointer;
		
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



table tr:last-of-type {
   padding-bottom: 50px;
}

#mrv_table {
   margin: 10px 0px 0px 0px;
   width: 100%;
   border-top: 1px solid #cdcdcd;
   border-bottom: 1px solid #cdcdcd;
   border-collapse: collapse
}

#mrv_table>thead {
   width: 8px;
   border-radius: 8px;
   background: #e1e1e1;
}

thead tr {
   background: #e1e1e1;
}

tr>th {
   padding: 14px 10px 14px 15px;
   text-align: left;
}

tr>td {
   padding: 14px 10px 14px 15px;
   cursor: pointer;
}

.rv_but {
   border: 0 none;
   background-color: transparent;
   cursor: pointer;
   color: #779ec0 !important;
}

.n-emp-i {
   width: 100%;
   height: 30%;
}

.modal-dragscroll>div>dl>dd {
   margin-bottom: 15px;
}

.modal-dragscroll {
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

   <div id='wrap'>

      <c:import url="../common/boardSubNav.jsp" />
      <div class="contents">
         <div class="contents-title">
            <span class="ct1" style="margin-right: 77%;">사내공지</span>
         </div>
		<br>
		<div style="margin-left:40px;">
			" ${search} "  검색 결과입니다.
		</div>
		
         <div style="padding: 0px 30px 0px 30px;">

            <table id="mrv_table" class=" table-striped  table-hover" >
               <colgroup>
                  <col width="10%" />
                  <col width="40%" />
                  <col width="15%" />
                  <col width="15%" />
                  <col width="25%" />
               </colgroup>
               <thead>
                  <tr>
                     <th>번호</th>
                     <th style="width: 300px;">제목</th>
                     <th>작성자</th>
                     <th>조회수</th>
                     <th align="center">작성일</th>
                  </tr>
               </thead>
               <tbody>
                  <c:forEach var="n" items="${list }">
                     <tr>
                        <td align="left">${n.nNo }</td>
                        <td align="left"><c:if test="${!empty loginUser }">
                              <c:url var="ndetail" value="ndetail.do">
                                 <c:param name="nNo" value="${n.nNo }" />
                                 <c:param name="currentPage" value="${pi.currentPage }" />
                              </c:url>
                              <a href="${ndetail }">${n.nTitle }</a>
                           </c:if> <c:if test="${empty loginUser }">
                              ${n.nTitle }
                           </c:if></td>
                        <td align="left">${n.nWriter }</td>
                        <td align="left">${n.nCount }</td>
                        <td align="left">${n.nCreateDate }</td>
                     </tr>
                  </c:forEach>
            </table>


         </div>
      </div>
      
      <br>

   <select id="category"> 
				<option>-----</option>
				<option value="제목">제목</option>
				<option value="글쓴이">글쓴이</option>
				<option value="내용">내용</option>
				<option value="제목내용">제목 + 내용</option>
			</select>
			<input  id="search" type="text" placeholder="게시물 검색"> 
			<button id="searchBtn" onclick="goSearch();" > 검색 </button> <br>
			
			
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script>

function goSearch(){
   	
	var category=  $("#category").children("option:selected").val();
	var search = $("#search").val();
	
	if(category =="-----"){
  	  alert("분류를 선택하지 않았습니다.");
	}else if(search != ""){
			document.location.href='searchNotice.do?category='+category+'&search='+search;	
	}
	  }
      function modal(id) {
         var zIndex = 9999;
         var modal = $('#' + id);

         // 모달 div 뒤에 희끄무레한 레이어
         var bg = $('<div>').css({
            position : 'fixed',
            zIndex : zIndex,
            left : '0px',
            top : '0px',
            width : '100%',
            height : '100%',
            overflow : 'auto',
            // 레이어 색갈은 여기서 바꾸면 됨
            backgroundColor : 'rgba(0,0,0,0.4)'
         }).appendTo('body');

         modal
               .css(
                     {
                        position : 'fixed',
                        boxShadow : '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

                        // 시꺼먼 레이어 보다 한칸 위에 보이기
                        zIndex : zIndex + 1,

                        // div center 정렬
                        top : '50%',
                        left : '50%',
                        transform : 'translate(-50%, -50%)',
                        msTransform : 'translate(-50%, -50%)',
                        webkitTransform : 'translate(-50%, -50%)'
                     }).show()
               // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
               .find('.close_btn').on('click', function() {
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