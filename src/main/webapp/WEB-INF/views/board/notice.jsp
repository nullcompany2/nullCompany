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
			총 게시글 갯수 : ${ pi.listCount }
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
      <table
         style="margin: 10px 0px 0px 0px; width: 80%; border-collapse: collapse">
         <!-- 페이징처리 -->
			<tr align="center" height="20">
				<td colspan="6" align="center">
					<!-- [이전] --> <c:if test="${ pi.currentPage eq 1 }">
						이전 &nbsp;
					</c:if> <c:if test="${ pi.currentPage ne 1 }">
						<c:url var="before" value="notice.do">
							<c:param name="currentPage" value="${ pi.currentPage - 1 }" />
						</c:url>
						<a href="${ before }">이전</a> &nbsp;
					</c:if> <!-- 페이지 --> <c:forEach var="p" begin="${ pi.startPage }"
						end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<font color="#477A8F" size="3"><b>${ p }</b> </font>
						</c:if>

						<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination" value="notice.do">
								<c:param name="currentPage" value="${ p }" />
							</c:url>
							<a href="${ pagination }">${ p }</a> &nbsp;
						</c:if>
					</c:forEach> <!-- [다음] --> &nbsp;<c:if test="${ pi.currentPage eq pi.maxPage }">
						다음
					</c:if> <c:if test="${ pi.currentPage ne pi.maxPage }">
						<c:url var="after" value="notice.do">
							<c:param name="currentPage" value="${ pi.currentPage + 1 }" />
						</c:url>
						<a href="${ after }">다음</a>
					</c:if>
				</td>
			</tr>
      </table>
      <br>

     <div class="searchArea" align="center">
         <select id="searchCondition" name="searchCondition">
            <option>-----</option>
            <option value="title">제목</option>
            <option value="content">내용</option>
            <option value="writer">작성자</option>
         </select> <input type="search" style="padding: .5em .5em;">
         <button type="submit" style="padding: .5em .5em;">검색하기</button>

      </div>

<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
        <script>
        $(document).ready(function(){
        	
        	var countAll = $("#tb tr").length;
        	$("#countAll").text("편지수 : " + countAll);


        	 </script>

</body>
</html>