<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>myInfoView</title>
	<link rel="stylesheet" href="<c:url value="/resources/css/memberInfo.css"/>">
</head>

    
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
                <div align="center">
                    <form action="mupdate.do" method="post" id="infoForm">
                       <table cellspacing="4" >
                       
                       	<tr>
                             <th width="100" >사번</th>
                             <td>
	                                ${ loginUser.memNo}
                             </td>
                          </tr>
                          <tr>
                             <th> 입사일 </th>
                             <td>
	                                ${ loginUser.enrollDate}
                             </td>
                          </tr>
                           <tr></tr><tr></tr><tr></tr>
                          <tr>
                             <th> 아이디 </th>
                             <td>
	                                ${ loginUser.id}
                             </td>
                          </tr>
                          <tr>
                           	 <th> 이름 </th>
                             <td>${ loginUser.name} </td>
                          </tr>
                          <tr>
                           	 <th> 부서 </th>
                             <td>${ loginUser.deptName }</td>
                          </tr>
                          <tr>
                             <th> 직급 </th>
                             <td>${ loginUser.rankName }</td>
                          </tr>
                          <tr>
                             <th> 생년월일 </th>
                             <td>${ loginUser.birth}</td>            
                          </tr>
                          <tr>
                             <th> 이메일 </th>
                             <td>
								${ loginUser.id} @nullcompany.com                             
                             </td>
                          </tr>
                          <tr>
                             <th> 개인 이메일 </th>
                             <td>
                             ${ loginUser.email}
                             </td>
                          </tr>
                          <tr>
                             <th> 휴대전화 </th>
                             <td> ${ loginUser.phone} </td>
                          </tr>
                          
                          <tr>
                          	 <th> 자택 주소 </th>
                             <td> ${ loginUser.address}
                             </td>
                          </tr>
                          
                          <tr> 
                             <th> 자기소개 </th>
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