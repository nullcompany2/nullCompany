<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myInfoView</title>
</head>
<style>
	
	body {
            padding: 0px; margin: 0px;
            box-sizing:board-box;
            background:#EFEFEF;
		}
		
	#infobox {
            margin: auto;
            margin-top: 50px;
            margin-bottom:40px;
            width: 600px;
            height: 750px;
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

    .infoForm {
        width: 700px;
    }
    
    #infoForm table {
    	padding-top : 40px;
    	padding-bottom: 40px;
    	
    	width : 600px;
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
            margin-left:-10%;
             
        }
        
        
        #emp-photo {
		height : 130px;
		width : 130px;
		border-radius : 80px;
		 margin-top:20px;
        }
       
    </style>
    
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<body>
	<c:import url="../common/header.jsp"/>

  <div class="form" id="infobox"> 
       		 <br> 
        	 <br>
            <span id="title"> 내 정보 관리 </span> 
   			<br>
   			<img src="${ loginUser.photo }" alt="" id="emp-photo">
            <div>
                <div class="infoForm" align="center">
                    <form action="mupdate.do" method="post" id="infoForm">
                       <table cellspacing="4" >
                       
                       	<tr>
                             <td width="100">사번</td>
                             <td>
	                                ${ loginUser.memNo}
                             </td>
                          </tr>
                          <tr>
                           <td >입사일</td>
                             <td>
	                                ${ loginUser.enrollDate}
                             </td>
                          </tr>
                           <tr></tr><tr></tr><tr></tr>
                          <tr>
                             <td>아이디</td>
                             <td>
	                                ${ loginUser.id}
                             </td>
                          </tr>
                          <tr>
                             <td>이름</td>
                             <td>${ loginUser.name} </td>
                          </tr>
                          <tr>
                             <td>부서 </td>
                             <td>${ loginUser.deptName }부</td>
                          </tr>
                          <tr>
                             <td>직급</td>
                             <td>${ loginUser.rankName }</td>
                          </tr>
                          <tr>
                             <td>생년월일</td>
                             <td>${ loginUser.birth}</td>            
                          </tr>
                          <tr>
                             <td>이메일</td>
                             <td>
								${ loginUser.id} @nullcompany.com                             
                             </td>
                          </tr>
                          <tr>
                             <td>개인 이메일</td>
                             <td>
                             ${ loginUser.email}
                             </td>
                          </tr>
                          <tr>
                             <td>휴대전화</td>
                             <td> ${ loginUser.phone} </td>
                          </tr>
                          
                          <tr>
                             <td>자택 주소</td>
                             <td> ${ loginUser.address}
                             </td>
                          </tr>
                          
                          <tr> 
                          	<td> 자기소개 </td>
                          	<td> ${ loginUser.myInfo } </td>
                          </tr>
                      
                       </table>
                       
                       <button onclick='return validate();'>수정하기</button>
                        <a href="home.do">메인으로 </a>
                    </form>
            </div>
        </div>
		</div>
</body>
</html>