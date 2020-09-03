<%@page import="com.study.exception.BizNotFoundException"%>
<%@page import="com.study.member.vo.MemberVO"%>
<%@page import="com.study.member.service.MemberServiceImpl"%>
<%@page import="com.study.member.service.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/inc/header.jsp" %>
	<title>memberView.jsp </title>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp"%>
 <div class="container">	
 <% 
	IMemberService memberService = new MemberServiceImpl();
 	try {
	 	String memId = request.getParameter("memId"); 
	 	MemberVO member = memberService.getMember(memId);
	 	request.setAttribute("member", member);
	 } catch(BizNotFoundException ex){
		 request.setAttribute("ex", ex);
	 }
 %>
	<h3>회원 상세 정보</h3>	
	<c:if test="${not empty ex}">
		<div class="alert alert-warning">
			해당 회원이 존재하지 않습니다. <br>
			<a href="memberList.jsp?" class="btn btn-default btn-sm">
			<span class="glyphicon glyphicon-list" aria-hidden="true"></span>
			&nbsp;목록
			</a>
		</div>
	</c:if>	
	<c:if test="${empty ex}">
	<table class="table table-striped table-bordered">
		<tbody>
			<tr>
				<th>아이디</th>
				<td>${member.memId}</td>
			</tr>
			<tr>
				<th>회원명</th>
				<td>${member.memName}</td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td>${member.memZip}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${member.memAdd1} ${member.memAdd2}
				</td>
			</tr>
			<tr>
				<th>생일</th>
				<td>${member.memBir}</td>
			</tr>
			<tr>
				<th>핸드폰번호</th>
				<td>${member.memHp}</td>
			</tr>
			<tr>
				<th>직업</th>
				<td>${member.memJobNm}, ${member.memJob}</td>
			</tr>
			<tr>
				<th>취미</th>
				<td>${member.memLikeNm}</td>
			</tr>			
			<tr>
				<th>마일리지</th>
				<td>${member.memMileage}</td>
			</tr>
			<tr>
				<th>탈퇴여부</th>
				<td>${member.memDelete}</td>
			</tr>
			<tr>
				<td colspan="2">
					<a href="memberList.jsp?" class="btn btn-default btn-sm">
					<span class="glyphicon glyphicon-list" aria-hidden="true"></span>
					&nbsp;목록
					</a>
					<%-- <%=request.getParameter("memId") %>, <%=memId %>, ${param.memId}, <%=rs.getString("mem_id") %> 다 똑같음 --%>
					<a href="memberEdit.jsp?memId=${param.memId}" class="btn btn-info btn-sm">
					<span class="glyphicon glyphicon-king" aria-hidden="true"></span>
					&nbsp;수정
					</a>
				</td>
			</tr>
		</tbody>	
	</table>
	</c:if>
</div>
</body>
</html>