<!DOCTYPE html>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.spring.mvc.vo.BoardVO"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link type="text/css" rel="stylesheet" href="../assets/plugins/css/bootstrap/css/bootstrap.min.css" >
<script	type="text/javascript"	src="../assets/plugins/jquery/1.11.0/jquery.min.js"></script>
<script	type="text/javascript"	src="../assets/plugins/css/bootstrap/js/bootstrap.min.js"></script>
<!-- <script type="text/javascript" src="../module_js/board.js"></script> -->
<script type="text/javascript" src="../js/board.js"></script>


<style>
  /* Note: Try to remove the following lines to see the effect of CSS positioning */
  .affix {
      top: 0;
      width: 100%;
  }

  .affix + .container-fluid {
      padding-top: 70px;
  }
  
.glyphicon.glyphicon-picture{
    font-size: 20px;
}
  .modal-header, h4, .close {
      background-color: #5cb85c;
      color:white !important;
      text-align: center;
      font-size: 30px;
  }
  .modal-footer {
      background-color: #f9f9f9;
  }
  

</style>

<title>Main</title>

</head>
  
<body>
	<div id="changeFBTableList">
		<h3 class="text-left">Board</h3>

		<div class="col-sm-12">&nbsp;</div>
		<!-- 게시판 리스트 출력 -->
		<table class="table table-hover">
			<thead>
				<tr>
					<th width="100px">No</th>
					<th width="500px">Title</th>
					<th width="200px">Writer</th>
					<th width="150px">Regdate</th>
					<th width="50px">hit</th>
				</tr>
			</thead>
			<tbody>
				<% List<Map<String,Object>> boardList = (List)request.getAttribute("boardList"); %>
				
					<%if(boardList.size() == 0){%>
					<tr>
						<td colspan="5">등록된 글이 없습니다.</td>
					</tr>
					<% }else{%>
					<%for(int i= 0; i < boardList.size(); i++){
						String getDate = boardList.get(i).get("M_DATE").toString().substring(0, 16);
					%>
					<tr style="text-align: left;">
						<td><%=boardList.get(i).get("M_BOARDSEQ") %></td>
						<td><a data-target="#myModal" data-toggle="modal" href="#myModal" onclick="boardAjax(<%=boardList.get(i).get("M_BOARDSEQ") %>)" style="color: #FAF4C0;"><%=boardList.get(i).get("M_TITLE") %></a></td>
						<td><%=boardList.get(i).get("M_USERID") %></td>
						<td><%=getDate %></td>
						<td><%=boardList.get(i).get("M_COUNT") %></td>
					</tr>
					<% } %>
					<%} %>
			</tbody>
		</table>
		<!-- 게시판 끝 -->
		<!-- 페이지 넘김 처리! -->
		<div align="center">
			<ul class="pagination" style="margin: center;">
				<!-- <li><a href="javascript:fprevPage('', '', '')"  id="preBtn">Prev</a></li> -->
				${pagingHtml}
				<!-- <li><a href="javascript:fnextPage('', '', '')" id="nextBtn">Next</a></li> -->
			</ul>
		</div>
		<div class="col-md-12 col-sm-12 container" id ="changeSearch">
				<!-- 검색어 입력란 -->
				<div class="col-xs-3" style="float: right;">
					<div class="input-group">
						<input type="text" class="form-control" size="10" id="fb_searchinput" placeholder="Search Text" required >
						<div class="input-group-btn">
							<button type="button" class="btn" style="background-color: #6799FF;color: white;" onclick="boardSearchCk()">Search</button>
						</div>
					</div>
				</div>
				<!-- 검색 콤보 박스 -->
				<div class="dropup" style="float: right;">
	
					<select class="form-control" id="fb_category">
						<optgroup label="Choice">
							<option value="ALL">ALL</option>
							<option value="NAME">Writer</option>
							<option value="TITLE">Title</option>
							<option value="CONTENT">Content</option>
						</optgroup>
					</select>
				</div>
	
			<!-- 글쓰기 이동 -->
			<div style="float: left;">
				<button type="button" class="btn" style="background-color: #6799FF;color: white;" data-target="#myModal" data-toggle="modal" onclick="clearWriteStatus()">
					Write
				</button>
			</div>
		</div>
	</div>
	<%--  다른방식
	<table style="border:1px solid #ccc">
	    <colgroup>
	        <col width="10%"/>
	        <col width="*"/>
	        <col width="15%"/>
	        <col width="20%"/>
	    </colgroup>
	    <thead>
	        <tr>
	            <th scope="col">글번호</th>
	            <th scope="col">제목</th>
	            <th scope="col">조회수</th>
	            <th scope="col">작성일</th>
	        </tr>
	    </thead>
	    <tbody>
	        <c:choose>
	            <c:when test="${fn:length(boardList) > 0}">
	                <c:forEach items="${boardList}" var="row">
	                    <tr>
	                    <!-- 쿼리상의 대소문자를 구분한다. board_SQL.xml의 IDX가 대문자로 되어있음 -->
	                        <td>${row.IDX}</td>
	                        <td>${row.TITLE}</td>
	                        <td>${row.COUNT}</td>
	                        <td>${row.DATE}</td>
	                    </tr>
	                </c:forEach>
	            </c:when>
	            <c:otherwise>
	                <tr>
	                    <td colspan="4">조회된 결과가 없습니다.</td>
	                </tr>
	            </c:otherwise>
	        </c:choose>
	    </tbody>
	</table> --%>
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-content" style="width: 60%;margin: auto;margin-top: 10%">
		<div class="modal-header" style="padding:35px 50px;background-color: #6799FF;">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 style="background-color: #6799FF;"><span class="glyphicon glyphicon-file" ></span>&nbsp;Board Content</h4>
			<input type="hidden" value="insertContent" id = "contentStatus">
			<input type="hidden" name="m_boardseq" id="m_boardseq">
		</div>
		<div class="modal-body" style="padding:20px 50px;">
			<form role="form" id="boardContentForm" method="post"><!--  enctype="multipart/form-data" -->
				<input type="hidden" id ="m_userid" name="m_userid" value="test">
				<div class="form-group">
					<label for="usrname"><span class="glyphicon glyphicon-user"></span> Title</label>
					<input type="text" class="form-control" id="m_title" name="m_title" placeholder="Enter Title">
				</div>
				<div class="form-group">
					<label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Content</label>
					<textarea class="form-control" id="m_content" rows="8" name="m_content" placeholder="Enter Content" ></textarea>
				</div>
				<input type="hidden" name="m_date" id="m_date">
			</form>
        </div>
		<div class="modal-footer">
		<button type="submit" class="btn btn-default pull-left" style="background-color: #6799FF;color: white;" data-dismiss="modal" id="saveBtn" onclick="boardWriteAjax()">Save</button>
		<button type="submit" class="btn btn-danger btn-default pull-right" data-dismiss="modal" onclick="clearWriteStatus()"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
		</div>
	</div>
</div>
	
</body>
</html>
	