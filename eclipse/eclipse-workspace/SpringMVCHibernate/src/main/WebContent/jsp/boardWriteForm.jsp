<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="container-fluid body-style">

	<div class="container">
		<h3 class="text-left">Write</h3>
		<p class="text-left">
		<em>글쓰기</em>

		</p>
		<div class="col-sm-12">&nbsp;</div>
		<div class="row test">
			<legend style="margin-left:15px">글쓰기</legend>
			<div class="col-md-8">

				<form name="freeBoardValueForm" id="freeBoardValueForm" action="/sample/fileUploadAjax.do"enctype="multipart/form-data" method="post">
					<!-- 아이디 입력 -->
					<div class="form-group">
						<label class="control-label col-sm-2" for="fb_title">제목</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" placeholder="Enter Title" 
								id="fb_title" name="fb_title" >
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2" for="fb_name">작성자</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" placeholder="Enter Name" 
								id="fb_name" name="fb_name" >
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2" for="fb_content">내용</label>
						<div class="col-sm-10">
							<textarea rows="13" cols="20" class="form-control" placeholder="Enter Content" 
							id="fb_content" name="fb_content"></textarea>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2" for="fb_pass">비밀번호</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" placeholder="Enter Pass" 
								id="fb_pass" name="fb_pass">
						</div>
					</div>
					
					
 					<div class="form-group">
						<label class="control-label col-sm-2" for="fb_pass">파일 첨부</label>
						<div class="col-sm-10" >
							<span id="addInput">
							<input type="file" class="btn btn-primary pull-left" name="freeboardUpload" id="freeboardUpload"
								onchange="readURL(this)"
								accept="image/*" style="background-color: black; height: 40px;" >
							</span>
						</div>
					</div> 

				</form>

				<div class="row">
					<div class="col-md-12 form-group">
						<div class="col-sm-12">&nbsp;</div>
					<button type="button" class="btn btn-primary pull-right"  id = "bt_fbWrtie" name ="bt_fbWrtie" 
						onclick="inputFreeBoard()"
						style="background-color: black;">등 록</button>
						<div style="float: left;">
						<!-- 취소 버튼 -->
							<button type="button" class="btn btn-default pull-right"
								onclick="fbUpdateCancel(1,'','')">Cancel</button>
						</div>
					</div>
				</div>
			</div>

			<!-- 등록된 이미지 보기 -->
			<div style="float: right;">
				<div><label for="title" style="margin-left: 30px">Image View</label></div>
				<div class="col-sm-12">&nbsp;</div>
				<span id="preview"></span>
			</div>					
		</div>

	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</div>