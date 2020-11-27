<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member join</title>
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
            height: 670px;
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
        
        span.guide,span.guide1{display:none; font-size:12px; top:12px; right:10px;}
		span.pwck{font-size:12px; top:12px; right:10px;}
		span.ok,span.ok1,span.pwdOk,span.phoneOk{color: #477A8F;}
		span.error,span.error1,span.pwdError,span.falsePWd,span.phoneError,span.phoneFormat{color:red;}
		
		 span.pwdlength, span.pwdImoji, span.pwdlengthMax{
			background : #477A8F;
			color :white;
			border-radius : 5px;
			padding : 3px;
		}
		
		span.pwdlength{
		margin-left: 20px;
		}
		
		input[type="radio"] { position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0; }
		input[type="radio"] + label { display: inline-block; position: relative; padding-left: 30px; cursor: pointer; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; }
	    input[type="radio"] + label:before { content: ''; position: absolute; left: 0; top: -4px; width: 18px; height: 18px; text-align: center; background: #fafafa; border: 1px solid #cacece; border-radius: 100%; box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05); }
        input[type="radio"] + label:active:before, input[type="radio"]:checked + label:active:before { box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1); }
        input[type="radio"]:checked + label:before { background: #E9ECEE; border-color: #adb8c0; }
        input[type="radio"]:checked + label:after { content: ''; position: absolute; top: 1px; left: 5px; width: 11px; height: 11px; background: #477A8F; border-radius: 100%; box-shadow: inset 0px 0px 10px rgba(0,0,0,0.3); }

		
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
                             <td><input type="password" name="pwd"id="pwd" required>
                              <span class="guide falsePWd">부적합한 비밀번호</span>
                             </td>
                          </tr>
                            <tr> <td> </td>
                            <td> 
                             	<span class="pwck pwdlength">6글자 이상</span>
                             	<span class="pwck pwdlengthMax">10글자 이하</span>
                                <span class="pwck pwdImoji">영문+숫자+특수문자</span>
                                <input type="hidden" name="pwdCheck" id="pwdLengthCheck" value="0"/>
                            </td>
                            </tr>
                          <tr>
                             <td>* 비밀번호확인</td>
                             <td><input type="password" name="pwd2" id="pwd2" required>
           					 <!--  ajax 적용  -->
                                <span class="guide pwdOk">비밀번호 일치</span>
                                <span class="guide pwdError">비밀번호 불일치</span>
                                <input type="hidden" name="pwdCheck" id="pwdCheck" value="0"/>
                             </td>
                             
                          </tr>
                          <tr></tr>
                          <tr>
                             <td>&nbsp;&nbsp; 성별</td>
                             <td>
                                <input type="radio" name="gender" value="M" id="m"><label for="m">남자</label> 
                                <input type="radio" name="gender" value="F" id="f"><label for="f">여자</label> 
                             </td>
                          </tr>
                          <tr>
                             <td>* 생년월일</td>
                             <td><input type="text" name="birth" placeholder="- 제외,숫자 8글자로 입력"required ></td>            
                          </tr>
                          <tr>
                             <td>* 개인 이메일</td>
                             <td>
                             <input type="email" id="userEmail" name="email" placeholder="이메일 중복 확인" required>
                              <!--  ajax 적용  -->
                                <span class="guide1 ok1"> 사용 가능 </span>
                                <span class="guide1 error1"> 사용 불가능 </span>
                                <input type="hidden" name="emailDuplicateCheck" id="emailDuplicateCheck" value="0"/>
                             
                             </td>
                          </tr>
                          <tr>
                             <td>* 휴대전화</td>
                             <td><input type="tel" name="phone" id="userPhone" placeholder="- 포함해서 입력" required>
                              <span class="guide phoneOk"> 사용 가능 </span>
                                <span class="guide phoneError"> 이미 존재하는 번호 </span>
                                <span class="guide phoneFormat"> 잘못된 형식의 번호 </span>
                                <input type="hidden" name="emailDuplicateCheck" id="phoneDuplicateCheck" value="0"/>
                             </td>
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
                    
                 // 이메일 중복 체크 여부  
                }else if($("#emailDuplicateCheck").val()==0){
                	 alert("사용가능한 email을 입력해주세요.");
                     $("#userEmail").focus();
                     return false;
                // 비밀번호 확인 체크 여부 
                }else if($("#pwdCheck").val()==0){
                	alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
                	$("#pwd2").focus();
                	return false;
                // 전화번호 중복 체크 여부 
                }else if($("#phoneDuplicateCheck").val()==0){
                	alert("이미 존재하는 전화번호입니다. 다시 입력해주세요.");
                	$("#userPhone").focus();
                	return false;
                // 전화번호가 유효하지 않은 형태이면 
                }else if($("#phoneDuplicateCheck").val()==2){
                	alert("유효하지않은 전화번호입니다. 다시 입력해주세요.");
                	$("#userPhone").focus();
                	return false;
                // 비밀번호가 조건에 부합하는지 
            	}else if($("#pwdLengthCheck").val() == 3){
                    return true;
                }
               
            }
            
            function chkPW(){

            	 var pw = $("#pwd").val();
            	 // 숫자 확인 
            	 var num = pw.search(/[0-9]/g);
            	 // 영어 확인 
            	 var eng = pw.search(/[a-z]/ig);
            	 // 특수문자 확인 
            	 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

            	 if(pw.length <= 10){
            		 $(".pwdlengthMax").css('background','lightgrey');
            		 $("#pwdLengthCheck").val(2);
            		 
            	 }else if(num != -1 && eng != -1 && spe != -1 ){
            		 $(".pwdImoji").css('background','lightgrey');
            		 $("#pwdLengthCheck").val(3);
            	 
            	 }
            	 	if($("#pwdLengthCheck").val() == 3) {
            		console.log("통과"); 
            	    return true;
            		
            	 }

            	}
            
            // 비밀번호에 길이가 맞으면 검사하러감  
            $(function(){
            	
            	$("#pwd").on("keyup",function(){
            		var pwd = $(this).val();
            		
            		if(pwd.length > 5) {
            			$(".pwdlength").css('background','lightgrey');
            			$("#pwdLengthCheck").val(1);
            			}else {
            				$(".pwdlength").css('background','#477A8F');
            				$("#pwdLengthCheck").val(0);
            		}
            			if($("#pwdLengthCheck").val() == 1){
            			chkPW();            		
            			}
            		
            		
            	})
            	
            });
            
            // 비밀번호 확인 과 비밀번호가 일치하는지 여부 
            $(function(){
            	
        
            	$("#pwd2").on("keyup",function(){
            		
            		var pwd2 = $(this).val();
            		var pwd = $("#pwd").val();
            		
            		if($("#pwdLengthCheck").val() == 3){
            			$(".falsePWd").hide();
            		if(pwd2.length = pwd.length){
            			if(pwd2 == pwd){
            				
            			    $(".pwdError").hide();
                            $(".pwdOk").show();
                            $("#pwdCheck").val(1);
                            
                        }else {
                            $(".pwdOk").hide();
                            $(".pwdError").show();
                            $("#pwdCheck").val(0);
                        }
            	      }
            		}else {
            			$(".falsePWd").show();
            			$("#pwd").focus();
            			
            		}
            		
            	})
            	
            	
            });
            
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
                        	 console.log("아이디 중복 체크 오류");
                        }
                            
                        
                    });
                });
            });
            
            // 이메일 중복 검사 
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
                         console.log("이메일 중복 체크 오류");
                        }
                    });
                });
            });
            
            // 전화번호 중복 체크 검사 
            $(function(){
            	
            	$("#userPhone").on("keyup",function(){
            		var userPhone = $(this).val();
            		
            		 if(userPhone.length > 9){
            			 // 번호 형식이 유효한지  검사 한번 해주고 
                      var phoneFormat = /^\d{3}-\d{3,4}-\d{4}$/;
                     	 if(!phoneFormat.test($("input[id='userPhone']").val())){
                    	  $(".phoneFormat").show();
                    	  $("#phoneDuplicateCheck").val(2);
                      }else{
                    	  $(".phoneFormat").hide();
                    	  $("#phoneDuplicateCheck").val(0);
                      	}
                     }
            		 if($("#phoneDuplicateCheck").val()== 0 && userPhone.length > 9){
            		$.ajax({
            			url:"phoneCheck.do",
            			data : {phone:userPhone},
            			type : "post",
            			success:function(data){
            				if(data == "ok"){
            					 $(".phoneFormat").hide();
            					 $(".phoneError").hide();
                                 $(".phoneOk").show();
                                 $("#phoneDuplicateCheck").val(1);
            					
            				}else {
                                $(".phoneOk").hide();
                                $(".phoneError").show();
                                $("#phoneDuplicateCheck").val(0);
                            }
            				
                        },error:function(){
                         console.log("번호 중복 체크 오류");
                        }
                    });
            		 }
                });
            });
            
        </script>
		</div>
</body>
</html>