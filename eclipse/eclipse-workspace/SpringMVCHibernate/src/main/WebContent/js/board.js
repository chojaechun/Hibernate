/**
 * search 기능 ( pageNum, pageCont, textField 도 함께 가지고와서 select ) OK
hit 기능 생성
글 삭제 기능 Delete N 체크만 하도록
session 기능 생성
회원가입 로그인 로그아웃 ( trim 체크 id 체크 )
회원만 글 작성 ( 글 등록 버튼시 user check, 글 작성 버튼시 user check )
회원 정보 일치시 수정 및 삭제 기능


admin 생성
admin 게시글 삭제 기능 if admin and userId
Delete Y 인 경우 color red 변경 ( admin 만 select 가능하게끔 )
Delete Y 인 경우 button을 Real Delete 로 변경 ( admin 만 )
 * 
 * 
 * JSON 화 : JSON.stringify(formJson)
 * OBJECT 선언 : var boardJson = new Object();
 * 		OBJECT 변수 선언 : boardJson.m_title = 'aa';
 * 전체 URL GET : console.log("url : "+$(location).attr('protocol')+"//"+$(location).attr('host')+""+$(location).attr('pathname')+""+$(location).attr('search'));
 * 
	
 * 
 */

$(document).ready(function(){
	var pageNum = '';
	var keyWord = '';
	var keyField = '';
	
	var path = decodeURI($(location).attr('search'),'utf-8');
	console.log(path);
	var pathField = path.split('&');
	
	for(var i =0; i<pathField.length; i++){
		var k = pathField[i].split('=');
		if(k[0] == '?pageNum' || k[0] == 'pageNum' ){pageNum = k[1];}
		if(k[0] == '?keyWord' || k[0] == 'keyWord' ){keyWord = k[1];}
		if(k[0] == '?keyField' || k[0] == 'keyField' ){keyField = k[1];}
	}

	var t_keyWord = $('#fb_category').val();
	if(keyWord == '' || keyWord == undefined || keyWord == 'null'){keyWord = 'ALL';}
	
	$('#fb_category').val(keyWord);
	$('#fb_searchinput').val(keyField);
	
});

function boardAjax(getContSeq){
	console.warn(getContSeq);
	var userSeq = {"userSeq": getContSeq};
    $.ajax({
        url:'getBoardContent.do',
        contentType: "application/json",
        type:'GET',
        data: userSeq,
        success:function(data){
        	console.log(data);
            $('#m_title').val(data.m_title);
            $('#m_content').val(data.m_content);
            $('#m_date').val(data.m_date);
            $('#m_boardseq').val(data.m_boardseq);
            $('#contentStatus').val('modifyContent');
            $('#saveBtn').text('Modify');
        },
        error:function(jqXHR, textStatus, errorThrown){
        	alert("error \n" + textStatus + " : " + errorThrown);
        	self.close(); // alert 창 닫는 메서드 self 는 자신 , window.close()는 현재 보고있는 창 close
        }
    });
}

//form serializeArray() data를 json 으로 변환
function objectifyForm(formArray) {//serialize data function

	var returnArray = {};
	for (var i = 0; i < formArray.length; i++){
		returnArray[formArray[i]['name']] = formArray[i]['value'];
	}
	return returnArray;
}

function clearWriteStatus(){
	$('#contentStatus').val('insertContent');
    $('#m_title').val('');
    $('#m_content').val('');
    $('#m_date').val('');
    $('#m_boardseq').val('');
	$('#saveBtn').text('Save');
}

function boardWriteAjax(){
	/** 
	 * 여기서 중요한 사실 한가지
	 * serialize()는 name을 참고하기 때문에 view에서 name 을 지정해주어야 한다.
	 * */ 
	var formData = $("#boardContentForm").serializeArray();
	var formJson = objectifyForm(formData);
	var formUrl = 'boardWrite.do';
	
	var t_keyWord = $('#fb_category').val();
	var t_keyField = $('#fb_searchinput').val();
	
	// modify
	if($('#contentStatus').val() == 'modifyContent'){
		formUrl = 'boardModify.do?m_boardseq='+$('#m_boardseq').val(); // 추후 update 문 url
	}
	
	$.ajax({
        url:formUrl,
        data : JSON.stringify(formJson),
        //dataType: "json", // 쓰지말것 에러남 Parsererror: Syntaxerror:Unexpected Token S in JSON at position 0
        contentType:'application/json; charset=utf-8',
        type:'POST',
        success:function(result){
        	console.log(result);
        	location.reload();
        },
        error:function(jqXHR, textStatus, errorThrown){
            alert("error \n" + textStatus + " : " + errorThrown);
            console.warn(jqXHR.responseText);
          // self.close(); // alert 창 닫는 메서드 self 는 자신 , window.close()는 현재 보고있는 창 close
        }
    });
	
}

function boardSearchCk(){
	
	var t_keyWord = $('#fb_category').val();
	var t_keyField = $('#fb_searchinput').val();
	
	var hrefPath = $(location).attr('protocol')+'//'+$(location).attr('host')+''+$(location).attr('pathname');
	hrefPath +='?pageNum=1'+'&keyWord='+t_keyWord+'&keyField='+t_keyField+'#thirdContainer';
	
	location.href = hrefPath;

}
