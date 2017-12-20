/**
 * 
 */


function boardAjax(getUrl, getData){
	console.warn(getUrl, getData);
	var allData = {"userSeq": getData};
    $.ajax({
        url:getUrl,
        contentType: "application/json",
        type:'GET',
        data: allData,
        success:function(data){
        	console.log(data.m_title);
        	console.log(data);
        	
            $('#m_usrname').val(data.m_title);
            $('#m_content').val(data.m_content);
            
            
           // window.opener.location.reload();
           // self.close();
        },
        error:function(jqXHR, textStatus, errorThrown){
            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
           // self.close();
        }
    });
}