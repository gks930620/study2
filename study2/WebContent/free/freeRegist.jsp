<%@page import="java.net.SocketException"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.net.NetworkInterface"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.study.free.service.FreeBoardServiceImpl"%>
<%@page import="com.study.free.service.IFreeBoardService"%>
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
	<title>freeRegist.jsp </title>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp"%>
 <div class="container">	
	<h3>회원등록</h3>		
	<jsp:useBean id="freeBoard" class="com.study.free.vo.FreeBoardVO" />
	<jsp:setProperty property="*" name="freeBoard" />
	<%
	IFreeBoardService freeBoardService = new FreeBoardServiceImpl();
		String ip = null;
	try {

		boolean isLoopBack = true;
		Enumeration<NetworkInterface> en;		
		en = NetworkInterface.getNetworkInterfaces();

		while(en.hasMoreElements()) {
			NetworkInterface ni = en.nextElement();
			if (ni.isLoopback())
				continue;

			Enumeration<InetAddress> inetAddresses = ni.getInetAddresses();
			while(inetAddresses.hasMoreElements()) { 
				InetAddress ia = inetAddresses.nextElement();
				if (ia.getHostAddress() != null && ia.getHostAddress().indexOf(".") != -1) {
					ip = ia.getHostAddress();
					System.out.println(ip);
					isLoopBack = false;
					break;
				}
			}
			if (!isLoopBack)
				break;
		}
	} catch (SocketException e) {
		e.printStackTrace();
	}
	
	try {
		freeBoard.setBoIp(ip);
		freeBoardService.registBoard(freeBoard);
		%>
		<div class="alert alert-success">
			<h4>등록 성공</h4>
			작성하신 글이 정상적으로 등록되었습니다.
		</div>
		<% 
	} catch(DaoDuplicateKeyException ex) {
		%>
			<div class="alert alert-warning">
				<h4>등록에 실패했습니다.</h4>
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