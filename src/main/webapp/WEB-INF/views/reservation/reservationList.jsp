<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 현황</title>

<c:import url="../common/header.jsp" />
<c:import url="../common/reservationSubNav.jsp" />
</head>

<style>
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
	text-align: left;
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

#detail_modal {
	display: none;
	padding: 10px 60px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
}

.close_btn {
	cursor: pointer;
}
</style>

<script>
    // 메뉴 아이콘용 토글 
    $(function () {
      $("#menu").click(function () {
        $("#menuToggle").toggle();
      });
    });


    // 인포용 토글
    $(function () {
      $("#infoToggle").hide();
      $("#infobtn").click(function () {
        $("#infoToggle").toggle();
      });
    });


  </script>

<body>
	<div class="contents">
		<div class="contents-title">
			<span class="ct1">예약 현황</span>
		</div>

		<div style="padding: 0px 30px 0px 30px;">
			<div style="margin-top: 10px;">
				보기 : <select name="category">
					<option value="">회의실</option>
					<option value="">차량</option>
					<option value="">비품</option>
				</select>
			</div>
			<table id="mrv_table">
				<thead>
					<tr>
						<th>예약자</th>
						<th>카테고리</th>
						<th>자원</th>
						<th>예약시간</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>신아라</td>
						<td>회의실</td>
						<td>회의실</td>
						<td>2020-10-10 1800 ~ 2020-10-10 20:00</td>
						<td>
							<button class="rv_but" id="detail_btn">상세보기</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	</div>

	<div id="detail_modal" class="modal-dragscroll">
		<h4 style="color: #477A8F; margin-bottom: 25px;">상세 보기</h4>
		<div class="n-emp-i">
			<dl>
				<dt style="float: left;">
					<label>자원 이름</label>
				</dt>
				<dd style="margin-left: 150px;">회의실</dd>
			</dl>
			<dl>
				<dt style="float: left;">
					<label>예약 시간</label>
				</dt>
				<dd style="margin-left: 150px;">2020-10-20 15:00 ~ 2020-10-20
					15:30</dd>
			</dl>
			<dl>
				<dt style="float: left;">
					<label>사용 용도</label>
				</dt>
				<dd style="margin-left: 150px;">asd</dd>
			</dl>
		</div>
		<div style="text-align: center; margin-top: 50px;">
			<button class="close_btn"
				style="background: #fff; color: #2c86dc; padding: 5px 27px 6px; border: 1px solid #c8c8c8">확인</button>
		</div>
	</div>

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

    $('#detail_btn').on('click', function() {
       // 모달창 띄우기
       modal('detail_modal');
    });
    
 </script>


</body>
</html>