/**
 * 
 */

var subTitleList = ['JAVA', 'JAVAScript', 'Oracle', 'Mysql'];
var subTitleId = ['java', 'javascript', 'oracle', 'mysql'];

$(document).ready(function(){
	
	for(var i=0; i<subTitleId.length; i++){
		var layerHTML1 = getHtml("default_layout_hidden");
		layerHTML1 = replaceall(layerHTML1, "%SubID_1%", subTitleId[i]);
		layerHTML1 = replaceall(layerHTML1, "%ID_1%", subTitleList[i]);
		layerHTML1 = replaceall(layerHTML1, "%ID_2%", subTitleList[i]);
		$("#sub_layout_view").append(layerHTML1);
	}
	
});

// Get HTML Source
function getHtml(id){
	var result = $("#"+id).html();
	return result;
}

// Replace String
function replaceall(fullStr,originalStr,changeStr){
   return  fullStr.split(originalStr).join(changeStr);
}

function subPage(sub_title){
	console.log(sub_title);
	
}