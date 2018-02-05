/*

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
	/*
	 * GET 방식의 Paging 
	var pageNum = '';
	var keyWord = '';
	var keyField = '';
	
	var path = decodeURI($(location).attr('search'),'utf-8');
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
	$('#fb_searchinput').val(keyField);*/
	
    $("#closeModal1").click(function() {
        pagingAjax('contentView');
    });

    $("#closeModal2").click(function() {
        pagingAjax('contentView');
    });
    
	var s_keyField = sessionStorage.getItem('s_keyField');
	var s_keyWord = sessionStorage.getItem('s_keyWord');
	var s_pageNum = sessionStorage.getItem('s_pageNum');
	
	if(s_keyField == null){sessionStorage.setItem('s_keyField', ""); s_keyField = sessionStorage.getItem('s_keyField')}
	if(s_keyWord == null){sessionStorage.setItem('s_keyWord', "ALL"); s_keyWord = sessionStorage.getItem('s_keyWord')}
	if(s_pageNum == null){sessionStorage.setItem('s_pageNum', "1"); s_pageNum = sessionStorage.getItem('s_pageNum')}
	
	var loadURL = $(location).attr('pathname')+"?keyField="+s_keyField+"&keyWord="+s_keyWord+"&pageNum="+s_pageNum+"";
	console.log(loadURL);
	
	pagingAjax(loadURL);
	
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

function pagingAjax(getUrl){
	// var hrefPath = $(location).attr('protocol')+'//'+$(location).attr('host')+''+$(location).attr('pathname');
	// mainPage.do?keyField=&keyWord=ALL&pageNum=2#thirdContainer

	var t_keyWord = sessionStorage.getItem('s_keyWord');
	var t_keyField = sessionStorage.getItem('s_keyField');
	var t_pageNum = sessionStorage.getItem('s_pageNum');
	
	if(getUrl == 'search'){ // search button click
		t_keyWord = $('#fb_category').val();
		t_keyField = $('#fb_searchinput').val();
		
		// sessionStorage에 데이터 저장
		sessionStorage.setItem('s_keyWord', t_keyWord);
		sessionStorage.setItem('s_keyField', t_keyField);
		sessionStorage.setItem('s_pageNum', 1);
		console.log(getUrl);

		getUrl = $(location).attr('pathname')+"?keyField="+t_keyField+"&keyWord="+t_keyWord+"&pageNum=1";
	}
	
	if(getUrl == 'contentView'){ // back button and content button click
		if(t_keyField == null){sessionStorage.setItem('s_keyField', ""); t_keyField = sessionStorage.getItem('s_keyField')}
		if(t_keyWord == null){sessionStorage.setItem('s_keyWord', "ALL"); t_keyWord = sessionStorage.getItem('s_keyWord')}
		if(t_pageNum == null){sessionStorage.setItem('s_pageNum', "1"); t_pageNum = sessionStorage.getItem('s_pageNum')}
		
		getUrl = $(location).attr('pathname')+"?keyField="+t_keyField+"&keyWord="+t_keyWord+"&pageNum="+t_pageNum;
	}
	
	$.ajax({
        url:getUrl,
        type:'GET',
        success:function(data){
        	var checka = data.indexOf("<div id='changeFBTableList'>"); // <div id='changeFBTableList'> 부터
        	var checkb = data.indexOf("<div id='endchangeFBTableList'></div>"); // <div id='endchangeFBTableList'></div> 앞부분 까지만
        	var getBoardHtml = data.substring(checka, checkb);
        	$('#changeFBTableList').html(getBoardHtml).find('changeFBTableList div');
        	
    		$('#fb_searchinput').val(t_keyField);
    		$('#fb_category').val(t_keyWord);

    		var cc = getUrl.split("pageNum=");
    		var t_pageNum = cc[1].replace(/[^0-9]/g,''); // 숫자만 가져온다.
    		sessionStorage.setItem('s_pageNum', t_pageNum);
    		
    		// 뒤로가기 동작을 위한 old page data
    		var getCurrentPage = "//#pageNum="+t_pageNum+"#keyField="+t_keyField+"#keyWord="+t_keyWord;
    		var getOldPage = sessionStorage.getItem('backPage');
    		getOldPage+= getCurrentPage;
    		
    		var loadPage = getOldPage.split("//");

    		if(("//"+loadPage[loadPage.length-2]) != getCurrentPage){
    			sessionStorage.setItem('backPage', getOldPage);
    			sessionStorage.setItem('nextPage', getOldPage);
    		}
    		
        	return false;
        },
        error:function(jqXHR, textStatus, errorThrown){
        	alert("error \n" + textStatus + " : " + errorThrown);
        	self.close(); // alert 창 닫는 메서드 self 는 자신 , window.close()는 현재 보고있는 창 close
        }
    });
}

function callContentView(obj){
	var newPage = obj[obj.length-1];
	var newPageNum = "";
	var newKeyWord = "";
	var newKeyField = "";

	if(newPage !== undefined){
		var pathField = newPage.split('#');
		
		for(var i =0; i<pathField.length; i++){
			var k = pathField[i].split('=');
			if(k[0] == '?pageNum' || k[0] == 'pageNum' ){newPageNum = k[1];}
			if(k[0] == '?keyWord' || k[0] == 'keyWord' ){newKeyWord = k[1];}
			if(k[0] == '?keyField' || k[0] == 'keyField' ){newKeyField = k[1];}
		}

		sessionStorage.setItem('s_keyWord', newKeyWord);
		sessionStorage.setItem('s_keyField', newKeyField);
		sessionStorage.setItem('s_pageNum', newPageNum);
		
		pagingAjax('contentView');
	}
}

function pageBack(){
	var reflash = sessionStorage.getItem('s_pageNum');
	if(reflash == null){
		pagingAjax('contentView');
		return;
	}
	
	var getOldPage = sessionStorage.getItem('backPage');
	var loadPage = getOldPage.split("//");
	var fullreplace ="";
	
	if(loadPage.length-1 > 1){
		loadPage.splice(loadPage.length-1);
	}else{
		alert("첫 페이지 입니다.");
	}
	
	for(var i = 0; i < loadPage.length; i++){

		if(fullreplace==""){
			fullreplace+=loadPage[i]; // 최초 null
		}else{
			fullreplace+="//"+loadPage[i];
			
		}
	}
	sessionStorage.setItem('backPage', fullreplace);
	
	callContentView(loadPage);

}

function pageNext(){
	var reflash = sessionStorage.getItem('s_pageNum');
	if(reflash == null){
		pagingAjax('contentView');
		return;
	}
	
	var getNextOldPage = sessionStorage.getItem('nextPage');
	var nextPageList = getNextOldPage.split("//");
	
	var getBackOldPage = sessionStorage.getItem('backPage');
	var backPageList = getBackOldPage.split("//");
	
	
	var fullreplace ="";
	
	if(backPageList.length < nextPageList.length){
		backPageList.push(nextPageList[backPageList.length]); // 현재 back 위치
		
		for(var i = 0; i < backPageList.length; i++){

			if(fullreplace==""){
				fullreplace+=backPageList[i]; // 최초 null
			}else{
				fullreplace+="//"+backPageList[i];
				
			}
		}
		sessionStorage.setItem('backPage', fullreplace);
	}
	
	callContentView(backPageList);
	
}