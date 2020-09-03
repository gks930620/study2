<%@page import="com.study.common.util.CookieUtils"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.study.login.vo.UserVO"%>
<%@page import="com.study.common.util.UserList"%>
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
<title>14/ loginCheck.jsp</title>
</head>
<body>
	<%
	String id = request.getParameter("userId");
	String pw = request.getParameter("userPass");
	String remember = request.getParameter("rememberMe");
	
	// 1. id, pw가 null인지 체크
	// 	  <jsp_forward , msg parameter에 "ID 또는 비밀번호가 비었습니다."
	
	if(id == null || id.isEmpty() || pw == null || pw.isEmpty()) {
		%>
		<jsp:forward page="login.jsp">
			<jsp:param name="msg" value="ID 또는 비밀번호가 비었습니다." />
		</jsp:forward>
		<%
	}
	
	// 2. UserList에 넘겨진 id가 존재하는지 조회를 통해 확인
	
	UserList users = new UserList();
	UserVO user = users.getUser(id);
	
	// 2.1 조회된 객체가 null이면
	//	   현재 화면에 "해당 회원은 존재하지 않습니다."
	if (user ==null) {
		%>
		<h3>해당 회원은 존재하지 않습니다.</h3>
		<a href="#" class="btn btn-default" onclick="history.go(-1)">뒤로가기</a>
		<%
	} else {
		// 2.2 조회된 객체가 존재하고 pw가 맞으면	(로그인 성공)
		if(user.getUserPass().equals(pw)) {
			
			// 로그인에 성공했고, rememberMe 파라미터가 존재하고 값이 "Y" 이면
			// 쿠키 생성. 쿠키 이름은 "SAVE_ID"로 해서 로그인 아이디를 저장해라.
			if (remember != null && remember.equals("Y")){
				// CookieUtils SAVE_ID = new CookieUtils(request.getParameter(id,pw));
				Cookie cookie = CookieUtils.createCookie("SAVE_ID",id, "/", 60*60*24*31);
				response.addCookie(cookie);
				
			} else {
				Cookie cookie = CookieUtils.createCookie("SAVE_ID","","/",0);
			} 
			
			// 현재 사용자정보(UserVO)를 세션에 저장
			// 브라우저를 끄지 않는 동안은 세션에 저장되어 있음
			System.out.println("세션에 정보 저장: " + user);
			session.setAttribute("USER_INFO", user);
			
			// response.sendRedirect 사용해서 "/" 또는 "/index.jsp" 로 이동
			response.sendRedirect(request.getContextPath());
			
		} else {
			// 2.3 조회된 객체가 존재하고 pw가 틀리면
			// pageContext의 forward 사용해서 "비밀번호를 확인해 주세요."
			pageContext.forward("login.jsp?mag=비밀번호를 확인해 주세요.");
		}
	}
	
	
	%>
	
	<%=id %>, <%=pw %>
</body>
</html>