<%@page import="com.study.common.util.CookieUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/WEB-INF/inc/header.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<%
		CookieUtils cookieUtils = new CookieUtils(request);
		String msg = request.getParameter("msg");
		
	//  34행 if문에 집어넣으면 하드코딩
	// String id = "malja";
	// String checked = "checked=\"checked\"";			// \"가 쌍따옴표
	
		String id="";
		String checked = "";
		
		if (cookieUtils.getValue("SAVE_ID") != null) {
			id = cookieUtils.getValue("SAVE_ID");
			checked = "checked='checked'";
		}
	%>
	<%@include file="/WEB-INF/inc/top.jsp"%>
	<div class="container">
		<form action="loginCheck.jsp" class="loginForm">
			<h2>로그인</h2>
			<%
				if (msg != null && !msg.isEmpty()) {
			%>
			<div>
				<p><%=msg%></p>
			</div>
			<%
				}
			%>

			<table class="table table-bordered">
				<tbody>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="userId"
							class="form-control input-sm" value="<%=id%>"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="userPass"
							class="form-control input-sm"></td>
					</tr>
					<tr>
						<td colspan="2"><label><input type="checkbox"
								name="rememberMe" value="Y" <%=checked%>> ID 기억하기</label></td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="submit" class="btn btn-primary btn-sm pull-right">로그인</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<!-- container -->
	
</body>
</html>