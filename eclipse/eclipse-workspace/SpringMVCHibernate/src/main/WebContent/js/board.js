/**
 * 
 */


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
	//console.log(JSON.stringify(formJson));
	
	//var boardJson = new Object();
	//boardJson.m_title = 'aa';
	
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
