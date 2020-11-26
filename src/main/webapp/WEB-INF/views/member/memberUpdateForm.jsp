<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원 정보 수정 </title>
	<link rel="stylesheet" href="<c:url value="/resources/css/memberUpdateForm.css"/>">
</head>

    
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
            	img.setAttribute("src", event.target.result); 
            	document.querySelector("div#imagePreview").appendChild(img); 
            	};
            	reader.readAsDataURL(event.target.files[0]); 
            	};
            
        </script>
		
</body>
</html>