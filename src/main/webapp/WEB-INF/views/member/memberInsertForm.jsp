<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberjoin</title>
</head>

 <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
 <link href="https://fonts.googleapis.com/css?family=Lato:400,700)" rel="stylesheet">
<style>
	
	body {
            font-family: "Noto Sans KR", sans-serif;
            padding: 0px; margin: 0px;
            box-sizing:board-box;
            background:#EFEFEF;
		}
		
#joinbox {
            margin: auto;
            margin-top: 50px;
            margin-bottom:40px;
            width: 680px;
            height: 650px;
            text-align:center;
            background:white;
            border-radius: 10px;
            box-shadow: 0 0 10px #8E98A4;
            background:white;
          
        }
        
        #joinbox #title {
        	font-family: 'Lato', sans-serif;
        	font-size: 38px; color : #3E4247;
        
        }

    .joinForm {
        width: 700px;
    }

    input{
            border: none;
            border: 1px solid #477A8F;
           	font-size : 16px;
            margin-left: 20px;
            height: 25px;
           	
            border-radius: 3px;
            padding:0px 4px;
            
        }
        input:focus, button:focus {outline:none; }

		input[type="text"]span {
		font-family: 'Lato', sans-serif;
			}

        a {
            text-decoration: none;
            cursor: pointer;
            color : #3E4247;
            font-size: 20px ;
        }
        button{
            border : none;
            color: #477A8F;
            background: none;
            font-size: 20px ;
            cursor: pointer;
            border-radius: 3px;
             
        }
        
        span.guide{display:none; font-size:12px; top:12px; right:10px;}
		span.ok{color: #477A8F;}
		span.error{color:red;}
		
		span.guide1{display:none; font-size:12px; top:12px; right:10px;}
		span.ok1{color: #477A8F;}
		span.error1{color:red;}
		
    </style>
    
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<body>

  <div class="form" id="joinbox"> 
       		 <br> 
        	 아이디 등록 신청  <br>
            <span id="title"> Null Company </span> 
            <div>
                <div class="joinForm" align="center">
                    <form action="minsert.do" method="post" id="joinForm">
                       <table width="550" cellspacing="4">
                          <tr>
                             <td width="140">* 아이디</td>
                             <td>
                                <input type="text" name="id" id="userId" placeholder="아이디 중복 확인 " required> &nbsp; <span style="font-size:13px">@nullcompany.com</span> 
                                <!--  ajax 적용  -->
                                <span class="guide1 ok"> 사용 가능 </span>
                                <span class="guide1 error"> 사용 불가능 </span>
                                <input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0"/>
                                
                             </td>
                          </tr>
                          <tr>
                             <td>* 이름</td>
                             <td><input type="text" name="name" required></input> </td>
                          </tr>
                          <tr>
                             <td>* 비밀번호</td>
                             <td><input type="password" name="pwd"id="pwd" required></td>
                          </tr>
                          <tr>
                             <td>* 비밀번호확인</td>
                             <td><input type="password" name="pwd2" id="pwd2" required></td>
           
                          </tr>
                          <tr>
                             <td>&nbsp;&nbsp; 성별</td>
                             <td>
                                <input type="radio" name="gender" value="M">남
                                <input type="radio" name="gender" value="F">여
                             </td>
                          </tr>
                          <tr>
                             <td>*생년월일</td>
                             <td><input type="text" name="birth" placeholder="- 제외,숫자 8글자로 입력"required ></td>            
                          </tr>
                          <tr>
                             <td>*개인 이메일</td>
                             <td>
                             <input type="email" id="userEmail" name="email" placeholder="이메일 중복 확인" required>
                              <!--  ajax 적용  -->
                                <span class="guide1 ok1"> 사용 가능 </span>
                                <span class="guide1 error1"> 사용 불가능 </span>
                                <input type="hidden" name="emailDuplicateCheck" id="emailDuplicateCheck" value="0"/>
                             
                             </td>
                          </tr>
                          <tr>
                             <td>*휴대전화</td>
                             <td><input type="tel" name="phone" placeholder="- 포함해서 입력" required></td>
                          </tr>
                          
                          <tr>
                             <td>&nbsp;&nbsp;자택 주소</td>
                             <td>
                                <input type="text" name="post" class="postcodify_postcode5" size="6" placeholder="우편번호">
                                <button type="button" id="postcodify_search_button" style="font-size: 15px; ">검색</button>
                             </td>
                          </tr>
                          <tr>
                             <td></td>
                             <td><input type="text" name="address1" class="postcodify_address" placeholder="도로명 주소"></td>
                          </tr>
                          <tr>
                             <td></td>
                             <td><input type="text" name="address2" class="postcodify_extra_info" placeholder="상세 주소"></td>
                          </tr>

                          <tr>
                          <tr></tr><tr></tr>
                            <td></td><br> <td><input type="checkbox" required> 개인정보 수집/이용에 동의합니다.</td><br> 
                         
                          
                          <!-- jQuery와 Postcodify를 로딩한다. -->
                          <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
                          <script>
                             $(function(){
                                $("#postcodify_search_button").postcodifyPopUp();
                             });
                          </script>
              
                       </table>
                                <button onclick='return validate();'>등록 신청</button>
                                &nbsp;&nbsp;
                                <a href="index.do">이전으로 </a>
                    </form>
            </div>
            <br> <br>
  			 <p style="text-align:center; font-size:13px; color:#8E98A4;">Powered by Us  </p>  
        </div>
    
        <script> 
            function validate(){
                // 아이디 중복 체크 여부 
                if($("#idDuplicateCheck").val()==0){
                    alert("사용가능한 ID를 입력해주세요.");
                    $("#userId").focus();
                    return false;
                }else {
                    return true;
                }
            }
            
            $(function(){
                $("#userId").on("keyup",function(){
                    var userId = $(this).val();
                    // 3글자 이상부터 할거임 
                    if(userId.length < 4){
                        $(".guide").hide();
                        $("#idDuplicateCheck").val(0);
                        return; 
                    }
                    
                    $.ajax({
                        url:"idCheck.do",
                        data : {id:userId},
                        type: "post",
                        success:function(data){
                            if(data == "ok"){
                                $(".error").hide();
                                $(".ok").show();
                                $("#idDuplicateCheck").val(1);
                                
                            }else {
                                $(".ok").hide();
                                $(".error").show();
                                $("#idDuplicateCheck").val(0);
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
            
            function validate(){
                // 이메일 중복 체크 여부 
                if($("emailDuplicateCheck").val()==0){
                    alert("사용가능한 email을 입력해주세요.");
                    $("#userEmail").focus();
                    return false;
                }else {
                    return true;
                }
            }
            
            $(function(){
                $("#userEmail").on("keyup",function(){
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
            
            
        </script>
		</div>
</body>
</html>