<%@page import="com.study.exception.BizPasswordNotMatchedException"%>
<%@page import="com.study.free.service.FreeBoardServiceImpl"%>
<%@page import="com.study.free.service.IFreeBoardService"%>
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
	<title>freeBoardModify.jsp </title>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp"%>
 <div class="container">	
	<h3>회원 정보 수정</h3>		
	<jsp:useBean id="board" class="com.study.free.vo.FreeBoardVO" />
	<jsp:setProperty property="*" name="board" />
	<%
	out.print("널인가요: " + board);
		IFreeBoardService freeBoardService = new FreeBoardServiceImpl();
		try {
			freeBoardService.modifyBoard(board);
			
			%>
			<div class="alert alert-success">
				<h4>수정 성공</h4>
				게시물이 정상적으로 수정되었습니다.
			</div>
			<% 
		} catch(BizNotFoundException ex) {
			%>
				<div class="alert alert-warning">
					<h4>수정에 실패했습니다.</h4>
					올바르게 접근해주세요.
				</div>
			<% 
		} catch(BizPasswordNotMatchedException ex) {
			%>
				<div class="alert alert-warning">
					<h4>수정에 실패했습니다.</h4>
					등록시 입력한 비밀번호를 입력해주세요.
				</div>
		<% 
		} catch(BizNotEffectedException ex) {
			%>
			<div class="alert alert-warning">
				<h4>수정에 실패했습니다.</h4>
				아이디나 비밀번호를 확인해주세요.
			</div>
	<% 
	}
	%>
	<a href="freeList.jsp?" class="btn btn-default btn-sm">
		<span class="glyphicon glyphicon-list" aria-hidden="true"></span>
		&nbsp;목록
	</a>
</body>
</html>