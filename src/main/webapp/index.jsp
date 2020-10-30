<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Login</title>

 <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
 <link href="https://fonts.googleapis.com/css?family=Lato:400,700)" rel="stylesheet">
 
<style>
	
	  body {
            font-family: "Noto Sans KR", sans-serif;
            padding: 0px; margin: 0px;
            box-sizing:board-box;
            

        } 
        
        ::-webkit-scrollbar { display: none; }
        
     
	 #loginbox {
            margin: auto;
            width: 450px;
            height: 400px;
            text-align:center;
            background: #ffffffa4;
            border-radius: 10px;
         	box-shadow: 0px 0px 20px #5C6369;
          
        }
	
       input {
            border: none;
            border: 1px solid #3E4247;
            background: rgb(241, 241, 241);
            margin-bottom: 5px;
            width: 300px;
            height: 40px;
            border-radius: 3px;
            font-size: 18px;
            padding:4px 13px;
            
        }
        
        input[type="password"]{
        background:#C8CACC;}
        
        input:focus {outline:none; color:#477A8F; border:2px solid #477A8F;}
        button:focus {outline:none; background:#356478;}
      	button:hover {transition:  all 1s; background:#356478; }
        

        a {
            text-decoration: none;
            cursor: pointer;
            font-size: 15px;
            color:black;
        }
        button{
            border: none;
            color: white;
            background: #477A8F;
            font-size: 22px ;
            cursor: pointer;
            width: 328px;
            height: 55px;
            padding:4px 13px;
            margin-bottom: 7px;
            border-radius: 3px;
           
        }
        
        .form .logo,.logo, #title, button{
        font-family: 'Lato', sans-serif;
        }
        
        #title {
        color: #477A8F;
        font-weight:bold;}
        
      .jb-box { width: 100%; height: 100%; margin: 0px auto; position: relative; background:black; }
       video { width: 100%; height:100%;}
      .jb-text { position: absolute; top: 25%; width: 100%; }
      
</style>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script> 
</head>
<body>

	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	
     <div class="jb-box">
        <video muted autoplay loop>
       <source src="resources/images/login3.mp4" type="video/mp4"> 
          <strong>Your browser does not support the video tag.</strong>
        </video>
        <div class="jb-text">
            <div class="form" id="loginbox">
                <br>
                <span class="logo"> L O G I N </span> <br>
                <span  id="title" style="font-size: 40px;">    Null Company   </span> <br><br><br>
               <form action="login.do" method="post">
                <span class="text"></span> <input type="text" name="id" placeholder="ID" required> <br>
                <span class="text"></span> <input type="password" name="pwd" placeholder="PASSWORD" required> <br> <br> 
    			
                <button>  SIGN IN</button> <br>
                <a href="enrollView.do">아이디 등록 신청  </a> 
               
      			</form>
          </div>
         <p style="text-align:center; font-size:15px; color:black;">Powered by Us  </p>  
        </div>
        </div>
       <div style="background:black; color:#BABDC0; text-align:center;"> <span class="logo">  </span>    &nbsp; </div> 

</body>
</html>