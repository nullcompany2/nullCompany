<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet"
	href="<c:url value="/resources/css/schemaincal.css"/>">
	
</head>
<body>
	<div id='wrap'>
		<c:import url="../common/header.jsp" />

		<div class="container">
			<!-- 전체높이지정용 -->
			<div id="drag-wrap">
				<div id="drag"></div>
			</div>
			<!--  -->
			<!-- 세부 네비 시작 -->
		<div class="container2" style="">
					<div class="H-personnel-subNavi underline" style="border: none;">
						<h2 id="mailTitle"
							style="text-align: center; padding-top: 20px; padding-bottom: 10px;">Schedule</h2>
						<div class="H-personnel-subNavi2 underline" style="border: none;">
							<div>

								<button id="sche_add"
									style="border: none;
								    border-radius: 3px;
								    background: #477A8F;
								    color: white;
								    font-size: 20px;
								    width: 100%;
								    height: 50px;
								    cursor: pointer;
								    margin-left: -2px;">
									일정 추가</button>
							</div>
						</div>
						<div class="drag-scrollbar2">
							<div class="H-personnel-subNavi2 underline" style="border: none">
								<div class="H-personnel-subNavi2 Depth01-1">

									<li class="subTitle"><label for="calendar_view"
										style="font-weight: bold;">내 캘린더</label>
										<button id="individual" class="calbtn" style="cursor: pointer;">만들기</button> <br>
										<div class="input-group">
											<!-- <select class="filter" id="type_filter" multiple="multiple"> -->
											<c:forEach var="IndividualCalList" items="${ IndividualCalList }">
												<div style="width: 14px;
												    height: 14px;
												    position: absolute;
												    right: 72px;
												    margin-top: 9px;
												    border-radius: 70px;
												    background: ${ IndividualCalList.color } "></div>
												<div>
												<input type="checkbox" name="sche_cate" 
												value="${ IndividualCalList.calNo }" id="${ IndividualCalList.calNo }"/>
												<label id="chela" for="${ IndividualCalList.calNo }">
												<span>${ IndividualCalList.calName }</span>
												</label>
												
											<a id="${IndividualCalList.calNo}" class="editindiCal">
											<input type="hidden" id="before_cal_name" value="${ IndividualCalList.calName}" />수정</a></div> 
											</c:forEach>
											<!-- </select> -->
										</div></li>

									<hr>

									<li class="subTitle"><label for="calendar_view"
										style="font-weight: bold;">공유 캘린더</label>
										<button id="community" class="calbtn" style="cursor: pointer;">만들기</button> <br>
										<div class="input-group">
										
											<c:forEach var="publicCalList" items="${ publicCalList }">
													<div style="width: 14px;
												    height: 14px;
												    position: absolute;
												    right: 72px;
												    margin-top: 9px;
												    border-radius: 70px;
												    background: ${ publicCalList.color } "></div>
												<div>
												<input type="checkbox" name="sche_cate" 
												value="${ publicCalList.calNo }" id="${ publicCalList.calNo }">
												<label id="chela" for="${ publicCalList.calNo }">
												<span>${ publicCalList.calName }</span>
												</label></input>
											<a id="${publicCalList.calNo}" class="editpubCal">수정</a></div> 
											</c:forEach>
											
									
										</div></li>
								</div>
							</div>
						</div>
					</div>
				</div>
			<!-- 네비 끝 -->

			<!-- 내부 컨텐츠 -->
			<div class="contents">
				<!-- 컨텐츠 타이틀명 -->
				   <div class="contents-title">
                <span class="ct1">검색 결과</span>
                
                <div id="returnBtn" style="position: absolute; cursor:pointer;
				    left: 730px;
				    top: 15px;">
                <span style="    font-size: 12px;
				    position: relative;
				    color:#676767;
				    top: -5px;
				    font-size:12px">검색 취소</span>
               	 <img style="width: 20px; height: 20px;"src="resources/images/return.png" />
                </div>
				
                <form action="" style="position: absolute;
    left: 815px;
    top: 10px;">
                <select name="search" id="search_option" style="border-radius: 8px; border: #676767 solid 1px; margin-right: 3px;">
                   <option id="Sche_name" value="Sche_name">일정 제목</option>
				   <option id="Cal_name" value="Cal_name">캘린더 이름</option>
                </select>
    
                  <input type="text" name="" id="search_text" class="search-emp" placeholder="&nbsp; 일정검색"
                  style="border-radius: 8px;border:#676767 solid 1px ;">&nbsp;&nbsp;
                  <a id="searchbtn" class="search-btn cursor" style="border: none;
                  background: none;">검색</a>
                </form>

                <div class="contents-wrap drag-scrollbar">
                  <div id="show-myleave" class="c-ic" style=" position: absolute;
                  top: 100px;
                  left: 5%;">
         
                    <table class="r-table" id="application-recode" style="border-collapse:collapse;">
                      <thead style="background: #e8ecee;">
                        <tr>
                          <th scope="col" rowspan="2" class="tr" style="width: 200px; height: 35px;">일자</th>
                          <th scope="col" colspan="3" rowspan="1" class="tr" style="width: 950px;">일정</th>
                       
                        </tr>
                      </thead>
                 
                      <tbody>
                      <c:forEach var="Sche_name_Search" items="${ Sche_name_Search }">
                        <tr style="height: 30px;">
                          <td class="ta" style="text-align: center;"><p style="font-size: 14px;">${ Sche_name_Search.startdate }</p></td>
                          <td class="ta" style="    border-collapse: collapse;
							    overflow: hidden;
							    text-overflow: ellipsis;
							    white-space: nowrap;
							    width: 100px; 
							    background-color: ${ Sche_name_Search.color };
							    border-collapse:collapse;">
                            &nbsp; <span> ${Sche_name_Search.sche_name } </span>
                          </td>
                          <td class="ta" style="display:table-cell; background-color: ${ Sche_name_Search.color };width: 75px;">
                            <span style="margin-left: 25px; font-size: 14px;"> ${ Sche_name_Search.starttime }시</span>
                         </td>
                         <td class="ta" style="display:table-cell; background-color: ${ Sche_name_Search.color };border-collapse:collapse;">
                            <span style="margin-left: 25px; font-size: 14px;"> ${ Sche_name_Search.sche_content }</span>
                         </td>
                        </tr>
                       </c:forEach>
                       <c:forEach var="Cal_name_Search" items="${ Cal_name_Search }">
                        <tr style="height: 30px;">
                          <td class="ta" style="text-align: center;"><p style="font-size: 14px;">${ Cal_name_Search.startdate }</p></td>
                          <td class="ta" style="    border-collapse: collapse;
							    overflow: hidden;
							    text-overflow: ellipsis;
							    white-space: nowrap;
							    width: 100px; 
							    background-color: ${ Cal_name_Search.color };
							    border-collapse:collapse;">
                            &nbsp; <span> ${Cal_name_Search.sche_name } </span>
                          </td>
                          <td class="ta" style="display:table-cell; background-color: ${ Cal_name_Search.color };width: 75px;">
                            <span style="margin-left: 25px; font-size: 14px;"> ${ Cal_name_Search.starttime }시</span>
                         </td>
                         <td class="ta" style="display:table-cell; background-color: ${ Cal_name_Search.color };border-collapse:collapse;">
                            <span style="margin-left: 25px; font-size: 14px;"> ${ Cal_name_Search.sche_content }</span>
                         </td>
                        </tr>
                       </c:forEach>
                       <c:if test="${empty Sche_name_Search && empty Cal_name_Search}">
								<tr id="list_table_tr_input">
									<td class="tg-0lax" colspan="4" style="text-align: center;"><p>검색 내용이 없습니다.</p></td>
								<tr>
				
					   </c:if>
				
                      </tbody>
                    </table>
            
                  </div>	
                </div>
			</div>

			</div>

		</div>
		
		<script>
		// 뒤로 돌아가기
			$("#returnBtn").on('click',function() {
				document.location.href = 'Schedulermain.do'		
			})
			
		// 검색
			 $("#searchbtn").on('click',function () {
			var text = $("#search_text").val();
			
			 if(text == ''){
				 alert("일정 내용을 입력해주세요.")
				 return false;}
			 
			var select_option = $("#search_option option:selected").val();
			document.location.href='SchedulerSearch.do?text='+text+'&select_option='+select_option;	
			
		 
			 })
		</script>
</body>
</html>