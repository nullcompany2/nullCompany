<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 정보 관리</title>
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<link rel="stylesheet" href="<c:url value="/resources/css/modification-myinfo.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/younsu-subNavi.css"/>">

	<style> 
	body {
		overflow : scroll;
	}
	
	#infobox {
            margin: auto;
            margin-top: 50px;
            margin-bottom:40px;
            text-align:center;
            background:white;
            border-radius: 10px;
            background:white;
            margin-left : 50px;
        }
        

	 #infoForm table {
    	padding-top : 40px;
    	padding-bottom: 40px;
    }
    
    #infoForm table th ,
    #infoForm table tr
    {
    	text-align : left;
    }
    
   

    #infobox input{
            border: none;
            border: 1px solid #477A8F;
           	font-size : 16px;
            height: 25px;
            border-radius: 3px;
            padding:0px 7px;
            
        }
        
        textarea {
         border: none;
         border: 1px solid #477A8F;
         font-size : 16px;
          border-radius: 3px;
          padding:7px 7px;
        
        
        }
        input:focus, button:focus {outline:none; }

		

        #infobox a {
            text-decoration: none;
            cursor: pointer;
            color : #3E4247;
            font-size: 20px ;
        }
        #infobox button{
            border : none;
            color: #477A8F;
            background: none;
            font-size: 20px ;
            cursor: pointer;
            border-radius: 3px;
            margin-right : 10px;
          
        }
        
        #save {
          margin-left:-15%;
        }
        
        span.guide{display:none; font-size:12px; top:12px; right:10px;}
		span.ok{color: #477A8F;}
		span.error{color:red;}
		
		span.guide1{display:none; font-size:12px; top:12px; right:10px;}
		span.ok1{color: #477A8F;}
		span.error1{color:red;}
		
		
		#imgLabel {
		position:relative;
		width:130px;
		}
		
		#imagePreview img,
		#emp-photo {
		
		height : 130px;
		width : 130px;
		border-radius : 80px;
		cursor:pointer;
		transition: all ease 0.7s 0s;
		
		}
		
		#imagePreview img:hover,
		#emp-photo:hover {
		filter: brightness(40%);
		
		}
		
		#imagePreview #addText {
		position:absolute;
		display:none;
		top:42%;
		left:48%;
		color:white;
		transition: all ease 0.7s 0s;
		}
	</style>
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
			<!-- 내부 컨텐츠 -->
			<div class="contents">
				<!-- 컨텐츠 타이틀명 -->
				<div class="contents-title">
					<span class="ct1">내 정보 관리</span>
				</div>
				<!-- 수정창 -->
			<div class="form" id="infobox" style="overflow:scroll;">
			 <form action="mupdateGo.do" method="post" id="infoForm" enctype="multipart/form-data">
                        <div id="imagePreview"> 
                          <label id="imgLabel"><img src="${ loginUser.photo }" alt="" id="emp-photo"></label>  
							<div id="addText" > 파일 선택 </div>
						</div>
						
						<div class="filebox"> 
							<input type="file" id="ex_file" name="uploadPhoto" style="border:none; display:none; padding-left:60px;" onchange="changeImageFile(event);"/>
						</div>
						
               		 <div class="infoForm" >
                       <table width="500" cellspacing="4" >
                       
                       	<tr>
                              <th width="100">사번</th>
                             <td>
                             <input type="text" name="memNo" id="memNo" value="${ loginUser.memNo}" readonly>
	                               
                             </td>
                          </tr>
                          <tr> 
                           <th>입사일</th>
                             <td>
	                           <input type="text" name="enrollDate" id="enrollDate" value="${ loginUser.enrollDate}" readonly>
                             </td>
                          </tr>
                          <tr></tr><tr></tr><tr></tr>
                          <tr>
                          	 <th>아이디</th>
                             <td>
                             <input type="text" name="id" id="userId" value="${ loginUser.id }" readonly>
	                                
                             </td>
                          </tr>
                          <tr>
                          	 <th>이름</th>
                             <td> <input type="text" name="name" id="name" value="${ loginUser.name }" readonly> </td>
                          </tr>
                          <tr>
                          	 <th>부서</th>
                             <td>
                             <input type="text" name="deptName" id="deptName" value="${ loginUser.deptName }부" readonly>
                             </td>
                          </tr>
                          <tr>
                          	 <th>직급</th>
                             <td>
                             <input type="text" name="rankName" id="rankName" value="${ loginUser.rankName }" readonly>
                            </td>
                          </tr>
                          <tr>
                             <th>생년월일</th>
                             <td><input type="text" name="birth" id="birth" value="${ loginUser.birth}" readonly>
                             </td>            
                          </tr>
                          <tr>
                             <th>이메일</th>
                             <td>
                             <input type="email" name="comEmail" id="comEmail" value="${ loginUser.id}@nullcompany.com" size=30; readonly>
                             
                             </td>
                          </tr>
                          <tr>
                             <th>개인 이메일</th>
                             <td>
                             <input type="email" name="email" id="email" value="${ loginUser.email }">
                             <!--  ajax 적용  -->
                                <span class="guide1 ok1"> 사용 가능 </span>
                                <span class="guide1 error1"> 사용 불가능 </span>
                                <input type="hidden" name="emailDuplicateCheck" id="emailDuplicateCheck" value="0"/>
                             </td>
                          </tr>
                          <tr>
                             <th>휴대전화</th>
                             <td><input type="tel" name="phone" value="${ loginUser.phone }" required></td>
                          </tr>
                          
                          <tr>
                             <th>자택주소</th>
                             <td>
                                <input type="text" name="post" class="postcodify_postcode5" size="8" placeholder="우편번호" >
                                <button type="button" id="postcodify_search_button" style="font-size: 15px;">검색</button>
                             </td>
                          </tr>
                          <tr>
                             <td></td>
                             <td><input type="text" name="address1" class="postcodify_address" size="30" placeholder="도로명 주소"></td>
                          </tr>
                          <tr>
                             <td></td>
                             <td><input type="text" name="address2" class="postcodify_extra_info" size="30" placeholder="상세 주소"></td>
                          </tr>

                       	<tr>
                       		<th>자기소개</th>
                       		<td> <textarea rows="3" cols="23" name="myInfo" placeholder="자유롭게 입력해주세요.">${ loginUser.myInfo }</textarea> </td>
                       	 </tr>
                         
                          <!-- jQuery와 Postcodify를 로딩한다. -->
                          <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
                         
                          <script>
                             $(function(){
                                $("#postcodify_search_button").postcodifyPopUp();
                             });
                          </script>
                       </table>
                                <button  id="save" onclick='return validate();'>저장하기  </button>
                                <a href="minfo.do">이전으로 </a>
                    </form>
			
			</div>
                </div>
			</div>
		</div>
		
    </div>
    
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
			modal('my_modal');
		});
		$(document).ready(function(){
			$(".md-btn-cancel").click(function(){
				var result = confirm("휴가신청을 취소하시겠습니까?");
			})
		})
		
		<script> 
            function validate(){
                // 이메일 중복 체크 여부 
                if($("emailDuplicateCheck").val()==0){
                    alert("사용가능한 email을 입력해주세요.");
                    $("#email").focus();
                    return false;
                }else {
                    return true;
                }
            }
            
            $(function(){
                $("#email").on("keyup",function(){
                    var userEmail = $(this).val();
                    // 10글자 이상부터 할거임 
                    if(userEmail.length < 11){
                        $(".guide").hide();
                        $("#emailDuplicateCheck").val(0);
                        return; 
                    }
                    
                    $.ajax({
                        url:"emailCheck.do",
                        data : {email:userEmail},
                        type: "post",
                        success:function(data){
                            if(data == "ok"){
                                $(".error1").hide();
                                $(".ok1").show();
                                $("#emailDuplicateCheck").val(1);
                                
                            }else {
                                $(".ok1").hide();
                                $(".error1").show();
                                $("#emailDuplicateCheck").val(0);
                            }
                            
                        },
                        error:function(request,status,errorData){
                           alert("error code : " + request.status + "\n"
                                 + "message: " + request.responseText
                                 + "error : " + errorData);
                        }
                    });
                });
            });
            
         $('#imgLabel').mouseover(()=>{
        	 $('#addText').attr('style', "display:block;");
        	 
         });
         
         $('#imgLabel').mouseout(()=>{
        	 $('#addText').attr('style', "display:none;");
        	 
         });
            
            $('#imgLabel').click(()=>{
            	$('#ex_file').click();
            	
            });
            
            function changeImageFile(event) { 
            	var reader = new FileReader(); 
           
            	reader.onload = function(event) { 
            		 $('#imagePreview').empty();
            	var img = document.createElement("img"); 
            	var div = document.createElement("div"); 
            	img.setAttribute("src", event.target.result); 
            	document.querySelector("div#imagePreview").appendChild(img); 
            	};
            	reader.readAsDataURL(event.target.files[0]); 
            	};
            
        </script>
            
		<style>
		
			
			#my_modal {
				display: none;
				width: 900px;
				height: 500px;
				padding: 20px 60px;
				background-color: #fefefe;
				border: 1px solid #888;
				border-radius: 3px;
			}
	
			#my_modal .modal-close-btn {
				position: absolute;
				top: 10px;
				right: 10px;
			}
			/* .modal-dragscroll{
				overflow: auto;
			} */
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
			.md-tbl{
				width: 100%;
				border-top: solid 0.1px #477A8F;
				border-bottom: solid 0.1px #477A8F;
				border-collapse:collapse;
			}
			.md-btn{
				font-size: 17px;
				border: none;
				background-color: white;
				border-bottom: solid 0.1px #477A8F;
				border-bottom-right-radius: 2px;
				border-bottom-left-radius: 2px;
            }

            .md-tr{
                padding: 10px;
                text-align: left;
            }
            .md-ta{
                padding: 10px;
                
               
            }
            
            
		</style>
	<!-- Modal div -->
	<div id="my_modal" class="modal-dragscroll">
		<h4 style="color: #477A8F; margin-bottom: 30px;">휴가 신청 상세</h4>
		<table class="md-tbl" id="application-record">
            <thead style="background: #e8ecee;">
                <tr>
                    <th scope="col" rowspan="1" class="md-tr">이름</th>
                    <th scope="col" rowspan="2" class="md-tr">아이디</th>
                    <th scope="col" rowspan="2" class="md-tr">사유</th>
                    <th scope="col" rowspan="2" class="md-tr">기간</th>
                    <th scope="col" rowspan="2" class="md-tr">삭제일</th>
                </tr>
            </thead>
            <!-- 휴직자 추가시 리스트 -->
            <tbody>
                <tr>
                    <td class="md-ta">Name</td>
                    <td class="md-ta">ID</td>
                    <td class="md-ta">Reason</td>
                    <td class="md-ta">term</td>
                    <td class="md-ta">deleteDate</td>
                </tr>
            </tbody>
        </table>
		<div style="text-align: center; margin-top: 50px;">
			<span class="md-btn cursor md-btn-close" >닫기</span>
		</div>

		<a class="modal-close-btn cursor md-btn-close">X</a>
	</div>
    
</body>
</html>