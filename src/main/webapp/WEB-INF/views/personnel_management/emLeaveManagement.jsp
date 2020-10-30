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
    <link rel="stylesheet" href="<c:url value="/resources/css/em-leave-management.css"/>">
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
			<!-- 세부 네비 시작 -->
            <c:import url="../common/personnelSubNavi.jsp"/>
            <!-- 세부 네비끝 -->

            <!-- 내부 컨텐츠 -->
            <div class="contents">
                <!-- 컨텐츠 타이틀명 -->
                <div class="contents-title">
                    <span class="ct1">직원 휴가 관리</span>
                </div>
                <!-- ---- -->
                <div class="contents-wrap drag-scrollbar" style="top: 50px;">
                    <div class="ic-navi">
                        <div href="" class="cate cursor" id="leave-status">올해 휴가 현황조회</div>
                        <div href="" class="cate cursor" id="reward-leave">포상휴가 생성</div>
                    </div>
    
                    <div id="show-leave-status" class="c-ic">
                        <form action="" style="float: right;">
                            <input type="text" name="" id="" class="search-emp">
                            <button class="search-btn cursor">검색</button>
                        </form>
                        <table class="l-table" id="leave-status-tbl">
                            <thead style="background: #e8ecee;">
                                <tr>
                                    <th scope="col" rowspan="2" class="tl">이름</th>
                                    <th scope="col" rowspan="2" class="tl">입사일</th>
                                    <th scope="col" rowspan="2" class="tl">올해생성</th>
                                    <th scope="col" colspan="2" class="tl">생성내역</th>
                                    <th scope="col" colspan="8" class="tl">사용현황</th>
                                    <th scope="col" rowspan="2" class="tl">잔여</th>
                                    <th scope="col" rowspan="2" class="tl sepa-line">수정 | 상세</th>
    
                                </tr>
                                <tr>
                                    <th scope="col" class="tl">정기</th>
                                    <th scope="col" class="tl">포상</th>
                                    <!-- 휴가 목록 리스트-->
                                    <th scope="col" class="ts">연차</th>
                                    <th scope="col" class="ts">포상</th>
                                    <th scope="col" class="ts">훈련</th>
                                    <th scope="col" class="ts">교육</th>
                                    <th scope="col" class="ts">경조사</th>
                                    <th scope="col" class="ts">병가</th>
                                    <th scope="col" class="ts">출산</th>
                                    <th scope="col" class="ts">무급</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="ta">신아라</td>
                                    <td class="ta">1992-12-28</td>
                                    <td class="ta">27</td>
                                    <td class="ta">25</td>
                                    <td class="ta">2</td>
                                    <!-- 휴가 목록 리스트 맞춰서 -->
                                    <td class="ta">0</td>
                                    <td class="ta">0</td>
                                    <td class="ta">0</td>
                                    <td class="ta">0</td>
                                    <td class="ta">0</td>
                                    <td class="ta">0</td>
                                    <td class="ta">0</td>
                                    <td class="ta">0</td>
                                    <!-- 여기까지 -->
                                    <td class="ta">27</td>
                                    <td class="ta sepa-line">
                                        <a href="#"id="detail-r-l" class="cursor" style="color: #477A8F;">수정</a> |
                                        <a href="#"id="detail-r-2" class="cursor" style="color: #477A8F;">상세</a>
                                    </td>
                                </tr>
                                
                            </tbody>
                        </table>
                    </div>	
                    <div id="show-reward-leave" class="c-ic">
                        <form action="">
                            <table class="re-l-tbl">
                                <tbody>
                                    <tr style="border-bottom: solid 0.1px #477A8F ;">
                                        <th scope="row" style="background: #e8ecee;padding: 10px;">대상자 선택</th>
                                        <td style="padding: 10px; float: left;">
                                            <span>대상자를 선택하세요</span>
                                            <a href="#"id="pick-em-1" class="cursor" style="color: #477A8F; margin-left: 20px;">선택하기</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" style="background: #e8ecee;padding: 10px;" >휴가일수</th>
                                        <td style="padding: 10px;">
                                            <h5 style="float: left; margin-bottom: 20px;">포상 휴가 일수를 입력한 후 '생성하기'를 클릭하세요.</h5>                                         
                                            <table class="re-l-list">
                                                <tr class="re-l-list-il">
                                                    <th class="re-l-list-ck-th" rowspan="2"><input type="checkbox" name="" id="All-chk"></th>
                                                    <th class="re-l-list-th" rowspan="2">이름</th>
                                                    <th class="re-l-list-th" rowspan="2">ID</th>
                                                    <th class="re-l-list-th" rowspan="2">부서</th>
                                                    <th class="re-l-list-th" rowspan="2">연차</th>
                                                    <th class="re-l-list-th sepa-line" colspan="2">포상</th>
                                                    
                                                </tr>
                                                <tr class="re-l-list-il">
                                                    <th class="re-l-list-th sepa-line">현재</th>
                                                    <th class="re-l-list-th">생성 후</th>
                                                    
                                                </tr>
                                                <!-- 리스트 -->
                                                <tr>
                                                    <td class="re-l-list-ck-td"><input type="checkbox" name="chk" id=""></td>
                                                    <td class="re-l-list-td">Han</td>
                                                    <td class="re-l-list-td">ys211</td>
                                                    <td class="re-l-list-td">인사</td>
                                                    <td class="re-l-list-td">25일</td>
                                                    <td class="re-l-list-td sepa-line">0일</td>
                                                    <td class="re-l-list-td" ><input type="text" name="" id="" style="width: 40px;">일</td>
                                                </tr>
                                            </table>
                                            <div style="text-align: left;margin-top: 10px;">
                                                <a href="#"id="delect-chk" class="cursor" style="color: #477A8F;">삭제</a>
                                            </div>                                               
                                        </td>                                    
                                    </tr>
                                </tbody>
                            </table>
                            
                            <div>
                                <input type="button" value="생성하기" class="save-btn cursor">
                            </div>
                        </form>
                    </div>
                </div>
                
            </div>

		</div>
	</div>
	<!-- Main -->
	<script>
		/* ic category */
		$("#leave-status").click(function(){
			$("#show-reward-leave").css("display","none")
			$("#show-leave-status").css("display","block")
			$("#leave-status").css("color","#477A8F")
			$("#reward-leave").css("color","black")
		})
		$("#reward-leave").click(function(){
			$("#show-leave-status").css("display","none")
			$("#show-reward-leave").css("display","block")
			$("#leave-status").css("color","black")
			$("#reward-leave").css("color","#477A8F")
		})
	</script>
	<!-- Modal -->
	
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
				.find('.md-btn-close')
				.on('click', function() {
					bg.remove();
					modal.hide();
				});
				
		}

		$('#detail-r-l').on('click', function() {
			// 모달창 띄우기
			modal('my_modal-1');
        });
        $('#detail-r-2').on('click', function() {
			// 모달창 띄우기
			modal('my_modal-2');
        });
        $('#pick-em-1').on('click', function() {
			// 모달창 띄우기
			modal('my_modal-3');
        });
        /* confirm 창 */
		$(document).ready(function(){
			$(".md-btn-save").click(function(){
				var result = confirm("저장하시겠습니까?");
            })
            	
        })
        $(function(){
            $("#modal-create-history").click(function(){
                $("#show-used-history").css("display","none")
                $("#show-create-history").css("display","block")
                $("#modal-create-history").css("color","#477A8F")
                $("#modal-used-history").css("color","black")
            })
            $("#modal-used-history").click(function(){
                $("#show-create-history").css("display","none")
                $("#show-used-history").css("display","block")
                $("#modal-create-history").css("color","black")
                $("#modal-used-history").css("color","#477A8F")
            })
            /* ic checkbox oneclick */
            $("#md-All-chk").click(function(){
                if($("#md-All-chk").prop("checked")){
                    $("input[name=md-chk]").prop("checked",true);
                }else{
                    $("input[name=md-chk]").prop("checked",false);
                }
            })
        })

    </script>
    <style>
        #my_modal-1 {
            display: none;
            width: 700px;
            height: 400px;
            padding: 20px 60px;
            background-color: #fefefe;
            border: 1px solid #888;
            border-radius: 3px;
        }
        #my_modal-2{
            display: none;
            width: 800px;
            height: 450px;
            padding: 20px 60px;
            background-color: #fefefe;
            border: 1px solid #888;
            border-radius: 3px;
        }
        #my_modal-3{
            display: none;
            width: 800px;
            height: 450px;
            padding: 20px 60px;
            background-color: #fefefe;
            border: 1px solid #888;
            border-radius: 3px;
        }

        #my_modal-1 .modal-close-btn {
            position: absolute;
            top: 10px;
            right: 10px;
        }
        #my_modal-2 .modal-close-btn {
            position: absolute;
            top: 10px;
            right: 10px;
        }
        #my_modal-3 .modal-close-btn {
            position: absolute;
            top: 10px;
            right: 10px;
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
        .md-ic-navi{
            margin-top: 30px;
            width:80%;
            height: 10%;
        }
        .md-tbl{
            width: 100%;
            border-top: solid 0.1px #477A8F;
            border-bottom: solid 0.1px #477A8F;
            border-collapse:collapse;
        }
        .md-l-table{
            margin-top: 20px;
            width: 100%;
            border-top: solid 0.1px  #477A8F;
            border-bottom: solid 0.1px #477A8F;
            text-align: center;
            border-collapse: collapse;

        }
        .modal-cate{
                
            float: left;
            width: 90px;
            margin-right: 20px;
            border-bottom: solid 0.1px #477A8F;
            border-bottom-right-radius: 10px;
            border-bottom-left-radius: 2px;
        }
        .md-tl{
            padding: 10px;
        }
        .md-tr{
            padding: 10px;
        }
        .md-ta{
            padding: 10px;
        }
        #modal-create-history{
            color: #477A8F;
        }
        #show-used-history{
            display: none;
        }
        .md-btn{
            margin-top: 10px;
            width: 70px;
            background: white;
            border: solid 0.1px #477A8f;
            border-radius: 5px;
            font-size: 15px;
            color: white;
            background: #477A8f;
        }
        .md-search-reward-pick{
            margin-bottom: 10px;
        }
        .md-search-btn{
            text-align: center;
            margin-bottom: 30px;
        }
    </style>
    <!-- 첫번째 modal -->
	<div id="my_modal-1" class="modal-dragscroll">
		<h4 style="color: #477A8F; margin-bottom: 30px;">직원 휴가일 수정</h4>
		<table class="md-l-table">
			<h4 style="font-weight:normal;">휴가 생성내역(<span>2019-12-28</span>~<span>2020-12-28</span>)</h4>
            <h5 style="font-weight:normal;">입사일 : (<span>1992-12-28</span>)</h5>
            <h5 style="font-weight:normal;">사원명 : (<span>ID</span>)</h5>
            <thead style="background: #e8ecee;">
                <tr>
                    <th scope="col" rowspan="2" class="md-tr">종류</th>
                    <th scope="col" rowspan="2" class="md-tr">현재</th>
                    <th scope="col" rowspan="2" class="md-tr">변경후</th>
                    <th scope="col" rowspan="2" class="md-tr">비고</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="md-ta">정기연차</td>
                    <td class="md-ta"><span>25</span></td>
                    <td class="md-ta"><input type="text" name="" id="" style="width: 30px;"></td>
                    <td class="md-ta"><input type="text" name="" id="" style="width: 100%;" placeholder="내용을 입력하세요."></td>
                </tr>
                <tr>
                    <td class="md-ta">포상</td>
                    <td class="md-ta"><span>2</span></td>
                    <td class="md-ta"><input type="text" name="" id="" style="width: 30px;"></td>
                    <td class="md-ta"><input type="text" name="" id="" style="width: 100%;" placeholder="내용을 입력하세요."></td>
                </tr>
            </tbody>
		</table>
		<div style="text-align: center; margin-top: 50px;">
			<input type="button" class="md-btn cursor md-btn-save" value="저장">
			<input type="button" class="md-btn cursor md-btn-close" style="margin-left: 50px;" value="닫기">
		</div>

		<a class="modal-close-btn cursor md-btn-close">X</a>
    </div>
    <!-- 2번째 modal -->
    <div id="my_modal-2" class="modal-dragscroll">
        <h4 style="color: #477A8F; margin-bottom: 30px;">휴가 상세</h4>
        <div class="md-ic-navi">
            <div href="" class="modal-cate cursor" id="modal-create-history">생성 내역</div>
            <div href="" class="modal-cate cursor" id="modal-used-history">사용 내역</div>
        </div>
        <!-- 생성내역 -->
        <div id="show-create-history">
            <h4 style="font-weight:normal;">휴가 생성내역(<span>2019-12-28</span>~<span>2020-12-28</span>)</h4>
            <h5 style="font-weight:normal;">입사일 : (<span>1992-12-28</span>)</h5>
            <h5 style="font-weight:normal;">사원명 : (<span>ID</span>)</h5>
            <table class="md-l-table" id="md-create-tbl">
                <thead style="background: #e8ecee;">
                    <tr>
                        <th scope="col" rowspan="2" class="md-tl">생성일</th>
                        <th scope="col" colspan="2" class="md-tl">생성 내역</th>
                        <th scope="col" rowspan="2" class="md-tl">내용</th>
                        <th scope="col" rowspan="2" class="md-tl">비고</th>
                    </tr>
                    <tr>
                        <th scope="col" class="ts">발생</th>
                        <th scope="col" class="ts">최종</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- 휴가 획득 리스트 -->
                    <tr>
                        <td class="md-ta">2020.09.17</td>
                        <td class="md-ta">25일</td>
                        <td class="md-ta">25일</td>
                        <td class="md-ta">정기 휴가</td>
                        <td class="md-ta">금년발생일(25), 최종연차(25)</td>
                    </tr>
                    <tr>
                        <td class="md-ta">2020.09.27</td>
                        <td class="md-ta">2일</td>
                        <td class="md-ta">27일</td>
                        <td class="md-ta">포상 휴가</td>
                        <td class="md-ta">포상(2), 최종연차(27)</td>
                    </tr>
                    <tr>
                        <td class="md-ta">2020.10.18</td>
                        <td class="md-ta">-2일</td>
                        <td class="md-ta">25일</td>
                        <td class="md-ta">포상 휴가</td>
                        <td class="md-ta">사유(-2), 최종연차(25)</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- 사용내역 -->
        <div id="show-used-history">
            <table class="md-tbl">
                <h4 style="font-weight:normal;">휴가 생성내역(<span>2019-12-28</span>~<span>2020-12-28</span>)</h4>
                <h5 style="font-weight:normal;">입사일 : (<span>1992-12-28</span>)</h5>
                <h5 style="font-weight:normal;">사원명 : (<span>ID</span>)</h5>
                <table class="md-l-table" id="md-used-tbl">
                    <thead style="background: #e8ecee;">
                        <tr>
                            <th scope="col" rowspan="2" class="md-tr">번호</th>
                            <th scope="col" rowspan="2" class="md-tr">신청자</th>
                            <th scope="col" rowspan="2" class="md-tr">휴가 종류</th>
                            <th scope="col" rowspan="2" class="md-tr">일수</th>
                            <th scope="col" rowspan="2" class="md-tr">기간</th>
                            <th scope="col" rowspan="2" class="md-tr">상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="md-ta">1</td>
                            <td class="md-ta">Shin</td>
                            <td class="md-ta">3</td>
                            <td class="md-ta">연차</td>
                            <td class="md-ta">2020-09-16 ~ 2020-09-18</td>
                            <td class="md-ta">결재완료</td>
                        </tr>
                    </tbody>
					<h5 style="font-weight:normal;">당해 간략 통계 : 연차() 포상() 교육() 경조사() 병가() 출산() 무급()</h5>
                </table>
            </table>
        </div>
        <div style="text-align: center; margin-top: 30px;">
			<input type="button" class="md-btn cursor md-btn-close" value="닫기">
		</div>
		<a class="modal-close-btn cursor md-btn-close">X</a>
    </div>
    <!-- 3번째 modal-pick-em -->
    <div id="my_modal-3" class="modal-dragscroll">
        <h4 style="color: #477A8F; margin-bottom: 30px;">포상휴가 대상자 설정</h4>
        <form action="">
            <div class="md-search-reward-pick">
                <dl>
                    <dt style="width: 100px; float: left;">입사일</dt>
                    <dd>
                        <input type="date" name="" id="">
                        ~
                        <input type="date" name="" id="">
                    </dd>
                </dl>
            </div>
            <div class="md-search-reward-pick">
                <dl>
                    <dt style="width: 100px; float: left;">이름 / 부서</dt>
                    <dd>
                        <input type="text" name="" id="">
                    </dd>
                </dl>
            </div>
            <div class="md-search-btn">
                <input type="button" value="검색" class="md-btn ">
            </div>
        </form>
        <table class="re-l-list">
            <tr class="re-l-list-il">
                <th class="re-l-list-ck-th" ><input type="checkbox" name="" id="md-All-chk"></th>
                <th class="re-l-list-th" >이름</th>
                <th class="re-l-list-th">ID</th>
                <th class="re-l-list-th" >부서</th>
                <th class="re-l-list-th">연차</th>
                <th class="re-l-list-th">포상</th>                
            </tr>

            <!-- 리스트 -->
            <tr class="re-l-list">
                <td class="re-l-list-ck-td"><input type="checkbox" name="md-chk" id=""></td>
                <td class="re-l-list-td">Han</td>
                <td class="re-l-list-td">ys211</td>
                <td class="re-l-list-td">인사</td>
                <td class="re-l-list-td">25일</td>
                <td class="re-l-list-td">0일</td>
            </tr>
            <tr class="re-l-list">
                <td class="re-l-list-ck-td"><input type="checkbox" name="md-chk" id=""></td>
                <td class="re-l-list-td">Han</td>
                <td class="re-l-list-td">ys211</td>
                <td class="re-l-list-td">인사</td>
                <td class="re-l-list-td">25일</td>
                <td class="re-l-list-td" >0일</td>
            </tr>
        </table>
		<div style="text-align: center; margin-top: 50px;">
			<input type="button" class="md-btn cursor md-btn-save" value="저장">
			<input type="button" class="md-btn cursor md-btn-close" style="margin-left: 50px;" value="닫기">
		</div>

		<a class="modal-close-btn cursor md-btn-close">X</a>
    </div>
</body>
</html>