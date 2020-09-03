<%@page import="com.study.login.vo.UserVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">A Reum Home</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">게시판 <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="#">자유게시판</a></li>
                <li><a href="#">자료실</a></li>
                <li><a href="#">공지사항</a></li>
                <li class="divider"></li>
                <li class="dropdown-header">Nav header</li>
                <li><a href="#">Separated link</a></li>
                <li><a href="#">One more separated link</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">관리자 <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="<%=request.getContextPath()%>/member/memberList.jsp">회원관리</a></li>
              </ul>
            </li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
          <%
          	UserVO user = (UserVO)session.getAttribute("USER_INFO");
          
          	if(user == null) {
          %>
            <li><a href="<%=request.getContextPath() %>/login/login.jsp">로그인</a></li>
            <li><a href="<%=request.getContextPath() %>/join/join.jsp">회원가입</a></li>
          <%
          	} else {
          %>
            
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><%=user.getUserName()%>님 <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="#">
	                <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
	                &nbsp;&nbsp;My page
	                </a></li>
                <li><a href="#">
                	<span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
                	&nbsp;&nbsp;비밀번호 변경
                	</a></li>
                <li><a href="#">
                	<span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>
                	&nbsp;&nbsp;1:1 문의게시판
                	</a></li>
                <li class="divider"></li>
                <li><a href="<%=request.getContextPath() %>/login/logout.jsp">
                	<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                	&nbsp;&nbsp;로그아웃
                	</a></li>
              </ul>
            </li>
            <%
          		}
            %>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>		 		
	</ul>
</div>	




<!-- top.jsp -->
<%--
<div id="top-menu">
	<ul>
		<li class="home"><a href="<%=request.getContextPath() %>/index.jsp">Home</a>  
		<li>게시판 관리
		<li>회사 소개 <%=request.getParameter("age") %>
		<li><%=request.getParameter("result") %> 		
		<li><%=request.getParameter("likes") %>
		
		<%
			// 중요한 부분! object를 list로 타입 변환
			List<String> hate = (List)request.getAttribute("hate");
			for(String x : hate){
				out.println("<li>" + x);
			}
		%>
 --%>