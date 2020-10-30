<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${codenum == '-1' }">
	<c:forEach var="dept" items="${ deptList }" varStatus="deptN">
		<c:if test="${deptN.index == codenum || codenum == '-1'}">
		<th>
			<div class="ic-title" style="padding-top: 30px">
				<label class="H-personnel-organization">${ dept.deptName }</label>
			</div>
		<tr>
			<c:set var="i" value="0" />
			<c:set var="j" value="6" />
			<c:forEach var="mlist" items="${ mList }" varStatus="vst">
				<c:if test="${dept.deptNo eq mlist.deptNo}">
					<c:if test="${i == j }">
						<tr>
						<c:set var="i" value="0" />
					</c:if>
					<td>
						<!-- 사번을 가져가기위한 input -->
						
						<div class=" ic-emp-info cursor" onclick="forModal(${mlist.memNo})">
							<img src="${ mlist.photo }" alt="" class="emp-img">
							<div style="width: 180px;">
								<span class="emp-info">${ mlist.name }</span><br> <span
									class="emp-info">${ mlist.deptName }</span><br> <span
									class="emp-info">${ mlist.rankName }</span>
							</div>
						</div>
					</td>
					<c:set var="i" value="${i+1}" />
				</c:if>
			</c:forEach>
		</tr>
		</c:if>
		</th>
	</c:forEach>
	</c:if>
</body>
</html>