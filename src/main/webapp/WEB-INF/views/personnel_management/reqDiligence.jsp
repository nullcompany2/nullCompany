<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/resources/css/req-diligence.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/css/younsu-subNavi.css"/>">

</head>

<body>
	
    <div id='wrap'>
    	<c:import url="../common/header.jsp"/>
		
		<div class="container" >
			<!-- 전체높이지정용 -->
			<div id="drag-wrap">
                <div id="drag"></div>
			</div>
			<!--  -->
			<!-- 세부 네비 시작 -->
			<c:import url="../common/personnelSubNavi.jsp"/>
			<!-- 세부 네비끝 -->
			<!-- 내부 컨텐츠 -->

			<div class="contents">
				<!-- 컨텐츠 타이틀명 -->
				<div class="contents-title">
					<span class="ct1">근태 수정요청</span>
				</div>
				<!-- ---- -->
				<div class="contents-wrap drag-scrollbar">
					<form action="">
						<div class="c-ic">
							<table class="req-table" id="statistics-tbl">
								<tr class="req-tbl-il">
									<th class="req-tbl-th">신청자</th>
									<td class="req-tbl-td"><span>Han</span></td>
								</tr>
								<tr class="req-tbl-il">
									<th class="req-tbl-th">요청날짜</th>
									<td class="req-tbl-td">SYSDATE</td>
								</tr>
								<tr class="req-tbl-il">
									<th class="req-tbl-th">종류</th>
									<td class="req-tbl-td">
										<select bname="d-type" id="" class="req-sel">
											<option value="">출근</option>
											<option value="">퇴근</option>
										</select>
									</td>
								</tr> 
								<tr class="req-tbl-il">
									<th class="req-tbl-th">기존 시간 및 상태</th>
									<td class="req-tbl-td">
										<span> 00:00:00</span>/ <span> 미체크</span>
									</td>
								</tr> 
								<tr class="req-tbl-il">
									<th class="req-tbl-th">변경 요청 시간</th>
									<td class="req-tbl-td">
										<select name="req-hour" id="" class="req-sel">
											<option value="">09</option>
											<option value="">10</option>
											<option value="">11</option>
											<option value="">12</option>
											<option value="">13</option>
											<option value="">14</option>
											<option value="">15</option>
											<option value="">16</option>
											<option value="">17</option>
											<option value="">18</option>
											<option value="">19</option>
											<option value="">20</option>
											<option value="">21</option>
											<option value="">22</option>
											<option value="">23</option>
										</select>
										<select name="req-min" id="" class="req-sel">
											<option value="">	0	</option>
											<option value="">	1	</option>
											<option value="">	2	</option>
											<option value="">	3	</option>
											<option value="">	4	</option>
											<option value="">	5	</option>
											<option value="">	6	</option>
											<option value="">	7	</option>
											<option value="">	8	</option>
											<option value="">	9	</option>
											<option value="">	10	</option>
											<option value="">	11	</option>
											<option value="">	12	</option>
											<option value="">	13	</option>
											<option value="">	14	</option>
											<option value="">	15	</option>
											<option value="">	16	</option>
											<option value="">	17	</option>
											<option value="">	18	</option>
											<option value="">	19	</option>
											<option value="">	20	</option>
											<option value="">	21	</option>
											<option value="">	22	</option>
											<option value="">	23	</option>
											<option value="">	24	</option>
											<option value="">	25	</option>
											<option value="">	26	</option>
											<option value="">	27	</option>
											<option value="">	28	</option>
											<option value="">	29	</option>
											<option value="">	30	</option>
											<option value="">	31	</option>
											<option value="">	32	</option>
											<option value="">	33	</option>
											<option value="">	34	</option>
											<option value="">	35	</option>
											<option value="">	36	</option>
											<option value="">	37	</option>
											<option value="">	38	</option>
											<option value="">	39	</option>
											<option value="">	40	</option>
											<option value="">	41	</option>
											<option value="">	42	</option>
											<option value="">	43	</option>
											<option value="">	44	</option>
											<option value="">	45	</option>
											<option value="">	46	</option>
											<option value="">	47	</option>
											<option value="">	48	</option>
											<option value="">	49	</option>
											<option value="">	50	</option>
											<option value="">	51	</option>
											<option value="">	52	</option>
											<option value="">	53	</option>
											<option value="">	54	</option>
											<option value="">	55	</option>
											<option value="">	56	</option>
											<option value="">	57	</option>
											<option value="">	58	</option>
											<option value="">	59	</option>
										</select>
									</td>
								</tr>                         
								<tr class="req-tbl-il">
									<th class="req-tbl-th">사유</th>
									<td class="req-tbl-td">
										<input type="text" name="" id="" style="width: 70%; ">
									</td>
								</tr> 
							</table>
							
							<div style="
								border: dotted;
								width: 60%;
								margin-top: 50px;
								padding: 10px;"
							>
								<input type="file" name="" id="req-file">
							</div>
							<button class="req-btn cursor" style="margin-top: 20px; margin-left:0px">요청하기</button>
	
						</div>
					</form>
				</div>
				
			</div>
		</div>
		
	</div>
</body>
</html>