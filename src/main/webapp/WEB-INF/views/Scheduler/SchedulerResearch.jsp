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
<link rel="stylesheet" href="<c:url value="/resources/css/sche_nav.css"/>">

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
						style="text-align: center; padding-top: 20px; padding-bottom: 10px;">일정
						관리</h2>
					<div class="H-personnel-subNavi2 underline" style="border: none;">
						<div>

							<button id="sche_add"
								style="border: none; border-radius: 3px; background: #477A8F; color: white; font-size: 20px; width: 90%; height: 50px; margin-left: 12px;">
								일정 추가</button>
						</div>
					</div>
					<div class="drag-scrollbar2">
						<div class="H-personnel-subNavi2 underline" style="border: none">
							<div class="H-personnel-subNavi2 Depth01-1">

								<li class="subTitle"><label for="calendar_view"
									style="font-weight: bold;">내 캘린더</label>
									<button class="calbtn">만들기</button> <br>
									<div class="input-group">
										<!-- <select class="filter" id="type_filter" multiple="multiple"> -->
										<input type="checkbox" name="sche_cate" value="카테고리1">
										집에가요</input><a>수정</a><br> <input type="checkbox" name="sche_cate"
											value="카테고리2"> 집!</input> <a>수정</a><br> <input
											type="checkbox" name="sche_cate" value="카테고리4"> 집!!</input><a>수정</a><br>
										<!-- </select> -->
									</div></li>

								<hr>

								<li class="subTitle"><label for="calendar_view"
									style="font-weight: bold;">공유 캘린더</label>
									<button class="calbtn">만들기</button> <br>
									<div class="input-group">
										<!-- <select class="filter" id="type_filter" multiple="multiple"> -->
										<input type="checkbox" name="sche_cate" value="카테고리1">
										ㅇㅇㅇ</input><a>수정</a><br> <input type="checkbox" name="sche_cate"
											value="카테고리2"> ㅁㅁㅁ</input><a>수정</a><br>

										<!-- </select> -->
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

                <form action="" style="position: absolute;
    left: 815px;
    top: 10px;">
                  <select name="search" style="border-radius: 8px; border: #676767 solid 1px; margin-right: 3px;">
                    <option value="일정 제목">일정 제목</option>
                    <option value="캘린더 이름">캘린더 이름</option>
                </select>
    
                  <input type="text" name="" id="" class="search-emp" placeholder="&nbsp; 일정검색"
                  style="border-radius: 8px;border:#676767 solid 1px ;">&nbsp;&nbsp;
                  <button class="search-btn cursor" style="border: none;
                  background: none;">검색</button>
                </form>

                <div class="contents-wrap drag-scrollbar">
                  <div id="show-myleave" class="c-ic" style=" position: absolute;
                  top: 100px;
                  left: 5%;">
         
                    <table class="r-table" id="application-recode">
                      <thead style="background: #e8ecee;">
                        <tr>
                          <th scope="col" rowspan="2" class="tr" style="width: 200px; height: 35px;">일자</th>
                          <th scope="col" rowspan="1" class="tr" style="width: 950px;">일정</th>
                       
                        </tr>
                      </thead>
                 
                      <tbody>
                        <tr style="height: 30px;">
                          <td class="ta" style="text-align: center;"><p style="font-size: 14px;">2020.10.06(화)</p></td>
                          <td class="ta" style="background-color: #6f6df5;">
                            &nbsp; <span>캘린더 이름</span>
                            <span style="margin-left: 25px; font-size: 14px;">   오전 12:00 - 오전 13:00 &nbsp; 어쩌구저쩌구</span>
                         </td>
                         
                        </tr>
                      </tbody>
                    </table>
            
                  </div>	
                </div>
			</div>

			</div>

		</div>
</body>
</html>