<%@page import="com.study.free.vo.FreeBoardVO"%>
<%@page import="com.study.free.service.FreeBoardServiceImpl"%>
<%@page import="com.study.free.service.IFreeBoardService"%>
<%@page import="com.study.code.service.ICommonCodeService"%>
<%@page import="com.study.code.service.CommonCodeServiceImpl"%>
<%@page import="com.study.code.vo.CodeVO"%>
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
	<title>freeEdit.jsp </title>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp"%>
 <div class="container">	
	<h3>게시글 수정</h3>	
	<% 
	IFreeBoardService boardService = new FreeBoardServiceImpl();
	ICommonCodeService codeService = new CommonCodeServiceImpl();
 	List<CodeVO> cateList = codeService.getCodeListByParent("BC00");
 	request.setAttribute("cateList", cateList);
 	
 	try {
	 
	 	int boNo = Integer.parseInt(request.getParameter("boNo")); 
	 	FreeBoardVO board = boardService.getBoard(boNo);
	 	request.setAttribute("board", board);
	 } catch(BizNotFoundException ex){
		 request.setAttribute("ex", ex);
	 }
 %>
 <c:if test="${not empty ex}">
		<div class="alert alert-warning">
			해당 게시글이 존재하지 않습니다. <br>
			<a href="freeList.jsp?" class="btn btn-default btn-sm">
			<span class="glyphicon glyphicon-list" aria-hidden="true"></span>
			&nbsp;목록
			</a>
		</div>
	</c:if>	
	<c:if test="${empty ex}">
 
	<form action="freeModify.jsp" method="post" >
		<input name="boNo" value='${board.boNo}' type="hidden">
	<table class="table table-striped table-bordered">
		<tbody>
			<tr>
				<th>글번호</th>
				<td>${board.boNo}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${board.boWriter}</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="boPass" class="form-control input-sm" ></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="boTitle" class="form-control input-sm" value="${board.boTitle}" ></td>
			</tr>
			<tr>
				<th>분류</th>
				<td>
					<select name="boCategory" class="form-control input-sm" required="required">
					<option value="">-- 선택하세요--</option>					
					<c:forEach items="${cateList}" var="code">
						<option value="${code.commCd}" ${code.commCd eq code.commCd ? "selected='selected'": "" }>${code.commNm}</option>
					</c:forEach>
				</select>					
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" name="boContent" class="form-control input-sm">${board.boContent}</textarea></td>
			</tr>
			<tr>
				<th>등록 IP</th>
				<td>${board.boIp}</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${board.boHit}</td>
			</tr>
			<tr>
				<th>등록일자</th>
				<td>${board.boRegDate}</td>
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
		              <!-- 문제점 : 사용자가 입력박스에서 엔터를 치면 첫번째 submit의 formaction 방향으로 이동한다.  -->
		              <button type="submit"  formaction="freeDelete.jsp" class="btn btn-sm btn-danger"> 
		                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
		                &nbsp;&nbsp;삭제
		              </button>
		              <button type="submit" class="btn btn-sm btn-primary" > 
		                <span class="glyphicon glyphicon-save" aria-hidden="true"></span>
		                &nbsp;&nbsp;저장
		              </button>
				</td>
			</tr>
		</tbody>	
	</table>
	</form>
	</c:if>
</div>
</body>
</html>