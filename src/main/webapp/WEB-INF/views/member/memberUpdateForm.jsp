<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>

<style>
	
	body {
            font-family: "Noto Sans KR", sans-serif;
            padding: 0px; margin: 0px;
            box-sizing:board-box;
            background:#EFEFEF;
		}
		
	#infobox {
            margin: auto;
            margin-top: 50px;
            margin-bottom:40px;
            width: 600px;
            height: 890px;
            text-align:center;
            background:white;
            border-radius: 10px;
            box-shadow: 0 0 10px #8E98A4;
            background:white;
        }
        
        #infobox #title {
        	font-family: 'Lato', sans-serif;
        	font-size: 30px; color : #3E4247;
        
        }

	 #infoForm table {
    	padding-top : 40px;
    	padding-bottom: 40px;
    }
    
    .infoForm {
        width: 700px;
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

		input[type="text"]span {
		font-family: 'Lato', sans-serif;
			}

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
    
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<body>
	<c:import url="../common/header.jsp"/>

  <div class="form" id="infobox"> 
       		 <br> 
        	 <br>
            <span id="title"> 내 정보 수정 </span> <br><br>
                    <form action="mupdateGo.do" method="post" id="infoForm" enctype="multipart/form-data">
                        <div id="imagePreview"> 
                          <label id="imgLabel"><img src="${ loginUser.photo }" alt="" id="emp-photo"></label>  
							<div id="addText" > 파일 선택 </div>
						</div>
						
						<div class="filebox"> 
							<input type="file" id="ex_file" name="uploadPhoto" style="border:none; display:none; padding-left:60px;" onchange="changeImageFile(event);"/>
						</div>
						
               		 <div class="infoForm" align="center">
                       <table width="500" cellspacing="4" >
                       
                       	<tr>
                              <td width="100">사번</td>
                             <td>
                             <input type="text" name="memNo" id="memNo" value="${ loginUser.memNo}" readonly>
	                               
                             </td>
                          </tr>
                          <tr> 
                           <td >입사일</td>
                             <td>
	                           <input type="text" name="enrollDate" id="enrollDate" value="${ loginUser.enrollDate}" readonly>
                             </td>
                          </tr>
                          <tr></tr><tr></tr><tr></tr>
                          <tr>
                             <td>아이디</td>
                             <td>
                             <input type="text" name="id" id="userId" value="${ loginUser.id }" readonly>
	                                
                             </td>
                          </tr>
                          <tr>
                             <td>이름</td>
                             <td> <input type="text" name="name" id="name" value="${ loginUser.name }" readonly> </td>
                          </tr>
                          <tr>
                             <td>부서 </td>
                             <td>
                             <input type="text" name="deptName" id="deptName" value="${ loginUser.deptName }부" readonly>
                             </td>
                          </tr>
                          <tr>
                             <td>직급</td>
                             <td>
                             <input type="text" name="rankName" id="rankName" value="${ loginUser.rankName }" readonly>
                            </td>
                          </tr>
                          <tr>
                             <td>생년월일</td>
                             <td><input type="text" name="birth" id="birth" value="${ loginUser.birth}" readonly>
                             </td>            
                          </tr>
                          <tr>
                             <td>이메일</td>
                             <td>
                             <input type="email" name="comEmail" id="comEmail" value="${ loginUser.id}@nullcompany.com" size=30; readonly>
                             
                             </td>
                          </tr>
                          <tr>
                             <td>개인 이메일</td>
                             <td>
                             <input type="email" name="email" id="email" value="${ loginUser.email }">
                             <!--  ajax 적용  -->
                                <span class="guide1 ok1"> 사용 가능 </span>
                                <span class="guide1 error1"> 사용 불가능 </span>
                                <input type="hidden" name="emailDuplicateCheck" id="emailDuplicateCheck" value="0"/>
                             </td>
                          </tr>
                          <tr>
                             <td>휴대전화</td>
                             <td><input type="tel" name="phone" value="${ loginUser.phone }" required></td>
                          </tr>
                          
                          <tr>
                             <td>자택 주소 </td>
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
                       		<td> 자기 소개 </td>
                       		<td> <textarea rows="3" cols="23" name="myInfo" placeholder="자유롭게 입력해주세요."></textarea> </td>
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
		
</body>
</html>