<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자원 관리</title>
<c:import url="../common/header.jsp" />
<c:import url="../common/reservationSubNav.jsp" />
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">

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

.close_btn {
	cursor: pointer;
}
</style>

<body>

	<div class="contents">
		<div class="contents-title">
			<span class="ct1">자원 관리</span> 
			<select name="category" style="width:100px;height:30px; border:none;
      font-size:16px;color:#477A8F;">
				<c:forEach var ="c" items="${ c }">
					<option value="${c.rcNo }">${ c.rcTitle }</option>
				</c:forEach>
			</select>
		</div>

		<div style="padding: 0px 30px 0px 30px;">
			<div style="margin-top: 10px;">
				자원 목록 : <button class="rv_but" id="add" style="color: #779ec0; font-size: 16px; margin-top: 2px;">추가하기</button>
			</div>
			<table id="mrv_table">
				<thead>
					<tr>
						<th>자원 이름</th>
						<th>관리</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
		</div>
	</div>

	</div>

	<div id="delete_modal" class="modal-dragscroll">
		<h4 style="color: #477A8F; margin-bottom: 25px;">자원 삭제</h4>
		<div class="n-emp-i">자원을 삭제 하시겠습니까?</div>
		<div style="text-align: center; margin-top: 30px;">
			<form action="resourceDelete.do">
			<input type="hidden" id="rsNo" name="rsNo" value="">
			<button class="close_btn"
				style="background: #fc8e8e; color: black; padding: 5px 27px 6px; border: 1px solid #fc8e8e">확인</button>
			<button class="close_btn" type="button"
				style="padding: 5px 27px 6px; color: #444; letter-spacing: -1px; border: 1px solid #dadada; background: white;">취소</button>
			</form>
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

    $(document).on('click', '.delete_btn', function(){
        var num = $(this).data('id');
        $("#rsNo").val( num );
       // 모달창 띄우기
       modal('delete_modal');
    });
    
    $(document).on('click','.update_btn',function(){
    	var rsNo=$(this).val();
    	document.location.href="resourceUpdateView.do?rsNo="+rsNo;
    });
    $(function() {
	  getList();
	});
    
    $("select[name=category]").change(function() {
    	getList();
    });
    
    $("#add").on('click', function() {
    	 var rcNo = $("select[name=category]").val();
    	document.location.href="resourceInsertView.do?rcNo="+rcNo;
    });

   function getList(){
	   var rcNo = $("select[name=category]").val();
		$.ajax({
			url:"List.do",
			type:"post",
			data:{rcNo : rcNo},
			success:function(data){
 				console.log(data);
	            $tableBody = $("tbody");
	            $tableBody.html("");
	            
	            var $tr;
	            var $rsTitle;
	            var $btn;

				for(var i in data){
				$tr = $("<tr>");
				$rsTitle = $("<td>").text(data[i].rsTitle);
				$btn = $('<td><button class="rv_but update_btn" id="update_btn" value="'+data[i].rsNo+'">수정</button> <span style="color: #e4e4e4;">|</span> <button class="rv_but delete_btn" id="delete_btn"  data-id="'+data[i].rsNo+'">삭제</button>');
				$tr.append($rsTitle);
				$tr.append($btn);
				$tableBody.append($tr);
				}
				
			},error : function() {
				console.log("전송실패");
			} 
		})
   } 
   
 </script>
</body>
</html>