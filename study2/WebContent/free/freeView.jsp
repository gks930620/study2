<%@page import="com.study.free.vo.FreeBoardVO"%>
<%@page import="com.study.free.service.FreeBoardServiceImpl"%>
<%@page import="com.study.free.service.IFreeBoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/inc/header.jsp"%>
<title>freeView.jsp</title>
</head>
<body>
<%@ include file="/WEB-INF/inc/top.jsp" %>
<div class="container">
 <% 
 	FreeBoardVO board = null;
	IFreeBoardService freeBoardService = new FreeBoardServiceImpl();
 	try {
 		int boNo = Integer.parseInt(request.getParameter("boNo")); 
 		freeBoardService.increaseHit(boNo);
	 	board = freeBoardService.getBoard(boNo);
	 	request.setAttribute("board", board);
	 } catch(Exception ex){
		 request.setAttribute("ex", ex);
	 }
 %>
	<div class="page-header">
		<h3>자유게시판 - <small>상세보기</small></h3>
	</div>
		<table class="table table-striped table-bordered">
			<tbody>
				<tr>
					<th>글번호</th>
					<td>${board.boNo}</td>
				</tr>
				<tr>
					<th>글제목</th>
					<td>${board.boTitle}</td>
				</tr>
				<tr>
					<th>글분류</th>
					<td>${board.boCategoryNm}</td>
				</tr>
				<tr>
					<th>작성자명</th>
					<td>${board.boWriter}</td>
				</tr>
				<!-- 비밀번호는 보여주지 않음  -->
				<tr>
					<th>내용</th>
					<td><textarea rows="10" name="boContent" class="form-control input-sm">${board.boContent}</textarea>	</td>
				</tr>
				<tr>
					<th>등록자 IP</th>
					<td>${board.boIp}</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>${board.boHit}</td>
				</tr>
				<tr>
					<th>등록일자</th>
					<td>
					<c:choose>
					<c:when test="${board.boModDate != null}">${board.boModDate}</c:when>
					<c:when test="${board.boModDate == null}">${board.boRegDate}</c:when>
					</c:choose>
					</td>
				</tr>
				<tr>
					<th>삭제여부</th>
					<td>${board.boDelYn}</td>
				</tr>
				<tr>
					<td colspan="2">
					  <div class="pull-left">
							<a href="freeList.jsp" class="btn btn-default btn-sm"> 
								<span class="glyphicon glyphicon-list" aria-hidden="true"></span>
								&nbsp;&nbsp;목록
							</a>
						</div>
						<div class="pull-right">
							<a href="freeEdit.jsp?boNo=${board.boNo}" class="btn btn-success btn-sm"> 
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
								&nbsp;&nbsp;수정
						  </a>
						</div>
					</td>					  
				</tr>
			</tbody>
		</table>
		
</div><!-- container -->
</body>
</html>






