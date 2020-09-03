<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/WEB-INF/inc/header.jsp" %>
<title>Insert title here</title>
</head>
<%
	// 현재 세션을 삭제하고 새로운 세션을 생성
	session.invalidate();
	// 세션을 무효화 한 이후에 속성, 세션 정보 등은 조회시 오류가 발생한다.
	// 무효화하고 리다이렉트로 현재 요청을 끝내야 함
	
%>
<body>
<%
	response.sendRedirect(request.getContextPath() + "/");
	// System.out.println(request.getContextPath());			// --> /study
%>
<%-- ↓ invalidate 하자마자 세션을 부르지 말라고 해서.. 주석처리 --%>
<%-- <%@include file="/WEB-INF/inc/top.jsp" %> --%>
<h3>정상적으로 로그아웃 되었습니다.</h3>

</body>
</html>
