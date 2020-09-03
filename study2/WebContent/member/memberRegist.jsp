<%@page import="java.sql.SQLException"%>
<%@page import="com.study.exception.BizDuplicateKeyException"%>
<%@page import="com.study.exception.DaoDuplicateKeyException"%>
<%@page import="com.study.exception.BizNotFoundException"%>
<%@page import="com.study.exception.BizNotEffectedException"%>
<%@page import="com.study.member.service.MemberServiceImpl"%>
<%@page import="com.study.member.service.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/inc/header.jsp" %>
	<title>memberList.jsp </title>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp"%>
 <div class="container">	
	<h3>회원등록</h3>		
	<jsp:useBean id="member" class="com.study.member.vo.MemberVO" />
	<jsp:setProperty property="*" name="member" />
	<%
	IMemberService memberService = new MemberServiceImpl();
	try {
		memberService.registMember(member);
		%>
		<div class="alert alert-warning">
			<h4>등록 성공</h4>
			정상적으로 회원등록되었습니다.
		</div>
		<% 
	} catch(BizDuplicateKeyException ex) {
		%>
			<div class="alert alert-warning">
				<h4>등록에 실패했습니다.</h4>
				이미 존재하는 아이디입니다.
			</div>
		<% 
	}
	%>
	<a href="memberList.jsp?" class="btn btn-default btn-sm">
		<span class="glyphicon glyphicon-list" aria-hidden="true"></span>
		&nbsp;목록
	</a>
</body>
</html>