<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>예약하기 창</title>
<c:import url="../common/header.jsp" />
<c:import url="../common/reservationSubNav.jsp" />
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">
</head>

<style>
#reservation_modal {
	display: none;
	padding: 10px 60px;
	width: 500px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
}

#reservation_modal .modal-close-btn {
	position: absolute;
	top: 10px;
	right: 10px;
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

.close_btn {
	cursor: pointer;
}
    table {
    width: 100%;
    border: 1px solid#e1e1e1;
    border-spacing: 0;
    border-collapse: collapse;
    padding: 0;
    margin: 0;
    }
    th, td {
      border: 1px solid #ddd;
    }
    .td_color{
      background: #e1e1e1;
      text-align: center;
      border-spacing: 0px;

    }
    .content_td{
    border-top: 1px solid #ddd;
    border-bottom: 1px dotted #ddd;
    }

    .left_table{
      padding: 0;
      height: 100%;
    }
    .left_table th{
      border: 1px solid #4444;
      height: 44px;
    }
  /* IE */
  div {
    -ms-overflow-style: none; 
  }

  /* chrome etc */
  div::-webkit-scrollbar { 
      display: none !important; 
  }
</style>
<body>

	<div class="contents">
      <div class="contents-title">
        <span class="ct1">회의실</span>
      </div>
      <br>
			<div style="text-align : center;">
        <button><</button> &nbsp;
        <span>10-24</span> &nbsp;
        <button>></button>
      </div>
      <br>
      <div style="margin: 0px 30px 0px 30px;" >
        <table 
        style="width: 100%;
        border: 1px solid gray;">
          <tr style="height: 50px;">
            <th class="td_color" style="width: 100px;  "></th>
            <th>회의실</th>
            <th class="td_color" style="width: 100px;"></th>
          </tr>
          <tr style="height: 100px;">
            <td style="text-align: center;" > < </td>
            <td style="text-align: center;">이미지</td>
            <td style="text-align: center;" > > </td>
          </tr>
          </table>
      </div>
			<div style="margin: 0px 30px 0px 30px;     overflow-y: scroll;
      height: 500px;">
        <table 
        style="width: 100%;
        border: 1px solid gray;">
          <tr>
            <td class="td_color" style="width: 100px;  "  > 
              <table class="left_table">
                <tr>
                  <th>오전1시</th>
                </tr>
                <tr>
                  <th>오전2시</th>
                </tr>
                <tr>
                  <th>오전3시</th>
                </tr>
                <tr>
                  <th>오전4시</th>
                </tr>
                <tr>
                  <th>오전5시</th>
                </tr>
                <tr>
                  <th>오전6시</th>
                </tr>
                <tr>
                  <th>오전7시</th>
                </tr>
                <tr>
                  <th>오전8시</th>
                </tr>
                <tr>
                  <th>오전9시</th>
                </tr>
                <tr>
                  <th>오전10시</th>
                </tr>
                <tr>
                  <th>오전11시</th>
                </tr>
                <tr>
                  <th>오전12시</th>
                </tr>
                <tr>
                  <th>오후1시</th>
                </tr>
                <tr>
                  <th>오후2시</th>
                </tr>
                <tr>
                  <th>오후3시</th>
                </tr>
                <tr>
                  <th>오후4시</th>
                </tr>
                <tr>
                  <th>오후5시</th>
                </tr>
                <tr>
                  <th>오후6시</th>
                </tr>
                <tr>
                  <th>오후7시</th>
                </tr>
                <tr>
                  <th>오후8시</th>
                </tr>
                <tr>
                  <th>오후9시</th>
                </tr>
                <tr>
                  <th>오후10시</th>
                </tr>
                <tr>
                  <th>오후11시</th>
                </tr>
              </table>  
            </td>

            <td>
              <table id="content_table">
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>
                <tr>
                  <td class="content_td" style="height: 22px;"></td>             
                </tr>

              </table>  
            </td>

            <td class="td_color" style="width: 100px;  " >
              <table class="left_table">
                <tr>
                  <th></th>
                </tr>
                <tr>
                  <th></th>
                </tr>
                <tr>
                  <th></th>
                </tr>
                <tr>
                  <th></th>
                </tr>
                <tr>
                  <th></th>
                </tr>
                <tr>
                  <th></th>
                </tr>
                <tr>
                  <th></th>
                </tr>
                <tr>
                  <th></th>
                </tr>
                <tr>
                  <th></th>
                </tr>
                <tr>
                  <th></th>
                </tr>
                <tr>
                  <th></th>
                </tr>
                <tr>
                  <th></th>
                </tr>
                <tr>
                  <th></th>
                </tr>
                <tr>
                  <th></th>
                </tr>
                <tr>
                  <th></th>
                </tr>
                <tr>
                  <th></th>
                </tr>
                <tr>
                  <th></th>
                </tr>
                <tr>
                  <th></th>
                </tr>
                <tr>
                  <th></th>
                </tr>
                <tr>
                  <th></th>
                </tr>
                <tr>
                  <th></th>
                </tr>
                <tr>
                  <th></th>
                </tr>
                <tr>
                  <th></th>
                </tr>
              </table>  
            </td>
          </tr>
        </table>
			</div>
    </div>

	<!-- Modal div -->
	<div id="reservation_modal" class="modal-dragscroll">
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
					<label>날짜</label>
				</dt>
				<dd style="margin-left: 150px; font-family: monospace;">
					<input type="date" name="" id="">
				</dd>
			</dl>
			<dl>
				<dt style="float: left;">
					<label>예약 시간</label>
				</dt>
				<dd style="margin-left: 150px;">
					<input type="time" name="" id=""> ~ <input type="time">
				</dd>
			</dl>
			<dl>
				<dt style="float: left;">
					<label>사용 용도</label>
				</dt>
				<dd style="margin-left: 150px;">
					<textarea name="" id="" cols="30" rows="10" style="resize: none;"></textarea>
				</dd>
			</dl>
		</div>
		<div style="text-align: center; margin-top: 50px;">
			<button class="close_btn"
				style="background: #fff; color: #2c86dc; padding: 5px 27px 6px; border: 1px solid #c8c8c8">확인</button>
			<button class="close_btn"
				style="padding: 5px 27px 6px; color: #444; letter-spacing: -1px; border: 1px solid #dadada; background: #dadada;">취소</button>
		</div>
	</div>

	<script>
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

		$('#content_table').on('click', function() {
			// 모달창 띄우기
			modal('reservation_modal');
		});
	</script>

</body>
</html>